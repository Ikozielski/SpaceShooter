/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

vida = 10;

carregando_tiro = game_get_speed(gamespeed_fps) * 3;
timer_tiro = 0;

//variavel que controla os estados
estado = "chegando";


morrendo = function(){

	if (vida > 1){
		vida -= 1;
	} else{
		sendo_destruido(obj_explosao_inimigo);
		instance_destroy();
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
			
			//Ele vai esperar 3 segundos, e depois disso, vai pro estado atirar
			
			//por enquanto está errado
			if (timer_tiro >= carregando_tiro){
				estado = "atirando";
			} else {
				timer_tiro = game_get_speed(gamespeed_fps);
			}
			
			show_debug_message(estado);
			
			
			
			
		} break;
		
		
		
		
		
		
	}
}