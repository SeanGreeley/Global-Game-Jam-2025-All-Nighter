extends Node2D

@export var player: CharacterBody2D;
@export var parent: Node2D;#important for scoping issues
# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):#ignores colition, moves twoard player
	parent.position += global_position.direction_to(Vector2(0,0))*delta*parent.speed
	if player != null:
		position += $global_position.direction_to(player.global_position)
	#if player.global_position $global_position.x
