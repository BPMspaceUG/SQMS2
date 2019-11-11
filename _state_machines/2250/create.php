<?php
$allow = false;
$pathStr= $param["path"];
$path = explode('/', $pathStr);
$path = array_reverse($path);

// Check if another Language Text exists
$cnt = 0;
if (count($path) >= 4) {
   $relTbl = $path[3];
   $objID = $path[4];
   if ($objID != "create") {
      $lang = $param["row"]["sqms2_language_iso_short"];
      $firstCol = array_keys(Config::getColsByTablename($relTbl))[1];
      $filter = '{"and":[{"=":["'.$firstCol.'",'.$objID.']},{"=":["sqms2_language_iso_short","'.$lang.'"]}]}';
      $resp = api(["cmd"=>"read", "param"=>["table"=>$relTbl, "filter"=>$filter]]);
      $json = json_decode($resp, true);
      $cnt = $json["count"];
   }
}
$allow = ($cnt === 0);

$script_result = [
    "allow_transition" => $allow,
    "show_message" => !$allow,
    "message" => "A Text in this language $lang already exists!"
];