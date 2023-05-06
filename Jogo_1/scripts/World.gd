extends Node2D

var score

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

func new_game():
	score = 0
	
func add_score(points):
	score += points
	$HUD/pontuacao.atualiza_pontuacao(score)

func _on_Coins_coletada():
	add_score(10)
