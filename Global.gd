extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var player_score
var player_lives
var current_player
var _client

func transition_scenes(new_scene):
	get_tree().change_scene(new_scene)
	

func begin_single_player_game():
	print("Started a single player game")
	#var player = preload("res://actors/Player.gd").instance()
	#current_player = player
	
func begin_muli_player_game():
	var ip_address =  IP.resolve_hostname(str(OS.get_environment("COMPUTERNAME")),1)
	print("Started a multi player game. Local IP is ", ip_address)
	connect_web_socket(str("ws://",ip_address,":2001/"))
	print("Connected to web socket! Client is ", _client)
	#var player = preload("res://actors/Player.gd").instance()
	#var current_player = player
	
func end_single_player_game():
	current_player = null
	player_score = 0
	player_lives = 3
	
func end_multi_player_game():
	current_player = null
	player_score = 0
	player_lives = 3

func update_player_score(score_adjustment):
	player_score += score_adjustment
	
func update_player_lives(lives_adjustment):
	player_lives += lives_adjustment
	
func connect_web_socket(SOCKET_URL):
	_client = WebSocketClient.new()

	_client.connect("connection_closed", self, "on_connection_closed")
	_client.connect("connection_error", self, "on_connection_closed")
	_client.connect("connection_established", self, "_on_connected")
	_client.connect("data_received", self, "_on_data")

	var err = _client.connect_to_url(SOCKET_URL)
	if err != OK:
		print("Unable to connect")
		set_process(false)
	#if(Input.is_action_just_pressed("changeweb")):
	#	_send('[7000,[["SMACK",1,5000],["Blizzard",2,10000],["Dragon Breath",3,7000],["Hydro Pump",4,10000]],20000]')
	#if(Input.is_action_just_pressed("changeweb2")):
	#	_send('[8000,[["Bug Buzz",1,5000],["Crunch",2,10000],["Astonish",3,7000],["Hyper Beam",4,10000]],15000]')


#Used for the web socket instantiation
func _on_connection_closed(was_clean = false):
	print("Closed, clean: ", was_clean)
	set_process(false)


func _on_connected(proto = ""):
	print("Connected with protocol: ", proto)
	_send('[10000,[["Intro",1,5000],["Magic",2,10000],["Howdy",3,7000],["USU 2022",4,10000]],31000]')


func _on_data():
	var payload = JSON.parse(_client.get_peer(1).get_packet().get_string_from_utf8()).result
	print("Received data: ", payload)


func _send(packetstr):
	_client.get_peer(1).set_write_mode(WebSocketPeer.WRITE_MODE_TEXT)
	_client.get_peer(1).put_packet(packetstr.to_utf8())
