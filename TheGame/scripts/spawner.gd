extends Node2D

var enemySkeleton = load("res://Scenes/enemy.tscn")
var crab = load("res://Scenes/enemy_crab.tscn")
var boss = load("res://Scenes/enemy_boss.tscn")
var spawnAmount:int = 10
var remainingWaves:int = 10
var timerIsRunning: bool = false
var testHealth = Global.bubbleHealth
# Called when the node enters the scene tree for the first time.
var spawns = [Vector2(-550, -615), Vector2(-575, -500), Vector2(-600, -150), Vector2(-600, 110), Vector2(-500, 400), Vector2(-450, 600),
Vector2(-130, 600), Vector2(150, 550), Vector2(450, 550), Vector2(660, 400), Vector2(600, 100), Vector2(630, -200), Vector2(630, -425), 
Vector2(430, -575), Vector2(230, -620), Vector2(-100, -630)]
func _spawnCrabz(pos: Vector2 = Vector2(0,0)):
	var newEnemy = enemySkeleton.instantiate()
	var newType = crab.instantiate()
	newEnemy.add_child(newType)
	newEnemy.position = pos
	get_tree().root.add_child.call_deferred(newEnemy)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _spawnBowz(pos: Vector2 = Vector2(0,0)):
	var newBoss = enemySkeleton.instantiate()
	var newType = boss.instantiate()
	newBoss.add_child(newType)
	newBoss.position = pos
	get_tree().root.add_child.call_deferred(newBoss)

func _spawning():
	$GameMusic.play()
	$ShopMusic.stop()
	for i in range(spawnAmount):
		_spawnCrabz(spawns.pick_random())
		await get_tree().create_timer(.2).timeout

#All other waves and Shop timer
func _process(delta):
	if get_tree().get_nodes_in_group("Enemies").is_empty() and not timerIsRunning:
		
		timerIsRunning = true
		Global.shopOpen = true
		$GameMusic.stop()
		$ShopMusic.play()
		await get_tree().create_timer(15).timeout
		spawnAmount += 30
		remainingWaves -= 1
		Global.roundCounter += 1
		Global.newWaveFade = 1.0
		Global.shopOpen = false
		_spawning()
		timerIsRunning = false

#First Wave
func _ready():
	_spawning()
	
	
