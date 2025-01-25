extends Node2D

var wall = load("res://Scenes/building_wall.tscn")# Replace this with your actual tower scene
var mouseButtonPressed = false # Makes sure towers aren't placed every frame the mouse is held.
var selectWall = 0


func _input(_ev):
	if Input.is_key_pressed(KEY_1) and Global.inventory[0] >= 1:
		selectWall = 0
	
	if Input.is_key_pressed(KEY_2) and Global.inventory[1] >= 1:
		selectWall = 1
		
	if Input.is_key_pressed(KEY_3) and Global.inventory[2] >= 1:
		selectWall = 2
		
	if Input.is_key_pressed(KEY_4) and Global.inventory[3] >= 1:
		selectWall = 3
		
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and Global.inventory[0] != 0 and Global.inventory[1] != 0 and Global.inventory[2] != 0 and Global.inventory[3] != 0:
		if !mouseButtonPressed:
			var newWall = wall.instantiate()
			newWall.position = get_viewport().get_mouse_position() - Vector2(1280,610) #will breaknwhen placed in main scene
			newWall.type = selectWall
			get_tree().root.add_child(newWall)
			mouseButtonPressed = true
	# Set your tower variable here
	# ex. towerScene.type = "Archer"
	if !Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		mouseButtonPressed = false
