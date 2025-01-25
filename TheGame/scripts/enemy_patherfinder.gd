extends Area2D

@onready var nav : NavigationAgent2D = $NavigationAgent2D
var finished = false
var parent: Node2D;

var loaded = false;

func _ready():
	nav.target_position = Vector2(100,100)
	parent = get_parent()

func _physics_process(delta):
	if not finished and loaded:
		var dir = (nav.get_next_path_position() - global_position).normalized()
		parent.translate(dir * parent.speed * delta)
<<<<<<< HEAD
=======
	if not loaded:
		loaded = true
>>>>>>> 938a2ab8aa5bd8c7cba641448dc9e25e5a10ef1d
#func _process(delta):
	#nav.target_position = #PlyerPos



func _on_navigation_agent_2d_navigation_finished():
	finished = true
