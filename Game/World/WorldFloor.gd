extends Node2D
class_name WorldFloor

export var id = ""

func _ready():
	if(id == ""):
		id = name.to_lower()

func getRooms():
	var result = []
	
	for r in get_children():
		if(r is SubGameWorld):
			result.append_array(getRoomsRecursive(r))
		elif(r is MapDecoration):
			continue
		elif(r is GameRoom):
			result.append(r)
		
	return result
			
func getRoomsRecursive(node):
	var result = []
	for r in node.get_children():
		if(r is GameRoom):
			result.append(r)
		elif(r is MapDecoration):
			continue
		else:
			result.append_array(getRoomsRecursive(r))
	
	return result
