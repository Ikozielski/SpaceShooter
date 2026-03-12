/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(room == rm_jogo) draw_text(20, 20 ,"Pontos: " + string(global.pontos));

if(global.transicao) exit;

var _gui_height = display_get_gui_height();
//Desenhando as vidas do Player


//altura boa vida - 115 / escudo -50

//Desenhando a palavra vida na base da janela 

desenha_icone(spr_icone_vida, vidas, _gui_height - 180);

desenha_icone(spr_escudo, escudos, _gui_height - 115);

desenha_icone(spr_powerUp_velocidade, boost, _gui_height - 50);

//desenha_icone(spr_escudo);
