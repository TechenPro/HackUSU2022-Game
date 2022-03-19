extends Pattern
class_name CircularPattern

const obj_bullet = preload("res://Bullets/Bullet.tscn")
const behavior = preload("res://Bullets/Behavior/MoveForwardBehavior.tres")
const circle_builder = preload("res://Bullets/CircleBulletBuilder.tres")

static func execute_attack_pattern(actor, spawn_position, options: Dictionary={}):
	var bullet_count = options.get("count") if options.get("count") else 5
	var bullet_scale = options.get("scale") if options.get("scale") else 0.8
	var rotation_offset = options.get("offset") if options.get("offset") else 0
	var bullet_velocity = options.get("velocity") if options.get("velocity") else Vector2(0, -250)
	var increment = 360/bullet_count
	var rotation_value = rotation_offset
	for i in range(bullet_count):
		var b1 = obj_bullet.instance()
		b1.behavior = behavior
		b1.builder = circle_builder
		b1.scale *= bullet_scale
		b1.position = spawn_position
		b1.velocity = bullet_velocity
		b1.rotation_degrees = rotation_value
		actor.get_parent().add_child(b1)
		rotation_value += increment
