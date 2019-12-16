<?php
    require_once(__DIR__.'/config.SECRET.inc.php');

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

    if ($sl === $sr) die("❌ No Syllabi, or the same!");
    // Check if left is german
    $x = parseElements("SELECT sqms_language_id AS id, null, null FROM sqms_syllabus WHERE sqms_syllabus_id = $sl");
    if ($x[0]["id"] !== LANG_de) die("❌ ERROR! Param <b>sl</b> No Syllabus set or Left Syllabus is not German!");
    // Check if right is englisch    
    $x = parseElements("SELECT sqms_language_id AS id, null, null FROM sqms_syllabus WHERE sqms_syllabus_id = $sr");
    if ($x[0]["id"] !== LANG_en) die("❌ ERROR! Param <b>sl</b> No Syllabus set or Right Syllabus is not english!");


    function qSyllabi($arr){return "SELECT sqms_syllabus_id, name, null FROM sqms_syllabus WHERE sqms_syllabus_id IN (".implode(',', $arr).")";}
    function qSyllElements($arr){return "SELECT sqms_syllabus_element_id, name, null FROM sqms_syllabus_element WHERE sqms_syllabus_id IN (".implode(',', $arr).")";}
    function qQuestions($arr){
        return 'SELECT q.sqms_question_id, q.question, 11110000-q.id_external  FROM sqms_question as q
        JOIN sqms_syllabus_element_question as seq ON seq.sqms_question_id = q.sqms_question_id
        WHERE seq.sqms_syllabus_element_id IN ('.implode(',', $arr).') AND q.sqms_question_id IN (
            SELECT DISTINCT sqms_question_id, null, null FROM sqms_question_answer_exam_version where sqms_exam_version_id
            IN (SELECT sqms_exam_version_id FROM sqms_exam_version where sqms_exam_version_name NOT LIKE "zz_%")
        )
        AND  q.sqms_topic_id = 1 ORDER BY q.sqms_question_id';

    }
    function qAnswers($arr){return "SELECT sqms_answer_id, answer, correct FROM sqms_answer WHERE sqms_question_id IN (".implode(',', $arr).")";}
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
    </style>
</head>
<body>
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
            $arrL = parseElements(qQuestions(array_column($arrL, "id")), $QE_IGNORE);
            $arrR = parseElements(qQuestions(array_column($arrR, "id")), $QE_IGNORE);
            echo '<tr><th colspan="2">Anzahl Questions (en: '.@count($arrL).' / de: '.@count($arrR).')</th></tr>';
            for ($i=0;$i<@count($arrL);$i++) {
                echo '<tr><td>'.@$arrL[$i]["id"].'<br><small>'.@$arrL[$i]["name"].'</small></td>';
                echo '<td>'.@$arrR[$i]["id"].'<br><small>'.@$arrR[$i]["name"].'</small></td></tr>';               
                echo '<tr><th colspan="2">Answers</th></tr>';
                $x = parseElements(qAnswers(@[$arrL[$i]["id"]]), $AN_IGNORE);
                $y = parseElements(qAnswers(@[$arrR[$i]["id"]]), $AN_IGNORE);
                for ($j=0;$j<count($x);$j++) {
                    echo '<tr><td'.(@$x[$j]["correct"] == 1 ? ' style="background-color:PaleGreen;"' : ' style="background-color:LightPink;"').'>'.@$x[$j]["id"].'<br><small>'.@$x[$j]["name"].'</small></td>';
                    echo '<td'.(@$y[$j]["correct"] == 1 ? ' style="background-color:PaleGreen;"' : ' style="background-color:LightPink;"').'>'.@$y[$j]["id"].'<br><small>'.@$y[$j]["name"].'</small></td></tr>';
                }                
                echo '<tr><th colspan="2">Question</th></tr>';
            }
        ?>
    </table>    
</body>
</html>