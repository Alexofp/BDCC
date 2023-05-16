extends Control

# Can be used to quickly convert a scene from a google docs document into code
var lines = []
var _i = 0
var runs = {}
var currentRun = ""
var tabAmount = 0
var reacts = {}
var sceneID = "TestScene"
var sceneReacts = {}
var trackedVariables = {}
var initSceneLines = []
var reactInitLines = []
var npcAssocs = {}
var functions = []
var devCommentary = []

var theGame:MainScene
var testingScene = false
var pickedSavePath = null

onready var savesContainer = $SavesMenu/ScrollContainer/SavesContainer
var saveGameElemenetScene = preload("res://UI/MainMenu/SaveGameElement.tscn")

func reset():
	lines = []
	reacts = {}
	_i = 0
	runs = {}
	currentRun = ""
	tabAmount = 0
	sceneID = "TestScene"
	sceneReacts = {}
	trackedVariables = {}
	initSceneLines.clear()
	reactInitLines.clear()
	npcAssocs.clear()
	functions.clear()
	devCommentary = []

func setCurrentRun(newcur):
	currentRun = newcur

func addToRun(thetext):
	for _j in range(tabAmount+2):
		thetext = "\t"+thetext
		
	addToRunNoTabs(thetext)

func addToRunNoTabs(thetext):
	if(!runs.has(currentRun)):
		runs[currentRun] = []
		
	runs[currentRun].append(thetext)

onready var inputTextEdit = $VBoxContainer/TextEdit
onready var outputTextEdit = $VBoxContainer/TextEdit2

func _ready():
	$VBoxContainer/TextEdit2.add_color_region('#', '', Color.cadetblue)

