extends CharacterBody2D

const SPEED = 900.0
const JUMP_FORCE = -400.0

var contador: int = 0

@onready var hud1 = $"../CanvasLayer/Control/Panel/Label"

@onready var hud2 = $"../CanvasLayer/HUD"

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
		contador += 1
		hud1.text = (str(contador) + "/" + str(contador))
		Hud.text = "oi"
