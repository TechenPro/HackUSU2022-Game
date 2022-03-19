extends Pattern
class_name LinePattern

const obj_bullet = preload("res://Bullets/Bullet.tscn")
const behavior = preload("res://Bullets/Behavior/MoveForwardBehavior.tres")
const circle_builder = preload("res://Bullets/CircleBulletBuilder.tres")

static func execute_attack_pattern(actor, spawn_position, options: Dictionary={}):
	var bullet_count = options.get("count") if options.get("count") else 5
	var line_count = options.get("line_count") if options.get("line_count") else 1
	var rotation_spacing = options.get("spacing") if options.get("spacing") else 90
	var rotation_offset = options.get("offset") if options.get("offset") else 0 
	var bullet_velocity = options.get("velocity") if options.get("velocity") else Vector2(0, 250)
	
	for j in range(bullet_count):
		var bullet_rotation = rotation_offset - (rotation_spacing / 2)*(line_count-1)
		for i in range(line_count):
			var b1 = obj_bullet.instance()
			b1.behavior = behavior
			b1.builder = circle_builder
			b1.position = spawn_position
			b1.velocity = bullet_velocity
			b1.rotation_degrees = bullet_rotation
			actor.get_parent().add_child(b1)
			bullet_rotation += rotation_spacing
