class_name Player
extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -500.0
var jump = 0
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var pivote: Node2D = $CollisionShape2D/pivote
@onready var timer05s: Timer = $Timer05s
@onready var jump_timer: Timer = $jumpTimer
@onready var coyote_timer: Timer = $coyoteTimer
@onready var jumping_1: AudioStreamPlayer = $jumping1
@onready var jumping_2: AudioStreamPlayer = $jumping2
@onready var win_sound: AudioStreamPlayer = $win
@onready var background: AudioStreamPlayer = $background
@onready var smash: AudioStreamPlayer = $Smash
@onready var lose: AudioStreamPlayer = $Lose

var muriendose: bool
var _boolCoyote: bool = false
var gana: bool


func _ready() -> void:
	muriendose = false
	#if not gana:
		#animation.play("Idle")
	#else:
		#animation.play("death_in_air")

func _proces(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jump = 0
	
	if not is_on_floor() and _boolCoyote:
		coyote_timer.start()

	# Handle jump.
	if (
			Input.is_action_just_pressed("jump") and 
			(jump == 1 or is_on_floor() or not coyote_timer.is_stopped()) and 
			not muriendose and 
			not gana and
			jump_timer.is_stopped()
		):
		if jump == 0:
			animation.play("jump")
			jumping_1.play()
		else:
			animation.play("double_jump")
			jumping_2.play()
		_boolCoyote = false
		jump_timer.start()
		jump += 1
	
	if not jump_timer.is_stopped():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_released("jump"):
		jump_timer.stop()
	
	if velocity.y > 0 and not muriendose and not gana:
		animation.play("fall")
	
	if (velocity.y == 0 and velocity.x == 0 and not muriendose and not gana):
		animation.play("Idle")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_right", "move_left")
	if direction and not muriendose and not gana:
		pivote.scale.x = sign(direction)
		if velocity.y == 0:
			animation.play("run")
		velocity.x = direction * SPEED
	elif not direction and not muriendose and not gana:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	_boolCoyote = is_on_floor()
	move_and_slide()

func take_damage(value: int) -> void:
	if not gana and not muriendose:
		background.stop()
		lose.play()
		muriendose = true
		velocity.x = 0
		velocity.y = 0
		animation.play("death")
		await get_tree().create_timer(4).timeout
		get_tree().reload_current_scene()

func win() -> void:
	background.stop()
	win_sound.play()
	gana = true
	animation.play("run")
	velocity.x = SPEED
	await get_tree().create_timer(0.2).timeout
	animation.play("sit")
	await get_tree().create_timer(5).timeout
	animation.play("death_in_air")
	await get_tree().create_timer(2).timeout
	if owner.has_method("panel_finish_level"):
		owner.panel_finish_level()
	pass

func mate() -> void:
	if not gana and not muriendose:
		smash.play()
		velocity.y = JUMP_VELOCITY
