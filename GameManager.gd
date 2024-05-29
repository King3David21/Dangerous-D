extends Node

@onready var popup = preload("res://PopUp.tscn")

var Wind = get_tree().get_nodes_in_group("window")

enum GameState {
	Start,
	Play,
	Win,
	Lose
}

var CurrentGameState
var score
var dragons

func _ready():
	CurrentGameState = GameState.Start
	score = 0

func _process(delta):
	match CurrentGameState:
		GameState.Play:
			if not get_tree().get_nodes_in_group("enemies").size():
				CurrentGameState = GameState.Win
				print("You win")
			elif not (dragons.size() or get_tree().get_nodes_in_group("Dragon").size()):
				CurrentGameState = GameState.Lose
				print("You lose")
			elif CurrentGameState == GameState.Win or CurrentGameState == GameState.Lose:
				Win.show()
			
			
			# get_tree().get_nodes_in_group("Interface")[0].SetScore()
	pass

func start_game(dragons: Array):
	self.dragons = dragons
	CurrentGameState = GameState.Play
	
