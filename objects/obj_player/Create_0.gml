/// @description 
// Você pode escrever seu código neste editor

#region	Variáveis 
velocidade = 2;

//Cooldown tiro
espera_tiro = 10;
timer_tiro = 0;

//Vidas

//Escudo

//Level do Tiro 
level_tiro = 0;

#endregion

#region Métodos
//Método de controlar o player 

controla_player = function(){

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
#endregion