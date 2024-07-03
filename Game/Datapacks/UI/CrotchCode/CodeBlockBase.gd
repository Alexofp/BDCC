extends Reference
class_name CodeBlockBase

var id = "error"

func getType():
	return CrotchBlocks.CALL

func execute(_contex:CodeContex):
	pass

func getValue(_contex:CodeContex):
	return execute(_contex)

func getTemplate():
	return [
		{
			type = "label",
			text = "MEOW",
		},
	]

func getSlot(_id):
	return null

func applyRawValue(_id, _value):
	pass
