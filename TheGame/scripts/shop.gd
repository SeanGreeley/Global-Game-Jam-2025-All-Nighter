extends Node2D

var millis

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(0,-1000)
	$BuyAcid.visible = true
	$BuyBoom.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	millis = Time.get_ticks_msec()
	if Global.shopOpen:
		position.y += (0-position.y)/30.0
	elif position.y > -1000 and position.y < 900:
		position.y += (-abs(position.y)-1)/30.0
	else:
		position.y = 1000
	for c in get_child_count():
		get_child(c).position.y += sin(millis/500.0+c*45.2)*delta*8.0
		get_child(c).scale = Vector2(1.0+sin(millis/300.0+c*87.4)*0.025,1.0-cos(millis/300.0+c*87.4)*0.025)
		if get_child(c).is_hovered():
			get_child(c).modulate = Color(0.7,0.7,0.7,1.0)
		else:
			get_child(c).modulate = Color(1.0,1.0,1.0,1.0)


func _on_buy_wood_pressed():
	Global.inventory[2] += 1
	Global.coinCounter -= 5


func _on_buy_stone_pressed():
	Global.inventory[1] += 1
	Global.coinCounter -= 10

func _on_buy_coral_pressed():
	Global.inventory[0] += 1
	Global.coinCounter -= 15


func _on_buy_urchin_pressed():
	Global.inventory[3] += 1
	Global.coinCounter -= 20


func _on_buy_acid_pressed():
	Global.coinCounter -= 25
	Global.hasAcid = true
	$BuyAcid.visible = false

func _on_buy_boom_pressed():
	Global.coinCounter -= 30
	Global.hasBoom = true
	$BuyBoom.visible = false
