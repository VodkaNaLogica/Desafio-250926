extends Control

@onready var panelLabel1 = $"Panel/HBoxContainer/Label"
@onready var panelLabel2 = $"Panel/HBoxContainer/Label2"

func atualizarLabel(text: String, id: int):
	var strId = str(id)
	match  strId:
		"1":
			panelLabel1.text = text
		"2":
			panelLabel2.text = text

func _on_button_pressed() -> void:
	Player.mudarDeModo()
