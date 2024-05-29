extends Control

@export var lastLevel = true

func _on_retry_pressed():
	get_tree().change_scene_to_file("res://World/Levels/level_3.tscn")

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://menu/menu.tscn")
	
func enable_continue():
	$MarginContainer/HBoxContainer/VBoxContainer/Continue.visible = lastLevel
