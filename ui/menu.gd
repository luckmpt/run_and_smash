extends Node2D

@onready var reanudar: Button = %reaudar
@onready var reiniciar: Button = %reiniciar
@onready var niveles: Button = %niveles

func _ready() -> void:
	reanudar.pressed.connect(_reanudar)
	reiniciar.pressed.connect(_reiniciar)
	niveles.pressed.connect(_niveles)

func _reanudar() -> void:
	pass

func _reiniciar() -> void:
	pass

func _niveles() -> void:
	pass
