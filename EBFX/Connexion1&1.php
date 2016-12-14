<meta charset="utf-8"/>

<?php

try
{
	$bd = new PDO('mysql:host=db656005906.db.1and1.com;dbname=db656005906' ,'dbo656005906','');
	$bd->query('set names utf8');
	$bd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}

catch (PDOException $e)
{
	die('<p> <h1>ERREUR 500!</h1>Erreur : '.$e->getMessage().'</p>');
}

echo "Connexion établie";

?>
