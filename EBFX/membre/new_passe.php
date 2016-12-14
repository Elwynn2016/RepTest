<?php session_start();
include('header_simple.php');
echo '<div id="header"> 
<div id="logo"></div>
<div id="menu">
<form action="" method="post">
<table align="center" class="form">
<tr>
<td colspan="3" align="center" class="titre_form"><h1>Mot de passe oubli&eacute;</h1></td>
</tr>';
if(!empty($_POST['envoi'])) {
	echo '<tr><td colspan="3" align="center">';
	echo '</td></tr>';
}
echo '<tr>
<td valign="top" rowspan="4"><img src="../Images/default.png" width="70" height="70" /></td>
</tr>
<tr>
<td>Votre Email : </td>
<td><input type="text" name="email" /></td>
</tr>
<tr>
<td colspan="3" align="center"><input type="submit" name="envoi" value="Valider" class="input" /></td>
</tr>
<tr>
	<td><a href="index.php">Retour</a></td>
</tr>
</table>
</form> 
</div> 
</div>';
include('footer_simple.php');
?>