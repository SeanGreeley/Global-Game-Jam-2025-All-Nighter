extends Node2D

var mousePos = Vector2(0,0)
var viewSize
var bullet = load("res://Scenes/bubble_bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	viewSize = get_viewport().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mousePos = get_viewport().get_mouse_position()
	rotation = atan2(viewSize.y/2.0-mousePos.y,viewSize.x/2.0-mousePos.x) + PI
	if Input.is_action_just_pressed("shoot"):
		var newBullet = bullet.instantiate()
		newBullet.global_transform = $Tip.global_transform
		newBullet.linear_velocity = Vector2(newBullet.position.x - position.x,newBullet.position.y - position.y) * 30.0
		get_parent().add_child(newBullet)
