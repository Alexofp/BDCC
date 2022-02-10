extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(_delta):
	return
	#if(Input.is_mouse_button_pressed(BUTTON_LEFT)):
	#	transform.origin = get_global_mouse_position()
	#pass
	#global_position = get_global_mouse_position()
	#add_central_force( -(global_position - get_global_mouse_position()).normalized() * _delta * 100.0 - linear_velocity * weight * _delta )

func _integrate_forces(_state):
	pass
	#if(Input.is_mouse_button_pressed(BUTTON_LEFT)):
	#	transform.origin = get_global_mouse_position()
