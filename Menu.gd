extends Control

func _on_play_pressed():
	get_tree().change_scene_to_file("res://World/Level 1/level_1.tscn")

func _on_levels_pressed():
	get_tree().change_scene_to_file("res://menu/levels_menu.tscn")

func _on_quit_pressed():
	get_tree().quit()
