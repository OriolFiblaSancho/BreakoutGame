extends Node2D

@onready var wallObject = preload("res://scenes/wall.tscn")
var col = 14
var rows = 8
#Margen con el borde de la pantalla
var margin = 60
#Margen entre muros
#Equivalen al tamaño de los muros + 2 pixeles
var padding_x = 65
var padding_y = 34

func _ready() -> void:
	setupLevel()
	$AudioStreamPlayer2D.playing = true
func setupLevel():
	
	var colors = getColors()
	if $AudioStreamPlayer2D.playing != true:
		$AudioStreamPlayer2D.playing = true
	
	for r in rows:
		for c in col:
			#Esto hace que el nivel sea diferente en cada iteracion
			var randNum = randi_range(0,4)
			if randNum > 0:
				var newWall = wallObject.instantiate()
				add_child(newWall)
				newWall.position = Vector2(margin + ( padding_x * c), margin + (padding_y * r))
			
				var sprite = newWall.get_node('Sprite2D')
				if r == 9:
					sprite.modulate = colors[8]
				if r == 8:
					sprite.modulate = colors[7]
				if r == 7:
					sprite.modulate = colors[6]
				if r == 6:
					sprite.modulate = colors[5]
				if r == 5:
					sprite.modulate = colors[4]	
				if r == 4:
					sprite.modulate = colors[3]
				if r == 3:
					sprite.modulate = colors[2]
				if r == 2:
					sprite.modulate = colors[1]
				if r == 1:
					sprite.modulate = colors[0]
				if r == 0:
					sprite.modulate = colors[0]
				
				

func getColors():
	var colors = [
		Color8(255,  59,  48),  # rojo
		Color8(255, 149,   0),  # naranja
		Color8(255, 204,   0),  # amarillo
		Color8(76, 217, 100),   # verde
		Color8(52, 199, 235),   # cyan
		Color8(0, 122, 255),    # azul
		Color8(88,  86, 214)    # morado
	]
	return colors
