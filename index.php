<!DOCTYPE html>
<?php
$caon=mysqli_connect("localhost", "root", "", "wetpol");
?>
<html>

    <head>
        <meta charset="utf-8">
        <title>WET POL</title>
        <link reel="stylesheet" href="main.css">
    </head>
    <body>
        <form method="post">
            Imie<input type="text" name="imie"><br>
            Nazwisko<input type="text" name="nazwisko">
        </form>
        <select>
            <?php
            $daneZBazy=mysqli_querry($con, "SELECT 'imie', 'nazwisko' FROM 'klienci'");
            $wiersze=mysqli_num_rows($daneZBazy);
            for ($i=1; $i<=$w; $i++) {
                $oneRow=mysqli_fetch_row($daneZBazy);
                echo "<option>";
                echo $oneRow[0]." ".$oneRow[1]."<br>";
                echo "</option>";
            }
            ?>
            </select>
    </body>
</html>