func _on_Button_pressed():
	reset()
	var result = []
	var text:String = inputTextEdit.text
	text = text.replace("“", '"')
	text = text.replace("”", '"')
	text = text.replace("‘", "'")
	text = text.replace("’", "'")
	
	lines = text.split("\n")
	_i = 0
	var linesSize = lines.size()
	while(_i < linesSize):
		var lineA = lines[_i]
		var line: String = lineA.strip_edges()
		
		# Empty line
		if(line == ""):
			_i += 1
			continue
		
		if(line.begins_with("sceneID=")):
			sceneID = line.substr(8).strip_edges()
			_i += 1
			continue
		
		# Comments
		if(line.begins_with("((")):
			addToRun("# "+ line)
			_i += 1
			continue
		
		# Code
		if(line.begins_with("! ")):
			var condition = line.substr(2)
			addToRun(condition)
			_i += 1
			continue
		
		# IFs
		if(line.begins_with("? ")):
			var condition = line.substr(2)
			addToRun('if ('+condition+'):')
			tabAmount += 1
			_i += 1
			continue
		if(line.begins_with("?else")):
			tabAmount -= 1
			addToRun('else:')
			tabAmount += 1
			_i += 1
			continue
		if(line.begins_with("?elif ")):
			var condition = line.substr(6)
			tabAmount -= 1
			addToRun('elif ('+condition+'):')
			tabAmount += 1
			_i += 1
			continue
		if(line.begins_with("?!") || line.begins_with("?end")):
			tabAmount -= 1
			#addToRun('')
			_i += 1
			continue
			
		if(line.begins_with("%var ")):
			var varStuff = line.substr(5)
			var splitted = varStuff.split(" ")
			var variableName = splitted[0]
			splitted.remove(0)
			var vairableValue = Util.join(splitted, " ")
			
			trackedVariables[variableName] = {
				value = vairableValue,
			}
			_i += 1
			continue
			
		if(line.begins_with("%assoc ")):
			var varStuff = line.substr(7)
			var splitted = varStuff.split(" ")
			var variableName = splitted[0]
			splitted.remove(0)
			var vairableValue = Util.join(splitted, " ")
			
			npcAssocs[variableName] = vairableValue
			_i += 1
			continue
		
		# Npcs saying things
		if(line.begins_with("=")):
			var content = line.substr(1)
			var splittedContent = content.split(":")
			
			var charID = splittedContent[0].strip_edges()
			splittedContent.remove(0)
			var whatSaid = Util.join(splittedContent, ":").strip_edges()
			
			whatSaid = whatSaid.replace("{{rahiMaster}}", '"+str(getFlag("RahiModule.rahiPCName", GM.pc.getName()))+"')
			whatSaid = whatSaid.replace("{{", '"+str(')
			whatSaid = whatSaid.replace("}}", ')+"')
			
			addToRun('saynn("[say='+charID+']'+whatSaid+'[/say]")\n')
			_i += 1
			continue
		
		# Code blocks
		if(line.begins_with("[[[")):
			var stuff = line.substr(3).strip_edges()
			
			var splittedStuff = stuff.split(",")
			
			var commandID = splittedStuff[0].strip_edges()
			splittedStuff.remove(0)
			
			var theCode = []
			_i += 1
			while(true):
				var reactlineA = lines[_i]
				var reactline: String = reactlineA#.strip_edges()
				
				if(reactline == "]]]"):
					_i += 1
					break
					
				theCode.append(reactline)
				_i += 1
			
			if(commandID in ["reactSceneEnd", "onSceneEnd"] && splittedStuff.size() > 0):
				var theSceneId = splittedStuff[0].strip_edges()
				sceneReacts[theSceneId] = theCode
			if(commandID in ["initScene"]):
				initSceneLines = theCode
			if(commandID in ["reactInit"]):
				reactInitLines = theCode
			if(commandID in ["code"]):
				functions.append_array(theCode)
				functions.append("")
			if(commandID in ["devCom", "developerCommentary"]):
				devCommentary = theCode
			
			continue
		
		# actions
		elif(line.begins_with("[[")):
			var stuff = line.substr(2).strip_edges()
			if(stuff.ends_with("]]")):
				var splittedStuff = stuff.trim_suffix("]]").split(",")
				
				var theid = splittedStuff[splittedStuff.size()-1].strip_edges()
				var thename = splittedStuff[0].strip_edges()
				splittedStuff.remove(0)
				splittedStuff.remove(splittedStuff.size()-1)
				var thedesc = Util.join(splittedStuff, ",").strip_edges()
				addToRun('addButton("'+thename+'", "'+thedesc+'", "'+theid+'")')
				_i += 1
				continue
			else:
				var splittedStuff = stuff.split(",")
				
				var theid = splittedStuff[splittedStuff.size()-1].strip_edges()
				var thename = splittedStuff[0].strip_edges()
				splittedStuff.remove(0)
				splittedStuff.remove(splittedStuff.size()-1)
				var thedesc = Util.join(splittedStuff, ",").strip_edges()
				_i += 1
				
				var nextLineB = lines[_i]
				if(nextLineB.begins_with("[") && nextLineB.ends_with("]")):
					addToRun('addButtonWithChecks("'+thename+'", "'+thedesc+'", "'+theid+'", [], '+nextLineB+')')
					_i += 1
				else:
					addToRun('addButton("'+thename+'", "'+thedesc+'", "'+theid+'")')
				
				reacts[theid] = []
				while(true):
					var reactlineA = lines[_i]
					var reactline: String = reactlineA#.strip_edges()
					
					if(reactline == "]]"):
						_i += 1
						break
						
					reacts[theid].append(reactline)
					_i += 1
				continue
					
				
		
		# new states
		if(line.begins_with(">")):
			var stuff = line.substr(1).strip_edges()
			var splittedStuff = stuff.split(",")
			var newid = ""
			if(splittedStuff.size() > 1):
				newid = splittedStuff[splittedStuff.size() - 1].strip_edges()
			else:
				newid = splittedStuff[0].strip_edges()
				
			# Check if we used such id already?
			setCurrentRun(newid)
			tabAmount = 0
			_i += 1
			continue
		
		line = line.replace("{{", '"+str(')
		line = line.replace("}}", ')+"')
		addToRun('saynn("'+line+'")\n')
		_i += 1
	
	
	result.append("extends SceneBase")
	result.append("")
	
	if(!trackedVariables.empty()):
		for variableName in trackedVariables:
			var varData = trackedVariables[variableName]
			result.append("var "+str(variableName)+" = "+str(varData["value"]))
		result.append("")
	
	result.append("func _init():")
	result.append('\tsceneID = "'+sceneID+'"')
	result.append("")
	
	if(initSceneLines.size() > 0):
		result.append("func _initScene(_args = []):")
		for theLine in initSceneLines:
			result.append('\t'+theLine)
		result.append("")
	
	if(reactInitLines.size() > 0):
		result.append("func _reactInit():")
		for theLine in reactInitLines:
			result.append('\t'+theLine)
		result.append("")
	
	if(!npcAssocs.empty()):
		result.append("func resolveCustomCharacterName(_charID):")
		for charID in npcAssocs:
			var resultedCharID = npcAssocs[charID]
			
			result.append("\tif(_charID == \""+charID+"\"):")
			result.append("\t\treturn "+str(resultedCharID))
		result.append("")
	
	result.append("func _run():")
	for runID in runs:
		if(runs[runID].size() > 0):
			result.append('\tif(state == "'+runID+'"):')
			
			#var toAdd = []
			result.append(Util.join(runs[runID], "\n"))
	
	if(!functions.empty()):
		result.append_array(functions)
	result.append("")
	
	result.append("func _react(_action: String, _args):")
	result.append('\tif(_action == "endthescene"):')
	result.append('\t\tendScene()')
	result.append('\t\treturn')
	result.append("")
	
	for reactID in reacts:
		if(reacts[reactID].size() > 0):
			result.append('\tif(_action == "'+reactID+'"):')
			
			for reactLine in reacts[reactID]:
				result.append('\t\t'+reactLine)
			result.append('')
	
	result.append("\tsetState(_action)")
	result.append("")
	
	if(!sceneReacts.empty()):
		result.append("func _react_scene_end(_tag, _result):")
		for sceneTag in sceneReacts:
			result.append('\tif(_tag == "'+str(sceneTag)+'"):')
				
			for reactLine in sceneReacts[sceneTag]:
				result.append('\t\t'+reactLine)
			result.append("")
		#result.append("")
	
	if(!trackedVariables.empty()):
		result.append("func saveData():")
		result.append("\tvar data = .saveData()")
		result.append("")
		
		for variableName in trackedVariables:
			#var varData = trackedVariables[variableName]
			result.append("\tdata[\""+str(variableName)+"\"] = "+str(variableName))
		result.append("")
		result.append("\treturn data")
		
		result.append("")
		result.append("func loadData(data):")
		result.append("\t.loadData(data)")
		result.append("")
		
		for variableName in trackedVariables:
			var varData = trackedVariables[variableName]
			result.append("\t"+str(variableName)+" = SAVE.loadVar(data, \""+str(variableName)+"\", "+str(varData["value"])+")")
		result.append("")
	
	if(devCommentary != null && devCommentary.size() > 0):
		result.append("func getDevCommentary():")
		result.append("\treturn \""+Util.join(devCommentary, "\\n")+"\"")
		result.append("")
		result.append("func hasDevCommentary():")
		result.append("\treturn true")
		result.append("")
	
	outputTextEdit.text = Util.join(result, "\n")


