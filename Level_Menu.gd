extends Control


func _on_retry_pressed():
	get_tree().reload_current_scene()

func _on_continue_pressed():
	get_tree().change_scene_to_file("res://World/Levels/level_2.tscn")

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://menu/menu.tscn")
	
func enable_continue():
	$MarginContainer/HBoxContainer/VBoxContainer/Continue.visible = true
