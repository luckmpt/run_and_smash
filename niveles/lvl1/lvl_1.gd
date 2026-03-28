extends Node2D

var menu

func _ready() -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("menu"):
		get_tree().add_child(menu)
		
