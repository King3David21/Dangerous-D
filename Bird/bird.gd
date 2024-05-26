extends RigidBody2D

var reset_pos = false
var reset_vel = false
var speed = 30
var pos: Vector2
var vel: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _integrate_forces(state):
	if (reset_pos):
		var t = state.get_transform()
		t.origin.x = pos.x
		t.origin.y = pos.y
		state.set_transform(t)
		state.apply_central_impulse(vel)
		reset_pos = false
		
func release_dragon(position: Vector2, velocity: Vector2):
	pos = position
	vel = velocity
	reset_pos = true
	
func get_speed():
	return speed

func launch():
	contact_monitor = true
	max_contacts_reported = 1

func _on_body_entered(body):
	print('collided with ', body)
	pass # Replace with function body.
