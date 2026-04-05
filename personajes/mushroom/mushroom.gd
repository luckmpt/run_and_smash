extends CharacterBody2D
@onready var animation: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	animation.play("idle")
	pass


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta


	move_and_slide()
	
func take_damage(value: int) -> void:
	animation.play("die")
	await get_tree().create_timer(1.5).timeout
	queue_free()
