extends Area2D


var isIn = false
var ignoreInput = false

# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(true)
	
func setIgnoreInput(i):
	ignoreInput = i
	ignoreInput = true

func _physics_process(_delta):
	var mousePos = get_global_mouse_position()
	var ourPos = global_position
	var dist = ourPos.distance_to(mousePos)
	
	if(dist < 30 && !ignoreInput):
		if(!isIn):
			isIn = true
			
			emit_signal("mouse_entered")
	else:
		if(isIn):
			isIn = false
			
			emit_signal("mouse_exited")
	
	#print(ourPos.distance_to(mousePos))
