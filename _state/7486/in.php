<?php
// Relation #20
$myAnswerID = $param["row"]["sqms2_Answer_id_fk_154388"];
$myTextID = $param["row"]["sqms2_Text_id_fk_842740"];
// 1. Find all related texts which are selected!
$json = json_decode(api(["cmd"=>"read","param"=>["table"=>"sqms2_answer_text",
"filter"=>'{"and":[{"=":["sqms2_Answer_id_fk_154388",'.$myAnswerID.']},{"=":["`sqms2_answer_text`.state_id",7485]}]}'
]]), true);
$recs = $json["records"];
$conc = "";
// Created the First answertext
foreach($recs as $rec) {
    $textID = $rec["sqms2_Text_id_fk_842740"]["sqms2_Text_id"];
    $answer = $rec["sqms2_Text_id_fk_842740"]["sqms2_Text"];
    $conc .= '<a href="javascript:void(0);" onclick="location.assign(location.hash+\'/sqms2_text/'.$textID.'\')">'.$answer.'</a>';
}
// Update Answer not this table
$resp = api(["cmd"=>"makeTransition","param"=>["table"=>"sqms2_answer",
"row"=>["sqms2_Answer_id"=>$myAnswerID, "sqms2_titleofanswers"=>$conc]]]);