extends Resource
class_name ForwardPath

var actor
var timer
var action_queue = []
var move_state = true

func init(actor_node, move_queue):
	actor = actor_node
	action_queue = move_queue
	timer = actor.mv_timer
	timer.connect("timeout", self, "_on_timer_timeout")
	action_queue.append(funcref(self, "test"))
	timer.wait_time = 5
	timer.start()

func move_actor(delta, options:Dictionary={}):
	action_queue = options.get("actions") if options.get("actions") else action_queue
	if(move_state):
		move(delta)
	
func move(delta):
	actor.position += actor.velocity * delta
	
func _on_timer_timeout():
	if(action_queue.size()):
		var action : FuncRef = action_queue.pop_front()
		action.call_func(actor)
	
