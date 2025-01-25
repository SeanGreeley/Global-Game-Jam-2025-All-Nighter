extends Node2D

@export var isBoss: bool = true;
var player: CharacterBody2D = Global.
@export var parent: Node2D;#important for scoping issues
var nottarget = Vector2(0,0)
var target: Vector2;
# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):#ignores colition, moves twoard player
	if player != null:
		if target != Vector2(0,0):
			target = player.position;
		if position.distance_to(nottarget) < position.distance_to(target) * 0.8:
			var temp = target
			target = nottarget
			nottarget = temp
		parent.position += $global_position.direction_to(target)*delta*parent.speed
	elif player == null:
		parent.position += global_position.direction_to(Vector2(0,0))*delta*parent.speed
