extends Node2D

@export var assignedSprite: Texture;
@export var health: int;
@export var speed: float = 250;

func _ready():
	var Sprite = get_node("Sprite2D")
	if assignedSprite != null:
		Sprite.set_texture(assignedSprite)
	add_to_group("Enemies")

func hit():
	health -= 1
	if health <= 0:
		remove_from_group("Enemies")
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if "isBullet" in body:
		hit()
		body.health -= 1
