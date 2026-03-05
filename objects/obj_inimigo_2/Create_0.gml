/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

criado_em_sequencia = in_sequence;


//hspeed = random_range(-2, 2);

alarm[0] = game_get_speed(gamespeed_fps) * 2;

atirando = function(){
	_angulo = 225;
	
	if (global.transicao) exit;
		if (instance_exists(obj_player)){
				repeat(30){
					play_audio(sfx_laser2, 0, 0);
					var _tiro = instance_create_layer(x, y, "Projeteis", obj_tiro_inimigo_2);
					_tiro.speed = 4;
					_tiro.direction = _angulo;
					_tiro.image_angle = _angulo + 90;
					_angulo += 25;
				}
		}
}

morrendo = function(){
	
	var _camelo = random_pitch(.9, 1.1);
	show_debug_message(_camelo);

	//Explodindo
	play_audio(sfx_explosion, 0,0, , ,_camelo);
	
	sendo_destruido(obj_explosao_inimigo);
	screenShake(30);
	var _chance = random(100);
	
	dropPowerUps();
}