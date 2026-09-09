extends CharacterBody2D

func _physics_process(_delta: float) -> void:
	var running = Input.is_action_pressed("ui_shift")
	var baseSpeed = 110 if running else 73
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	velocity = direction * baseSpeed

	move_and_slide()
