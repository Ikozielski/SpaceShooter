/// @description 
// Você pode escrever seu código neste editor

controla_player();

//Mudando o valor do level do meu tiro
//Se eu apertei para cima, o level do tiro diminui

//if (keyboard_check_pressed(vk_up)){
//	level_tiro--;
//}



retorna_efeito_mola(.4);

contador_efeito_dano();

boostVelocidade();

if (!instance_exists(obj_creditos)) global.creditos = false;


//if(instance_exists(meuEscudo)){
//	meuEscudo.x = x;
//	meuEscudo.y = y;	
//} else {
//	meuEscudo = noone;
//}








//Crie um debug do level do tiro

// Crie esse debug no evento draw

//Use um draw text para desenhar na tela o level do tiro dele 
