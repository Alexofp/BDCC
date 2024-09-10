extends Control

onready var anim_list = $VBoxContainer/HBoxContainer/AnimList
onready var camera3d = $VBoxContainer/HBoxContainer/PanelContainer/Viewport/Camera
onready var anim_settings_list = $VBoxContainer/HBoxContainer/SettingsWrapperContainer/ScrollContainer/AnimSettingsList

var animPickerSelectorScene = preload("res://Game/Datapacks/UI/CrotchCode/UI/AnimPickerSelectorVar.tscn")

var allPossibleChars = []
var allAnims = []

var charAliases = {}

var selectedAnim = ""
var animData = {
	state = {
		value = "tease",
		isVar = false,
		varName = "",
	},
	data = {},
}
var valuesForID = {}

var vars = []

var animStage:BaseStageScene3D

signal onCancelPressed
signal onAnimSelected(animID, animData)

onready var stage_3d = $VBoxContainer/HBoxContainer/PanelContainer/Viewport/Stage3D
var draggingCamera: bool = false
var previousPosition: Vector2 = Vector2(0, 0)
var startMousePosition: Vector2 = Vector2(0, 0)

var requestedChars = {}
var loadedChars = {}

func updateLoadedChars():
	for loadedID in loadedChars.keys():
		if(!requestedChars.has(loadedID)):
			loadedChars[loadedID].queue_free()
			loadedChars.erase(loadedID)
	
	for requestID in requestedChars:
		if(!loadedChars.has(requestID)):
			var actualID = requestID
			if(charAliases.has(actualID)):
				actualID = charAliases[actualID]
			var theirID = actualID
			if(actualID == "pc"):
				actualID = "TestPC"
			var newChar = GlobalRegistry.createCharacter(actualID)
			add_child(newChar)
			newChar.id = theirID
			loadedChars[requestID] = newChar

func updateAnimSettings():
	Util.delete_children(anim_settings_list)
	
	if(animStage == null):
		return
	
	var stateVar = animPickerSelectorScene.instance()
	anim_settings_list.add_child(stateVar)
	stateVar.setData({
		name = "State",
		value = animData["state"]["value"],
		values = animStage.getSupportedStates(),
		isVar = animData["state"]["isVar"],
		vars = vars,
		varName = animData["state"]["varName"],
	})
	stateVar.connect("onDataChanged", self, "onStateDataChanged")
	
	if(animData.has("data")):
		for entryID in animData["data"]:
			var theEntry = animData["data"][entryID]
			
			var newVarEntry = animPickerSelectorScene.instance()
			anim_settings_list.add_child(newVarEntry)
			newVarEntry.id = entryID
			newVarEntry.setData({
				name = entryID,
				value = theEntry["value"],
				values = valuesForID[entryID],
				isVar = theEntry["isVar"],
				vars = vars,
				varName = theEntry["varName"],
			})
			newVarEntry.connect("onDataChanged", self, "onAnimDataChanged")
	#var varSettings = theScene.getVarOptions()

#func _init():
	#if(GlobalRegistry.stageScenes.size() <= 0):
	#	GlobalRegistry.registerStageSceneFolder("res://Player/StageScene3D/Scenes2/")
	#	GlobalRegistry.registerStageSceneFolder("res://Player/StageScene3D/Scenes/")

func onAnimDataChanged(_id, _newData):
	animData["data"][_id] = _newData
	playAnim()

func onStateDataChanged(_id, newData):
	animData["state"] = newData
	playAnim()

func _ready():
#	allPossibleChars = ["pc"]
#	for otherdatapackID in GlobalRegistry.getDatapacks():
#		var otherdatapack:Datapack = GlobalRegistry.getDatapack(otherdatapackID)
#		for charID in otherdatapack.characters:
#			var finalCharID = otherdatapack.getFinalCharacterID(charID)
#			allPossibleChars.append(finalCharID)
#	for charID in GlobalRegistry.getCharacterClasses():
#		allPossibleChars.append(charID)
	
	var theAnims = GlobalRegistry.getStageScenesClasses()
	
	for animID in theAnims:
		anim_list.add_item(animID)
		allAnims.append(animID)

