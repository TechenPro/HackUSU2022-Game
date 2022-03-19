extends Control

var single
func _ready():
	$VBoxContainer/SinglePlayer.grab_focus()

func _on_SinglePlayer_pressed():
	Global.transition_scenes("res://GamePlay.tscn")

func _on_Multiplayer_pressed():
	Global.begin_muli_player_game()
	Global.transition_scenes("res://GamePlay.tscn")
	
func _on_Quit_pressed():
	get_tree().quit()
