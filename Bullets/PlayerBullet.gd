extends CollidableSpriteBuilder
class_name PlayerBulletBuilder

const collision = preload("res://Shapes/PlayerShotShape.tres")
const tex = preload("res://Assets/Bullets/PlayerShot.png")

static func load_sprite_data(sprite: Sprite, shape: CollisionShape2D, options: Dictionary ={}):
	print("Here")
	sprite.set_texture(tex)
	sprite.hframes = 1
	shape.set_shape(collision)
