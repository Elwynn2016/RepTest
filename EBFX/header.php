<!DOCTYPE html>
<?php if(!isset($folder)) $folder=''; ?>
<html> 

	<head>

		<title>ENERBIOFLEX</title>
	
		<meta charset="utf-8">
	
		<link rel="stylesheet" type="text/css" href="<?php echo $folder ?>accueil.css">
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0">


    </head>

	<body>
	<header>
		<img  class="logo" src="<?php echo $folder ?>Images/logo1.png" alt="logo"  /> 

		<div id="zone_recherche">
			<input id="texte_recherche" type="text" placeholder="Rechercher" />
			<input id="bouton_recherche" type="image" src="<?php echo $folder ?>Images/bouton_recherche.png" alt="Rechercher" />
		</div>

		<div id="reseaux">		
				<a href="http://www.facebook.com/enerbioflex/info/?tab=page_info" class="fb">
					<img class="reseau"  src="<?php echo $folder ?>Images/fb_v.jpg" alt="Facebook" />
				</a>

				<a href="https://twitter.com/enerbioflex">
					<img class="reseau" src="<?php echo $folder ?>Images/tw_v.jpg" alt="Twitter" />
				</a>
				
				<a href="https://www.youtube.com/channel/UCtRzZBgashQrI6sm1WXzGlA" >
					<img class="reseau" src="<?php echo $folder ?>Images/yt_v.jpg" alt="Youtube" />
				</a>
				
				<a href="https://www.linkedin.com/company/enerbioflex">
					<img class="reseau" src="<?php echo $folder ?>Images/in_v.jpg" alt="Linkedin" />
				</a>
				
				<a href="https://www.dailymotion.com">
					<img class="reseau" src="<?php echo $folder ?>Images/dm_v.jpg" alt="Dailymotion" />
				</a>
				
		</div>
	</header>
	
	<nav>
	<label for="show-menu" class="show-menu">Menu</label>
	<input type="checkbox" id="show-menu" role="button">
	<ul id="menu">
		<li><a href="#">Accueil</a></li>
		<li><a href="#">Forum </a></li>
		<li><a href="#">Articles </a></li>
		<li><a href="#">VisioConférence</a></li>
		<li><a href="#">Mon Profil</a></li>
		<li><a href="InfoPratique.html" >Infos Pratiques</a></li>
		<li><a class="seconnecter" href="membre/inscription.php">S'inscrire</a></li>
		<li><a class="seconnecter" href="membre/index.php" >Se Connecter</a></li>
		<li><a></a></li>
		<li id="remplissage"><a></a></li>
		
	
	</ul>
	</nav>
	<main>