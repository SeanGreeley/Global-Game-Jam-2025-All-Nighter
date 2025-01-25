extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$WaveCount.text = "WAVE "+str(Global.roundCounter)
	$CoinCount.text = "x"+str(Global.coinCounter)
	$Inv1/Count.text = "x"+str(Global.inventory[0])
	$Inv2/Count.text = "x"+str(Global.inventory[1])
	$Inv3/Count.text = "x"+str(Global.inventory[2])
	$Inv4/Count.text = "x"+str(Global.inventory[3])
	$BossHealth.value = 100.0
	$BubbleHealth.value = 100.0
	Global.newWaveFade = 1.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$WaveCount.text = "WAVE "+str(Global.roundCounter)
	$NewWave.text = "WAVE "+str(Global.roundCounter)
	$CoinCount.text = "x"+str(Global.coinCounter)
	$Inv1/Count.text = "x"+str(Global.inventory[0])
	$Inv2/Count.text = "x"+str(Global.inventory[1])
	$Inv3/Count.text = "x"+str(Global.inventory[2])
	$Inv4/Count.text = "x"+str(Global.inventory[3])
	$BossHealth.value = 100.0
	$BubbleHealth.value = Global.bubbleHealth
	$NewWave.modulate = Color(1.0,1.0,1.0,1.0-abs(0.5-Global.newWaveFade)*2)
	$NewWave.scale = Vector2(1.0-Global.newWaveFade*0.25,1.0-Global.newWaveFade*0.25)
	if Global.newWaveFade > 0:
		Global.newWaveFade -= delta*0.5
