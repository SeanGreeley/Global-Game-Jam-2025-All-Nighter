extends Node2D

@export var player: CharacterBody2D;
@export var nodeTexture: Texture;
# Called when the node enters the scene tree for the first time.
func _enter_tree():
	if nodeTexture != null:
		$Enemy.sprite = nodeTexture
	var parent = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):#ignores colition, moves twoard player
	position += global_position.direction_to(Vector2(0,0))*delta
	if player != null:
		position += $global_position.direction_to(player.global_position)
	#if player.global_position $global_position.x
