extends Control

func resume():
	get_tree().paused = false
	
func pause():
	get_tree().paused = true
	
func test_esc():
	
	if Input.is_action_just_pressed("esc") and get_tree().paused == false:
		$".".show()
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused == true:
		$".".hide()
		resume()
		
func _on_resume_pressed():
	resume()
	$".".hide()
	
func _on_main_menu_pressed():
	resume()
	get_tree().change_scene_to_file("res://Scenes/Menus/Main_Menu.tscn")
	


func _process(delta):
	test_esc()
