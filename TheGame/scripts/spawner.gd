extends Node2D

var enemySkeleton = load("res://Scenes/enemy.tscn")
var crab = load("res://Scenes/enemy_crab.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var newEnemy = enemySkeleton.instantiate()
	newEnemy.add_child(crab.instantiate())
	get_tree().root.add_child(newEnemy)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
