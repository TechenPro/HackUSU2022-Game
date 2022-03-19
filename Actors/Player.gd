extends KinematicBody2D


onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

var velocity = Vector2.ZERO
var directionalStates = ["Move", "Turn"]

func _ready():
	animationTree.active = true
	
func _physics_process(delta):
	move(delta)

func move(delta):
	#Gather input
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	#Check if non-zero
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * 300, 300)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, 90)

	velocity = move_and_slide(velocity)
	
	
