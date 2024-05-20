extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	mode = RigidBody2D.MODE_KINEMATIC
	pass # Replace with function body.


func ThrowBird():
	mode = RigidBody2D.MODE_RIGID
