/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

criado_em_sequencia = in_sequence;


hspeed = random_range(-2, 2);

alarm[0] = game_get_speed(gamespeed_fps) * 2;

atirando = function(){
	var _tiro = instance_create_layer(x, y, "Projeteis", obj_tiro_inimigo_1);

}

morrendo = function(){
	sendo_destruido(obj_explosao_inimigo);
	var _chance = random(100);
	
	if(_chance > 95){
		//Criando o PowerUp
		instance_create_layer(x, y, layer, obj_powerUp);
	}
}