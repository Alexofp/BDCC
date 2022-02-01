tool
extends Polygon2D

export var exportPolygon = false setget setDoThing

func setDoThing(newv):
	if(!newv):
		return
	
	var data = {}
	data["verts"] = []
	
	for pos in polygon:
		data["verts"].append([pos.x, pos.y])

	data["faces"] = []
	
	for face in polygons:
		var newface = []
		for ind in face:
			newface.append(ind)
		data["faces"].append(newface)

	data["globalpos"] = [global_position.x, global_position.y]

	print(JSON.print(data))
