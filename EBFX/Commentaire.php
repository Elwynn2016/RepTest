<meta charset="utf-8" />
<?php
require('connexion.php');

   if(isset($_POST['submit'])) /*Si le Bouton existe */
   {
      if(isset($_POST['pseudo'],$_POST['contenu']) AND !empty($_POST['pseudo']) AND !empty($_POST['contenu'])) /*Vérifie si tt les champs sont compléter & pas videe sinn Mess ERREUR!!!*/
	  {
         $pseudo = htmlspecialchars($_POST['pseudo']);//securisation !
         $contenu = htmlspecialchars($_POST['contenu']);
         if(strlen($pseudo) < 25) //Verification dla longeure
		 { try{ //INSERTION DANS LA BASE DE DONNER !!!
            $req = $bd->prepare('INSERT INTO commentaire (pseudo, contenu) VALUES  (:p,:c)');
			$req->bindValue(':p', $_POST['pseudo'] );
			$req->bindValue(':c', $_POST['contenu']);
            $req->execute();
			} catch(PDOException $e){ die('Erreur:'.$e->getMessage()); }
			
            echo "<span style='color:green'>Votre commentaire a bien été posté. </span>";
         } else {
            $c_Erreur = "Erreur: Le pseudo doit faire moins de 25 caractères.";
         }
      } else {
         $c_Erreur = "Erreur: Tous les champs doivent être complétés.";
      }
   }
   $com = $bd->prepare('SELECT * FROM commentaire ORDER BY date DESC '); // pr que les commentaire récent soit les 1er sur la liste !!!
   $com->execute();
?>
<h2>Vision:</h2>
<p> Lien de la Visio Elwynn</p>
<br />
<h2>Commentaires:</h2>
<form method="POST">
   <input type="text" name="pseudo" placeholder="Votre pseudo" /><br />
   <textarea name="contenu" placeholder="Votre commentaire..."></textarea><br />
   <input type="submit" value="Poster mon commentaire" name="submit" />
</form>
<?php 
if(isset($c_Erreur)) 
{
	echo  '<script type="text/javascript"> alert("'.$c_Erreur.'"); </script>'; // Affiche une alerte (fenetre)
}

while($c = $com->fetch()) 
{
  echo '<b>'.$c['pseudo'].':</b>'.$c['contenu'].'<br/>';
}
?>
