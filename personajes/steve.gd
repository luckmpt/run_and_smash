extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -500.0
var jump = 0
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var pivote: Node2D = $CollisionShape2D/pivote

func _ready() -> void:
	animation.play("Idle")
	pass

func _proces(delta: float) -> void:
	pass


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jump = 0

	# Handle jump.
	if Input.is_action_just_pressed("jump") and jump < 2:
		if jump == 0:
			animation.play("jump")
		else:
			animation.play("double_jump")
		velocity.y = JUMP_VELOCITY
		jump += 1
	
	if velocity.y > 0:
		animation.play("fall")
	
	if (velocity.y == 0 and velocity.x == 0):
		animation.play("Idle")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_right", "move_left")
	if direction:
		pivote.scale.x = sign(direction)
		if velocity.y == 0:
			animation.play("run")
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
