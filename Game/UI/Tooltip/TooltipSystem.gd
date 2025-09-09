extends Node

onready var tooltip = $CanvasLayer/TooltipDisplay

var nodeRef:WeakRef

func showTooltip(theControl, title: String, text: String, showBelow: bool = false, delayShow: bool = false, wideTooltip: bool = false):
	tooltip.set_is_active(true, delayShow)
	tooltip.setIsWide(wideTooltip)
	tooltip.setShowBelow(showBelow)
	tooltip.set_text(title, text)
	nodeRef = weakref(theControl) if theControl else null

func hideTooltip(theNodeRef):
	if(getRefNode() && theNodeRef != getRefNode()):
		return

	nodeRef = null
	tooltip.set_is_active(false)

func setTooltipText(theNodeRef, title:String, text:String):
	if(getRefNode() && theNodeRef != getRefNode()):
		return
	tooltip.set_text(title, text)

func resetTooltips():
	nodeRef = null
	tooltip.set_is_active(false)

func _process(_delta):
	if(nodeRef == null):
		return
	var theNode = nodeRef.get_ref()
	if(!theNode || !theNode.is_visible_in_tree()):
		resetTooltips()

func getRefNode():
	return nodeRef.get_ref() if nodeRef else null
