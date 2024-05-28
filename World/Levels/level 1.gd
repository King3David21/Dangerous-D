extends Node2D

@onready var red = preload("res://Dragons/red_dragons.tscn")

var dragons = []

# Called when the node enters the scene tree for the first time.
func _ready():
	dragons.append(red)
	dragons.append(red)
	dragons.append(red)
	dragons.append(red)
	dragons.append(red)
	pass # Replace with function body.
	
func get_dragons():
	return dragons
