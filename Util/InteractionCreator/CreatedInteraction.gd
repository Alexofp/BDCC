extends Reference
class_name CreatedInteraction

var id:String = ""
var startCode:String = "func start(_pawns:Dictionary, _args:Dictionary):\n\tdoInvolvePawn(\"guard\", _pawns[\"guard\"])\n\tdoInvolvePawn(\"inmate\", _pawns[\"inmate\"])\n\tsetState(\"\", \"inmate\")"
var endCode:String = "func getAnimData() -> Array:\n\treturn [StageScene.Duo, \"stand\", {pc=\"inmate\", npc=\"guard\"}]"
var vars:String = ""

var states: Dictionary = {}
var interruptions: Dictionary = {}

func getEditVars():
	return {
		"id": {
			name = "ID",
			type = "string",
			value = id,
		},
		"vars": {
			name = "vars",
			type = "bigString",
			value = vars,
		},
		"startCode": {
			name = "startCode",
			type = "bigString",
			value = startCode,
			minsize = 200.0,
		},
		"endCode": {
			name = "endCode",
			type = "bigString",
			value = endCode,
			minsize = 200.0,
		},
	}

func applyEditVar(varid, value):
	if(varid == "id"):
		id = value
		return true
	if(varid == "startCode"):
		startCode = value
	if(varid == "endCode"):
		endCode = value
	if(varid == "vars"):
		vars = value
	
	return false



func saveData():
	var stateData = []
	for stateID in states:
		var state = states[stateID]
		stateData.append({
			id = stateID,
			data = state.saveData(),
		})
	
	var intData = []
	for intID in interruptions:
		var interruption = interruptions[intID]
		intData.append({
			id = intID,
			data = interruption.saveData(),
		})
	
	return {
		"id": id,
		"states": stateData,
		"startCode": startCode,
		"endCode": endCode,
		"vars": vars,
		"interruptions": intData,
	}

func loadData(data):
	id = loadVar(data, "id", "noid")
	startCode = loadVar(data, "startCode", "")
	endCode = loadVar(data, "endCode", "")
	vars = loadVar(data, "vars", "")
	
	var stateData = loadVar(data, "states", [])
	states.clear()
	for stateInfo in stateData:
		var newAc = CreatedInteractionState.new()
		newAc.id = stateInfo["id"]
		newAc.loadData(stateInfo["data"])
		states[newAc.id] = newAc
	
	var intData = loadVar(data, "interruptions", [])
	interruptions.clear()
	for intInfo in intData:
		var newAc = CreatedInteractionInterruption.new()
		newAc.id = intInfo["id"]
		newAc.loadData(intInfo["data"])
		interruptions[newAc.id] = newAc
		
		
func loadVar(_data, thekey, defaultValue = null):
	if(_data.has(thekey)):
		return _data[thekey]
	return defaultValue

func saveToFile():
	var folder:String = "user://createdInteractions"
	var dir:Directory = Directory.new()
	var _ok = dir.make_dir(folder)
	
	var finalFilePath:String = folder.plus_file(id+".json")
	var file:File = File.new()
	var _ok2 = file.open(finalFilePath, File.WRITE)
	
	file.store_string(JSON.print(saveData(), "\t"))
	file.close()

func loadFromFile(filePath:String):
	var file:File = File.new()
	
	var _ok = file.open(filePath, File.READ)
	
	if(_ok != OK):
		return
	
	var text = file.get_as_text()
	file.close()
	
	var json = JSON.parse(text)
	
	if(json.error != OK):
		return
	
	var data = json.result
	loadData(data)

