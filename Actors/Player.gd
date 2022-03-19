extends KinematicBody2D


const obj_bullet = preload("res://Bullets/Bullet.tscn")
const shot_behavior = preload("res://Bullets/Behavior/MoveForwardBehavior.tres")
const shot_builder = preload("res://Bullets/PlayerBullet.tres")
const shot_velocity = Vector2(0, -2000)

onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

var velocity = Vector2.ZERO
var speed = 400
var fire_rate = 2
onready var update_delta: float = 0.1
var current_time : float = 0
var rotation_off: int = 1

var directionalStates = ["Move", "Turn"]

func _ready():
	animationTree.active = true
	
func _physics_process(delta):
	if(Input.is_action_just_pressed("Slow")):
		speed = 250
	elif(Input.is_action_just_released("Slow")):
		speed = 400
	move(delta)
	shoot(delta)
	
func shoot(delta):
	current_time += delta
	if(current_time < update_delta):
		return
	if Input.is_action_pressed("Shoot"):
		current_time = 0
		var b1 = obj_bullet.instance()
		var b2 = obj_bullet.instance()
		b1.behavior = shot_behavior
		b2.behavior = shot_behavior
		b1.builder = shot_builder
		b2.builder = shot_builder
		b1.position = position + Vector2(10, -30)
		b2.position = position + Vector2(-10, -30)
		b1.velocity = shot_velocity
		b2.velocity = shot_velocity
		b1.duration = 1
		b2.duration = 1
		get_parent().add_child(b1)
		get_parent().add_child(b2)
		

func move(delta):
	#Gather input
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	#Check if non-zero
	if input_vector != Vector2.ZERO:
		
		if input_vector.x != 0:
			animationTree.set("parameters/Move/blend_position", sign(input_vector.x))
			animationTree.set("parameters/Turn/blend_position", sign(input_vector.x))
			animationTree.set("parameters/Slow/blend_position", sign(input_vector.x))
			if !(animationState.get_current_node() in ["Move", "Turn"]) || sign(velocity.x) != sign(input_vector.x):
				animationState.travel("Turn")
		elif animationState.get_current_node() != "Idle":
			animationState.travel("Idle")
		velocity = velocity.move_toward(input_vector * speed, 300)
	else:
		if animationState.get_current_node() == "Move":
			animationState.travel("Slow");
		elif animationState.get_current_node() != "Idle":
			animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, 90)

	velocity = move_and_slide(velocity)
