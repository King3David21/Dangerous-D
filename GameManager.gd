extends Node

enum GameState {
	Start,
	Play,
	Win,
	Lose
}


var CurrentGameState = GameState.Start
var score = 0 


func _process(delta):
	match CurrentGameState:
		GameState.Start:
			pass
		GameState.Play:
			var Dragon = get_tree().get_nodes_in_group("Dragon")
			var Enemy = get_tree().get_nodes_in_group("Enemy")
			if Enemy.size() <= 0:
				CurrentGameState = GameState.Win 
			elif Dragon.size() <= 0:
				CurrentGameState  = GameState.Lose
			get_tree().get_nodes_in_group("Interface")[0].SetScore()
		GameState.Win:
			print("You won")
		GameState.Lose:
			print("You lose ")
	pass
