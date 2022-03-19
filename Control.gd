extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var ip_address =  IP.resolve_hostname(str(OS.get_environment("COMPUTERNAME")),1)
	Global.connect_web_socket(str("ws://",ip_address,":2001/"))
	
	get_node("IP_Holder").text = str("Go to ",ip_address,":2022 on your phone to join!")


func _on_StartGame_pressed():
	Global.begin_muli_player_game()
	Global.transition_scenes("res://GamePlay.tscn")
