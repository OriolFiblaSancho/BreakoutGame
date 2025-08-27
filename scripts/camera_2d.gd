extends Camera2D

@export var shake_duration: float = 0.3  # cuánto dura el temblor
@export var shake_magnitude: float = 5  # cuánto se mueve la cámara
@export var shake_steps: int = 5 #Cuantos movimientos aleatorios

@onready var cam = get_viewport().get_camera_2d()


func start_shake():
	var tween = create_tween()
	var step_time = shake_duration / shake_steps
	for i in range(shake_steps):
		var random_offset = Vector2(
			randf_range(-shake_magnitude, shake_magnitude),
			randf_range(-shake_magnitude, shake_magnitude)
		)
		tween.tween_property(self, "offset", random_offset, step_time).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	# Último movimiento vuelve al cero suavemente
	tween.tween_property(self, "offset", Vector2.ZERO, step_time).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

func _reset_position():
	offset = Vector2.ZERO


func _on_camera_shake_body_entered(body: Node2D) -> void:
	if body.is_in_group("Walls"):
		cam.start_shake()