func resetAnimData():
	valuesForID = {}
	animData = {
		state = {
			value = GlobalRegistry.getStageScenesCachedStates()[selectedAnim][0],
			isVar = false,
			varName = "",
		},
		data = {},
	}
	var extraData = {}
	var theOptions = animStage.getVarOptions()
	for optionEntryID in theOptions:
		var optionEntry = theOptions[optionEntryID]
		var optionType = optionEntry["type"]
		
		if(optionType == "character"):
			extraData[optionEntryID] = {
				value = "pc",
				isVar = false,
				varName = "",
			}
			valuesForID[optionEntryID] = allPossibleChars
		if(optionType == "bool"):
			extraData[optionEntryID] = {
				value = false,
				isVar = false,
				varName = "",
			}
			valuesForID[optionEntryID] = [false, true]
		if(optionType == "action"):
			extraData[optionEntryID] = {
				value = optionEntry["actions"][0],
				isVar = false,
				varName = "",
			}
			valuesForID[optionEntryID] = optionEntry["actions"]
		if(optionType == "bodystate"):
			extraData[optionEntryID+".naked"] = {
				value = false,
				isVar = false,
				varName = "",
			}
			valuesForID[optionEntryID+".naked"] = [false, true]
			extraData[optionEntryID+".exposedChest"] = {
				value = false,
				isVar = false,
				varName = "",
			}
			valuesForID[optionEntryID+".exposedChest"] = [false, true]
			extraData[optionEntryID+".exposedCrotch"] = {
				value = false,
				isVar = false,
				varName = "",
			}
			valuesForID[optionEntryID+".exposedCrotch"] = [false, true]
			extraData[optionEntryID+".hard"] = {
				value = false,
				isVar = false,
				varName = "",
			}
			valuesForID[optionEntryID+".hard"] = [false, true]
			extraData[optionEntryID+".underwear"] = {
				value = false,
				isVar = false,
				varName = "",
			}
			valuesForID[optionEntryID+".underwear"] = [false, true]
			extraData[optionEntryID+".condom"] = {
				value = false,
				isVar = false,
				varName = "",
			}
			valuesForID[optionEntryID+".condom"] = [false, true]
			extraData[optionEntryID+".caged"] = {
				value = false,
				isVar = false,
				varName = "",
			}
			valuesForID[optionEntryID+".caged"] = [false, true]
			extraData[optionEntryID+".leashedBy"] = {
				value = "",
				isVar = false,
				varName = "",
			}
			valuesForID[optionEntryID+".leashedBy"] = [""] + allPossibleChars
	animData["data"] = extraData

func _on_AnimList_item_selected(index):
	if(index < 0 || index >= allAnims.size()):
		return
	setSelectedAnim(allAnims[index])
	
func setSelectedAnim(newA, andData = null):
	selectedAnim = newA
	
	var _i = 0
	for animName in allAnims:
		if(animName == selectedAnim):
			anim_list.select(_i)
		_i += 1
	
	if(animStage != null):
		animStage.queue_free()
		animStage = null
	animStage = GlobalRegistry.createStageScene(selectedAnim)
	if(animStage == null):
		selectedAnim = StageScene.Solo
		andData = null
		animStage = GlobalRegistry.createStageScene(selectedAnim)
	
	if(andData != null):
		resetAnimData()
		var newAnimData = andData.duplicate(true)
		for newAID in newAnimData:
			if(!animData.has(newAID)):
				continue
			animData[newAID] = newAnimData[newAID]
	else:
		resetAnimData()
	updateAnimSettings()
	
	playAnim()
	

func playAnim():
	#requestedChars = {}
	var newRequested = {}
	#updateLoadedChars()
	
	var finalAnimData = {}
	if(animData.has("data")):
		for entryID in animData["data"]:
			var theEntry = animData["data"][entryID]
			
			if("." in entryID):
				var splitData = Util.splitOnFirst(entryID, ".")
				var firstThing = splitData[0]
				var secondThing = splitData[1]
				if(!finalAnimData.has(firstThing)):
					finalAnimData[firstThing] = {}
				
				if(secondThing in ["leashedBy"]):
					var theCharID = theEntry["value"]
					if(charAliases.has(theCharID)):
						theCharID = charAliases[theCharID]
					finalAnimData[firstThing][secondThing] = theCharID
				else:
					finalAnimData[firstThing][secondThing] = theEntry["value"]
			else:
				if(entryID in ["pc", "npc", "npc2", "npc3", "npc4"]):
					var theCharID = theEntry["value"]
					
					
					requestedChars[theCharID] = true
					newRequested[theCharID] = true
					updateLoadedChars()
					finalAnimData[entryID] = loadedChars[theCharID]
				else:
					finalAnimData[entryID] = theEntry["value"]
	
	requestedChars = newRequested
	updateLoadedChars()
	
	stage_3d.play(selectedAnim, animData["state"]["value"], finalAnimData)

func a_gui_input(event: InputEvent):
	if event is InputEventMouseButton && event.button_index == BUTTON_MIDDLE:
		camera3d.size = 10
		camera3d.transform.origin = Vector3(0.0,4.141,50.0)
	
	if event is InputEventMouseButton:
		if(event.button_index == BUTTON_WHEEL_UP):
			camera3d.size *= 0.9
		if(event.button_index == BUTTON_WHEEL_DOWN):
			camera3d.size *= 1.1
	
	if event is InputEventMouseButton:
		if event.pressed:
			draggingCamera = true
			startMousePosition = event.position
			previousPosition = event.position
		else:
			draggingCamera = false
	elif draggingCamera and event is InputEventMouseMotion:
		var delta = previousPosition - event.position
		camera3d.translate(Vector3(delta.x * camera3d.size / 500.0, -delta.y * camera3d.size / 500.0, 0.0))
		previousPosition = event.position

func _on_PanelContainer_gui_input(event):
	a_gui_input(event)


func _on_CancelButton_pressed():
	emit_signal("onCancelPressed")

func _on_ConfirmButton_pressed():
	emit_signal("onAnimSelected", selectedAnim, animData.duplicate(true))
