<?php
    // Includes
    require_once(__DIR__."/../src/RequestHandler.inc.php");

    //======DEFINITION==========
    $fname = __DIR__."/data_full_+IDs.json";

    $metaEdges = [
        "sqms2_syllabus_topic" => ["sqms2_syllabus", "sqms2_topic"],
        "sqms2_syllabus_syllabuschapter" => ["sqms2_syllabus", "sqms2_syllabuschapter"],
        "sqms2_syllabuschapter_question" => ["sqms2_syllabuschapter", "sqms2_question"],
        "sqms2_question_answer" => ["sqms2_question", "sqms2_answer"],
        "sqms2_syllabus_desc" => ["sqms2_syllabus", "sqms2_text"],
        "sqms2_syllabuschapter_desc" => ["sqms2_syllabuschapter", "sqms2_text"],
        "sqms2_question_text" => ["sqms2_question", "sqms2_text"],
        "sqms2_answer_text" => ["sqms2_answer", "sqms2_text"]
    ];

    function create($table, $row) {
        $pcol = array_keys($row)[0];
        $resp = api(["cmd"=>"create", "param"=>["table"=>$table,"row"=>$row]]);
        $res = json_decode($resp, true);
        // If exists, return the ID
        $id = $row[$pcol];
        if (count($res) == 2)
            $id = $res[1]["element_id"];
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
    function getEdgeName($from, $to) {
        global $metaEdges;
        foreach ($metaEdges as $key => $value) {
            if ($value[0] == $from && $value[1] == $to)
                return $key;
        }
        return null;
    }
    function walk($x, $k) {
        global $stack;
        if (is_array($x)) {
            // 🌱 Twig = Edge
            foreach ($x as $key => $value)
                walk($value, $k);
        }
        elseif (is_object($x)) {
            // 🍂 Leaf = Object
            $arr = (array)$x;
            foreach ($arr as $key => $value)
                walk($value, $key);
            //--- Create Objects
            $newObjID = create($k, $arr);
            $x->primarykey9842739845742380850234850834058043 = $newObjID;
            echo "<b>  o  $k [$newObjID]</b><br>";
            //--- Relations
            foreach ($arr as $key => $channel) {
                if (is_array($channel)) {
                    $edge = getEdgeName($k, $key);
                    echo "<b> --- $edge (".count($channel).")</b><br>";
                    foreach ($channel as $conn) {
                        $toID = $conn->primarykey9842739845742380850234850834058043;
                        $ed = relate($edge, $newObjID, $toID)[0];
                        echo "     $newObjID -> $toID [$ed]<br>";
                    }
                }
            }
        }
    }

    //===> IMPORT

    $content = file_get_contents($fname);
    $data = json_decode($content);
    echo "<pre>";
    walk($data->{"sqms2_syllabus"}, "sqms2_syllabus");
    echo "</pre>";