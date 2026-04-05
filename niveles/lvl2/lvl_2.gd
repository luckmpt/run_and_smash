extends Node2D
@onready var finish_level: Control = $CanvasLayer/FinishLevel

func panel_finish_level() -> void:
	finish_level.show_panel()
