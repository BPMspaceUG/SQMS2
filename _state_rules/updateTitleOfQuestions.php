<?php
    // inputs
    $questionID = $param["row"]["sqms2_Question_id"];

    // find related questiontexts
    $json = json_decode(api(["cmd"=>"read","param"=>["table"=>"sqms2_question_text",
        "filter"=>'{"and":[{"=":["sqms2_Question_id",'.$questionID.']},{"=":["`sqms2_question_text`.state_id",7493]}]}'
    ]]), true);    
    $param["row"]["sqms2_titleofquestions"] = $json["records"][0]["sqms2_Text_id_fk_559100"]["sqms2_Text"];