func generateCode() -> String:
	var text = 'extends PawnInteractionBase'
	text += '\n'
	if(vars != ""):
		for varEntry in vars.split("\n"):
			var varData = Util.splitOnFirst(varEntry, " ")
			var varName = varData[0]
			var varValue = varData[1]
			
			text += "\nvar "+varName+" = "+varValue
		text += '\n\n'
	else:
		text += "\n"
	text += 'func _init():'
	text += '\n\tid = "'+id+'"'
	text += '\n\n'
	if(startCode != ""):
		text += startCode
		text += '\n\n'
	
	for stateID in states:
		var actualID:String = stateID if stateID != "" else "init"
		var state:CreatedInteractionState = states[stateID]
		
		text += 'func '+actualID+'_text():\n'
		
		var textCodeLines := []
		var afterButtonLines := []
		for line in state.output.split("\n"):
			if(line.strip_edges() == ""):
				continue
			var lineData = getTabsAndText(line)
			line = lineData[1]
			var tabsText = lineData[0] + "\t"
			
			if(line.begins_with("!")):
				line = line.substr(1)
				if(line.begins_with("!")):
					afterButtonLines.append(tabsText+line.substr(1))
				else:
					textCodeLines.append(tabsText+line)
			elif(line.begins_with("=")):
				var sayData = Util.splitOnFirst(line.substr(1), ":")
				textCodeLines.append(tabsText+"saynn(\"[say="+sayData[0]+"]"+sayData[1].strip_edges()+"[/say]\")")
			else:
				textCodeLines.append(tabsText+"saynn(\""+line+"\")")
		if(textCodeLines.size() <= 0):
			text += "\tsaynn(\"\")"
		else:
			text += Util.join(textCodeLines, "\n")
		text += "\n\n"
		for actionID in state.actions:
			var action:CreatedInteractionAction = state.actions[actionID]
			var extraFields:String = ""
			if(action.args != ""):
				extraFields += "args={"+action.args+"},"
			if(action.start_fight != ""):
				extraFields += "start_fight=["+action.start_fight+"],"
			if(action.start_sex != ""):
				extraFields += "start_sex=["+action.start_sex+"],"
			
			var extraT:String = ""
			if(action.condSee != ""):
				text += '\tif('+action.condSee+'):\n'
				extraT = "\t"
			
			if(action.cond != ""):
				text += extraT+'\tif('+action.cond+'):\n\t'
			text += extraT+'\taddAction("'+actionID+'", "'+action.name+'", "'+action.desc.replace("\n", "\\n")+'", \"'+action.scoreType+'\", '+str(action.score)+', '+str(action.time)+', {'+extraFields+'})\n'   #")\n'
			if(action.cond != "" && action.disabledDesc != ""):
				text += extraT+'\telse:\n'+extraT+'\t\taddDisabledAction("'+action.name+'", "'+action.disabledDesc.replace("\n", "\\n")+'")\n'
			#text += "\t\t{\n"
			#text += "\t\t\tid = \""+actionID+"\",\n"
			#text += "\t\t\tname = \""+action.name+"\",\n"
			#text += "\t\t},\n"
		text += "\n"
		
		if(afterButtonLines.size() > 0):
			text += Util.join(afterButtonLines, "\n")
			text += "\n\n"
		
		if(!state.actions.empty()):
			text += 'func '+actualID+'_do(_id:String, _args:Dictionary, _context:Dictionary):\n'
			for actionID in state.actions:
				var action:CreatedInteractionAction = state.actions[actionID]
				text += "\tif(_id == \""+actionID+"\"):\n"
				if(action.code == ""):
					text += "\t\tpass\n"
				else:
					for line in action.code.split("\n"):
						text += "\t\t"+line+"\n"
			text += "\n\n"
		#text += '\treturn [\n'

		#text += '\t]'
		#text += "\n\n"
	
	if(!interruptions.empty()):
		text += 'func getInterruptActions(_pawn:CharacterPawn) -> Array:\n'
		text += '\tvar result:Array = []\n'
		for intID in interruptions:
			var interruption:CreatedInteractionInterruption = interruptions[intID]
			var tt := "\t"
			if(!interruption.states.empty()):
				text += tt+"if(getState() in ["+Util.joinWithBorders(interruption.states, ", ", '"')+"]):\n"
				tt += "\t"
			if(interruption.cond != ""):
				text += tt+"if("+interruption.cond+"):\n"
				tt += "\t"
			text += tt+"result.append({\n"
			text += tt+'\tid = "'+intID+'",\n'
			text += tt+'\tname = "'+interruption.name+'",\n'
			text += tt+'\tdesc = "'+interruption.desc.replace("\n", "\\n")+'",\n'
			text += tt+'\tscore = '+interruption.score+',\n'
			text += tt+'\tscoreType = "'+interruption.scoreType+'",\n'
			text += tt+'\tscoreRole = "'+interruption.scoreRole+'",\n'
			text += tt+'\targs = {'+interruption.args+'},\n'
			text += tt+'})\n'
		text += '\treturn result'
		text += '\n\n'
		
		text += "func doInterruptAction(_pawn:CharacterPawn, _id:String, _args:Dictionary, _context:Dictionary):\n"
		for intID in interruptions:
			var interruption:CreatedInteractionInterruption = interruptions[intID]
			text += '\tif(_id == "'+intID+'"):\n'
			if(interruption.code == ""):
				text += "\t\tpass\n"
			else:
				for line in interruption.code.split("\n"):
					text += "\t\t"+line+"\n"
		text += '\n\n'
	
#func doInterruptAction(_pawn:CharacterPawn, _id:String, _args:Dictionary, _context:Dictionary):
#	pass
	
	if(endCode != ""):
		text += endCode
		text += '\n\n'
		
	if(vars != ""):
		text += "func saveData():\n"
		text += "\tvar data = .saveData()\n"
		for varEntry in vars.split("\n"):
			var varData = Util.splitOnFirst(varEntry, " ")
			var varName = varData[0]
			#var varValue = varData[1]
			
			text += "\n\tdata[\""+varName+"\"] = "+varName
		text += "\n\treturn data"
		text += '\n\n'
		text += "func loadData(_data):\n"
		text += "\t.loadData(_data)\n"
		for varEntry in vars.split("\n"):
			var varData = Util.splitOnFirst(varEntry, " ")
			var varName = varData[0]
			var varValue = varData[1]
			
			text += "\n\t"+varName + " = SAVE.loadVar(_data, \""+varName+"\", "+varValue+")"
		text += '\n\n'
		
	return text

func getTabsAndText(theLine:String):
	var tabs:String = ""
	
	while(theLine.length() > 0 && theLine[0] == "\t"):
		tabs += "\t"
		theLine = theLine.substr(1)
	
	return [tabs, theLine]
