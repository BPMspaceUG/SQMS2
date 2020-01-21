<?php
    // Includes
    require_once(__DIR__."/../src/RequestHandler.inc.php");

    // Increase Script-Time-Limits
    ini_set('max_execution_time', 300);
    set_time_limit(300);

    //===> IMPORT
    echo "<pre>";
    $import = new DataImporter(); // data_full data_question
    $import->importFile(__DIR__."/exported_topics_SQMS1.json"); // generated_demo_full.json");