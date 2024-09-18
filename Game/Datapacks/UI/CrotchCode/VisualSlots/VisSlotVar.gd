extends VBoxContainer
onready var block_catcher_panel = $BlockCatcherPanel

var slotVar
var extraMode = 0

var editor

func setExtraMode(newExtraMode):
	extraMode = newExtraMode

func setSlotVar(theSlotVar):
	slotVar = theSlotVar
	updateBlock()
	#updateBlocksFully()
	#slotCalls.connect("onBlockAdded", self, "onNewBlockAdded")
	slotVar.connect("onBlockChanged", self, "onBlockChanged")
	block_catcher_panel.setRawMode(slotVar.getRawType(), extraMode)
	block_catcher_panel.setRawValue(slotVar.getRawValue())
	if(slotVar.getRawType() == CrotchVarType.BOOL):
		block_catcher_panel.setRawPossibleValues([true, false])
	#print("SET BLOCK")

func setPossibleValues(newVals:Array):
	block_catcher_panel.setRawPossibleValues(newVals)
	#block_catcher_panel.setRawValue(slotVar.getRawValue())

func updateBlock():
	#if(!is_inside_tree()):
	#	return
	if(slotVar.getBlock() == null):
		block_catcher_panel.setContainedNode(null)
		return
	var newVisualBlock = preload("res://Game/Datapacks/UI/CrotchCode/CrotchBlockVisual.tscn").instance()
	newVisualBlock.editor = editor
	block_catcher_panel.setContainedNode(newVisualBlock)
	newVisualBlock.setCodeBlock(slotVar.getBlock())
	newVisualBlock.setParentVisSlot(self)

func onBlockChanged(_newBlock):
	if(!is_inside_tree()):
		return
	updateBlock()

func removeBlock(_theblock):
	if(slotVar != null):
		#print("REMOVED BLOCK")
		slotVar.setBlock(null)

func _on_BlockCatcherPanel_onBlockDraggedOnto(_data, _index):
	if(slotVar != null):
		var theBlock = _data["block"]
		if(theBlock.hasSlotObject(slotVar)): # To prevent dropping a block into itself
			return
		editor.onUserChangeMade()
		if(Input.is_action_pressed("editor_duplicate_mod")):
			var newBlock = CrotchBlocks.createBlock(theBlock.id)
			newBlock.loadData(theBlock.saveData().duplicate(true))
			theBlock = newBlock
		else:
			_data["ref"].doSelfdelete()
		slotVar.setBlock(theBlock)

func setSideLabelsType(theType):
	block_catcher_panel.setSideLabelsType(theType)


func _on_BlockCatcherPanel_onRawValueChanged(newRaw):
	if(slotVar != null):
		slotVar.setRawValue(newRaw)

func makeExpand():
	size_flags_horizontal = SIZE_EXPAND_FILL

func setPlaceholder(thePlace):
	block_catcher_panel.setPlaceholder(thePlace)

func setMinSize(theMinSize:float):
	rect_min_size.x = theMinSize
