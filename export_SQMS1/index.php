<?php
    $filepath = __DIR__.'/config.SECRET.inc.php';
    if (!file_exists($filepath)) die('🔑 Configuration-File "'.basename($filepath).'" not found!');
    require_once($filepath);

    // Const
    define("LANG_de", 1);
    define("LANG_en", 2);

    // Param
    @$sl = isset($_GET["sl"]) ? (int)$_GET["sl"] : null;
    @$sr = isset($_GET["sr"]) ? (int)$_GET["sr"] : null;
    $SE_IGNORE = isset($_GET["se_ign"]) ? explode(",", $_GET["se_ign"]) : []; // 242
    $QE_IGNORE = isset($_GET["qe_ign"]) ? explode(",", $_GET["qe_ign"]) : []; // 0
    $AN_IGNORE = isset($_GET["an_ign"]) ? explode(",", $_GET["an_ign"]) : []; // 2696,2697
    
    $con = new mysqli($host, $user, $password, $dbname, $port)
        or die ('Could not connect to the database server' . mysqli_connect_error());
    $con->set_charset("utf8");

    if ($sl === $sr) die("❌ No Syllabi, or the same! (Param sl, sr)");
    // Check if left is german
    $x = parseElements("SELECT sqms_language_id AS id, null, null FROM sqms_syllabus WHERE sqms_syllabus_id = $sl");
    if ($x[0]["id"] !== LANG_de) die("❌ ERROR! Param <b>sl</b> No Syllabus set or Left Syllabus is not German!");
    // Check if right is englisch    
    $x = parseElements("SELECT sqms_language_id AS id, null, null FROM sqms_syllabus WHERE sqms_syllabus_id = $sr");
    if ($x[0]["id"] !== LANG_en) die("❌ ERROR! Param <b>sl</b> No Syllabus set or Right Syllabus is not english!");


    function qSyllabi($arr){return "SELECT sqms_syllabus_id, name, null FROM sqms_syllabus WHERE sqms_syllabus_id IN (".implode(',', $arr).")";}
    function qSyllElements($arr){return "SELECT sqms_syllabus_element_id, name, null FROM sqms_syllabus_element WHERE sqms_syllabus_id IN (".implode(',', $arr).")";}
    function qQuestions($arr){
        // Return questionID, question,
        return 'SELECT q.sqms_question_id, q.question, 11110000-q.id_external  FROM sqms_question as q
        JOIN sqms_syllabus_element_question as seq ON seq.sqms_question_id = q.sqms_question_id
        WHERE seq.sqms_syllabus_element_id IN ('.implode(',', $arr).')
        ORDER BY q.sqms_question_id';
    }
    function qAnswers($arr){
        return "SELECT sqms_answer_id, answer, correct FROM sqms_answer WHERE sqms_question_id IN (".implode(',', $arr).") ORDER BY sqms_answer_id";
    }
    function parseElements($query, $ignIDs = []){
        global $con;
        if ($stmt = $con->prepare($query)) {
            $stmt->execute();
            $stmt->bind_result($id, $text, $extra1);
            $tmp = [];
            while ($stmt->fetch()) {
                $ign = in_array($id, $ignIDs);
                if (!$ign) {
                    $el = ["id"=>(int)$id, "name"=>$text];
                    if ($extra1) $el["correct"] = $extra1;
                    $tmp[] = $el;
                }
            }
            $stmt->close();
            return $tmp;
        }
    }
    function specialQuery1($qID) {
        return 'SELECT DISTINCT sqms_question.sqms_question_id, sqms_question.question, sqms_question.id_external - 11110000 AS id1, (SELECT sqms_question_id FROM sqms_question
        WHERE sqms_question_id = id1) AS question_id_other, sqms_question.id_external - 11110000 - (SELECT sqms_question_id FROM sqms_question WHERE sqms_question_id = id1) AS check_1,
        (SELECT question FROM sqms_question WHERE sqms_question_id = id1) AS question_text_other,
        (SELECT sqms_question.id_external - 11110000 FROM sqms_question WHERE sqms_question_id = id1) AS question_external_other,
        sqms_question.sqms_question_id,
        (SELECT sqms_question.id_external - 11110000 FROM sqms_question WHERE sqms_question_id = id1) - sqms_question.sqms_question_id AS check_2
        FROM sqms_syllabus
        INNER JOIN sqms_syllabus_element ON sqms_syllabus_element.sqms_syllabus_id = sqms_syllabus.sqms_syllabus_id
        INNER JOIN sqms_syllabus_element_question ON sqms_syllabus_element_question.sqms_syllabus_element_id = sqms_syllabus_element.sqms_syllabus_element_id
        INNER JOIN sqms_question ON sqms_syllabus_element_question.sqms_question_id = sqms_question.sqms_question_id
        WHERE sqms_question.sqms_question_id IN (SELECT DISTINCT sqms_question_id FROM v_sqms_used_questions WHERE v_sqms_used_questions.language_ID = 1)
        AND sqms_question.sqms_question_id = '.$qID.';';
    }
    // TODO: Chapter bei Question mit angeben in ID mit dash (chapterId-questionID)
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SQMSExport</title>
    <style>
        * {font-family: "arial"; font-size: 12px;}
        table th {padding-top: 2em;}
        table td {padding: .5em; border: 1px solid #ccc;}
        .question {width:100%; font-weight: bold;}
        .question td:first {width:100px;}
        .answer {width:50%; margin-bottom: 5em;}
        .answer td {height: 100px;}
        .answer.left {float: left;}
        .answer.right {float: right;}
        .answer .correct {color: green; border-color:green;}
        .answer .wrong {color: red; border-color:red;}
    </style>
</head>
<body>
    <p style="margin-bottom: 3em; color: grey;">Params: sr, sl, se_ign, qe_ign, an_ign</p>
    <table>
        <?php
            // Syllabus IDs via Parameter
            $arrL = [["id"=>$sl]];
            $arrR = [["id"=>$sr]];
            //------
            echo '<tr><th colspan="2">Syllabus</th></tr>';
            for ($i=0;$i<count($arrL);$i++) {
                echo '<tr><td>'.@$arrL[$i]["id"].'</td><td>'.@$arrR[$i]["id"].'</td></tr>';
            }
            $arrL = parseElements(qSyllabi(array_column($arrL, "id")));
            $arrR = parseElements(qSyllabi(array_column($arrR, "id")));
            //------
            echo '<tr><th colspan="2">SyllabusElements</th></tr>';
            $arrL = parseElements(qSyllElements(array_column($arrL, "id")), $SE_IGNORE);
            $arrR = parseElements(qSyllElements(array_column($arrR, "id")), $SE_IGNORE);
            for ($i=0;$i<count($arrL);$i++) {
                echo '<tr><td>'.@$arrL[$i]["id"].'<br><small>'.@$arrL[$i]["name"].'</small></td>';
                echo '<td>'.@$arrR[$i]["id"].'<br><small>'.@$arrR[$i]["name"].'</small></td></tr>';
            }
            //------
            // auslesen welche (deutschen) Fragen mit Chapter 1-n verbunden sind
            $arrL = parseElements(qQuestions(array_column($arrL, "id")), $QE_IGNORE);
            $newQ = 'SELECT DISTINCT sqms_question_id, null, null FROM v_sqms_used_questions';
            $res1 = parseElements($newQ);
            $usedQuestions = [];
            foreach ($res1 as $q)
                $usedQuestions[] = $q["id"];
            // loop fragen
            foreach ($arrL as $question) {
                if (in_array($question["id"], $usedQuestions)) {
                    $x = $con->query(specialQuery1($question["id"]));
                    $row = $x->fetch_array(MYSQLI_NUM);
                    $answersL = parseElements(qAnswers([$question["id"]]), $AN_IGNORE);
                    $answersR = parseElements(qAnswers([$row[3]]), $AN_IGNORE);

                    // HTML Question
                    echo '<table class="question">';
                    echo '<tr><td>'.$row[0].'</td><td>'.$row[1].'</td></tr>';
                    echo '<tr><td>'.$row[3].'</td><td>'.$row[5].'</td></tr>';
                    echo "</table>";

                    //---- Answers [DE]
                    echo '<table class="answer left">';
                    for ($j=0;$j<count($answersL);$j++)
                        echo '<tr><td class="'.(@$answersL[$j]["correct"] == 1 ? 'correct':'wrong').'">'.
                        @$answersL[$j]["id"].'<br><small>'.@$answersL[$j]["name"].'</small></td></tr>';
                    echo "</table>";

                    //---- Answers [EN]
                    echo '<table class="answer right">';
                    if ($answersR) {
                        for ($j=0;$j<count($answersR);$j++)
                            echo '<tr><td class="'.(@$answersR[$j]["correct"] == 1 ? 'correct':'wrong').'">'.
                            @$answersR[$j]["id"].'<br><small>'.@$answersR[$j]["name"].'</small></td></tr>';
                    }
                    echo "</table>";

                    echo '<div style="clear:both;"></div>';
                }
                else {
                    continue;
                }
            }
        ?>
    </table>    
</body>
</html>