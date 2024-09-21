extends Spatial
class_name PartOrientPicker

export(bool) var invert = false

var _theDoll:Spatial
# stores the doll itself by sarching in loop

func _ready():
	var Part3D = load("res://Player/Player3D/Parts/Part3D.gd")
	var theNode:Node = self # I really hope this works
	while !(theNode is Part3D):
		var previousNode = theNode.get_node("..")
		if (previousNode == null || previousNode is Doll3D ):
			break
		if previousNode is Part3D:
			_theDoll = previousNode.getDoll()
		theNode = previousNode

func _process(_delta):
	if _theDoll == null:
		return # i sure hope running this code every single frame doesn't add up.
	if invert:
		setValue(_theDoll.get_scale().x == -1)
	else:
		setValue(!(_theDoll.get_scale().x == -1))

func setValue(value):
	for child in get_children():
		if child is PartOrient:
			if child.getOrient() == value:
				child.visible = true
			else:
				child.visible = false