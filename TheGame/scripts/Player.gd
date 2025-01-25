extends CharacterBody2D

@export var Player = true;


const speed = 300.0
var rotation_speed = 1.5

# Function to simulate action remapping
func handle_action_remapping():
	if Input.is_key_pressed(KEY_W):  # W -> "ui_up"
		Input.action_press("ui_up")
	else:
		Input.action_release("ui_up")
	
	if Input.is_key_pressed(KEY_S):  # S -> "ui_down"
		Input.action_press("ui_down")
	else:
		Input.action_release("ui_down")
	
	if Input.is_key_pressed(KEY_A):  # A -> "ui_left"
		Input.action_press("ui_left")
	else:
		Input.action_release("ui_left")
	
	if Input.is_key_pressed(KEY_D):  # D -> "ui_right"
		Input.action_press("ui_right")
	else:
		Input.action_release("ui_right")

func _physics_process(delta):
	
	#var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#velocity = direction * speed
	
	handle_action_remapping()
	
	#collects input for player node
	var move_input = Input.get_axis("ui_down", "ui_up") 
	var rotation_direction = Input.get_axis("ui_left", "ui_right") 
	
	#variables for the speed and direction(rotation) 
	velocity = transform.x * move_input * speed
	rotation += rotation_direction * rotation_speed * delta
	
	move_and_slide()
