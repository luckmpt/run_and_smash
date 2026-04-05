extends Control

@onready var reiniciar: Button = %Reiniciar
@onready var siguiente: Button = %Siguiente
@onready var salir: Button = %Salir

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	hide()
	reiniciar.pressed.connect(_on_reiniciar_press)
	siguiente.pressed.connect(_on_siguiente_press)
	salir.pressed.connect(_on_salir_press)

func show_panel() -> void:
	get_tree().paused = not get_tree().paused
	visible = get_tree().paused

func _on_reiniciar_press() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_siguiente_press() -> void:
	get_tree().paused = false
	LevelManager.next_level()

func _on_salir_press() -> void:
	get_tree().paused = false
	LevelManager.main_menu()
