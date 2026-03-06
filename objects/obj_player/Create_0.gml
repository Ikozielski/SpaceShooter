/// @description 
// Você pode escrever seu código neste editor

//Parando de tocar qualquer audio e Tocando a musica do jogo
audio_stop_all();
//musica_fundo, é a uma variavel definida no player, pra poder controlar qual musica toca na rrom que o player está 
audio_play_sound(musica_fundo, 0, 1);

#region	Variáveis 
velocidade = 2;

//Cooldown tiro
espera_tiro = 10;
timer_tiro = 0;

//Vidas - Max 7
vidas = 5;
//Escudo - Max 7
escudos = 3;
//Boost de Velocidade - Max 5
boost = 1;


//Level do Tiro 
level_tiro = 1;

inicia_efeito_dano();

//Váriavel pra saber se tenho meu escudo
meuEscudo = noone;

tempo_invencivel = game_get_speed(gamespeed_fps) * 2;
timer_invencivel = 0; 

inicia_efeito_mola();

#endregion

#region Métodos
//Método de controlar o player 

controla_player = function(){
	
	if (timer_invencivel > 0) timer_invencivel--;
	
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
	
	var _velocidadeH = ((_direita - _esquerda) * velocidade) * global.velocidadeMaxima;
	x += _velocidadeH;
		
	var _velocidadeV = ((_baixo - _cima) * velocidade) * global.velocidadeMaxima;
	y += _velocidadeV;
	
	
	//Limitando a posição do Player
	bordaLimite();

	//if (_cima) y -= velocidade;
	//if (_baixo) y += velocidade;
	//if (_esquerda) x -= velocidade;
	//if (_direita) x += velocidade;
	
	if(keyboard_check_released(ord("E"))) usa_escudo();
	
	//Se eu apertei para baixo o level do tiro aumenta
	if (keyboard_check_pressed(ord("L"))) level_tiro++;
	
	

	com_escudo();

	timer_tiro--;
	//if(_cima) level_tiro = 1;
	//if (_baixo) level_tiro = 2;
	
	if 	(_atirar && timer_tiro <= 0){
		
		//Quando player atira, muda o tamanho dele 
		efeito_mola(.8, 1.2);
		play_audio(sfx_laser1, 0, 0);
		
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
		//_tiro.vspeed = -10;
			

}

tiro_2 = function(){
	var _tiro = instance_create_layer(x - 15, y, "Projeteis", obj_tiro);
		//_tiro.vspeed = -10;
		_tiro = instance_create_layer(x + 5 , y, "Projeteis", obj_tiro);
		//_tiro.vspeed = -10;
}

tiro_3 = function(){
	tiro_1();
	tiro_2();
}

ganha_level_tiro = function (){
	if(level_tiro < global.maxLevel) {
		level_tiro++;
	} else if(escudos < 7) {
		escudos += 1;
	}
	
}

desenha_icone = function(_icone = spr_icone_vida, _quantidade = 1, _altura){

	draw_text(10, display_get_gui_height() - 215, "Vidas: ");
	draw_text(10, display_get_gui_height() - 150, "Escudos: ");
	draw_text(10, display_get_gui_height() - 85, "Boost: ");

	var _espaco = 0;


	repeat(_quantidade){
		draw_sprite_ext(_icone,0, 20 + _espaco, _altura, 1,1,0,c_white,1);
		_espaco += 25;
	
	}
}

//Método para perder vida
perde_vida = function(){
	if (meuEscudo != noone) return;
	if(timer_invencivel > 0) return;
	
	screenShake(10);
	timer_efeito_dano(5);
	
	//Efeito ao tomar tiro
	efeito_mola(2, .5);
	retorna_efeito_mola(.4);
	
	if (vidas > 0){
		vidas--;	
	//	timer_invencivel = tempo_invencivel;
	} else{
		instance_destroy();
		instance_create_layer(x, y, "Particulas", obj_explosao_player);
		screenShake(50);
		transicao_entrada(x,y);
		global.transicao = true;
	}
}

usa_escudo = function(){
	if (escudos > 0 && meuEscudo == noone){
		play_audio(sfx_shieldUp, 0, 0);
		escudos--;
		
		meuEscudo = instance_create_layer(x, y, "Escudo", obj_escudo);
		meuEscudo.alarm[0] = tempo_invencivel;
		alarm[0] = tempo_invencivel;
		timer_invencivel = tempo_invencivel;
	}
}
com_escudo = function(){
	if(instance_exists(meuEscudo)){
		meuEscudo.x = x;
		meuEscudo.y = y;	
	} else {
		meuEscudo = noone;
	}
}

//Criando a transição na minha posição 
layer_sequence_create("Transicao", x, y, sq_transicao2);

//Avisando que o destino é a room inicial 
global.destino = rm_inicio;



#endregion