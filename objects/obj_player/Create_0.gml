/// @description 
// Você pode escrever seu código neste editor

#region	Variáveis 
velocidade = 2;

//Cooldown tiro
espera_tiro = 10;
timer_tiro = 0;

//Vidas
vidas = 5;
//Escudo
escudos = 3;

//Level do Tiro 
level_tiro = 0;

//Váriavel pra saber se tenho meu escudo 
meuEscudo = noone;

tempo_invencivel = game_get_speed(gamespeed_fps);
timer_invencivel = 0; 

#endregion

#region Métodos
//Método de controlar o player 

controla_player = function(){
	timer_invencivel--
	
	var _cima, _baixo, _esquerda, _direita, _atirar;
	_cima = keyboard_check(ord("W")) or keyboard_check(vk_up);
	_baixo = keyboard_check(ord("S")) or keyboard_check(vk_down);
	_esquerda = keyboard_check(ord("A")) or keyboard_check(vk_left);
	_direita = keyboard_check(ord("D")) or keyboard_check(vk_right);
	_atirar = keyboard_check(vk_space) or mouse_check_button(mb_left);
	
	//Fazendo a Movimentação Horizontal
	//Velocidade Horizontal 
	//1 - 0 = 1 * velocidade = 2
	//0 - 1 = -1 * velocidade = -2
	//0 - 0 = 0 * velocidade = 0
	//1 - 1 = 0 * velocidade = 0
	
	var _velocidadeH = (_direita - _esquerda) * velocidade;
	x += _velocidadeH;
		
	var _velocidadeV = (_baixo - _cima) * velocidade;
	y += _velocidadeV;
	
	
	//Limitando a posição do Player
	x = clamp(x, sprite_width/2, room_width - sprite_width/2);
	y = clamp(y, 19, room_height - 19);

	//if (_cima) y -= velocidade;
	//if (_baixo) y += velocidade;
	//if (_esquerda) x -= velocidade;
	//if (_direita) x += velocidade;
	
	timer_tiro--;
	//if(_cima) level_tiro = 1;
	//if (_baixo) level_tiro = 2;
	
	if 	(_atirar && timer_tiro <= 0){
		if(level_tiro == 1){
			tiro_1();
		}else if (level_tiro == 2){
			tiro_2();
		}else if (level_tiro == 3){
			tiro_3();
		}
		
		timer_tiro = espera_tiro;
	}
	
}

tiro_1 = function(){
	var _tiro = instance_create_layer(x - 5 , y, "Projeteis", obj_tiro);
		_tiro.vspeed = -10;
			

}

tiro_2 = function(){
	var _tiro = instance_create_layer(x - 15, y, "Projeteis", obj_tiro);
		_tiro.vspeed = -10;
		_tiro = instance_create_layer(x + 5 , y, "Projeteis", obj_tiro);
		_tiro.vspeed = -10;
}

tiro_3 = function(){
	tiro_1();
	tiro_2();
}

ganha_level_tiro = function (){
	if(level_tiro < global.maxLevel) level_tiro++;
	
}

desenha_icone = function(_icone = spr_icone_vida, _quantidade = 1, _altura){

	draw_text(10, display_get_gui_height() - 150, "Vidas: ");
	draw_text(10, display_get_gui_height() - 85, "Escudos: ");

	var _espaco = 0;


	repeat(_quantidade){
		draw_sprite_ext(_icone,0, 20 + _espaco, _altura, 1,1,0,c_white,1);
		_espaco += 25;
	
	}
}

//Método para perder vida
perde_vida = function(){
	if(timer_invencivel > 0) return;
	
	if (vidas >= 0){
		vidas--;	
		timer_invencivel = tempo_invencivel;
	} else{
		show_message("Morreu");
		game_restart();
	}
}

usa_escudo = function(){
	if (escudos > 0 && meuEscudo == noone){
		alarm[0] = game_get_speed(gamespeed_fps);
		escudos--;
		meuEscudo = instance_create_layer( x, y, "Escudo", obj_escudo);

	}
}

#endregion