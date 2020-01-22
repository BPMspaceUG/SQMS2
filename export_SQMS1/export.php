<?php
    //==========================================================
    // Export data from SQMS1 into a JSON-File, which is formatted like the JSON of Import SQMS2
    //==========================================================
    
    // Increase Script-Time-Limits
    ini_set('max_execution_time', 300);
    set_time_limit(300);

    // Configuration
    $filepath = __DIR__.'/config.SECRET.inc.php';
    if (!file_exists($filepath)) die('🔑 Configuration-File "'.basename($filepath).'" not found!');
    require_once($filepath);
    
    // Connect to the Database
    $con = new mysqli($host, $user, $password, $dbname, $port)
    or die ('Could not connect to the database server' . mysqli_connect_error());
    $con->set_charset("utf8");

    // Export Data
    echo "<pre>";

    function getResult($sql, $paramstr = null, $param = null) {
        global $con;
        if ($stmt = $con->prepare($sql)) {
            $output = [];
            if (!is_null($paramstr) && !is_null($param))
                $stmt->bind_param($paramstr, $param);
            $stmt->execute();
            $stmt->bind_result($r1, $r2, $r3, $r4);
            while ($stmt->fetch()) {
                $output[] = [$r1, $r2, $r3, $r4];
            }
            $stmt->close();
            return $output;
        }
    }

    //--- Export Topics
    $export = ["sqms2_topic"=>[]];

    $res = getResult("SELECT sqms_topic_id + 872438324, name, 0, 0 FROM sqms_topic WHERE sqms_topic_id IN (SELECT distinct topic_id FROM v_sqms_used_questions WHERE v_sqms_used_questions.language_ID = 1);");
    foreach ($res as $row) 
        $export["sqms2_topic"][] = ["sqms2_Topic_id"=>(int)$row[0], "sqms2_Topic_title"=>$row[1]];
    echo "Topics ✔️\n";

    function appendQtoTopic($topicID, $q) {
        global $export;
        for ($i=0; $i < count($export["sqms2_topic"]); $i++) { 
            if ($topicID === $export["sqms2_topic"][$i]["sqms2_Topic_id"]) {
                // append
                $export["sqms2_topic"][$i]["sqms2_question"][] = $q;
            }
        }
    }


    //--- Export Questions
    $res = getResult("SELECT DISTINCT sqms_question_id, question, id_external, topic_ID + 872438324 FROM v_sqms_used_questions WHERE v_sqms_used_questions.language_ID = 1;");
    foreach ($res as $row) {
        $newQuestion = ["sqms2_Question_type"=>'MULTIPLE CHOICE', "sqms2_text"=>[], "sqms_answer"=>[]];
        $questionID = (int)$row[0];
        $questionIDenglish = (int)$row[2];
        $topicID = (int)$row[3];
        $newQuestion["sqms2_text"][] = ["sqms2_Text"=>$row[1], "sqms2_language_iso_short"=>"de"];
        // english Text (only if exists)
        if (!is_null($questionIDenglish) && $questionIDenglish !== 0) {
            $resEN = getResult("SELECT question, 0, 0, 0 FROM sqms_question WHERE sqms_question_id = ?;", "i", $questionIDenglish);
            $newQuestion["sqms2_text"][] = ["sqms2_Text"=>$resEN[0][0], "sqms2_language_iso_short"=>"en"];
        }
        //--- Answers
        $resAnswDE = getResult("SELECT answer, correct, 0, 0 FROM sqms_answer WHERE sqms_question_id = ? ORDER BY sqms_answer_id;", "i", $questionID);
        $resAnswEN = getResult("SELECT answer, correct, 0, 0 FROM sqms_answer WHERE sqms_question_id = ? ORDER BY sqms_answer_id;", "i", $questionIDenglish);
        $i = 0;
        foreach ($resAnswDE as $answ) {
            // german Answer
            $germanAnswerText = $answ[0];
            $isCorrect = (int)$answ[1] === 1;            
            $newAnswer = ["sqms2_text"=>[], "sqms2_correct"=>$isCorrect];
            $newAnswer["sqms2_text"][] = ["sqms2_Text"=>$germanAnswerText, "sqms2_language_iso_short"=>"de"];            
            // append english text
            if (isset($resAnswEN[$i])) {
                $englishAnswerText = $resAnswEN[$i][0];
                $newAnswer["sqms2_text"][] = ["sqms2_Text"=>$englishAnswerText, "sqms2_language_iso_short"=>"en"];
            }
            // append to Question
            $newQuestion["sqms2_answer"][] = $newAnswer;
            $i++;
        }
        // append Question to Topics
        appendQtoTopic($topicID, $newQuestion);
        //----
        //break; // for debuggin -> only first question
    }

    // ========> Save to File
    file_put_contents("exported_SQMS1_topics_questions.secret.json", json_encode($export)); // Save as JSON-File
    echo "Questions ✔️\n";


