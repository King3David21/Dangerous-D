extends Control

func _on_retry_pressed():
	get_tree().change_scene_to_file("res://World/Level 1/level_1.tscn")

func _on_continue_pressed():
	get_tree().change_scene_to_file("res://World/Level 2/level_2.tscn")

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://menu/menu.tscn")
	
func enable_continue():
	$MarginContainer/HBoxContainer/VBoxContainer/Continue.visible = true
	
func win():
	$MarginContainer/HBoxContainer/Title/Win.visible = true
	
func lose():
	$MarginContainer/HBoxContainer/Title/Lose.visible = true
