extends Reference
class_name CodeContex

signal onPrint(text)
signal onError(codeBlock, text)

var curLine:int = -1

var vars = {}
var varsDefinition = {}

func getVar(theVar:String, defaultValue = null):
	if(!vars.has(theVar)):
		if(varsDefinition.has(theVar)):
			return varsDefinition[theVar]["default"]
		return defaultValue
	return vars[theVar]

func setVar(theVar:String, newValue):
	print("SETTING "+str(theVar)+" TO "+str(newValue))
	vars[theVar] = newValue

func clearVars():
	vars = {}

func doPrint(text):
	emit_signal("onPrint", text)
	Log.print(str(text))

func throwError(_codeBlock, _errorText):
	emit_signal("onError", _codeBlock, str(_errorText))
	Log.printerr("[CrotchScript Error at line "+str(_codeBlock.lineNum)+"] "+str(_errorText))

func execute(slotCalls):
	#clearVars()
	calcLineNums(slotCalls)
	slotCalls.execute(self)

func getValue(slotVar):
	var result = slotVar.getValue(self)
	
	return result

func calcLineNums(slotCalls):
	curLine = 0
	slotCalls.calcLineNums(self)

func say(text):
	doPrint(text)

func sayn(text):
	doPrint(text)

func saynn(text):
	doPrint(text)

func addButton(_nameText, _descText, _state, _codeSlot):
	doPrint("BUTTON ADDED: "+str(_nameText))

func addDisabledButton(_nameText, _descText):
	doPrint("DISABLED BUTTON ADDED: "+str(_nameText))
