extends Reference
class_name CrotchSlotVar

var block
signal onBlockChanged(newBlock)

func setBlock(theBlock):
	block = theBlock
	emit_signal("onBlockChanged", theBlock)

func getValue(_contex:CodeContex):
	if(block == null):
		return null
	return block.getValue(_contex)

func getBlock():
	return block
