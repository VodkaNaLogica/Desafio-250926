extends Control

@onready var panelLabel = $Panel/Label

func atualizarLabel(text: String):
	panelLabel.text = text
