extends CharacterBody2D

@onready var hitParticles = $CPUParticles2D

var speed = 200
var dir = Vector2.DOWN
var is_active = true

# tiempo desde spawn (evita triggers inmediatos)
var alive_time := 0.0
var spawn_safe_time := 0.12 # segundos de gracia

var hitCounter = 0

func _ready() -> void:
	velocity = Vector2(speed * -1, speed)
	speed = speed + (10*GameManager.lvl)
	
	
func _physics_process(delta: float) -> void:
	
	alive_time += delta
	if is_active:
		var collision = move_and_collide(velocity * delta)
		
		if collision:
			velocity = velocity.bounce(collision.get_normal())
			
			if collision.get_collider().has_method("hit"):
				hitCounter += 1
				collision.get_collider().hit()
				hitParticles.emitting = true
				_play_pling_for_combo()
			else:
				hitCounter = 0
				$"ball-wall".playing = true
		if(velocity.y > 0 and velocity.y < 200):
			velocity.y = -200
		
		if(velocity.x == 0):
			velocity.x = -300
			
		
func gameOver():
	GameManager.score = 0
	GameManager.lvl = 1
	get_tree().reload_current_scene()

func _on_death_zone_body_entered(body: Node2D) -> void:
	if alive_time < spawn_safe_time:
		return
	if body != self:
		return
	gameOver()
	
func _play_pling_for_combo(max_variants := 12) -> void:
	# Asume nodos llamados "pling1", "pling2", ..., "plingN" como hijos del mismo nodo
	var idx = clamp(hitCounter, 1, max_variants)
	var node_name = "pling%d" % idx
	var pling_node = get_node_or_null(node_name)
	if pling_node:
		pling_node.playing = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("ballParticlesHit"):
		hitParticles.emitting = true
