class_name HitboxComponent
extends Area2D

signal damage_dealt

@export var damage: int = 10

func aplaste():
	if owner.has_method("mate"):
		owner.mate()
