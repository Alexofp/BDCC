extends Control

var flagPanelEntryScene = preload("res://UI/DebugUI/FlagPanelEntry.tscn")
var flagPanelDividerScene = preload("res://UI/DebugUI/FlagPanelDivider.tscn")
onready var flagEditWindow = $FlagEditWindow
onready var filterEdit = $ScrollContainer/VBoxContainer/HBoxContainer/LineEdit
var flagMissionCompletedScene = preload("res://UI/DebugUI/FlagMissionCompletedEntry.tscn")
var flagMissionDecisionScene = preload("res://UI/DebugUI/FlagMissionDecisionEntry.tscn")

export var addGameFlags := true
export var addDatapackFlags := false
export var addMissionFlags := false

func updateFlags():
	var filterText = filterEdit.text.to_lower()
	Util.delete_children($ScrollContainer/VBoxContainer/VBoxContainer)
	
	if(GM.main == null):
		return
	
	if(addGameFlags):
		addDivider("GLOBAL FLAGS")
		var flags = GM.main.flagsCache
		for flagID in flags:
			if(filterText != "" && !(filterText in flagID.to_lower())):
				continue
			
			var flagData = flags[flagID]
			var flagType = flagData["type"]
			var flagValue = GM.main.getFlag(flagID)
			
			var newflagpanelentry = flagPanelEntryScene.instance()
			$ScrollContainer/VBoxContainer/VBoxContainer.add_child(newflagpanelentry)
			newflagpanelentry.setNameAndValue(flagID+" ("+str(FlagType.getVisibleName(flagType))+")", flagValue)
			newflagpanelentry.flagKind = FlagType.Kind.GameFlag
			newflagpanelentry.flagID = flagID
			newflagpanelentry.flagValue = flagValue
			newflagpanelentry.flagType = flagType
			var _ok = newflagpanelentry.connect("changeFlagButton", self, "onFlagChangeButton")

		var modules = GlobalRegistry.getModules()
		for moduleID in modules:
			var module:Module = modules[moduleID]
			
			var modflags = module.getFlagsCache() 
			if(modflags.empty()):
				continue
			addDivider(str(moduleID)+" MODULE FLAGS")
			
			
			for flagID in modflags:
				if(filterText != "" && !(filterText in flagID.to_lower())):
					continue
				
				var flagData = modflags[flagID]
				var flagType = flagData["type"]
				var flagValue = GM.main.getModuleFlag(moduleID, flagID)
				
				var newflagpanelentry = flagPanelEntryScene.instance()
				$ScrollContainer/VBoxContainer/VBoxContainer.add_child(newflagpanelentry)
				newflagpanelentry.setNameAndValue(flagID+" ("+str(FlagType.getVisibleName(flagType))+")", flagValue)
				newflagpanelentry.flagKind = FlagType.Kind.GameFlag
				newflagpanelentry.flagID = flagID
				newflagpanelentry.flagValue = flagValue
				newflagpanelentry.moduleID = moduleID
				newflagpanelentry.flagType = flagType
				var _ok = newflagpanelentry.connect("changeFlagButton", self, "onFlagChangeButton")
	
	if(addDatapackFlags):
		var loadedDatapacks = GM.main.loadedDatapacks
		for datapackID in loadedDatapacks:
			var datapack = GlobalRegistry.getDatapack(datapackID)
			if(datapack == null || datapack.flags.empty()):
				continue
			addDivider(str(datapackID)+" DATAPACK FLAGS")
	
			for flagID in datapack.flags:
				if(filterText != "" && !(filterText in flagID.to_lower())):
					continue
				
				var flagData = datapack.flags[flagID]
				var flagType = flagData["type"]
				var flagValue = GM.main.getDatapackFlag(datapackID, flagID)
				
				var newflagpanelentry = flagPanelEntryScene.instance()
				$ScrollContainer/VBoxContainer/VBoxContainer.add_child(newflagpanelentry)
				newflagpanelentry.setNameAndValue(flagID+" ("+str(DatapackSceneVarType.getName(flagType))+")", flagValue)
				newflagpanelentry.flagKind = FlagType.Kind.DatapackFlag
				newflagpanelentry.flagID = flagID
				newflagpanelentry.flagValue = flagValue
				newflagpanelentry.moduleID = datapackID
				newflagpanelentry.flagType = DatapackSceneVarType.toFlagType(flagType)
				var _ok = newflagpanelentry.connect("changeFlagButton", self, "onFlagChangeButton")
	
	if(addMissionFlags):
		for theMissionID in GlobalRegistry.getMissions():
			var theMission:MissionBase = GlobalRegistry.getMission(theMissionID)
			addDivider(str(theMissionID)+" - "+str(theMission.getName()))
			
			var newCheckbox = flagMissionCompletedScene.instance()
			$ScrollContainer/VBoxContainer/VBoxContainer.add_child(newCheckbox)
			newCheckbox.setMission(theMissionID, GM.main.MS.isCompleted(theMissionID))
			newCheckbox.connect("onCheckboxChanged", self, "onFlagMissionCompletedChanged")
			
