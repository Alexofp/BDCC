extends Spatial

var isIn = false
export(String) var bodypartID = ""

signal mouseEntered(bodypartID)
signal mouseExited(bodypartID)

func _input(event: InputEvent):
	var viewport = get_viewport()
	if(viewport == null):
		return
	var camera = viewport.get_camera()
	if(camera == null):
		return
	
	if(event is InputEventMouseMotion || event is InputEventMouseButton):
		var mousePos = camera.project_ray_origin(event.position)
		mousePos.z = 0.0
		var ourPos = global_transform.origin
		ourPos.z = 0.0
		
		#print(mousePos, " ", ourPos)
		var distance = mousePos.distance_to(ourPos)
		
		if(distance < 0.5 && (event.position.x >= 0 && event.position.y >= 0)):
			if(!isIn):
				isIn = true
				emit_signal("mouseEntered", bodypartID)
		else:
			if(isIn):
				isIn = false
				emit_signal("mouseExited", bodypartID)
