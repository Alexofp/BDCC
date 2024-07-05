extends Reference
class_name CodeContex

signal onPrint(text)
signal onError(codeBlock, text)

var curLine:int = -1

var vars = {}

func getVar(theVar:String, defaultValue = null):
	if(!vars.has(theVar)):
		return defaultValue
	return vars[theVar]

func setVar(theVar:String, newValue):
	vars[theVar] = newValue

func clearVars():
	vars = {}

func doPrint(text):
	emit_signal("onPrint", text)
	print(text)

func throwError(_codeBlock, _errorText):
	emit_signal("onError", _codeBlock, str(_errorText))
	Log.printerr("[CrotchScript Error at line "+str(_codeBlock.lineNum)+"] "+str(_errorText))

func execute(slotCalls):
	clearVars()
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
