extends Node2D
@export var bubble_gun = true

var mousePos = Vector2(0,0)
var viewSize
var parentRotation = 0
var bullet = load("res://Scenes/bubble_bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	viewSize = get_viewport().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mousePos = get_viewport().get_mouse_position()
	if get_parent():
		parentRotation = get_parent().rotation
	rotation = atan2(viewSize.y/2.0-mousePos.y,viewSize.x/2.0-mousePos.x) + PI - parentRotation
	if Input.is_action_just_pressed("shoot"):
		var newBullet = bullet.instantiate()
		newBullet.global_transform = $Tip.global_transform
		newBullet.linear_velocity = Vector2(cos(rotation),sin(rotation)) * 1000.0
		get_parent().add_child(newBullet)
