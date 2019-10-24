<?php
    header('Content-Type: plain');
    // Includes
    require_once(__DIR__."/../src/RequestHandler.inc.php");

    $fname = __DIR__."/_template.json";
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
        echo $id."\n"; // Debugging
        return (int)$id;
    }


    //=== MAIN
    
    foreach ($data["Topic"] as $t) {
        //---(Topic)
        $a = create("sqms2_topic", $t);
        // [+]
        if (array_key_exists("Syllabus", $t)) {
            foreach ($t["Syllabus"] as $s) {
                //---(Syllabus)
                $b = create("sqms2_syllabus", $s);
                create("sqms2_syllabus_topic", ["sqms2_Syllabus_id_fk_345197" => $b, "sqms2_Topic_id_fk_945295" => $a]);
                // [+]
                if (array_key_exists("SyllabusDescription", $s)) {
                    foreach ($s["SyllabusDescription"] as $sd) {
                        //---(SyllabusDescription)
                        $c = create("sqms2_text", $sd);
                        create("sqms2_syllabus_desc", ["sqms2_Syllabus_id_fk_783731" => $b, "sqms2_Text_id_fk_178796" => $c]);
                    }
                }
                // [+]
                if (array_key_exists("SyllabusChapter", $s)) {
                    foreach ($s["SyllabusChapter"] as $sc) {
                        //---(SyllabusChapter)
                        $d = create("sqms2_syllabuschapter", $sc);
                        create("sqms2_syllabus_syllabuschapter", ["sqms2_Syllabus_id_fk_870666" => $b, "sqms2_SyllabusChapter_id_fk_327935" => $d]);
                        // [+]
                        if (array_key_exists("SyllabusChapterDescription", $sc)) {
                            foreach ($sc["SyllabusChapterDescription"] as $scd) {
                                //---(SyllabusChapterDescription)
                                $e = create("sqms2_text", $scd);
                                create("sqms2_syllabuschapter_desc", ["sqms2_SyllabusChapter_id_fk_886795" => $d, "sqms2_Text_id_fk_524933"=> $e]);
                            }
                        }
                        // [+]
                        if (array_key_exists("Question", $sc)) {
                            foreach ($sc["Question"] as $q) {
                                //---(Question)
                                $f = create("sqms2_question", $q);
                                create("sqms2_syllabuschapter_question", ["sqms2_SyllabusChapter_id_fk_920241" => $d, "sqms2_Question_id_fk_285826"=> $f]);
                            }
                        }
                    }
                }
            }
        }
    }