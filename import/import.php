<?php
    // Includes
    require_once(__DIR__."/../src/RequestHandler.inc.php");

    $fname = __DIR__."/_template.json";
    $content = file_get_contents($fname);
    $data = json_decode($content, true);

    // Topics
    foreach ($data["Topic"] as $topic) {
        api(["cmd"=>"create","param"=>["table"=>"sqms2_topic","row"=>["sqms2_Topic_title"=>$topic["title"]]]]);
    }