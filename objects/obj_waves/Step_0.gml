/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


if(indice = array_length(waves)){
    if(!instance_exists(obj_inimigo_2) && !instance_exists(obj_inimigo_3) && !boss_spawnado){
        boss_spawnado = true;
		alarm[1] = game_get_speed(gamespeed_fps) * 2;
    }
}