/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

criado_em_sequencia = in_sequence;

estados = "chegando";

vida = 10;

inicia_efeito_mola();
inicia_efeito_dano();

//hspeed = random_range(-2, 2);
hspeed = -1;

alarm[0] = game_get_speed(gamespeed_fps) * 2;

atirando = function(){
	_angulo = 225;
	
	if (global.transicao) exit;
		if (instance_exists(obj_player)){
				repeat(30){
					play_audio(sfx_laser2, 0, 0);
					var _tiro = instance_create_layer(x, y, "Projeteis", obj_tiro_inimigo_2);
					_tiro.speed = 5;
					_tiro.direction = _angulo;
					_tiro.image_angle = _angulo + 90;
					_angulo += 25;
				}
		}
}

morrendo = function(){
	
	//Fazendo o efeito mola
	efeito_mola(1.5, .5);
	timer_efeito_dano(3);
	
	if(vida > 1){
		vida--;
		play_audio(sfx_hit, 0, 0);
	}else {
		var _camelo = random_pitch(.9, 1.1);
		show_debug_message(_camelo);

		//Explodindo
		play_audio(sfx_explosion, 0,0, , ,_camelo);
	
		sendo_destruido(obj_explosao_inimigo);
		screenShake(30);
		var _chance = random(100);
	
		dropPowerUps();
		
	}
	
}

//Funciona se o inimigo for colocado direto na room, mas como vou fazer sequencias de waves
//esse código vai me atrapalhar
/*
maquinaDeEstados = function(){
	switch(estados){
	
		case "chegando":
			if(x >= room_width / 2){
				hspeed = -1.2;
			} else {
				hspeed = 0;
				iniciaFlutuar();
				estados = "flutuando"
			} break;
			
		case "flutuando":
			flutuar();
	}
}
*/
