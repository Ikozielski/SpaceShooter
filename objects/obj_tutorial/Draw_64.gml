/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(!global.transicao){

	draw_sprite_ext(spr_powerUp, 0, 50, 100, 2, 2, 1, c_white, 1);
	draw_text(80, 80, " Aumenta o poder de tiro (MAX 3)\n Se estiver Nivel Maximo Ganha 1 Escudo. + 50 Pontos");

	draw_sprite_ext(spr_powerUp_velocidade, 0, 50, 200, 2, 2, 1, c_white, 1);
	draw_text(80, 180, " Aumenta a Velocidade de Movimento (MAX 5)\n Ganha uma Carga do Boost. + 50 Pontos");

	draw_sprite_ext(spr_powerUp_vida, 0, 50, 300, 2, 2, 1, c_white, 1);
	draw_text(80, 290, " Aumenta 1 de Vida (MAX 7). + 50 Pontos");

	draw_sprite_ext(spr_powerDown, 0, 50, 400, 2, 2, 1, c_white, 1);
	draw_text(80, 370, " Diminui 1 de Vida, 1 de Escudo e 1 de Boost. \n Sem efeito se o escudo estiver Ativo. + 10 Pontos\n ao Destruir");

	draw_set_font(fnt_tutorial);

	draw_text(250, 490, "Comandos:");

	draw_text(205, 520, "WASD - Movimentação");
	draw_text(225, 550, "  Espaco - Atirar");
	draw_text(225, 580, "     E - Escudo");
	draw_text(225, 610, "    Shift - Boost");
	draw_text(225, 640, "    ESC - Voltar");

	draw_set_font(-1);
	
}