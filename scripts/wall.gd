extends RigidBody2D

@onready var particles = $death

func _ready() -> void:
	particles.emitting = false

func hit():
	GameManager.addPoints(1)
	
	# Activa la gravedad
	gravity_scale = 1
	# Aplica un impulso hacia abajo
	apply_impulse(Vector2.ZERO, Vector2(0, 300))
	# Opcional: desactiva la colisión para que no rebote con la bola
	$CollisionShape2D.disabled = true
	
	
	var bricksLeft = get_tree().get_nodes_in_group('Wall')
	
	await get_tree().create_timer(0.2).timeout
	fade_out()
	particles.emitting = true
	
	if bricksLeft.size() == 1:
		get_parent().get_node("projectile").is_active = false
		await get_tree().create_timer(1).timeout
		GameManager.lvl += 1
		get_tree().reload_current_scene()
	else:
		await get_tree().create_timer(2).timeout
		$Sprite2D.visible = false
		queue_free()

func fade_out():
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 1)
	tween.tween_callback(Callable(self, "queue_free"))
	
