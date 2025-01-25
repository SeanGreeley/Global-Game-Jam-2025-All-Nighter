extends Node

var bubbleHealth:int = 100
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
