extends CollidableSpriteBuilder
class_name WispBuilder

const collision = preload("res://Shapes/WispShape.tres")
const tex = preload("res://Assets/wisp1.png")
const idle = preload("res://Actors/Enemy/WispIdle.tres")

func load_sprite_data(sprite: Sprite, shape: CollisionShape2D, options: Dictionary ={}):
	sprite.set_texture(tex)
	sprite.hframes = 3
	sprite.offset = Vector2(-3, 0)
	var animationPlayer = sprite.get_node("AnimationPlayer")
	animationPlayer.add_animation("Idle", idle)
	animationPlayer.play("Idle")
	shape.set_shape(collision)
