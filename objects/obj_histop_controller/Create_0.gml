timer_histop = 0;

metodo_timer = function() {
	if (timer_histop > 0) {
		timer_histop--;
		if (timer_histop <= 0) {
			global.histop = false;
			with (all) {
				if (id != other.id && variable_instance_exists(id, "_saved_image_speed")) {
					image_speed = _saved_image_speed;
					speed = _saved_speed;
				}
			}
		}
	}
}
