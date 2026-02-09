/// @description 
// Você pode escrever seu código neste editor

controla_player();

//Mudando o valor do level do meu tiro
//Se eu apertei para cima, o level do tiro diminui

//if (keyboard_check_pressed(vk_up)){
//	level_tiro--;
//}

//Ativando ou Desativando o Debug
if(keyboard_check_released(vk_tab)) global.debug = !global.debug;


//Se eu apertei para baixo o level do tiro aumenta

//if (keyboard_check_pressed(vk_down)){
//	level_tiro++;
//}

//Crie um debug do level do tiro

// Crie esse debug no evento draw

//Use um draw text para desenhar na tela o level do tiro dele 
