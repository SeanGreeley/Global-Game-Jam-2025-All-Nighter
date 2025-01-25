extends Area2D

@export var isBoom:bool = true
var scaleFac = 0.1

# Called when the node enters the scene tree for the first time.
func _ready():
	$Collide.scale = Vector2(0.1,0.1)
	$Particles.emitting = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if scaleFac <= 4.1:
		scaleFac += delta*6.0
		$Collide.scale = Vector2(scaleFac,scaleFac)
	else:
		queue_free()