func _on_TestButton_pressed():
	if(testingScene):
		return
	
	var newScript:GDScript = GDScript.new()
	newScript.source_code = outputTextEdit.text
	var _error = newScript.reload()
	if(_error != OK):
		$ErrorDialog.dialog_text = "There is an error in your scene's code somewhere"
		$ErrorDialog.show()
		return
		
	var newSceneID = GlobalRegistry.registerTemporaryScene(newScript)
	if(newSceneID == null):
		$ErrorDialog.dialog_text = "Unable to register test scene\nDoes scene inherit SceneBase?"
		$ErrorDialog.show()
		return
	
	$StopTestingButton.visible = true
	$GameSpotControl.visible = true
	$VBoxContainer.visible = false
	testingScene = true
	theGame = preload("res://Game/MainScene.tscn").instance()
	$GameSpotControl.add_child(theGame)
	theGame.setIsTestingScene(true)
	if(pickedSavePath != null):
		SAVE.loadGame(pickedSavePath)
	theGame.clearSceneStack()
	theGame.runScene(newSceneID)
	theGame.runCurrentScene()


func _on_StopTestingButton_pressed():
	if(!testingScene):
		return
	
	
	$StopTestingButton.visible = false
	$GameSpotControl.visible = false
	if(theGame):
		theGame.queue_free()
		theGame = null
	
	GlobalRegistry.clearTemporaryScenes()
	
	$VBoxContainer.visible = true
	testingScene = false

func updateSaves():
	Util.delete_children(savesContainer)
	
	var savesPaths = SAVE.getSavesSortedByDate()
	
	for savePath in savesPaths:
		var saveGameElementObject = saveGameElemenetScene.instance()
		savesContainer.add_child(saveGameElementObject)
		saveGameElementObject.setSaveFile(savePath)
		saveGameElementObject.connect("onLoadButtonPressed", self, "onSaveLoadButtonClicked")
		saveGameElementObject.setDeleteMode(false)
		saveGameElementObject.setPickMode()

func onSaveLoadButtonClicked(savePath):
	pickedSavePath = savePath
	$SavesMenu.visible = false
	$VBoxContainer.visible = true
	$VBoxContainer/HBoxContainer/PickSaveButton.text = pickedSavePath.get_file()


func _on_PickSaveButton_pressed():
	$SavesMenu.visible = true
	$VBoxContainer.visible = false
	updateSaves()


func _on_SavesBackButton_pressed():
	$SavesMenu.visible = false
	$VBoxContainer.visible = true
