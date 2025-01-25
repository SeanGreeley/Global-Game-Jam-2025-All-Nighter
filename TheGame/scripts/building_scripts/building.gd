extends Node2D

var health = 100
var type = 0
@export var isWall:bool = true
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.frame = type
	if type == 0:
		health = 500
	elif type == 1:
		health = 250
	else:
		health = 100

func hit():
	health -= 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if type != 4:
		health -= 10.0 * delta
	if health <= 0:
		queue_free()
		
		
func _on_area_2d_body_entered(body):
	if "isEnemy" in body and type != 4:
		hit()
	if "isEnemy" in body and type == 4:
		body.health -= 1
		hit()
