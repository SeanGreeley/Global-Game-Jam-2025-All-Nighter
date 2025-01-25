extends Node

var health = 100
var type = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.frame = type


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if type == 0:
		health = 500
	elif type == 1:
		health = 250
	else:
		health = 100
	
	if health == 0:
		queue_free()
