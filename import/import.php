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

    class DataImporter {
        private $metaEdges = null;

        private static function array_insert(&$array, $position, $insert) {
            if (is_int($position)) {
                array_splice($array, $position, 0, $insert);
            } else {
                $pos   = array_search($position, array_keys($array));
                $array = array_merge(
                    array_slice($array, 0, $pos),
                    $insert,
                    array_slice($array, $pos)
                );
            }
        }
        private function create($table, $row, $pathStr = "") {
            @$pcol = array_keys($row)[0];
            $resp = api(["cmd"=>"create", "param"=>["table"=>$table, "path"=>$pathStr, "row"=>$row]]);
            $res = json_decode($resp, true);
            // If exists, return the ID
            @$id = $row[$pcol];
            if (count($res) == 2)
                $id = $res[1]["element_id"];
            return (int)$id;
        }
        private function relate($table, $objID1, $objID2) {
            $colnames = array_keys(Config::getColsByTablename($table));
            $edgeID = $this->create($table, [$colnames[1] => $objID1, $colnames[2] => $objID2]);
            return [$edgeID, $objID1, $objID2];
        }
        private function getEdgeName($from, $to) {
            foreach ($this->metaEdges as $key => $value) {
                if ($value[0] == $from && $value[1] == $to)
                    return $key;
            }
            return null;
        }
        private function createAndRelate($path, $leafData) {
            // Checks:
            // 1. Path count always has to be a even number and be > 1!
            // 2. Special case at length = 2
            if (count($path) % 2 !== 0 || count($path) < 2) {
                return null;
            } elseif (count($path) === 2) {
                // Starting Element => Just create
                $newID = $this->create($path[0], $leafData);
                return [null, null, $newID];
            } else {
                // Create AND relate
                $tblFrom = $path[count($path)-4];
                $tblTo = $path[count($path)-2];
                $tblEdge = $this->getEdgeName($tblFrom, $tblTo);
                $idFrom = $path[count($path)-3];

                // Insert the Relation-Table in the Path
                self::array_insert($path, count($path)-2, [$tblEdge, "create"]);
                $newPath = implode('/', $path);

                // 1. create Element with path
                $idTo = $this->create($tblTo, $leafData, $newPath);
                // 2. Get Edge Name (nm-Table)                
                return $this->relate($tblEdge, $idFrom, $idTo);
            }
        }
        private function walk($x, $k=null, $layer=-1, &$path=[]) {
            if (is_array($x)) {
                // 🌱 Twig = Edge
                $layer++;                
                foreach ($x as $key => $value)
                    $this->walk($value, $k, $layer, $path);
            }
            else if (is_object($x)) {
                // 🍂 Leaf = Object
                $arr = (array)$x;
                if (!is_null($k)) {
                    // Clone Array and remove all sub arrays for multidimensional array
                    $array = (array)clone(object)$arr;
                    foreach($array as $ki => $a) {
                        if (is_array($a)) { unset($array[$ki]); }
                    }
                    // Clear all parts after actual layer
                    $path = array_slice($path, 0, $layer+1);
                    // Build the create Path
                    $leaf = $k."/create";
                    $path[$layer] = $leaf;                    
                    $pathStr = implode('/', $path);
                    // CREATE and relate Object
                    $res = $this->createAndRelate(explode('/', $pathStr), $array);
                    $objID = $res[2]; // the new ID
                    // Modify Path
                    $leaf = $k."/".$objID;
                    $path[$layer] = $leaf;
                    // Debug-Log:
                    if ($objID != 0) {
                        echo "[".count($path).'] <span style="color:green;">'.implode('/', $path)."</span>\n";
                    }
                    else {
                        // Error
                        echo "[".count($path).'] <span style="color:red;">'.implode('/', $path)."</span> <b>ERROR</b>\n";
                    }                         
                }
                foreach ($arr as $key => $value)
                    $this->walk($value, $key, $layer, $path);
            }
        }

        public function __construct() {
            // Read out meta structure
            $config = json_decode(Config::getConfig(), true);
            foreach ($config as $tablename => $table) {
                if ($table["table_type"] !== "obj") {
                    // Relation
                    $colnames = array_keys($table["columns"]);
                    @$objA = $table["columns"][$colnames[1]]["foreignKey"]["table"];
                    @$objB = $table["columns"][$colnames[2]]["foreignKey"]["table"];
                    // Both ForeignKeys have to have tables
                    if (!is_null($objA) && !is_null($objB))
                        $this->metaEdges[$tablename] = [$objA, $objB];
                }
            }
            
        }
        public function importFile($filePath) {
            $content = file_get_contents($filePath);
            $importData = json_decode($content);
            $this->walk($importData);
        }
    }


    //===> IMPORT
    echo "<pre>";
    $import = new DataImporter(); // data_full data_question
    $import->importFile(__DIR__."/test.json");