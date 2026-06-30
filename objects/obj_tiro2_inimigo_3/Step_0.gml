if (global.histop) exit;

if (y > 512 || y < -100 || x > 400 || x < -100) instance_destroy();

velocidadeX = lerp(velocidadeX, velocidadeMaximaX, .1);
velocidadeY = lerp(velocidadeY, velocidadeMaximaY, .1);
x += velocidadeX;
y += velocidadeY;
