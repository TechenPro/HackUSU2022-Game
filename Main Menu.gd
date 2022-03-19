extends Control


func _ready():
	$VBoxContainer/SinglePlayer.grab_focus()

func _on_SinglePlayer_pressed():
	get_tree().change_scene("res://Game Play.tscn")

func _on_Multiplayer_pressed():
	get_tree().change_scene("res://Game Play.tscn")
	
func _on_Quit_pressed():
	get_tree().quit
