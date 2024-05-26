extends RigidBody2D

#Gives the brick a health value 
var health = 5




# This is what the tutorial said to do for the bricks.
# Im not really sure what the code is doing, but I thubk its a sort of time that prevents the bricks from doing something.
# Not sure what though. s
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
	pass

#
func _on_body_entered(body):
	#checking if the player is hitting the brick
	if is_instance_valid(body):
		#Making sure the object is a RigidBody so that an error doesnt happen 
		if body is RigidBody2D:
			#This line is not required. Its used for syntax coloring 
			body = body as RigidBody2D
			#calcualtes damage based off of the line lenght and direction 
			var damage = body.linear_velocity.length() * .05
			#This is saything health = health - damage 
			health -= damage
			if(health <= 0):
				queue_free()
		
	pass # Replace with function body.
