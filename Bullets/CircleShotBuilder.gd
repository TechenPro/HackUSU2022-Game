extends CollidableSpriteBuilder
class_name CircleBulletBuilder

const collision = preload("res://Shapes/CircleShotShape.tres")
const tex = preload("res://Assets/Bullets/Circle.png")

static func load_sprite_data(sprite: Sprite, shape: CollisionShape2D, options: Dictionary ={}):
	sprite.set_texture(tex)
	sprite.hframes = 6
	shape.set_shape(collision)
