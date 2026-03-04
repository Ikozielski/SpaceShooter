
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