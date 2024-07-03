extends VBoxContainer
onready var block_catcher_panel = $BlockCatcherPanel

var slotVar

func setSlotVar(theSlotVar):
	slotVar = theSlotVar
	updateBlock()
	#updateBlocksFully()
	#slotCalls.connect("onBlockAdded", self, "onNewBlockAdded")
	slotVar.connect("onBlockChanged", self, "onBlockChanged")
	
func updateBlock():
	if(slotVar.getBlock() == null):
		block_catcher_panel.setContainedNode(null)
		return
	var newVisualBlock = preload("res://Game/Datapacks/UI/CrotchCode/CrotchBlockVisual.tscn").instance()
	block_catcher_panel.setContainedNode(newVisualBlock)
	newVisualBlock.setCodeBlock(slotVar.getBlock())
	newVisualBlock.setParentVisSlot(self)

func onBlockChanged(_newBlock):
	updateBlock()

func removeBlock(_theblock):
	if(slotVar != null):
		slotVar.setBlock(null)

func _on_BlockCatcherPanel_onBlockDraggedOnto(_data, _index):
	if(slotVar != null):
		var theBlock = _data["block"]
		_data["ref"].doSelfdelete()
		slotVar.setBlock(theBlock)

func setSideLabelsType(theType):
	block_catcher_panel.setSideLabelsType(theType)
