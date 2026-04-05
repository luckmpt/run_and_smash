extends Control

@onready var reanudar: Button = %Reanudar
@onready var reiniciar: Button = %Reiniciar
@onready var salir: Button = %Salir
@onready var menu: Button = %Menu

func _ready() -> void:
	hide()
	reanudar.pressed.connect(_on_reanudar_press)
	reiniciar.pressed.connect(_on_reiniciar_press)
	salir.pressed.connect(_on_salir_press)
	menu.pressed.connect(_on_menu_press)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("menu"):
		get_tree().paused = not get_tree().paused
		visible = get_tree().paused

func _on_reanudar_press() -> void:
	get_tree().paused = false
	hide()

func _on_reiniciar_press() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_salir_press() -> void:
	LevelManager.salir()

func _on_menu_press() -> void:
	get_tree().paused = false
	LevelManager.main_menu()
