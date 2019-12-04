<?php
    $tmpl_topic = 'Topic-%';
    $tmpl_syllabus = 'Syllabus-%';
    $tmpl_syllabuschapter = 'Chapter-%';


    $x = [];

    // Syllabus
    $cntS = random_int(2,4);
    for ($i=0;$i<$cntS;$i++) {
        $s_title = str_replace('%', $i+1, $tmpl_syllabus);
        // Syllabus
        $x["sqms2_syllabus"][] = [
            "sqms2_Syllabus_titel" => $s_title,
            //"sqms2_topic" => [(object)["sqms2_Topic_title" => "Topic-1"]],
        ];
        // SyllabusChapter
        $cntSC = random_int(4,7);
        for ($j=0;$j<$cntSC;$j++) {
            $sc_title = str_replace('%', $j+1, $tmpl_syllabuschapter);
            $x["sqms2_syllabus"][$i]["sqms2_syllabuschapter"][] = [
                "sqms2_SyllabusChapter_titel" => $sc_title,
                "sqms2_SyllabusChapter_ChapterNumber" => $j+1,
                "sqms2_SyllabusChapter_Severity" => round(100 / $cntSC),
            ];
            // Question
            $cntQ = random_int(6,10);
            for ($k=0;$k<$cntQ;$k++) {
                $x["sqms2_syllabus"][$i]["sqms2_syllabuschapter"][$j]["sqms2_question"][] = [
                    "sqms2_text" => [
                        ["sqms2_language_iso_short"=>"en", "sqms2_Text"=>"<p>What a Question ".(100*($j+1) + $k+1)." is this?</p>"],
                        ["sqms2_language_iso_short"=>"de", "sqms2_Text"=>"<p>Was für eine Frage ".(100*($j+1) + $k+1)." ist das?</p>"]
                    ]
                ];
                // Answers
                $cntA = random_int(1,6);
                for ($l=0;$l<$cntA;$l++) {
                    $x["sqms2_syllabus"][$i]["sqms2_syllabuschapter"][$j]["sqms2_question"][$k]["sqms2_answer"][] = [
                        "sqms2_correct" => (random_int(1,10) >= 5), // avg. 20% of the answers are correct
                        "sqms2_text" => [
                            ["sqms2_language_iso_short"=>"en", "sqms2_Text"=>"<p>Answer ".(100*($k+1) + $l+1).".</p>"],
                            ["sqms2_language_iso_short"=>"de", "sqms2_Text"=>"<p>Antwort ".(100*($k+1) + $l+1).".</p>"]
                        ]
                    ];
                }
            }
            // Description
            $x["sqms2_syllabus"][$i]["sqms2_syllabuschapter"][$j]["sqms2_text"][] = ["sqms2_language_iso_short"=>"en","sqms2_Text"=>"<p>Description of ".$sc_title.'</p>'];
            $x["sqms2_syllabus"][$i]["sqms2_syllabuschapter"][$j]["sqms2_text"][] = ["sqms2_language_iso_short"=>"de","sqms2_Text"=>"<p>Beschreibung von ".$sc_title.'</p>'];
        }
        // Description
        $x["sqms2_syllabus"][$i]["sqms2_text"][] = ["sqms2_language_iso_short"=>"en","sqms2_Text"=>"<p>Description of ".$s_title.'</p>'];
        $x["sqms2_syllabus"][$i]["sqms2_text"][] = ["sqms2_language_iso_short"=>"de","sqms2_Text"=>"<p>Beschreibung von ".$s_title.'</p>'];
    }

    //=====================================
    header('Content-Type: application/json');
    echo json_encode($x);
    
