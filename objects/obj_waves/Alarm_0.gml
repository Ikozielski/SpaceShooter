/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor



if(indice < array_length(waves)){
	layer_sequence_create("Seq_Inimigos", 0, 0, waves[indice]);
	alarm[0] = intervaloSequencia;
	indice++;
} 