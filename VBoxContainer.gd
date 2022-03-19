extends VBoxContainer

func _ready():
	$VBoxContainer/SinglePlayer.gra
func _on_SinglePlayer_pressed():
	get_tree().change_scene("res://Single Player.tscn")
func _on_Quit_pressed():
	get_tree().quit

