/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

incrementoVelocidade = .1;
velocidade = 1; 

direction = choose(45, 135, 225, 315);

speed = velocidade;

ficaNaRoom = function(){
		
	// Laterais
	if (x < 0) {
	    x = -x;
	    direction = 180 - direction;
	    speed += incrementoVelocidade;
	}
	else if (x > room_width) {
	    x = room_width - (x - room_width);
	    direction = 180 - direction;
	    speed += incrementoVelocidade;
	}

	// Topo
	if (y < 0) {
	    y = -y;
	    direction = -direction;
	    speed += incrementoVelocidade;
	}

	// Saiu por baixo
	if (y > room_height) {
	    instance_destroy();
	}
	
	/*
	// Bounce nas paredes laterais
	if (x <= 0 || x >= room_width + 32) {
		speed += incrementoVelocidade;
	    direction = -direction;
	}

	// Bounce no topo
	if (y <= 0) {
		speed += incrementoVelocidade;
	    direction = -direction;
	}

	// Se sair por baixo da room, destrói
	if (y > room_height) {
	    instance_destroy();
	}
	*/
}
