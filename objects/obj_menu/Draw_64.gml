/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


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
