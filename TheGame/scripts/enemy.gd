extends Node2D

@export var assignedSprite: Texture;
@export var health: int;
@export var speed: float = 100;
@export var isEnemy:bool = true;
var child;
var coinScene = load("res://Scenes/coin.tscn")
var boomScene = load("res://Scenes/boom.tscn")

func _ready():
	var Sprite = get_node("Sprite2D")
	if assignedSprite != null:
		Sprite.set_texture(assignedSprite)
	child = get_child(2)
	if "isBoss" in child:
		health = 10
		Global.bossHealth = health
	add_to_group("Enemies")

func _process(delta):
	if position.length() <= 80:
		Global.bubbleHealth -= delta*0.5
		if Global.bubbleHealth <= 0:
			get_tree().call_group("Enemies", "die")
			get_tree().change_scene_to_file("res://Scenes/YouDiedScene.tscn")

func die():
	queue_free()

func hit():
	health -= 1
	if "isBoss" in child:
		Global.bossHealth = health
	if health <= 0:
		remove_from_group("Enemies")
		if randi_range(0,1) == 1:
			var newCoin = coinScene.instantiate()
			newCoin.position = position
			get_tree().root.call_deferred("add_child", newCoin)#get_tree().current_scene.call_deferred(“add_child”, newInstantiateObject)
		queue_free()

func _on_area_2d_body_entered(body):
	if "isBullet" in body:
		body.health -= 1
		if Global.hasBoom == true:
			var newBoom = boomScene.instantiate()
			newBoom.position = position
			get_tree().root.add_child(newBoom)
		if body.health == 0:
			body.queue_free()
		hit()
	if "isPlayer" in body:
		Global.stunned = true
	if "isWall" in body:
		speed = 0
	if "isBubble" in body:
		pass


func _on_area_2d_area_entered(area):
	if "isBoom" in area:
		hit()
