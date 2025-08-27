extends CharacterBody2D


const SPEED = 500.0

func _physics_process(delta: float) -> void:
	var dir := Input.get_axis("ui_left","ui_right")
	
	if dir:
		velocity.x = dir * SPEED
	else:
		velocity.x = move_toward(velocity.x,0,SPEED)
	var old_y = global_position.y
	move_and_slide()
	global_position.y = old_y
