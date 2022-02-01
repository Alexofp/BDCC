tool
extends Skeleton2D
export var exportBones = false setget setExportBones

var skeletonData = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func printBonePosDifference():
	var posLeft = $Hip/LLeg.global_position
	var posRight = $Hip/RLeg.global_position
	print(str(posLeft)+" "+str(posRight))
	
	var difference = posLeft - posRight
	print(str(difference))


func setExportBones(_newvalue):
	if(!_newvalue):
		return
	
	skeletonData = saveBones(self)
	
	print(JSON.print(skeletonData))
	
	
	
func saveBones(node: Node2D):
	var data = {}
	
	if(node is Skeleton2D):
		data["name"] = "root"
		data["child_bones"] = []
		
		for n in node.get_children():
			if(n is Bone2D):
				data["child_bones"].append(saveBones(n))
	
	if(node is Bone2D):
		var bonename = node.name

		data["name"] = bonename
		data["rest"] = node.rest
		data["child_bones"] = []
		data["posx"] = node.global_position.x
		data["posy"] = node.global_position.y
		data["rot"] = node.global_rotation
		data["len"] = node.default_length
		var posend = node.global_position + Vector2(cos(node.global_rotation), sin(node.global_rotation))*node.default_length
		
		data["posxend"] = posend.x
		data["posyend"] = posend.y
		
		for n in node.get_children():
			if(n is Bone2D):
				data["child_bones"].append(saveBones(n))

		
	return data
