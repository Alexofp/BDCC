extends Spatial
class_name PartOrientPicker

export(bool) var invert = false

var _theDoll:Spatial
# stores the doll itself by sarching in loop

var _cachedSide:bool = false
# we can get into the loop if the actual side compared to this is changed

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

	var _currentSide = (_theDoll.get_scale().x == -1)
	if invert: # yes this is boilerplate so what
		setValue(!_currentSide)
	else:
		setValue(_currentSide)

	_cachedSide = _currentSide # set init "cached" side

func _process(_delta):
	if _theDoll == null:
		return # i sure hope running this code every single frame doesn't add up.

	var _currentSide = (_theDoll.get_scale().x == -1)
	if _cachedSide != _currentSide: # check if current side changes
		_cachedSide = _currentSide
		if invert: # basically the same as L24-L27
			setValue(!_currentSide)
		else:
			setValue(_currentSide)

func setValue(value):
	for child in get_children():
		if child is PartOrient:
			if child.getOrient() == value:
				child.visible = true
			else:
				child.visible = false