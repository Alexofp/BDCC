extends Reference
class_name CodeContex

signal onPrint(text)
signal onError(codeBlock, text)

var curLine:int = -1

func doPrint(text):
	emit_signal("onPrint", text)
	print(text)

func throwError(_codeBlock, _errorText):
	emit_signal("onError", _codeBlock, str(_errorText))
	Log.printerr("[CrotchScript Error at line "+str(_codeBlock.lineNum)+"] "+str(_errorText))

func execute(slotCalls):
	calcLineNums(slotCalls)
	slotCalls.execute(self)

func getValue(slotVar):
	var result = slotVar.getValue(self)
	
	return result

func calcLineNums(slotCalls):
	curLine = 0
	slotCalls.calcLineNums(self)
