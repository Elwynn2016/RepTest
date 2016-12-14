<?php
$folder = '../';
include('header_simple.php');

echo '
<div id="principal">
	<h1>S\'inscrire</h1>
	<hr width="100%" color="7ad443">
	<div>Veuillez entrez vos informations personnelles</div> <br/>
	<form action="" method="post">
		<fieldset class="fieldset">
		<legend>Inscription</legend>
		
		<table width="80%" align="center">
			<tr>
				<td align="center" colspan="2">';
				if(!empty($_POST['inscription'])) {
					secureform($_POST);
					extract($_POST);
					$er =  Inscription::inscrire($civilite, $nom, $prenom, $ville, $identifiant, $email, $passeUn, $passeDe);
				}
				echo '</td>
			</tr>
			
			<tr>
				<td align="left" class="titre_form" width="40%"> Civilité : </td>
				<td><select name="civilite"> 
						<option value="h"> Homme </option> 
						<option value="f"> Femme </option>
					</select></td>
			</tr>
			<tr>
				<td align="left" class="titre_form" width="40%"> Nom : </td>
				<td><input type="text" name="nom" size="40" required /></td>
			</tr>
			<tr>
				<td align="left" class="titre_form" width="40%"> Prénom : </td>
				<td><input type="text" name="prenom" size="40"  required /></td>
			</tr>
			<tr>
				<td align="left" class="titre_form" width="40%"> Ville : </td>
				<td><input type="text" name="ville" size="40"  required /></td>
			</tr>
			<tr>
				<td align="left" class="titre_form" width="40%"> Pays : </td>
				<td>'; include("listepays.php"); echo '</td>
			</tr>
			<tr>
				<td align="left" class="titre_form" width="40%">Login : </td>
				<td><input type="text" name="identifiant" size="40" required /></td>
			</tr>
			<tr>
				<td align="left" class="titre_form" width="40%">Email : </td>
				<td><input type="text" name="email" size="40" /></td>
			</tr>
			<tr>
				<td align="left" class="titre_form" width="40%">Confirmez votre email : </td>
				<td><input type="text" name="email" size="40" /></td>
			</tr>
			<tr>
				<td align="left" class="titre_form" width="40%">Mot de Passe : </td>
				<td><input type="text" name="passeUn" size="40" /></td>
			</tr>
			<tr>
				<td align="left" class="titre_form" width="40%">Confirmer le mot de passe : </td>
				<td><input type="text" name="passeDe" size="40" /></td>
			</tr>
			
			<tr>
				<td align="left" class="titre_form" width="40%">Choisissez votre photo </td>
				<td><input type="file" name="photo" id="photo" /></td>
			</tr>
			<tr> <td align="left" class="titre_form" > <h6>(Taille max 10ko)</h6> </td> </tr>
			
			<tr>
				<td colspan="2" align="center">
				<br />
				<input type="submit" value="Valider Inscription" name="inscription" class="input" />
				<br /><br />
				</td>
			</tr>
		</table>
	</form>
</div>';
if(!empty($er) and isset($er)) {
	if($er!=='ok') {?>
		<div id="erreur">
			<div class="alert-r">
				<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
				<?php echo $er.', veuillez recommencer l\'inscription.'; ?>
			</div>
		</div>
<?php 
	}
	else {?>
		<div id="valide">
			<div class="alert-v">
				<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
				<?php echo 'Votre inscription est termin&eacute;e, vous pouvez maintenant vous connecter.<br /><a href="index.php">Connexion</a>'; ?>
			</div>
		</div>
<?php
	}
}

include('footer_simple.php');
?>