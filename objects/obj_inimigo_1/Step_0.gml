/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


x = clamp(x, sprite_width/2, room_width - sprite_width/2);

if (x <= sprite_width/2) {
    hspeed = random_range(1, 2);
}

if (x >= room_width - sprite_width/2) {
    hspeed = random_range(-2, -1);
}

//vspeed = random_range(1, 2);
