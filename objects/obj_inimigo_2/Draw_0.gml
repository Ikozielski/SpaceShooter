/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


desenha_efeito_mola();
desenha_efeito_dano(desenha_efeito_mola);


draw_self();

if(boss){

	var largura = 200;
	var altura = 10;
	var barra = vida / vidaMaximaBoss;

	var x1 = x - largura/2;
	var y1 = y - 50;


	//Borda
	draw_set_color(c_black);
	draw_rectangle(x1 - 1.5, y1 - 1.5, x1 + largura + 1.5, y1 + altura + 1.5, false);

	//Fundo
	draw_set_color(c_dkgray);
	draw_rectangle(x1, y1, x1 + largura, y1 + altura, false);

	//Vida
	draw_set_color(c_red);
	draw_rectangle(x1, y1, x1 + (largura * barra), y1 + altura, false);

	draw_set_color(c_white);
}