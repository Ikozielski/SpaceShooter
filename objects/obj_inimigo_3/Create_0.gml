/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

vida = 10;

carregando_tiro = game_get_speed(gamespeed_fps) * 2;
timer_tiro = 0;

contador_tiro = 0;

decidi_direcao = false;

inicia_efeito_mola();
inicia_efeito_dano();

//variavel que controla os estados
estado = "chegando";


morrendo = function(){
		
	//Fazendo o efeito mola
	efeito_mola(1.5, .5);
	timer_efeito_dano(3);
	
	
	
	if (vida > 1){
		vida -= 1;
		play_audio(sfx_hit, 0, 0);
	} else{
		sendo_destruido(obj_explosao_inimigo);
		play_audio(sfx_explosion,0, 0);
		screenShake(20);
		instance_destroy();
	}
}

boss_foge = function(){
	
	if(instance_exists(obj_player)){
		if (contador_tiro < 3){
			estado = "carregando";
		} else{
			estado = "fugindo";
		}
	} else {
		estado = "fugindo";
	}	
}
	
maquina_de_estados = function(){
	
	switch(estado){
		case "chegando":{
			if (y <= 184){
				vspeed = 1.2;
			} else{
				estado = "carregando";
			  }
		} break;
		
		case "carregando":{
			vspeed = 0;
			
			timer_tiro++;
			
			//Ele vai esperar 3 segundos, e depois disso, vai pro estado atirar
			
			//por enquanto está errado
			if (timer_tiro >= carregando_tiro){
				estado = choose("atirando", "atirando2");
				timer_tiro = 0;
				contador_tiro++;
			}
		} break;
		
		//Estado Atirando 
		case "atirando":{
			if(global.transicao) exit;
			
			//Encontrando a direção do player
			var _direcao = point_direction(x, y, obj_player.x, obj_player.y);
			
			//Fazer ele checar se o player existe 
			
			if (instance_exists(obj_player)){
				play_audio(sfx_laser2, 0, 0);
				var _tiro = instance_create_layer(x, y, "Projeteis", obj_tiro1_inimigo_3);
				_tiro.speed = 2;
				_tiro.direction = _direcao;
				_tiro.image_angle = _direcao + 90;
				estado = "carregando";
				
				boss_foge();
			}
			
		} break;
		
		case "atirando2":{
			if(global.transicao) exit;
			
			_angulo = 245;
			
			//Fazer o tiro b ir pra baixo, e depois voltar a carregar 
			if (instance_exists(obj_player)){
				repeat(3){
					play_audio(sfx_laser2, 0, 0);
					var _tiro = instance_create_layer(x, y, "Projeteis", obj_tiro2_inimigo_3);
					_tiro.speed = 4;
					_tiro.direction = _angulo;
					_angulo += 25;
				}
				boss_foge();
			}

		} break;
		
		case "fugindo":{
			
			if(!decidi_direcao){
				hspeed = choose(-1, 1);
				decidi_direcao = true;
			}
			
			vspeed = -2;
			
			if ( y <= -100) instance_destroy();
			
		} break;
		
		
		
		
		
	}
}