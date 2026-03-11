/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(!instance_exists(sequenciaBossFinal)){
	 var _boss = instance_create_layer(145,-64,"Inimigos",obj_inimigo_2);
	 
#region Barra de vida 
	x_BarraDeVida = 0;
	tamanhoBarraDeVida = 0;
	hp = _boss.vida;
	hpMaximo = 50;
	hpSombra = 50;
#endregion
	
	//show_message("nasci");
	_boss.boss = true;

	//Boss nasceu
	_boss.vida = 50;
	
	show_debug_message(_boss.vida)
	
	if(_boss.vida <= 40){
		dropPowerUps();
	}

	

	//Alterando a cor do inimigo 2 - Para se transformar no Boss 
	//corBoss = make_colour_rgb(255,0,0);
	_boss.image_blend = c_red;
	_boss.image_alpha = .8;
}