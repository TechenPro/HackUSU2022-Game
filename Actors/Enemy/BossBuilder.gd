extends CollidableSpriteBuilder
class_name BossBuilder

const collision = preload("res://Shapes/BossShape.tres")
const tex = preload("res://Assets/boss1.png")
const idle = preload("res://Actors/Enemy/BossIdle.tres")
const atk = preload("res://Actors/Enemy/BossAttack.tres")
const move = preload("res://Actors/Enemy/BossMove.tres")

static func load_sprite_data(sprite: Sprite, shape: CollisionShape2D, options: Dictionary ={}):
	sprite.set_texture(tex)
	sprite.hframes = 10
	var animationPlayer = sprite.get_node("AnimationPlayer")
	animationPlayer.add_animation("Idle", idle)
	animationPlayer.add_animation("Attack", atk)
	#animationPlayer.add_animation("Move", move)
	animationPlayer.play("Idle")
	shape.set_shape(collision)
