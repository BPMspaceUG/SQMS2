<?php
    // Includes
    require_once(__DIR__."/../src/RequestHandler.inc.php");


    class DataImporter {
        private $metaEdges = null;
        private $importData = null;
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
                    $this->log .= "Import finished!";
                    return;
                }
                //--- Create Objects
                $newObjID = $this->create($k, $arr);
                $x->primarykey9842739845742380850234850834058043 = $newObjID;
                $this->log .=  "<b>  o  $k [$newObjID]</b><br>";
                //--- Relations
                foreach ($arr as $key => $channel) {
                    if (is_array($channel)) {
                        $edge = $this->getEdgeName($k, $key);
                        $this->log .=  "<b> --- $edge (".count($channel).")</b><br>";
                        foreach ($channel as $conn) {
                            $toID = $conn->primarykey9842739845742380850234850834058043;
                            $ed = $this->relate($edge, $newObjID, $toID)[0];
                            $this->log .=  "     $newObjID -> $toID [$ed]<br>";
                        }
                    }
                }
            }
        }

        public function __construct($metaStructData) {
            $this->metaEdges = $metaStructData;
            // TODO: Read out meta structure

            
        }
        public function loadFile($filePath) {
            $content = file_get_contents($filePath);
            $this->importData = json_decode($content);
        }
        public function import() {
            $this->log = "";
            $this->walk($this->importData);
        }
        public function getLog() {
            return $this->log;
        }
    }


    //===> IMPORT
    $metaStruct = json_decode(file_get_contents(__DIR__."/../meta_structure.json"), true);
    $import = new DataImporter($metaStruct);
    $import->loadFile(__DIR__."/data_full.json");
    $import->import();
    echo $import->getLog();