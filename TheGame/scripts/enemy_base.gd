extends Node2D

@export var sprite: Texture;



func _ready():
	var Sprite = get_node("Sprite2D")
	if sprite != null:
		Sprite.set_texture(sprite)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
