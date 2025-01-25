extends Node

var bubbleHealth:float = 100
var bossHealth:int
var roundCounter:int = 1
var coinCounter:int = 0
var inventory:Array = [0,0,0,0]
var stunned:bool = false
var shopOpen:bool = false
var playerPosition:Transform2D
var hasAcid:bool = false
var hasBoom:bool = false
var newWaveFade:float = 1.0

func resetGame():
	bubbleHealth = 100
	#bossHealth = 25
	roundCounter = 1
	coinCounter = 0
	inventory = [0,0,0,0]
	stunned = false
	shopOpen = false
	
	hasAcid = false
	hasBoom = false
	newWaveFade = 1.0
