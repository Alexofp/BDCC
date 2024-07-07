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

func saveData():
	var data = {}
	
	data["rawValue"] = rawValue
	if(block != null):
		data["block"] = {
			id = block.id,
			data = block.saveData(),
		}
	
	return data

func loadData(_data):
	rawValue = loadVar(_data, "rawValue", null)
	if(rawValue == null):
		if(rawType == CrotchVarType.NUMBER):
			rawValue = 0
		if(rawType == CrotchVarType.STRING):
			rawValue = ""
	
	var blockData = loadVar(_data, "block", null)
	if(blockData == null):
		setBlock(null)
	else:
		var theID = loadVar(blockData, "id", "")
		var theBlock = CrotchBlocks.createBlock(theID)
		if(theBlock != null):
			theBlock.loadData(loadVar(blockData, "data", {}))
			setBlock(theBlock)
	
func loadVar(_data, thekey, defaultValue = null):
	if(_data.has(thekey)):
		return _data[thekey]
	return defaultValue
