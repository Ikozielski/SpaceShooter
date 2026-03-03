
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