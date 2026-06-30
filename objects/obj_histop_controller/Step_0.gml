if (keyboard_check_pressed(vk_numpad5)) {
	global.histop = true;
	timer_histop = game_get_speed(gamespeed_fps) * 1;
	with (all) {
		if (id != other.id) {
			_saved_image_speed = image_speed;
			_saved_speed = speed;
			image_speed = 0;
			speed = 0;
		}
	}
}

metodo_timer();
