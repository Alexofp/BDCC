extends Spatial
class_name PartOrientPicker

export(bool) var invert = false

var _callcount:int = 0

func _ready():
	var theNode = get_node("..")
	var theDoll:Spatial

	while !(theNode is BaseStageScene3D):
		var previousNode = theNode.get_node("..")
		if (previousNode == null || previousNode is Stage3D):
			break # just in case it got lower than Stage3D, the null check is here
		else:
			if theNode is Doll3D:
				theDoll = theNode
			theNode = previousNode

	if theDoll == null:
		if (invert):
			setValue(false)
		else:
			setValue(true)
		return

	var flipped = (theDoll.get_scale().x == -1)

	if theNode is BaseStageScene3D:
		if theNode.getVarOptions().has("flipNPC"):
			yield(get_tree(), "idle_frame") # I sure hope no one notices this and this is a bad code. At the same time if I were to make ALL BaseStageScene3D store playAnimation() aruguments, it would take more space. Atleast that's what I think. - CanInBad
			flipped = theDoll.get_scale().x == -1

	if (invert):
		setValue(!flipped)
	else:
		setValue(flipped)

func setValue(value):

	for child in get_children():
		if child is PartOrient:
			if child.getOrient() == value:
				child.visible = true

			else:
				child.visible = false
