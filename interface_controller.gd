extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func SetScore():
	$ScoreValue.text = get_tree().get_first_node_in_group("GameManager").score
	
