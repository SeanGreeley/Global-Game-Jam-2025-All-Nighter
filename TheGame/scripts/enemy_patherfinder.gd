extends Area2D

@onready var nav : NavigationAgent2D = $NavigationAgent2D
var finished = false
var parent: RigidBody2D;

var loaded = false;

func _ready():
	nav.target_position = Vector2(0,0)
	parent = get_parent()

func _physics_process(delta):
	if not finished and loaded:
		var dir = (nav.get_next_path_position() - global_position).normalized()
		parent.linear_velocity = dir * parent.speed
	if not loaded:
		loaded = true
#func _process(delta):
	#nav.target_position = #PlyerPos



func _on_navigation_agent_2d_navigation_finished():
	finished = true
	parent.linear_velocity = Vector2(0,0)
