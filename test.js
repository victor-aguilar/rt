/** Ending of Modernizr **/

var html5 = '<audio controls preload="auto" autobuffer>  <source src="http://www.vorbis.com/music/Epoq-Lepidoptera.ogg" /><source src="http://users.skynet.be/fa046054/home/P22/track06.mp3" /> </audio>';

var flash = '<object type="application/x-shockwave-flash" data="http://www.alsacreations.fr/flashdir/dewplayer-mini.swf" width="160" height="20" id="dewplayermini" name="dewplayermini"><param name="movie" value="http://www.alsacreations.fr/flashdir/dewplayer-mini.swf" /><param name="flashvars" value="mp3=http://www.alsacreations.fr/mp3/everywhere.mp3" /></object>';

if (Modernizr.audio){
	player = html5;
}else{
	player = flash;
}

document.write(player);