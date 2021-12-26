extends Limb

export(float) var baseRotation = 0
export(Vector2) var LLLegPos = Vector2(-194.285, -31.001)
export(float) var LLLegAng = -1.7
export(Vector2) var LFootPos = Vector2(-171.884, -33.687)
export(float) var LFootAng = -120.9

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _changeSkeleton(_skeleton: Skeleton2D):
	var bone:Bone2D = _skeleton.get_node("Hip/LLeg")
	var baseTransform:Transform2D = Transform2D(deg2rad(baseRotation), bone.rest.get_origin())
	bone.rest = baseTransform
	
	bone = _skeleton.get_node("Hip/LLeg/LLLeg")
	bone.rest = Transform2D(deg2rad(LLLegAng), LLLegPos)
	
	bone = _skeleton.get_node("Hip/LLeg/LLLeg/LFoot")
	bone.rest = Transform2D(deg2rad(LFootAng), LFootPos)
