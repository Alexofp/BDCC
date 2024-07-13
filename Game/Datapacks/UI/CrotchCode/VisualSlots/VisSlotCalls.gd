extends VBoxContainer
onready var blocks_list = $BlocksList
onready var block_catcher_panel = $BlockCatcherPanel

var smallCatchPanel = preload("res://Game/Datapacks/UI/CrotchCode/VisualSlots/BlockCatcherPanelSmall.tscn")

var littleAdders = []
var slotCalls
var blockToVisualBlock = {}

var editor

func _ready():
	block_catcher_panel.setSideLabelsType(CrotchBlocks.CALL)

func setSlotCalls(theSlotCalls):
	if(slotCalls != null):
		slotCalls.disconnect("onBlockAdded", self, "onNewBlockAdded")
		slotCalls.disconnect("onBlockRemoved", self, "onBlockRemoved")
	slotCalls = theSlotCalls
	slotCalls.connect("onBlockAdded", self, "onNewBlockAdded")
	slotCalls.connect("onBlockRemoved", self, "onBlockRemoved")
	requestFullUpdate()


func onBlockRemoved(_oldBlock):
	if(!is_inside_tree()):
		return
	#blockToVisualBlock[oldBlock].queue_free()
	#blockToVisualBlock.erase(oldBlock)
	#updateLittleAdders()
	requestFullUpdate()

func onNewBlockAdded(_newBlock, _index):
	if(!is_inside_tree()):
		return
	#print("ADD BLOCK AT INDEX ", _index)
	#addVisBlockToList(newBlock, index)
	#updateLittleAdders()
	requestFullUpdate()

func updateLittleAdders():
	for littleAdder in littleAdders:
		littleAdder.queue_free()
	littleAdders = []
	
	var _i = 0
	for block in slotCalls.getBlocks():
		var blockVisualNode = blockToVisualBlock[block]
		
		var newSmallAdder = smallCatchPanel.instance()
		blocks_list.add_child(newSmallAdder)
		blocks_list.move_child(newSmallAdder, blockVisualNode.get_index())
		newSmallAdder.dropIndex = _i
		newSmallAdder.connect("onBlockDraggedOnto", self, "_on_BlockCatcherPanel_onBlockDraggedOnto")
		littleAdders.append(newSmallAdder)
		_i += 1

func addVisBlockToList(theCodeBlock, index):
	var newVisualBlock = preload("res://Game/Datapacks/UI/CrotchCode/CrotchBlockVisual.tscn").instance()
	newVisualBlock.editor = editor
	var _cm = blocks_list.get_child_count()
	blocks_list.add_child(newVisualBlock)
	if(index >= 0):
		if(index == 0):
			blocks_list.move_child(newVisualBlock, 0)
		elif(index >= (slotCalls.getBlocks().size()-1)):
			pass
		else:
			var newIndex = blockToVisualBlock[slotCalls.getBlocks()[index+1]].get_index()
			blocks_list.move_child(newVisualBlock, newIndex)
	blockToVisualBlock[theCodeBlock] = newVisualBlock
	newVisualBlock.setCodeBlock(theCodeBlock)
	newVisualBlock.setParentVisSlot(self)
	

func requestFullUpdate():
	if(!needsUpdating):
		needsUpdating = true
		#yield(get_tree(), "idle_frame")
		#yield(get_tree(), "idle_frame")
		#yield(get_tree(), "idle_frame")
		#yield(get_tree(), "idle_frame")
		#yield(get_tree(), "idle_frame")
		call_deferred("updateBlocksFully")
		#updateBlocksFully()
	
var needsUpdating = false
func updateBlocksFully():
	#if(!is_inside_tree()):
	#	return
	if(!needsUpdating):
		return
	needsUpdating = false
	Util.delete_children(blocks_list)
	if(slotCalls == null):
		updateLittleAdders()
		return
	
	for block in slotCalls.getBlocks():
		addVisBlockToList(block, -1)
	updateLittleAdders()
	
	var shouldHideLastAdder = false
	if(slotCalls.getBlocks().size() > 0 && slotCalls.getBlocks().back().hidesNextBlockAdder()):
		shouldHideLastAdder = true
	block_catcher_panel.visible = !shouldHideLastAdder
	

func _on_BlockCatcherPanel_onBlockDraggedOnto(_data, _index):
	#print("INDEX: ",_index)
	#print(_data)
	if(slotCalls != null):
		editor.onUserChangeMade()
		var theBlock = _data["block"]
		if(Input.is_action_pressed("editor_duplicate_mod")):
			var newBlock = CrotchBlocks.createBlock(theBlock.id)
			newBlock.loadData(theBlock.saveData().duplicate(true))
			theBlock = newBlock
		else:
			_data["ref"].doSelfdelete()
		if(_index >= 0):
			slotCalls.addBlockAt(theBlock, _index)
		else:
			slotCalls.addBlock(theBlock)
		#updateBlocks()

func removeBlock(theblock):
	if(slotCalls != null):
		slotCalls.removeBlock(theblock)
		#updateBlocks()
