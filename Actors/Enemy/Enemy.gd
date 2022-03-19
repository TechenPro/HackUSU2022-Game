extends Area2D

onready var atk_timer = $AttackTimer
onready var mv_timer = $MoveTimer
var velocity: Vector2 = Vector2(20, 30)

export(int) var health
export(Resource) var pattern_set
export(Resource) var builder
export(Resource) var path
var action_queue = []

# Called when the node enters the scene tree for the first time.
onready var sprite = get_node("Sprite")
onready var shape = get_node("CollisionShape2D")

func _ready():
	print("Here")
	connect("body_entered", self, "_on_body_entered")
	builder.load_sprite_data(sprite, shape)
	path.init(self, action_queue)
	
func _process(delta: float) -> void:
<<<<<<< Updated upstream
	#path.move_actor(delta)
	position += velocity * delta
=======
	path.move_actor(delta)
	pass
>>>>>>> Stashed changes

func _on_body_entered(body):
	pass
