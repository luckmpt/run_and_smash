extends Node2D

@onready var level_1: Button = %level1
@onready var level_2: Button = %level2
@onready var level_3: Button = %level3
@onready var salir: Button = %Salir
@onready var creditos: Button = %Creditos


func _ready() -> void:
	level_1.pressed.connect(_on_pressed_l1)
	level_2.pressed.connect(_on_pressed_l2)
	level_3.pressed.connect(_on_pressed_l3)
	salir.pressed.connect(_on_pressed_salir)
	creditos.pressed.connect(_on_pressed_creditos)

func _process(delta: float) -> void:
	pass
	
func _on_pressed_l1():
	LevelManager.ir_a_nivel(1)

func _on_pressed_l2():
	LevelManager.ir_a_nivel(2)

func _on_pressed_l3():
	LevelManager.ir_a_nivel(3)

func _on_pressed_salir():
	LevelManager.salir()

func _on_pressed_creditos():
	LevelManager.credits()
