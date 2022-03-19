extends Area2D


var velocity: Vector2 = Vector2.ZERO
var duration = 4
export(Resource) var behavior
export(Resource) var builder
export(Resource) var path

# Called when the node enters the scene tree for the first time.
onready var bullet_sprite = get_node("Sprite")
onready var bullet_shape = get_node("CollisionShape2D")

func _ready():
	connect("body_entered", self, "_on_body_entered")
	builder.load_sprite_data(bullet_sprite, bullet_shape)
	
	
func _process(delta: float) -> void:
	velocity = behavior.move_bullet(velocity)
	position += velocity.rotated(rotation) * delta
	duration -= delta
	if duration < 0:
		queue_free()

func _on_body_entered(body):
	pass
