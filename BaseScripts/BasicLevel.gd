# This file is a general level file
extends Node2D

class_name BasicLevel

# Reference to the red dragon scene
@onready var red = preload("res://Dragons/red_dragons.tscn")
@onready var black = preload("res://Dragons/black_dragon.tscn")
@onready var gameManager = get_tree().get_first_node_in_group("GameManager")

# Our array of dragons and how many there should be by default
var _dragons = []
var _numDragons = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	# Dragons are handled like this in case we wanted to load a specific order
	for i in range(_numDragons):
		if randi_range(0, 1):
			_dragons.append(red)
		else:
			_dragons.append(black)
	# Tell the game manager to start and give it a reference to the dragons array
	gameManager.start_game(_dragons)

# Returns the array of dragons
func get_dragons():
	return _dragons
