extends Node2D

var wall = load("res://Scenes/building_wall.tscn")# Replace this with your actual tower scene
var mouseButtonPressed = false # Makes sure towers aren't placed every frame the mouse is held.
var selectWall = 0

func placeWall():
	var newWall = wall.instantiate()
	newWall.global_transform = Global.playerPosition #will breaknwhen placed in main scene
	newWall.rotation -= PI/2
	newWall.position += Vector2(50*cos(newWall.rotation+PI/2),50*sin(newWall.rotation+PI/2))
	newWall.type = selectWall
	Global.inventory[selectWall] -= 1;
	get_tree().root.add_child(newWall)

func _input(_ev):
	if Input.is_action_just_pressed("build1") and Global.inventory[0] > 0:
		selectWall = 0
		placeWall()
	
	if Input.is_action_just_pressed("build2") and Global.inventory[1] > 0:
		selectWall = 1
		placeWall()
		
	if Input.is_action_just_pressed("build3") and Global.inventory[2] > 0:
		selectWall = 2
		placeWall()
		
	if Input.is_action_just_pressed("build4") and Global.inventory[3] > 0:
		selectWall = 3
		placeWall()
