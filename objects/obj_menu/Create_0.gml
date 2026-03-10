/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Meu Menu terá as opções (Jogar, Tutorial e Sair)

//Criando um array para as opções do menu

menu = ["Jogar", "Tutorial","Creditos", "Sair"];

atual = 0;

margem = 40;

controla_menu = function(){
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
		
		if (keyboard_check_pressed(vk_enter)) ativa_menu();
}
	
desenha_menu = function(){
	//Desenhando a opção de jogar do meu menu
	var _metadeRoom = display_get_gui_height() / 3;

	draw_set_valign(1);

	//Definindo Fonte 
	draw_set_font(fnt_menu);

	var _alturaFonte = string_height("I");

	for (var i = 0;  i < array_length(menu); i++){
		//Variavel da cor do texto
		var _cor = c_white;
	
		//Variavel da Margem
		var _margem = 0; 
	
		if (i == atual){
			_cor = c_red;
			_margem = margem; 
		}
	
		draw_set_colour(_cor);
		draw_text( 20 + _margem, _metadeRoom + i * _alturaFonte * 1.2, menu[i]);
		draw_set_colour(-1);
	}


	draw_set_valign(-1);

	draw_set_font(-1);
}

ativa_menu = function(){
	switch(atual){
			//Jogar
			case 0: 
				transicao_entrada()
				global.destino = rm_jogo;
				global.transicao = 1;
			break;
			
			// Tutorial
			case 1:
				transicao_entrada()
				global.destino = rm_tutorial;
				global.transicao = 1;
			
			break;
			
			//Creditos
			case 2:
				transicao_entrada()
				global.destino = rm_creditos;
				global.transicao = 1;
			break;
			
			//Sair
			case 3: game_end();
			
			break;
			
		}
}