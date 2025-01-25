extends Node2D

var millis

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(0,1000)
	Global.shopOpen = true
	await get_tree().create_timer(5.0).timeout
	Global.shopOpen = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	millis = Time.get_ticks_msec()
	if Global.shopOpen:
		position.y += (0-position.y)/30.0
	else:
		position.y += (position.y-1)/30.0
	for c in get_child_count():
		get_child(c).position.y += sin(millis/500.0+c*45.2)*delta*8.0
		get_child(c).scale = Vector2(1.0+sin(millis/300.0+c*87.4)*0.025,1.0-cos(millis/300.0+c*87.4)*0.025)
		if get_child(c).is_hovered():
			get_child(c).modulate = Color(0.7,0.7,0.7,1.0)
		else:
			get_child(c).modulate = Color(1.0,1.0,1.0,1.0)
