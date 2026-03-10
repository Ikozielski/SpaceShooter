/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

instance_destroy();

if(global.velocidadeMaxima < 1.5) global.velocidadeMaxima += .1;  

play_audio(sfx_powerUp, 0, 0);

var _particula = instance_create_layer(x,y,layer, obj_explosao_tiro);

_particula.image_angle = random(359);

adicionaPontos(50);

if (other.boost < 3) other.boost++;

show_debug_message(global.velocidadeMaxima);