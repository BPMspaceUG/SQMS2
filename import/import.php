<?php
    header('Content-Type: plain');
    // Includes
    require_once(__DIR__."/../src/RequestHandler.inc.php");

    //================>
    $fname = __DIR__."/withIDs.json";


    $content = file_get_contents($fname);
    $data = json_decode($content, true);


    function create($table, $row) {
        $pcol = array_keys($row)[0];
        $resp = api(["cmd"=>"create", "param"=>["table"=>$table,"row"=>$row]]);
        $res = json_decode($resp, true);
        // If exists, return the ID
        $id = $row[$pcol];
        if (count($res) == 2)
            $id = $res[1]["element_id"];
        echo $table." -> ".$id."\n"; // for Debugging
        return (int)$id;
    }
    function relate($table, $objID1, $objID2) {
        $colnames = array_keys(Config::getColsByTablename($table));
        $edgeID = create($table, [$colnames[1] => $objID1, $colnames[2] => $objID2]);
        return [$edgeID, $objID1, $objID2];
    }
    function multiRelate($obj, $objID, $newRelName, $newObjName) {
        $res = [];
        if (array_key_exists($newObjName, $obj)) {
            foreach ($obj[$newObjName] as $x) {
                $res[] = relate($newRelName, $objID, create($newObjName, $x));
            }
        }
        return $res;
    }

    /*
    function test($arr, &$res, $k) {
        if (is_array($arr)) {
            if (!is_numeric($k)) $res[] = $k;
            foreach ($arr as $key => $value) {
                test($value, $res, $key);
            }
        }
    }
    $x = [];
    $res = test($data["sqms2_topic"], $x, "sqms2_topic");    
    var_dump($x);
    die();
    */


    foreach ($data["sqms2_topic"] as $t) {
        // [+]---(Syllabus)
        if (array_key_exists("sqms2_syllabus", $t)) foreach ($t["sqms2_syllabus"] as $s) {
            // Syllabus --- Topic
            $s_t = relate("sqms2_syllabus_topic", create("sqms2_syllabus", $s), create("sqms2_topic", $t));

            // [+]---(SyllabusDescription)
            multiRelate($s, $s_t[1], "sqms2_syllabus_desc", "sqms2_text");

            // [+]---(SyllabusChapter)
            if (array_key_exists("sqms2_syllabuschapter", $s)) foreach ($s["sqms2_syllabuschapter"] as $sc) {
                $s_sc = relate("sqms2_syllabus_syllabuschapter", $s_t[1], create("sqms2_syllabuschapter", $sc));
                // [+]---(SyllabusChapterDescription)
                multiRelate($sc, $s_sc[2], "sqms2_syllabuschapter_desc", "sqms2_text");
                // [+]---(Question)
                if (array_key_exists("sqms2_question", $sc)) foreach ($sc["sqms2_question"] as $qu) {
                    $sc_q = relate("sqms2_syllabuschapter_question", $s_sc[2], create("sqms2_question", $qu));
                    // [+]---(QuestionText)
                    multiRelate($qu, $sc_q[2], "sqms2_question_text", "sqms2_text");
                    
                    // [+]---(Answer)
                    //TODO: multiRelate($qu, $sc_q[2], "sqms2_question_answer", "sqms2_answer");

                    if (array_key_exists("sqms2_answer", $qu)) foreach ($qu["sqms2_answer"] as $an) { 
                        $q_a = relate("sqms2_question_answer", $sc_q[2], create("sqms2_answer", $an));
                        // [+]---(AnswerText)
                        multiRelate($an, $q_a[2], "sqms2_answer_text", "sqms2_text");
                    }


                }
            }
        }
    }