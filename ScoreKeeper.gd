extends CanvasLayer

var score = 0
@onready var ScoreLabel = $Score
@onready var gameManager = get_tree().get_first_node_in_group("GameManager")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func SetScore():
	$ScoreKeeper/ScoreValue.text = str(int(gameManager.score))
