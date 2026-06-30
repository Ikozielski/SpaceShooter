/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


if (global.histop) exit;

if (y <= -40){
	instance_destroy();
}

image_xscale = lerp(image_xscale, 1, .1);
image_yscale = lerp(image_yscale, 1, .1);

velocidadeY = lerp(velocidadeY, velocidadeMaxima, .1);
y -= velocidadeY;