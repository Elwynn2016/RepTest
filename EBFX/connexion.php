<meta charset="utf-8"/>

<?php
try
{
	$bd = new PDO('mysql:host=localhost;dbname=enerbioflex','root','');
	$bd->query('set names utf8');
	$bd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}

catch (PDOException $e)
{
	die('<p> <h1>ÉCHOUÉ!</h1>'.'Le plan à échoué. <br/>Erreur : '.$e->getMessage().'</p>');
}


?>
