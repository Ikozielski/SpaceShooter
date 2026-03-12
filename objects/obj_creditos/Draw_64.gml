/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(!global.transicao){
	
	draw_text(20, 20, "ESC - Voltar");
	
	draw_text(225, 150, " Desenvolvedor:\n Iury Kozielski");
	
	draw_text(25, 620, "Apoie!");
	

	draw_set_font(fnt_tutorial);

	draw_sprite_ext(spr_instagram, 0, 50, 300, 2, 2, 1, c_white, .9);
	draw_text(80, 290, "  @iury_kozielski");

	draw_sprite_ext(spr_youtube, 0, 50, 400, 2, 2, 1, c_white, 1);
	draw_text(80, 387, "  @iuryKzK");

	draw_sprite_ext(spr_gmail, 0, 50, 500, 2, 2, 1, c_white, 1);
	draw_text(80, 490, "  contato.iurykozielski@gmail.com");

	draw_sprite_ext(spr_apoie, 0, 50, 600, 2, 2, 1, c_white, 1);
	draw_text(80, 590, "  livepix.gg/iurykzk");

	

	//draw_text(250, 490, "Comandos:");

	//draw_text(205, 520, "WASD - Movimentação");
	//draw_text(225, 550, "  Espaco - Atirar");
	//draw_text(225, 580, "     E - Escudo");
	//draw_text(225, 610, "    Shift - Boost");
	//draw_text(225, 640, "    ESC - Voltar");

	draw_set_font(-1);
	
}