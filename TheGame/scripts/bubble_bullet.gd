extends RigidBody2D

@export var isBullet:bool = true
@export var health:int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.hasAcid:
		health = 3
	else:
		health = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if global_position.length() > 10000:
		queue_free()


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if "tile_set" in body:
		queue_free()
