/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


if (global.histop) exit;

if(y > 512 || y < -100 || x > 400 || x < -100) {
	instance_destroy();
}

velocidadeY = lerp(velocidadeY, velocidadeMaxima, .1);
y += velocidadeY;