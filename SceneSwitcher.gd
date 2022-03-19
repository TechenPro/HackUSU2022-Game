extends Node2D

const level2 = preload("res://level2.tscn")
const level3 = preload("res://level3.tscn")
func _on_Timer_timeout():
	var timer = false
	
func _process(delta):
	if Timer.Wait_Time == 0:
		$TransitionScreen.transition()

func _on_TransitionScreen_transitioned():
	$CurrentScene.get_child(0).queue_free()
	$CurrentScene.add_child(level2.instance())
	print("Swapped in level2")


