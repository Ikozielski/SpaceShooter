/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (!in_sequence && criado_em_sequencia) instance_destroy();

//maquinaDeEstados();

retorna_efeito_mola();
contador_efeito_dano();

show_debug_message(global.bossMorreu);

if (boss){
	if (y <= 150){
		vspeed = 1.2;
	} else{
		vspeed = 0;
	}
	
	if(vida <= 40 && vida >= 35 && !bossDropou){
		repeat(5){
			dropPowerUps();
		}
		bossDropou = true;	
	} else if (vida <= .5) global.bossMorreu = true;
	
	
	//if(!instance_exists(obj_inimigo_2)){
	//	alarm[1] = game_get_speed(gamespeed_fps) * 3;
	//}
}