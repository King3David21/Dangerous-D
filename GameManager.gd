extends Node

enum GameState {
	Start,
	Play,
	Win,
	Lose
}

var CurrentGameState
var score
var dragons
var _popUp

func _ready():
	_popUp = get_tree().get_first_node_in_group("levelMenu")
	CurrentGameState = GameState.Start
	score = 0

func _process(_delta):
	match CurrentGameState:
		GameState.Play:
			if not get_tree().get_nodes_in_group("Enemy").size():
				CurrentGameState = GameState.Win
				print("You win")
				end_level(true)
			elif not (dragons.size() or get_tree().get_nodes_in_group("Dragon").size()):
				CurrentGameState = GameState.Lose
				print("You lose")
				end_level(false)
				
			# get_tree().get_nodes_in_group("Interface")[0].SetScore()
	pass

func start_game(dragons: Array):
	self.dragons = dragons
	CurrentGameState = GameState.Play
	
func end_level(result: bool):
	_popUp.enable_continue()
	_popUp.position = get_window().size / 2
	_popUp.visible = result
	
