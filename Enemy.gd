extends RigidBody2D

class_name Enemy

var health = 10
var damage = 5
var envHit = false

# Called when the node enters the scene tree for the first time.
func _ready():
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
	print('Hit')
	if envHit:
		if body.is_in_group("Dragon"):
			print('OOF')
			health = 0
		else:
			health -= damage
			print('YEOWCH ', health)
	else: 
		envHit = true
