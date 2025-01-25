extends Node2D

@export var assignedSprite: Texture;
@export var health: int;
@export var speed: float = 100;
@export var isEnemy:bool = true;
var child;

func _ready():
	var Sprite = get_node("Sprite2D")
	if assignedSprite != null:
		Sprite.set_texture(assignedSprite)
	child = get_child(2)
	if "isBoss" in child:
		health = 10
		Global.bossHealth = health
	add_to_group("Enemies")

func hit():
	health -= 1
	if "isBoss" in child:
		Global.bossHealth = health
	if health <= 0:
		remove_from_group("Enemies")
		queue_free()

func _on_area_2d_body_entered(body):
	if "isBullet" in body:
		body.health -= 1
		if body.health == 0:
			body.queue_free()
		hit()
	if "isPlayer" in body:
		Global.stunned = true
	if "isBubble" in body:
		pass
