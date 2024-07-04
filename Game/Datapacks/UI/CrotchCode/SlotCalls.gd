extends Reference
class_name CrotchSlotCalls

var blocks = []

signal onBlockAdded(newBlock, index)
signal onBlockRemoved(oldBlock)

func addBlock(newBlock):
	blocks.append(newBlock)
	emit_signal("onBlockAdded", newBlock, blocks.size() - 1)

func removeBlock(theBlock):
	blocks.erase(theBlock)
	emit_signal("onBlockRemoved", theBlock)

func execute(_contex:CodeContex):
	for block in blocks:
		block.execute(_contex)

func getBlocks():
	return blocks

func addBlockAt(newBlock, index):
	blocks.insert(index, newBlock)
	emit_signal("onBlockAdded", newBlock, index)

func calcLineNums(_contex:CodeContex):
	for block in blocks:
		_contex.curLine += 1
		block.calcLineNums(_contex)