#	decisions = {
#		"helped": {
#			name = "Helped Kait",
#			outcomes = {
#				"avy": {
#					text = "No",
#					effects = [
#						DECISION_EFFECT_AVY_LOVE,
#					],
#					kaitLine = "I asked Avy not to help me.. but she still could have done something!",
#					avyLine = "It was pretty fun to see that softie get wrecked.",
#				},
			
			var theFlags:Dictionary = theMission.getFlags()
			var theDecisions:Dictionary = theMission.decisions
			for flagID in theFlags:
				if(filterText != "" && !(filterText in flagID.to_lower())):
					continue
				
				var theFlagEntry:Dictionary = theFlags[flagID]
				var flagType:int = theFlagEntry["type"]
				var flagValue = GM.main.MS.getSpecificFlag(theMissionID, flagID, null)
				
				if(!theDecisions.has(flagID)):
					var newflagpanelentry = flagPanelEntryScene.instance()
					$ScrollContainer/VBoxContainer/VBoxContainer.add_child(newflagpanelentry)
					newflagpanelentry.setNameAndValue(flagID+" ("+str(FlagType.getVisibleName(flagType))+")", flagValue)
					newflagpanelentry.flagKind = FlagType.Kind.MissionFlag
					newflagpanelentry.flagID = flagID
					newflagpanelentry.flagValue = flagValue
					newflagpanelentry.moduleID = theMissionID
					newflagpanelentry.flagType = flagType
					var _ok = newflagpanelentry.connect("changeFlagButton", self, "onFlagChangeButton")
				else:
					var newMissionDecisionEntry = flagMissionDecisionScene.instance()
					$ScrollContainer/VBoxContainer/VBoxContainer.add_child(newMissionDecisionEntry)
					newMissionDecisionEntry.setDecision(theMissionID, flagID, theDecisions[flagID], flagValue)
					var _ok = newMissionDecisionEntry.connect("onDecisionSelect", self, "onDecisionChange")

func onDecisionChange(_missionID:String, _decisionID:String, _value):
	GM.main.MS.setDecisionSpecific(_missionID, _decisionID, _value)
	Log.print("Setting mission decision "+str(_decisionID)+" in mission "+str(_missionID)+" to "+str(_value))

func onFlagMissionCompletedChanged(_missionID:String, _completed:bool):
	GM.main.MS.setMissionCompleteStatus(_missionID, _completed)
	if(_completed):
		Log.print("Marking mission "+str(_missionID)+" as completed")
	else:
		Log.print("Marking mission "+str(_missionID)+" as not completed")
	
func addDivider(text):
	var flagPanelDividerObject = flagPanelDividerScene.instance()
	$ScrollContainer/VBoxContainer/VBoxContainer.add_child(flagPanelDividerObject)
	flagPanelDividerObject.setText(text)


func _on_Button_pressed():
	updateFlags()


func _on_FlagsPanel_visibility_changed():
	if(visible):
		updateFlags()

func onFlagChangeButton(flagKind, moduleID, flagID, flagType, flagValue):
	flagEditWindow.setFlag(flagKind, moduleID, flagID, flagType, flagValue)
	flagEditWindow.popup_centered()

func _on_FlagEditWindow_clearFlag(flagKind, moduleID, flagID):
	if(flagKind == FlagType.Kind.GameFlag):
		if(moduleID == null || moduleID == ""):
			GM.main.clearFlag(flagID)
			Log.print("Cleared flag "+str(flagID))
		else:
			GM.main.clearModuleFlag(moduleID, flagID)
			Log.print("Cleared flag "+str(flagID)+" in module "+str(moduleID))
	elif(flagKind == FlagType.Kind.DatapackFlag):
		GM.main.clearDatapackFlag(moduleID, flagID)
		Log.print("Cleared flag "+str(flagID)+" in datapack "+str(moduleID))
	elif(flagKind == FlagType.Kind.MissionFlag):
		GM.main.MS.setSpecificFlag(moduleID, flagID, null)
		Log.print("Cleared flag "+str(flagID)+" in mission "+str(moduleID))

	updateFlags()

func _on_FlagEditWindow_setFlagValue(flagKind, moduleID, flagID, value):
	if(flagKind == FlagType.Kind.GameFlag):
		if(moduleID == null || moduleID == ""):
			GM.main.setFlag(flagID, value)
			Log.print("Setting flag "+str(flagID)+" to "+str(value))
		else:
			GM.main.setModuleFlag(moduleID, flagID, value)
			Log.print("Setting flag "+str(flagID)+" in module "+str(moduleID)+" to "+str(value))
	elif(flagKind == FlagType.Kind.DatapackFlag):
		GM.main.setDatapackFlag(moduleID, flagID, value)
		Log.print("Setting datapack flag "+str(flagID)+" in datapack "+str(moduleID)+" to "+str(value))
	elif(flagKind == FlagType.Kind.MissionFlag):
		GM.main.MS.setSpecificFlag(moduleID, flagID, value)
		Log.print("Setting mission flag "+str(flagID)+" in mission "+str(moduleID)+" to "+str(value))
	
	updateFlags()


func _on_LineEdit_text_entered(_new_text):
	updateFlags()

