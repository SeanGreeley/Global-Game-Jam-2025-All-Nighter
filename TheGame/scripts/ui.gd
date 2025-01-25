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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$WaveCount.text = "WAVE "+str(Global.roundCounter)
	$CoinCount.text = "x"+str(Global.coinCounter)
	$Inv1/Count.text = "x"+str(Global.inventory[0])
	$Inv2/Count.text = "x"+str(Global.inventory[1])
	$Inv3/Count.text = "x"+str(Global.inventory[2])
	$Inv4/Count.text = "x"+str(Global.inventory[3])
	$BossHealth.value = 100.0
	$BubbleHealth.value = 100.0
