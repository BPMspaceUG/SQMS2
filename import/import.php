<?php
    // Includes
    require_once(__DIR__."/../src/RequestHandler.inc.php");

    // Increase Script-Time-Limits
    ini_set('max_execution_time', 300);
    set_time_limit(300);

    // Import works via Path
    // So for example we can give the following structure:    
    // cmd = [question/85647895] / [answer/create] / [text/create]
    /* param = [
        0: {should be empty...execpt we wanna update something},
        1: {"correct": true},
        2: {"text": "this is a correct answer."}
    ]
    */

    //===> IMPORT
    echo "<pre>";
    $import = new DataImporter(); // data_full data_question
    $import->importFile(__DIR__."/generated_demo_full.json");