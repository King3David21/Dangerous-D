extends Node2D

enum SlingState{
	idle,
	pull,
	thrown,
	reset
}
var SlingShotState
var LongLine
var ShortLine

func _ready():
	SlingShotState = SlingState.idle
	LongLine = $LongLine
	ShortLine = $ShortLine
	
func _process(delta):
	match SlingShotState:
		SlingState.idle:
			pass
		
		SlingState.pull:
			if Input.is_action_pressed("Left_Mouse"):
				var mp = get_global_mouse_position()
				print(mp)#should show where the mose postion is, but it doesnt 
				LongLine.points[1] = mp
				ShortLine.points[1] = mp  
			
		SlingState.thrown:
			pass
			
		SlingState.reset:
			pass

func _on_touch_area_input_event(viewport, event, shape_idx):
	SlingShotState = SlingState.pull

