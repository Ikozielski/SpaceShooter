/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor



if(keyboard_check_pressed(vk_down)) {
	atual += 1;
	play_audio(sfx_zap, 0, 0);
	margem = 0;
}
if(keyboard_check_pressed(vk_up)){
	atual -= 1;
	play_audio(sfx_zap, 0, 0);
	margem = 0;
}

atual = clamp(atual, 0, array_length(menu) - 1);
margem = lerp(margem, 40, .1);


show_debug_message(atual);
