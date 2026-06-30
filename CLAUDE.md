# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

SpaceShooter é um jogo 2D feito em **GameMaker Studio 2** (GML). Não há build via terminal — o projeto é aberto e executado diretamente na IDE do GameMaker. Arquivos `.yyp` e `.yy` são metadados do GameMaker; a lógica do jogo fica nos arquivos `.gml`.

## Arquitetura

### Rooms (fluxo de telas)
- `rm_inicio` → menu principal
- `rm_tutorial` → tutorial
- `rm_jogo` → jogo principal
- `rm_creditos` → créditos

Transições entre rooms usam `global.transicao` + `global.destino` com as funções `transicao_entrada()` / `transicao_saida()` / `muda_room_transicao()` de `scr_Funcoes`.

### Scripts globais
- **`scr_Globais`** — variáveis globais (`global.pontos`, `global.velocidadeMaxima`, `global.transicao`, `global.debug`, etc.). Inicializadas uma vez no início do jogo.
- **`scr_Funcoes`** — funções utilitárias reutilizáveis por qualquer objeto: `bordaLimite()`, `sendo_destruido()`, `screenShake()`, `efeito_mola()` / `retorna_efeito_mola()`, `desenha_efeito_dano()`, `dropPowerUps()`, `flutuar()`, `adicionaPontos()`, `transicao_entrada/saida()`, etc.
- **`scr_ScreenShake`** — versão alternativa/refatorada de `ScreenShake()` (em desenvolvimento na branch `game-feel`).
- **`spr_SquashStretch`** — funções de squash & stretch (`efeito_squash`, `retorna_efeito_squash`, `desenha_efeito_squash`). Duplica parcialmente as funções de mola de `scr_Funcoes`; a consolidação ainda não foi feita.

### Objetos principais
- **`obj_player`** — toda a lógica do jogador está em métodos definidos no Create (padrão GML de "métodos como variáveis"). Controla movimento (WASD/setas), tiro (espaço/LMB), escudo (E), boost (Shift), vidas, level de tiro (1–3) e efeitos visuais.
- **`obj_waves`** — gerencia o loop de ondas de inimigos via array de sequences (`sq_wave1`…`sq_wave10`). Cada onda é disparada por `alarm[0]` com intervalo de ~5.8s. Após todas as ondas, spawna o boss (`obj_inimigo_2` com `boss = true`, `vida = 50`, cor vermelha).
- **`obj_screenShake`** — aplica screen shake via `view_set_xport/yport`. Recebe intensidade pela variável `treme`; usa `lerp` para suavizar. Chamado indiretamente via `screenShake(_treme)` de `scr_Funcoes`.
- **`obj_controler`** — controlador de room; atualmente quase vazio.
- **`obj_inimigo_1/2/3`** — inimigos com comportamentos distintos. `obj_inimigo_2` serve como boss quando `boss = true`. Inimigos criados via Sequences do GameMaker (não instanciados diretamente no Step).

### Shader
- **`sh_branco`** — shader de "flash branco" aplicado quando o player toma dano (`desenha_efeito_dano()`).

### PowerUps / PowerDown
Dropados por `dropPowerUps()` na morte de inimigos com probabilidades: vida (>90), velocidade (>60, se `velocidadeMaxima < 1.5`), escudo/tiro (>50), power down (else).

## Convenções importantes

- **Métodos como variáveis no Create**: `obj_player` define toda sua lógica como funções atribuídas a variáveis no evento Create (ex.: `controla_player = function(){...}`). O Step chama esses métodos.
- **`in_sequence`**: inimigos checam `in_sequence` no Step para se auto-destruírem quando a sequence termina.
- **`global.debug`**: flag para habilitar comportamentos de debug; atualmente `true` em `scr_Globais`.
- **Efeito mola vs squash**: `scr_Funcoes` tem `efeito_mola/retorna_efeito_mola/desenha_efeito_mola` e `spr_SquashStretch` tem funções equivalentes com nome `squash`. São a mesma ideia — ao adicionar novos efeitos, verificar qual conjunto já está sendo usado no objeto alvo.
