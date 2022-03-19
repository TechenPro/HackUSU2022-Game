extends Node2D



const enemy_scene = preload("res://Actors/Enemy/Enemy.tscn")
const wisp_builder = preload("res://Actors/Enemy/WispBuilder.tres")
const forward_path = preload("res://MovementPaths/ForwardPath.gd")
const circular_patterns = preload("res://Actors/Enemy/Patterns/CircularPattern.tres")

#Format: [votingTimeout, [[attack1Name, num, cooldown], [attack2Name, num, cooldown], [attack3Name, num, cooldown], [attack4Name, num, cooldown], phaseTimeout]
var enemy_info = []
var e1 = null
var e2 = null
var e3 = null
var e4 = null
var e5 = null
var e6 = null
var e7 = null
var e8 = null
var e9 = null
var e10 = null
var i = 1

func buildEnemies():
	e1 = enemy_scene.instance()
	e2 = enemy_scene.instance()
	e3 = enemy_scene.instance()
	e4 = enemy_scene.instance()
	e5 = enemy_scene.instance()
	e6 = enemy_scene.instance()
	e7 = enemy_scene.instance()
	e8 = enemy_scene.instance()
	e9 = enemy_scene.instance()
	e10 = enemy_scene.instance()

func loadEnemyInfo():
	e1.path = forward_path
	e2.path = forward_path
	e3.path = forward_path
	e4.path = forward_path
	e5.path = forward_path
	e6.path = forward_path
	e7.path = forward_path
	e8.path = forward_path
	e9.path = forward_path
	e10.path = forward_path
	
	e1.builder = wisp_builder
	e2.builder = wisp_builder
	e3.builder = wisp_builder
	e4.builder = wisp_builder
	e5.builder = wisp_builder
	e6.builder = wisp_builder
	e7.builder = wisp_builder
	e8.builder = wisp_builder
	e9.builder = wisp_builder
	e10.builder = wisp_builder
	
	e1.pattern_set = circular_patterns
	e2.pattern_set = circular_patterns
	e3.pattern_set = circular_patterns
	e4.pattern_set = circular_patterns
	e5.pattern_set = circular_patterns
	e6.pattern_set = circular_patterns
	e7.pattern_set = circular_patterns
	e8.pattern_set = circular_patterns
	e9.pattern_set = circular_patterns
	e10.pattern_set = circular_patterns
	
	e1.health = 10
	e2.health = 10
	e3.health = 10
	e4.health = 10
	e5.health = 10
	e6.health = 10
	e7.health = 10
	e8.health = 10
	e9.health = 10
	e10.health = 10
	
	e1.velocity = Vector2(0,50)
	e2.velocity = Vector2(0,40)
	e3.velocity = Vector2(0,30)
	e4.velocity = Vector2(0,20)
	e5.velocity = Vector2(0,10)
	e6.velocity = Vector2(0,55)
	e7.velocity = Vector2(0,45)
	e8.velocity = Vector2(0,35)
	e9.velocity = Vector2(0,25)
	e10.velocity = Vector2(0,15)
	
func spawnEnemies():
	print("here")
	get_parent().add_child(e1)
	get_parent().add_child(e2)
	get_parent().add_child(e3)
	get_parent().add_child(e4)
	get_parent().add_child(e5)
	get_parent().add_child(e6)
	get_parent().add_child(e7)
	get_parent().add_child(e8)
	get_parent().add_child(e9)
	get_parent().add_child(e10)
		
func generatePhase(votingTimeout, enemyList, phaseTimeout):
	for enemyVals in enemyList.values():
		print(enemyVals)
	
	Global._send(String(enemy_info)) 

func _ready():
	buildEnemies()
	loadEnemyInfo()
	
	
func _process(delta):
	if i == 1:
		spawnEnemies()
	i =0


#Static movement functions
static func pause(actor):
	actor.velocity = Vector2.ZERO
	actor.mv_timer = 3

static func move_right(actor):
	actor.velocity = Vector2(1,0) * actor.speed
	actor.mv_timer = 2
