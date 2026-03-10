/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//if (indice <= array_length(waves)){
//	draw_text(256,20, "Wave: " + string(indice));
//}

if(boss_spawnado){
	draw_text(256,250, "FINAL BOSS");
} else {
	draw_text(256,20, "Wave: " + string(indice));
}