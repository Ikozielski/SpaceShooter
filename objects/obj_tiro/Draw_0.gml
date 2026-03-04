/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


draw_self();

//Efeito de Brilho no Tiro
gpu_set_blendmode(bm_add);
//Desenhando NOVAMENTE a sprite do tiro, mas um pouco mais transparente
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * 2, image_yscale * 2, image_angle, c_aqua, 0.5);

gpu_set_blendmode(bm_normal);