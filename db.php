<?php
//database class
	class PDODatabase extends PDO{
		//private fields
		protected $connection;
		//create a constructor
		function __construct(){
			$this->connection = new PDO('mysql:host=localhost;dbname=films;charset=utf8','root','');
			$this->connection->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
		}

		//methods
		public function display_error($e){
			echo $e->getMessage(). " ". $e->getFile(). " :". $e->getLine();
		}

		
	}
	$db = new PDODatabase();

?>