extends ParallaxBackground


export(float) var scrolling_speed = 50

#func _signal
	#scrolling_speed = 300

func _process(delta):
	scroll_offset.y += scrolling_speed * delta
	#Global._client.poll()
