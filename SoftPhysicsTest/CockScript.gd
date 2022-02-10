extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var origPos = global_position

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _physics_process(_delta):
	if(Input.is_mouse_button_pressed(BUTTON_LEFT)):
		var toTarget = (get_global_mouse_position() - global_position)
		var desiredVel = toTarget * mass
		var currentVel = linear_velocity
		var thrust = desiredVel - currentVel * 0.5* mass
		apply_central_impulse(thrust)
		
		#transform.origin = get_global_mouse_position()
	
	if(false):
		apply_central_impulse((origPos - global_position)*_delta*100.0)
