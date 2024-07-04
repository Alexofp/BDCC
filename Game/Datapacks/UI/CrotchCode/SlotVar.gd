extends Reference
class_name CrotchSlotVar

var block
signal onBlockChanged(newBlock)

var rawValue = null
var rawType = CrotchVarType.ANY

func setRawType(newRawType):
	rawType = newRawType
	rawValue = CrotchVarType.getDefaultValue(rawType)

func getRawType():
	return rawType

func setRawValue(newValue):
	rawValue = newValue

func getRawValue():
	return rawValue

func setBlock(theBlock):
	block = theBlock
	emit_signal("onBlockChanged", theBlock)

func getValue(_contex:CodeContex):
	if(block == null):
		return getRawValue()
	return block.getValue(_contex)

func getBlock():
	return block

func isEmpty():
	return block == null

func calcLineNums(_contex:CodeContex):
	if(block != null):
		block.calcLineNums(_contex)
