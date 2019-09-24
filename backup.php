<?php
// for Windows, set path to mysqldump executable file as environment variable
// for example C:\xampp\mysql\bin

require_once(__DIR__.'/config.SECRET.inc.php');

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
$database = DB_NAME;
$user = DB_USER;	
$pass = DB_PASS;
$host = DB_HOST;

echo "Starting Backup...";
$dir = __DIR__ . '/sqldump/'.$database.'_structure.sql';  
exec("mysqldump --user={$user} --password={$pass} --protocol tcp --no-data --host={$host} {$database} --result-file={$dir} 2>&1", $output);
$dir = __DIR__ . '/sqldump/'.$database.'_statemachine.sql';
exec("mysqldump --user={$user} --password={$pass} --protocol tcp --routines --host={$host} {$database} state state_machines state_rules --result-file={$dir} 2>&1", $output);
 