extends Control

func _ready() -> void:
	$AnimationPlayer.play("RESET")
	hide()
	

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")
	hide()
	
func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")
	show()
func menu():
	if Input.is_action_just_pressed("pause") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("pause") and get_tree().paused == true:
		resume()


func _on_check_button_pressed() -> void:
	$click.play()

func _on_button_pressed() -> void:
	resume()


func _process(delta: float) -> void:
	menu()
