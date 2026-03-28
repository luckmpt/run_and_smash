extends Node2D

var button1
var button2
var button3

func _ready() -> void:
	button1 = $Fondo/Panel/Button1
	button1.pressed.connect(_on_pressed_B1)
	button2 = $Fondo/Panel/Button2
	button2.pressed.connect(_on_pressed_B2)
	button3 = $Fondo/Panel/Button3
	button3.pressed.connect(_on_pressed_B3)

func _process(delta: float) -> void:
	pass
	
func _on_pressed_B1():
	get_tree().change_scene_to_file("res://niveles/lvl1/lvl1.tscn")

func _on_pressed_B2():
	get_tree().change_scene_to_file("res://niveles/lvl2/lvl2.tscn")

func _on_pressed_B3():
	get_tree().change_scene_to_file("res://niveles/lvl3/lvl3.tscn")
