extends ProgressBar

var life = 0
signal death
func _ready():
	
	
#func _on_boss appears:
		#$BossHealth.visible =$BossHealth.visible
#func_boss_hit():
	if life > 0:
		#life =- num
		value = life
	else:
		#$BossHealth.visible = not $BossHealth.visible
		emit_signal("death")
