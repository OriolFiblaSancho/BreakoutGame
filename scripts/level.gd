extends Node2D

@onready var wallObject = preload("res://scenes/wall.tscn")
var col = 6
var rows = 10
#Margen con el borde de la pantalla
var margin = 50
#Margen entre muros
#Equivalen al tamaño de los muros + 2 pixeles
var padding_x = 65
var padding_y = 34

func _ready() -> void:
	setupLevel()

func setupLevel():
	for r in rows:
		for c in col:
			
			var newWall = wallObject.instantiate()
			add_child(newWall)
			newWall.position = Vector2(margin + ( padding_x * c), margin + (padding_y * r))
