extends CharacterBody2D

const speed = 300.0
var rotation_speed = 1.5
func _physics_process(delta):
	
	#var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#velocity = direction * speed
	
	#collects input for player node
	var move_input = Input.get_axis("ui_down", "ui_up") 
	var rotation_direction = Input.get_axis("ui_left", "ui_right") 
	
	#variables for the speed and direction(rotation) 
	velocity = transform.x * move_input * speed
	rotation += rotation_direction * rotation_speed * delta
	
	move_and_slide()
