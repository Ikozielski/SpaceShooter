/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

instance_destroy();

other.perde_vida();

if(!other.timer_invencivel > 0){
	 other.escudos--;
	 other.boost--;
}

//if (other.escudos >= 0) other.escudos--;
if (other.level_tiro > 1) other.level_tiro--;

var _particula = instance_create_layer(x,y,layer, obj_explosao_tiro);

_particula.image_angle = random(359);
