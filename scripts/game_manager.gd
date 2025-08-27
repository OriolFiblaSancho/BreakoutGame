extends Node

var score = 0
var lvl = 1

#p de Puntos
func addPoints(p):
	score += p

func _process(delta: float) -> void:
	$CanvasLayer/ScoreLabel.text = str(score)
	$CanvasLayer/LvlLabel.text = "Lvl: " + str(lvl)
