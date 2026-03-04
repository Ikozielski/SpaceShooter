/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//draw_self();


//Mesma função de se desenhar do que o drawself, mas pode ser usado
//para não aumentar a mascara de colisao, caso aumente a sprite por codigo

//draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_alpha, image_blend, image_alpha);
//vou deixar comentado, pq vou colocar em uma função pra ele se desenhar 


//xscale e yscale são variaveis, que vão controlar o tamanho da escala da sprite, diferente do padrão usado pra se desenhar
// image_xscale e image_yscale, que desenham a escala atual da sprite 

//Só vou me desenhar branco se eu tomei tiro


desenha_efeito_dano(desenha_efeito_mola);


/*
if(tomei_tiro){
	//Desenhando o shader
	shader_set(sh_branco);

	desenha_efeito_mola();

	//Resetando o shader
	shader_reset();
} else{
	desenha_efeito_mola();
}
*/
