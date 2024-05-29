extends RigidBody2D

class_name Enemy

var health = 10
var damage = 5
var envHit = false


 
# Called when the node enters the scene tree for the first time.
func _ready():
	var t = Timer.new()
	t.set_wait_time(0.5)
	t.set_one_shot(true)
	# call our callback when the timer ends
	t.timeout.connect(_onTimerEnd)
	self.add_child(t)
	t.start()


# Our callback to enable collisions
func _onTimerEnd():
	contact_monitor = true
	max_contacts_reported = 1
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if health <= 0:
		GameManager.score += damage
		print(GameManager.score)
		print('OOF')
		queue_free()

# Handles when another body makes contact
func _on_body_entered(body):
	if is_instance_valid(body):
		if body.is_in_group("Environment"):
			print('Env Hit')
			if envHit:
				health -= damage
				
				print('YEOWCH ', health)
			else: 
				envHit = true
		elif body.is_in_group("Dragon"):
			health = 0 
			
		else:
			health -= damage 
