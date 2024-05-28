extends Node2D

var slingshotPos
var mouse
var center
var camera: Camera2D
var cameraOrigin
# The current slingshot state
var currState
var mousePos

# speed const
var speed = 40
var maxDist = 30
var timer = 0

# These will all be instantiated when the nodes are ready
var LongLine
var ShortLine
var dragonsRB: RigidBody2D
var dragons: Array


# Runs when the node has entered the scene
func _ready():
	slingshotPos = get_parent().get_node("Slingshot").position
	# Set states to our idle default
	currState = 'idle'
	LongLine = $LongLine
	ShortLine = $ShortLine
	center = $TouchArea/CenterOfSlingShot.position
	camera = get_tree().get_nodes_in_group("Camera")[0]
	cameraOrigin = camera.position
	dragons = get_parent().get_dragons() as Array
	_load_dragon()
	
	ShortLine.points[1] = center
	LongLine.points[1] = center
	
# Runs once per scene update, delta being the time difference between frames
func _process(_delta):
	# Update the position of the lines and dragon for the drag
	if currState == 'pressed':
		mousePos = get_local_mouse_position()
		ShortLine.points[1] = mousePos
		LongLine.points[1] = mousePos
		if is_instance_valid(dragonsRB):
			dragonsRB.position = mousePos
	if currState == 'released':
		timer = timer + _delta
		if is_instance_valid(dragonsRB):
			camera.position = dragonsRB.position + slingshotPos
		if timer > 3:
			currState = 'idle'
			camera.position = cameraOrigin
	
# Handles the release
func _input(event):
	if currState == 'pressed':
		# If we are not holding left-click and the previous state was 'pressed' we have released left-click
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			currState = 'released'
			timer = 0
			ShortLine.points[1] = center
			LongLine.points[1] = center
			if is_instance_valid(dragonsRB):
				var globalMouse = get_global_mouse_position()
				var velocity = (center + slingshotPos - globalMouse) * dragonsRB.get_speed()
				dragonsRB.release_dragon(globalMouse, velocity)
				dragonsRB.launch()
			else:
				currState = 'idle'
	
# Handle the left click even when we are clicking on the 2d slingshot shape	
func _on_touch_area_input_event(_viewport, event, _shape):
	if currState == 'idle':
		# We are clicking for the first time, load a dragon and enter state
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			currState = 'pressed'
			_load_dragon()

# Creates a dragon from the preloaded object
func _load_dragon():
	# We need to free up the object here to de-instantiate the previous dragon
	if is_instance_valid(dragonsRB):
		dragonsRB.free()
	# If we have dragons left in the scene
	if dragons.size():
		# Grab the next dragon ref
		var dragon = dragons.pop_front()
		# Make the dragon
		dragonsRB = dragon.instantiate()
		dragonsRB.can_sleep = false
		add_child(dragonsRB)

