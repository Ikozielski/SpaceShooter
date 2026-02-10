/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (global.debug) draw_text(20, 20 ,"Level tiro: " + string(level_tiro));


	var _gui_height = display_get_gui_height();
//Desenhando as vidas do Player


//Desenhando a palavra vida na base da janela 

desenha_icone(spr_icone_vida, vidas, _gui_height - 115);

desenha_icone(spr_escudo, escudos, _gui_height - 50);

//desenha_icone(spr_escudo);
