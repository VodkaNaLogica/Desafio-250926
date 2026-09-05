extends CharacterBody2D

const JUMP_FORCE = -600.0

@onready var hud: Control = $"../CanvasLayer/HUD"

var contador: int = 0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta * 1.5

	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_FORCE

	var direction := Input.get_axis("ui_left", "ui_right")
	var running = Input.is_action_pressed("ui_shift")
	var BASE_SPEED = 950.0 if running else 680.0
	
	if direction:
		velocity.x = direction * BASE_SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, BASE_SPEED)

	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == self:
		var limite: int = 2
		if contador > limite-1:
			if contador == limite:
				global_scale = 1.5 * global_scale
				contador+=1
		else:
			contador += 1
			hud.atualizarLabel(str(contador) + "/" + str(limite))
