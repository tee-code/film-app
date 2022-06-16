
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>BrilloConnetz | Film Sales Service</title>
  </head>
  <body class="container">
    <h4 class="bg-primary p-3 text-white">Film Sales Service</h4>

    <h6 class="p-3">PHP DEVELOPER TEST ANSWER</h6>

    <?php 

    require_once('FilmController.php');
    $film = new FilmController();
    $q1 = $film->fetchFilmsPurchasedByCustomers();
    $q2 = $film->startWith('s');
    
    $q3 = $film->getMonthlySales();
    $q4 = $film->getFilmByGenre();
    $q5 = $film->getCustumerAbove50();


    $film->print_result($q1, 'List the total number of films purchased by the customers');
    $film->print_result($q2, 'List all the products that end with the character ‘s’');
    $film->print_result($q3, 'List the total number of monthly sales.');
    $film->print_result($q4, 'List all the films that have Genre – ‘Action’');
    $film->print_result($q5, 'List the customers whose age is above 50');

?>


    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
  </body>
</html>