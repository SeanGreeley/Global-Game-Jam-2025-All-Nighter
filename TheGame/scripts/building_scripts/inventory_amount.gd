extends Node2D

var wall = load("res://Scenes/building_wall.tscn")# Replace this with your actual tower scene
var mouseButtonPressed = false # Makes sure towers aren't placed every frame the mouse is held.
var selectWall = 0

var placePos:Vector2


func _input(ev):
	
	
	if Input.is_action_just_pressed("build1"):
		selectWall = 0

	if Input.is_action_just_pressed("build2"):
		selectWall = 1
		
	if Input.is_action_just_pressed("build3"):
		selectWall = 2

		
	if Input.is_action_just_pressed("build4"):
		selectWall = 3
		
	#
	if  ev is InputEventMouseButton and ev.button_index == MOUSE_BUTTON_RIGHT and Global.inventory[selectWall] > 0 and !mouseButtonPressed:
		mouseButtonPressed = true
		var camera = get_viewport().get_camera_2d()
		placePos = camera.get_global_mouse_position()
		placeWall()
		
		
	

func placeWall():
	var newWall = wall.instantiate()
	#newWall.global_transform = Global.playerPosition #will breaknwhen placed in main scene
	#newWall.rotation -= PI/2
	#newWall.position += Vector2(50*cos(newWall.rotation+PI/2),50*sin(newWall.rotation+PI/2))
	newWall.position = placePos
	newWall.rotation = Global.playerPosition.get_rotation()
	newWall.type = selectWall
	newWall.rotation -= PI/2
	Global.inventory[selectWall] -= 1;
	get_tree().root.add_child(newWall)
	
	mouseButtonPressed = false
