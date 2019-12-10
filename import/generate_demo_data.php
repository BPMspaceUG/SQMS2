<?php
    // Parameter
    $cntT = 2;
    $cntS = 3;
    $cntSC = rand(4,9);
    $cntQ = rand(6,10);
    $cntA = rand(1,6);
    $probabilityCorrectAnswer = .2;

    $x = [];
    // Syllabus
    for ($i=0;$i<$cntS*$cntT;$i++) {
        $s_title = "Syllabus-".($i + 1);
        // Syllabus
        $x["sqms2_syllabus"][] = [
            "sqms2_Syllabus_titel" => $s_title,
            "sqms2_topic" => [[
                "sqms2_Topic_id" => 99000 + ($i % $cntT),
                "sqms2_Topic_title" => "Topic-".($i % $cntT + 1)
            ]],
        ];
        // SyllabusChapter        
        for ($j=0;$j<$cntSC;$j++) {
            $sc_title = "Chapter-".($j+1);
            $severity = round(100 / $cntSC);
            if ($j === $cntSC-1) $severity = 100 - ($j * round(100 / $cntSC)); // last element
            $x["sqms2_syllabus"][$i]["sqms2_syllabuschapter"][] = [
                "sqms2_SyllabusChapter_titel" => $sc_title,
                "sqms2_SyllabusChapter_ChapterNumber" => $j+1,
                "sqms2_SyllabusChapter_Severity" => $severity,
            ];
            // Question            
            for ($k=0;$k<$cntQ;$k++) {
                $x["sqms2_syllabus"][$i]["sqms2_syllabuschapter"][$j]["sqms2_question"][] = [
                    "sqms2_text" => [
                        ["sqms2_language_iso_short"=>"en", "sqms2_Text"=>"<p>What a Question ".(100*($j+1) + $k+1)." is this?</p>"],
                        ["sqms2_language_iso_short"=>"de", "sqms2_Text"=>"<p>Was für eine Frage ".(100*($j+1) + $k+1)." ist das?</p>"]
                    ]
                ];
                // Answers                
                for ($l=0;$l<$cntA;$l++) {
                    $x["sqms2_syllabus"][$i]["sqms2_syllabuschapter"][$j]["sqms2_question"][$k]["sqms2_answer"][] = [
                        "sqms2_correct" => (rand(1,1000) >= 1000*$probabilityCorrectAnswer),
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
    file_put_contents("generated_demo_full.json", json_encode($x));

    header("Content-Type: application/json");
    echo json_encode($x);
    
