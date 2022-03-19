extends Resource
class_name CollidableSpriteBuilder

export(Texture) var texture
export(Shape2D) var collision_shape

static func load_sprite_data(sprite: Sprite, shape: CollisionShape2D, options: Dictionary ={}):
	pass
