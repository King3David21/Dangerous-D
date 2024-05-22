extends Node2D

#  >>> Please make sure to comment everything, I'll comment this file as an example <<<
# It may seem tedious but commenting code is the standard. I can go into more detail about documentation if you need me to.

# I'm assuming this will be used to generate the sling line
var LongLine
var ShortLine

# The previous slingshot state
var prevState
# The current slingshot state
var currState
# If we are hovering over the slingshot shape
var hovering = false
# The drag start and end position
var startPos
var endPos
# this is just for debugging
var printed = false

# Runs when the node has entered the scene
func _ready():
	# Set states to our idle default
	prevState = 'idle'
	currState = 'idle'
	LongLine = $LongLine
	ShortLine = $ShortLine
	
# Runs once per scene update, delta being the time difference between frames
func _process(delta):
	$Mouse.position = get_global_mouse_position()
	# If we are hovering over the shape
	if hovering:
		# If we are holding left-click at this point, we should be dragging
		if currState == 'pressed':
			# remove this when you actually add dragging
			if not printed:
				print('dragging the dragon')
				printed = true
	# If we have released left-click, we launch the dragon
	if currState == 'released':
		var endPos = get_global_mouse_position()
		var dir = (Vector2(endPos[0], endPos[1]) - startPos).normalized()
		print('FIRE! ', dir)
		# Set the current state to 'idle' to reset
		currState = 'idle'
		printed = false
	# set the previous state to the current state
	prevState = currState
	
func _input(event):
	# Get the input event, check the type
	if event is InputEventMouseButton:
		# It is some sort of left click, check if press or release
		if event.button_index == MOUSE_BUTTON_LEFT:
			# If we are hovering over the slingshot we can left click it
			if hovering and event.pressed && prevState == 'idle':
				currState = 'pressed'
				var mp = get_global_mouse_position()
				startPos = Vector2(mp[0], mp[1])
			# If we are not holding left-click and the previous state was 'pressed' we have released left-click
			if not event.pressed && prevState == 'pressed':
				# Handle launching the dragon once the state has entered 'released' for the first time
				currState = 'released'

# This function detects the mouse pointer entering the slingshot shape
func _on_touch_area_input_event(viewport, event, shape_idx):
	hovering = true
