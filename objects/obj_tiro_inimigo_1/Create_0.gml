/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

speed = 5;
direction = 270;

morrendo = function(){

instance_destroy();

//Criando a particula 

var _particula = instance_create_layer(x, y, layer, obj_explosao_tiro);

_particula.image_angle = random(359);
}