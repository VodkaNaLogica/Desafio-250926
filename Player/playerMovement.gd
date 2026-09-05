extends CharacterBody2D

const SPEED = 900.0
const JUMP_FORCE = -400.0

var contador: int = 0

@onready var hud = $"../CanvasLayer/HUD"

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_FORCE

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == self:
		var limite = 2
		if contador > limite-1:
			if contador == limite:
				global_scale = 1.5 * global_scale
				contador+=1
		else:
			contador += 1
			hud.atualizarLabel(str(contador) + "/" + str(limite))
