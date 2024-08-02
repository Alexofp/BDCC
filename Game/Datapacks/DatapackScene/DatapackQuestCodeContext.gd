extends CodeContex
class_name DatapackQuestCodeContext

var datapackQuest:DatapackQuest
var datapack:Datapack

var storedErrors = []
var storedStages = []

var questVisible:bool = false
var questCompleted:bool = false

func setDatapack(theDatapack):
	datapack = theDatapack

func setQuest(theQuest):
	datapackQuest = theQuest

func say(text):
	storedStages.append(processOutputString(text))

func sayn(text):
	storedStages.append(processOutputString(text))

func saynn(text):
	storedStages.append(processOutputString(text))

func hasFlag(theVar:String, _codeblock = null):
	if(GM.main == null):
		return .hasFlag(theVar, _codeblock)
	
	if(!datapack.flags.has(theVar)):
		return false
	return true

func getFlag(theVar:String, defaultValue = null, _codeblock = null):
	if(GM.main == null):
		return .getFlag(theVar, defaultValue, _codeblock)
	
	if(datapack.flags.has(theVar)):
		return GM.main.getDatapackFlag(datapack.id, theVar, defaultValue)
	
	return GM.main.getFlag(theVar, defaultValue)

func setFlag(theVar:String, newValue, _codeblock):
	if(GM.main == null):
		return .setFlag(theVar, newValue, _codeblock)
	
	if(datapack.flags.has(theVar)):
		var varType = datapack.flags[theVar]["type"]
		
		if(varType == DatapackSceneVarType.BOOL && !(newValue is bool)):
			throwError(_codeblock, "Trying to assign a '"+str(newValue)+"' value to a BOOLEAN flag "+str(theVar))
			return
		if(varType == DatapackSceneVarType.STRING && !(newValue is String)):
			throwError(_codeblock, "Trying to assign a '"+str(newValue)+"' value to a STRING flag "+str(theVar))
			return
		if(varType == DatapackSceneVarType.NUMBER && !(newValue is int) && !(newValue is float)):
			throwError(_codeblock, "Trying to assign a '"+str(newValue)+"' value to a NUMBER flag "+str(theVar))
			return
		GM.main.setDatapackFlag(datapack.id, theVar, newValue)
		return
	GM.main.setFlag(theVar, newValue)

func throwError(_codeBlock, _errorText):
	.throwError(_codeBlock, _errorText)
	
	if(_codeBlock == null):
		storedErrors.append("[CrotchScript Error] "+str(_errorText))
	else:
		storedErrors.append("[CrotchScript Error at line "+str(_codeBlock.lineNum)+", block: "+str(_codeBlock.id)+"] "+str(_errorText))

func calculateQuestInfo():
	questVisible = false
	questCompleted = false
	storedStages = []
	
	clearVars()
	var code = datapackQuest.getCode()
	execute(code)
	
	if(storedErrors.size() > 0):
		for errorText in storedErrors:
			GM.main.addMessage("[color=red](Datapack quest: "+str(datapack.id)+":"+str(datapackQuest.id)+") "+errorText+"[/color]")
		storedErrors = []
	
	return {
		questVisible = questVisible,
		questCompleted = questCompleted,
		storedStages = storedStages,
	}
	

func loadVar(_data, thekey, defaultValue = null):
	if(_data.has(thekey)):
		return _data[thekey]
	return defaultValue

var simpleStringInterpolator:SimpleStringInterpolator = SimpleStringInterpolator.new()

# Handles things like {{varName}} and {{"meow" if varName else "mow"}}
func processOutputVars(text:String):
	return simpleStringInterpolator.process(text, self)

func processOutputString(text:String):
	return processOutputVars(text)

func doDebugPrint(text):
	doPrint(processOutputVars(text))

func markQuestAsVisible():
	questVisible = true

func markQuestAsCompleted():
	questCompleted = true
