extends Reference
class_name CrotchSlotCalls

var blocks = []

func addBlock(newBlock):
	blocks.append(newBlock)

func execute():
	for block in blocks:
		block.execute()
