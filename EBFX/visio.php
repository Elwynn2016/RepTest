<!DOCTYPE html>
<?php
require ('connexion.php');
require ('header.php');
?>
	
<h1> VisioConférence </h1>
<hr width="100%" color="7ad443">
<h2> En direct </h2>  
<iframe frameborder="0" width="480" height="270" src="//www.dailymotion.com/embed/video/x51s6gc" allowfullscreen></iframe><br />

<h2> Anciennes visios </h2>
<div id="visios">
<?php 
	$req = $bd->prepare('select lien from diffusion');
	$req->execute();
	
	while($visio = $req->fetch(PDO::FETCH_ASSOC) )
	{
		$lien = $visio['lien'];
		
		// retire http://www.dailymotion.com/video/ et l'eventuelle fin à l'adresse pour garder le code de la video
		$debut = explode("/video/",$lien,2);
        $fin = explode("_",$debut[1],2);
        $code = $fin[0];
		
		// recupere le titre
		$tags = json_decode(file_get_contents("https://api.dailymotion.com/video/".$code),true);
        $titre = htmlspecialchars($tags["title"]);
		
		echo '	<div class="unevid">
			<a href='.$lien.'
			<span> 
				<img src="http://www.dailymotion.com/thumbnail/160x120/video/'.$code.'"><br/>
				'.$titre.'<br/>				
			</span>
			</a>
		</div>'."\n";
	}
?>
</div>

<?php require('footer.php'); ?>