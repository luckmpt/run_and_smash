extends Node

@export var main_menu_scene: PackedScene
@export var credits_scene: PackedScene
@export var levels: Array[PackedScene]

var level = 0

func start() -> void:
	level = 0
	if not levels.is_empty():
		get_tree().change_scene_to_packed(levels[0])

func next_level() -> void:
	level += 1
	if level < levels.size():
		get_tree().change_scene_to_packed(levels[level])
	else:
		credits()

func main_menu() -> void:
	get_tree().change_scene_to_packed(main_menu_scene)

func ir_a_nivel(i: int) -> void:
	level = i-1
	get_tree().change_scene_to_packed(levels[level])

func credits() -> void:
	get_tree().change_scene_to_packed(credits_scene)

func salir() -> void:
	get_tree().quit()
