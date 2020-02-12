<?php
    //===================================================================
    // EXPORT ExamVersion for TEMS
    //===================================================================
    header("Content-Type: application/json");

    // Includes
    require_once(__DIR__."/../src/RequestHandler.inc.php");

    
    // Parameter:
    $examSetVersID = 402;
    $examSetLang = "en";


    $res = json_decode(api(["cmd"=>"read","param"=>[
        "table"=>"sqms2_question_examsetversion",
        "filter"=>'{"and":[
            {"=":["`sqms2_question_examsetversion`.sqms2_ExamSetVersion_id_fk_264577","'.$examSetVersID.'"]},
            {"=":["`sqms2_question_examsetversion`.state_id",7489]}
        ]}'
    ]]), true);

    //=====================>
    $output = [];

    // Fill Data
    $examSet = $res["records"][0]["sqms2_ExamSetVersion_id_fk_264577"];
    $output["ExamVersion_ID"] = $examSet["sqms2_ExamSetVersion_id"];
    $output["ExamVersion_Name"] = $examSet["sqms2_ExamSetVersion_title"];
    $output["ExamVersion_Version"] = $examSet["sqms2_ExamSetVersion_Version"];
    $output["ExamVersion_Set"] = $examSet["sqms2_ExamSetVersion_Set"];
    $output["ExamVersion_SampleSet"] = ($examSet["sqms2_ExamSetVersion_SampleSet"] > 0);
    $output["ExamVersion_Language"] = $examSetLang;
    $output["examQuestions"] = [];
    // Loop Questions
    foreach ($res["records"] as $link) {
        $qdata = $link["sqms2_Question_id_fk_615560"];
        $q = [];
        $q["question_id"] = (int)$qdata["sqms2_Question_id"];
        // Questiontext
        @$text = json_decode(api(["cmd"=>"read","param"=>[
            "table"=>"sqms2_question_text",
            "filter"=>'{"and":[{"=":["sqms2_Question_id",'.$q["question_id"].']},{"=":["sqms2_language_iso_short","'.$examSetLang.'"]}]}']]),
        true)["records"][0]["sqms2_Text_id_fk_559100"]["sqms2_Text"];
        $q["question_text"] = $text;
        $q["answers"] = [];

        // Answers
        $examSetVersAnswID = $link["sqms2_Question_ExamSetVersion_id"];
        $res = json_decode(api(["cmd"=>"read","param"=>[
            "table"=>"sqms2_question_examsetversion_answer",
            "filter"=>'{"and":[
                {"=":["`sqms2_question_examsetversion_answer`.sqms2_Question_ExamSetVersion_id_fk_186326","'.$examSetVersAnswID.'"]},
                {"=":["`sqms2_question_examsetversion_answer`.state_id",7491]}
            ]}'
        ]]), true);    
        foreach ($res["records"] as $link2) {
            $adata = $link2["sqms2_Answer_id_fk_507266"];
            $a = [];
            $a["answer_id"] = (int)$adata["sqms2_Answer_id"];
            // Answertext
            $filter = '{"and":[{"=":["sqms2_Answer_id",'.$a["answer_id"].']},{"=":["sqms2_language_iso_short","'.$examSetLang.'"]}]}';
            @$text = json_decode(api(["cmd"=>"read","param"=>["table"=>"sqms2_answer_text", "filter"=>$filter]]), true)["records"][0]["sqms2_Text_id_fk_842740"]["sqms2_Text"];
            $a["answer_text"] = $text;
            // append
            $q["answers"][] = $a;
        }
        // append
        $output["examQuestions"][] = $q;
    }

    // ==== OUTPUT
    echo json_encode($output, JSON_PRETTY_PRINT);




