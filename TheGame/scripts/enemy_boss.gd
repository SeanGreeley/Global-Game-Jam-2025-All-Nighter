extends Node2D

@export var moveVector: Vector2;
@export var player: CharacterBody2D;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):#ignores colition, moves twoard player
	pass
	#if player.global_position $global_position.x
