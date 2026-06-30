/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor



if (global.histop) exit;

if(instance_exists(obj_player)){
	x = obj_player.x;
	y = obj_player.y
} else{
	instance_destroy();
}
