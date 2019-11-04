<?php
    // Includes
    require_once(__DIR__."/../src/RequestHandler.inc.php");

    // TODO: The Import has to work via the Path!!!
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
        private $log = null;

        private function create($table, $row) {
            $pcol = array_keys($row)[0];
            $resp = api(["cmd"=>"create", "param"=>["table"=>$table,"row"=>$row]]);
            $res = json_decode($resp, true);
            // If exists, return the ID
            $id = $row[$pcol];
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
        /*
        private function walk($x, $k = null) {
            if (is_array($x)) {
                // 🌱 Twig = Edge
                foreach ($x as $key => $value)
                    $this->walk($value, $k);
            }
            elseif (is_object($x)) {
                // 🍂 Leaf = Object
                $arr = (array)$x;
                foreach ($arr as $key => $value)
                    $this->walk($value, $key);
                // Import complete!
                if (is_null($k)) {
                    $this->log .= "\nImport finished!";
                    return;
                }

                //$this->log .= var_export($arr, true);

                //--- Relations
                foreach ($arr as $key => $channel) {
                    if (is_array($channel)) {
                        //--- Create Node
                        // TODO: Clear all arrays from arr
                        $newObjID = $this->create($k, $arr);
                        $this->log .=  "<b style=\"color:red;\">• $k [$newObjID]</b>\n";
                        //--- Relate everything else
                        $edge = $this->getEdgeName($k, $key);
                        //$this->log .= "<b> --- $edge (".count($channel).")</b>";
                        foreach ($channel as $conn) {
                            // Create Sub-Object
                            $toID = $this->create($key, (array)$conn);
                            $ed = $this->relate($edge, $newObjID, $toID)[0];
                            $this->log .= "<b style=\"color:orange;\">└─• $key [$toID] EdgeID: $ed</b>\n";
                        }
                    } else {
                        //$this->log .=  "$key\n";
                    }
                }
            }
        }
        */

        // TODO: This function should give back all paths!
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
                    // NODE
                    $leaf = $k."/create";
                    // TODO: Create and modify Path
                    $path[$layer] = $leaf;
                    echo implode('/', $path)."\n";
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
            $this->log = "";
            $content = file_get_contents($filePath);
            $importData = json_decode($content);
            $this->walk($importData);
        }
        public function getLog() {
            return $this->log;
        }
    }


    //===> IMPORT
    echo "<pre>";
    $import = new DataImporter(); // data_full data_question
    $import->importFile(__DIR__."/data_question.json");
    //echo '<pre>'.$import->getLog().'</pre>';