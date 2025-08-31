extends Node

var score = 0
var lvl = 1
var bestScore = 0

#p de Puntos
func addPoints(p):
	score += p
	if score > bestScore:
		bestScore = score
		
func _process(delta: float) -> void:
	
	
	$CanvasLayer/ScoreLabel.text = str(score)
	$CanvasLayer/LvlLabel.text = "Lvl: " + str(lvl)
	$CanvasLayer/BestScoreLabel.text = "Best: " + str(bestScore)
