extends Node2D

@onready var mouse: Sprite2D = get_node("Mouse")

@onready var bird = preload("res://bird/bird.tscn")
@onready var red = preload("res://Dragons/red_dragons.tscn")

var dragons = []

# Called when the node enters the scene tree for the first time.
func _ready():
	dragons.append(bird)
	dragons.append(red)
	pass # Replace with function body.
	
func get_dragons():
	return dragons
