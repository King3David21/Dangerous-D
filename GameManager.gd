extends Node

enum GameState {
	Start,
	Play,
	Win,
	Lose
}


var CurrentGameState = GameState.Start

func _process(delta):
	match CurrentGameState:
		GameState.Start:
			pass
		GameState.Play:
			pass
		GameState.Win:
			print("You won")
		GameState.Lose:
			print("You lose ")
	pass
