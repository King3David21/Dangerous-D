extends RigidBody2D


func _ready():
	
#This makes the dragon not move by physics but by user code.
	mode = RigidBody2D.FREEZE_MODE_KINEMATIC 
	
	
	
	

func ThrowBird():
	
#This allows the dragon to go back to being affected by phyiscs 
	mode = RigidBody2D.MODE_RIGID
