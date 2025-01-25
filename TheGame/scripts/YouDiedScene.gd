extends Control


func _ready():
	Global.resetGame()
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://Scenes/Menus/Main_Menu.tscn")
