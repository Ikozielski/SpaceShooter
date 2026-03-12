/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(!instance_exists(sequenciaBossFinal)){
	global.desenhaBarra = true;
	 var _boss = instance_create_layer(145,-64,"Inimigos",obj_inimigo_2);

	 

	
	//show_message("nasci");
	_boss.boss = true;

	//Boss nasceu
	_boss.vida = 50;
	hp = _boss.vida;

	//Alterando a cor do inimigo 2 - Para se transformar no Boss 
	//corBoss = make_colour_rgb(255,0,0);
	_boss.image_blend = c_red;
	_boss.image_alpha = .8;
	
	
	//alarm[3] = game_get_speed(gamespeed_fps) * 3;
	
}