<?php
require_once('db.php');
class FilmController extends PDODatabase{

    //1
    public function fetchFilmsPurchasedByCustomers(){
        $query = "SELECT name, COUNT(*) as num FROM films JOIN purchases WHERE films.id = purchases.film_id GROUP BY films.name;";
        return $this->perform_query($query);
    }

    //2
    public function startWith($s){
        $query = "SELECT * FROM `films` WHERE films.name LIKE '$s%'";
        return $this->perform_query($query);
    }

    //3
    public function getMonthlySales(){
        $query = "SELECT MONTHNAME(date) as month, COUNT(*) FROM purchases GROUP BY month";
        return $this->perform_query($query);
    }
    
    //4
    public function getFilmByGenre(){
        $query = "SELECT films.name as film_name, amount, is_available, genres.name FROM films JOIN genres WHERE films.genre_id = genres.id and genres.name = 'Action'";
        return $this->perform_query($query);
    }

    //5
    public function getCustumerAbove50(){
        
        $query = "SELECT * FROM customers WHERE TIMESTAMPDIFF(YEAR, dob, CURRENT_DATE()) > " . 50; 
        return $this->perform_query($query);
    }

    public function perform_query($sql){
        $result_set = $this->connection->prepare($sql);
        $result_set->execute();

        $result = $result_set->fetchAll(\PDO::FETCH_ASSOC);
        return $result;
    }

    public function print_result($result, $question){

        if(count($result) > 0){
            $keys = array_keys($result[0]);
            echo "<h4>$question</h4>";
            echo "<table class='table table-primary'>";
            echo "<thead class='table-dark'>";

            foreach($keys as $key){
                echo "<th>" . $key . "</th>";
            }

            echo "</thead>";
            echo "<tbody>";

            foreach($result as $res){
                echo "<tr>";
                foreach($keys as $key){
                    echo "<td>" .$res[$key] . "</td>";
                }
                echo "</tr>";
            }

            echo "</tbody>";

            echo "</table>";
    
        }

              
    }
}