extends Node2D

@export var assignedSprite: Texture;
@export var health: int;
@export var speed: float = 250;
@export var isEnemy:bool = true;

func _ready():
	var Sprite = get_node("Sprite2D")
	if assignedSprite != null:
		Sprite.set_texture(assignedSprite)
	var child = get_child(2)
	if "isBoss" in child:
		health = 50
	add_to_group("Enemies")

func hit():
	health -= 1
	if health <= 0:
		remove_from_group("Enemies")
		queue_free()

func _on_area_2d_body_entered(body):
	if "isBullet" in body:
		body.health -= 1
		if body.health == 0:
			body.queue_free()
		hit()
