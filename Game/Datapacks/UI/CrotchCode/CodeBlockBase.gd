extends Reference
class_name CodeBlockBase

var id = "error"
var lineNum:int = -1

func updateEditor(_editor):
	pass

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

func shouldExpandTemplate():
	return false

func getSlot(_id):
	return null

func updateVisualSlot(_editor, _id, _visSlot):
	pass

func applyRawValue(_id, _value):
	pass

func throwError(_contex:CodeContex, errorText):
	_contex.throwError(self, errorText)

func calcLineNums(_contex:CodeContex):
	lineNum = _contex.curLine
	
	for templateLine in getTemplate():
		if(templateLine["type"] == "slot"):
			getSlot(templateLine["id"]).calcLineNums(_contex)
		if(templateLine["type"] == "slot_list"):
			#_contex.curLine += 1
			getSlot(templateLine["id"]).calcLineNums(_contex)

func isNumber(val):
	if((val is float || val is int)):
		return true
	return false

func isString(val):
	if(val is String):
		return true
	return false
