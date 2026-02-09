/// @description 
// Você pode escrever seu código neste editor

#region	Variáveis 
velocidade = 2;

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


	//if (_cima) y -= velocidade;
	//if (_baixo) y += velocidade;
	//if (_esquerda) x -= velocidade;
	//if (_direita) x += velocidade;
	
	
	
	
}

#endregion