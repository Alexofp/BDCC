extends Control

var containedNode = null
signal onBlockDraggedOnto(data, index)

var dropIndex = -1

func can_drop_data(_position, _data):
	#setIsHighlighted(true)
	return true

func drop_data(_position, _data):
	emit_signal("onBlockDraggedOnto", _data, dropIndex)

func setIsHighlighted(isHigh):
	var borderS = 0
	if(isHigh):
		borderS = 4
	var theStyle:StyleBoxFlat = get_stylebox("panel")
	theStyle.border_width_left = borderS
	theStyle.border_width_right = borderS
	theStyle.border_width_top = borderS
	theStyle.border_width_bottom = borderS

func _ready():
	#var _ok = GlobalSignals.connect("onDragEnded", self, "onDragEnded")
	#var _ok2 = GlobalSignals.connect("onDragStarted", self, "onDragStarted")
	pass

func onDragEnded():
	setIsHighlighted(false)

func onDragStarted():
	setIsHighlighted(true)

func setContainedNode(theNode):
	if(containedNode != null):
		containedNode.queue_free()
		containedNode = null
	if(theNode != null):
		containedNode = theNode
		add_child(theNode)

func setSideLabelsType(theType):
	$Label.text = CrotchBlocks.getLeftBracket(theType)
	$Label2.text = CrotchBlocks.getRightBracket(theType)
