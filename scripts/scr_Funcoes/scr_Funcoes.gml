
function bordaLimite() {

	x = clamp(x, sprite_width/2, room_width - sprite_width/2);
	y = clamp(y, 19, room_height - 19);
}

function sendo_destruido(_particula = obj_explosao_tiro){
	instance_destroy();
	instance_create_layer(x, y, "Particulas", _particula);
}

function screenShake(_treme = 0){
	
	
	if(instance_exists(obj_screenShake)){	
		
		//Acessar o objeto screnshake
		with(obj_screenShake){
			if(_treme > treme){
				treme = _treme;	
			}
		}
		//obj_screenShake.treme = _treme;
	}
}

function sequenciaScreenShake(){
	screenShake(40);
}


function inicia_efeito_mola(){
		xscale = 1;
		yscale = 1;	
}

function efeito_mola(_xscale = 1, _yscale = 1){
	xscale = _xscale;
	yscale = _yscale;
}

function retorna_efeito_mola(_quantidade = .1){
	xscale = lerp(xscale, 1, _quantidade);
	yscale = lerp(yscale, 1, _quantidade);
}

function desenha_efeito_mola(){
	draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_alpha, image_blend, image_alpha);
}

function inicia_efeito_dano(){
	tomei_tiro = false;
}

function timer_efeito_dano(_tempo = 1){
	tomei_tiro = _tempo;
}

function contador_efeito_dano(){
	if (tomei_tiro > 0 ) tomei_tiro--;
}

function desenha_efeito_dano(_funcao_desenho = draw_self){
	if (tomei_tiro){
		shader_set(sh_branco);
		_funcao_desenho();
		shader_reset();
	} else {
		_funcao_desenho();
	}
}

function play_audio(_audio, _prioridade = 0, _loops = 0, _ganho = undefined, _offset = undefined, _pitch = undefined, _listener_mask = undefined){
	audio_play_sound(_audio, _prioridade, _loops, _ganho,_offset, _pitch, _listener_mask);
}

function random_pitch(_valorPitch1 = .9, _valorPitch2 = 1.1){
	return random_range(_valorPitch1, _valorPitch2);
}

function muda_room_transicao(){
	room_goto(global.destino);
	
	//Parando todos os sons
	audio_stop_all();
}

function transicao_entrada(_largura = room_width / 2, _altura = room_height / 2){
	layer_sequence_create("Transicao", _largura,  _altura, sq_transicao1);
}

function transicao_saida(_largura = room_width / 2, _altura = room_height / 2){
	layer_sequence_create("Transicao", _largura,  _altura, sq_transicao2);
}

function finalisa_transicao(){
	global.transicao = false;
}

function dropPowerUps(){
	
	var _chance = random(100);
	
	if(_chance > 90){
		//Criando o PowerUp
		_poderVida = instance_create_layer(x, y, "PowerUp", obj_powerUp_vida);
	} else if(_chance > 60 && global.velocidadeMaxima < 1.5){
		_poderVelocidade = instance_create_layer(x, y,  "PowerUp", obj_powerUp_velocidade);
		
	} else if(_chance > 50){
		_poderTiroEscudo = instance_create_layer(x, y, "PowerUp", obj_powerUp);
	} else{
		_poderRuim = instance_create_layer(x, y, "PowerUp", obj_powerDown);
	}
	
}

function iniciaFlutuar(){
	incrementoVelocidade = .1;
	velocidade = 1; 
	direction = choose(45, 135, 225, 315);
	speed = velocidade;
}

function flutuar(){
	
	// Laterais
	if (x < 0) {
	    x = -x;
	    direction = 180 - direction;
	    speed += incrementoVelocidade;
	}
	else if (x > room_width) {
	    x = room_width - (x - room_width);
	    direction = 180 - direction;
	    speed += incrementoVelocidade;
	}

	// Topo
	if (y < 0) {
	    y = -y;
	    direction = -direction;
	    speed += incrementoVelocidade;
	}
	
	if (y > room_height) {
	    instance_destroy();
	}
}

function adicionaPontos(_pontos = 1){
	global.pontos += _pontos
}