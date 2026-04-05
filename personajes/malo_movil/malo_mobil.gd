extends CharacterBody2D

@onready var ray_cast_2d: RayCast2D = $pivote/RayCast2D
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var pivote: Node2D = $pivote
@onready var ray_cast_2d_2: RayCast2D = $pivote/RayCast2D2
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent
@onready var hitbox_component: HitboxComponent = $HitboxComponent


var muriendose: bool
const SPEED = 100.0

func _ready() -> void:
	muriendose = false
	animation.play("run")
	pass


func _physics_process(delta: float) -> void:
	# Add the gravity.
	var direction = sign(pivote.scale.x)
	if not is_on_floor():
		velocity += get_gravity() * delta

	if not muriendose:
		velocity.x = direction*SPEED
	
	if ray_cast_2d.is_colliding() or not ray_cast_2d_2.is_colliding():
		pivote.scale.x *= -1

	move_and_slide()

func take_damage(value: int) -> void:
	if muriendose == false:
		hurtbox_component.queue_free()
		hitbox_component.queue_free()
		muriendose = true
		velocity.x = 0
		animation.play("die")
		await get_tree().create_timer(1.5).timeout
		queue_free()
