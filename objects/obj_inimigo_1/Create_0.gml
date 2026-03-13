/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

criado_em_sequencia = in_sequence;


//hspeed = random_range(-2, 2);

alarm[0] = game_get_speed(gamespeed_fps) * 2;

atirando = function(){
	if(global.transicao) exit;
	var _tiro = instance_create_layer(x, y, "Projeteis", obj_tiro_inimigo_1);
	play_audio(sfx_laser2,0,0);
}

morrendo = function(){
	
	var _camelo = random_pitch(.9, 1.1);
	//show_debug_message(_camelo);

	//Explodindo
	play_audio(sfx_explosion, 0,0, , ,_camelo);
	
	sendo_destruido(obj_explosao_inimigo);
	screenShake(30);
	adicionaPontos(100);
	
	dropPowerUps();
}