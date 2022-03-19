extends CollidableSpriteBuilder
class_name PlayerBulletBuilder

const collision = preload("res://Shapes/PlayerShotShape.tres")
const tex = preload("res://Assets/Bullets/PlayerShot.png")

func load_sprite_data(sprite: Sprite, shape: CollisionShape2D, options: Dictionary ={}):
	sprite.set_texture(tex)
	shape.set_shape(collision)
