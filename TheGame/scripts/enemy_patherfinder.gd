extends Area2D

@onready var nav : NavigationAgent2D = $NavigationAgent2D
var finished = false

func _ready():
	nav.target_position = Vector2(100,100)

func _physics_process(delta):
	if not finished:
		var dir = (nav.get_next_path_position() - global_position).normalized()
		translate(dir * 200 * delta)

#func _process(delta):
	#nav.target_position = #PlyerPos



func _on_navigation_agent_2d_navigation_finished():
	finished = true
