extends RigidBody2D

var health = 10

var damage = 5


# Called when the node enters the scene tree for the first time.
func _ready():
	var t = Timer.new()
	t.set_wait_time(3)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	await t.timeout
	contact_monitor = true
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if health <= 0:
		queue_free()


func _on_body_entered(body):
	if is_instance_valid(body):
		print("it")
		if body is RigidBody2D:
			if body.is_in_group("Enviorment"):
				health -= damage
				print("Environment", health)
			elif body.is_in_group("Dragon"):
				health = 0 
			else:
				health -= damage 
				
