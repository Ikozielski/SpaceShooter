/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


if (global.histop) exit;

if (image_index <= 0.2 && image_speed < 0) instance_destroy();

if (timer_expira > 0) {
	timer_expira--;
	if (timer_expira <= 0) {
		image_speed = -1;
		play_audio(sfx_shieldDown, 0, 0);
	}
}