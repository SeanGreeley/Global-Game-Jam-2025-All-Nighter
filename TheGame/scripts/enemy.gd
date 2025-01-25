extends Node2D

@export var sprite: Texture;
@export var health: int;
@export var speed: float;

func _ready():
	var Sprite = get_node("Sprite2D")
	if sprite != null:
		Sprite.set_texture(sprite)
	add_to_group("Enemies")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
