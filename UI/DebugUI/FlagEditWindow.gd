extends WindowDialog

var moduleID
var flagID
var savedFlagType
var flagKind:int = FlagType.Kind.GameFlag

signal clearFlag(flagKind, moduleID, flagID)
signal setFlagValue(flagKind, moduleID, flagID, value)

onready var checkbox = $VBoxContainer/ScrollContainer/VBoxContainer/VBoxContainer/CheckBox
onready var spinbox = $VBoxContainer/ScrollContainer/VBoxContainer/VBoxContainer/SpinBox
onready var lineedit = $VBoxContainer/ScrollContainer/VBoxContainer/VBoxContainer/LineEdit

func setDatpackFlag(newdatpackid, newflagID, flagType, flagValue):
	setFlag(FlagType.Kind.DatapackFlag, newdatpackid, newflagID, DatapackSceneVarType.toFlagType(flagType), flagValue)

#	datapackID = newdatpackid
#	moduleID = null
#	flagID = newflagID
#
#	checkbox.visible = false
#	spinbox.visible = false
#	lineedit.visible = false
#
#	var flagType = null
#	var flagValue = null
#	savedFlagType = null
#	var datapacks = GlobalRegistry.getDatapacks()
#	if(datapacks.has(datapackID)):
#		var datapack:Datapack = datapacks[datapackID]
#
#		var cashedFlags = datapack.flags
#		if(cashedFlags.has(flagID)):
#			var flagData = cashedFlags[flagID]
#			flagType = flagData["type"]
#			flagValue = GM.main.getDatapackFlag(datapackID, flagID)
#
#			$VBoxContainer/ScrollContainer/VBoxContainer/FlagLabel.text = str(flagID)+" ("+DatapackSceneVarType.getName(flagType)+")"
#
#	$VBoxContainer/ScrollContainer/VBoxContainer/CurrentValueLabel.text = "Current value: "+str(flagValue)
#	savedFlagType = flagType
#
#	if(flagType == DatapackSceneVarType.BOOL):
#		checkbox.visible = true
#
#		if(flagValue != null):
#			checkbox.pressed = !!flagValue
#		else:
#			checkbox.pressed = false
#
#	if(flagType == DatapackSceneVarType.NUMBER):
#		spinbox.visible = true
#
#		if(flagValue != null):
#			spinbox.value = flagValue
#		else:
#			spinbox.value = 0
#
#	if(flagType == DatapackSceneVarType.STRING):
#		lineedit.visible = true
#
#		if(flagValue != null):
#			lineedit.text = str(flagValue)
#		else:
#			lineedit.text = ""

func setFlag(_kind:int, newmoduleID, newflagID, flagType, flagValue):
	moduleID = newmoduleID
	flagID = newflagID
	flagKind = _kind
	savedFlagType = flagType
	
	checkbox.visible = false
	spinbox.visible = false
	lineedit.visible = false
	
	$VBoxContainer/ScrollContainer/VBoxContainer/FlagLabel.text = str(flagID)+" ("+FlagType.getVisibleName(flagType)+")"
	$VBoxContainer/ScrollContainer/VBoxContainer/CurrentValueLabel.text = "Current value: "+str(flagValue)
	
	if(flagType == FlagType.Bool):
		checkbox.visible = true
		
		if(flagValue != null):
			checkbox.pressed = !!flagValue
		else:
			checkbox.pressed = false
		
	if(flagType == FlagType.Number):
		spinbox.visible = true
		
		if(flagValue != null):
			spinbox.value = flagValue
		else:
			spinbox.value = 0

	if(flagType == FlagType.Text):
		lineedit.visible = true
		
		if(flagValue != null):
			lineedit.text = str(flagValue)
		else:
			lineedit.text = ""
	
#func setFlag_OLD(newmoduleID, newflagID):
#	datapackID = null
#	moduleID = newmoduleID
#	flagID = newflagID
#
#	checkbox.visible = false
#	spinbox.visible = false
#	lineedit.visible = false
#
#	var flagType = null
#	var flagValue = null
#	savedFlagType = null
#	if(moduleID == null || moduleID == ""):
#		if(GM.main.flagsCache.has(flagID)):
#			var flagData = GM.main.flagsCache[flagID]
#			flagType = flagData["type"]
#			flagValue = GM.main.getFlag(flagID)
#
#			$VBoxContainer/ScrollContainer/VBoxContainer/FlagLabel.text = str(flagID)+" ("+FlagType.getVisibleName(flagType)+")"
#
#	else:
#		var modules = GlobalRegistry.getModules()
#		if(modules.has(moduleID)):
#			var module:Module = modules[moduleID]
#
#			var cashedFlags = module.getFlagsCache()
#			if(cashedFlags.has(flagID)):
#				var flagData = cashedFlags[flagID]
#				flagType = flagData["type"]
#				flagValue = GM.main.getModuleFlag(newmoduleID, flagID)
#
#				$VBoxContainer/ScrollContainer/VBoxContainer/FlagLabel.text = str(flagID)+" ("+FlagType.getVisibleName(flagType)+")"
#
#	$VBoxContainer/ScrollContainer/VBoxContainer/CurrentValueLabel.text = "Current value: "+str(flagValue)
#	savedFlagType = flagType
#
#	if(flagType == FlagType.Bool):
#		checkbox.visible = true
#
#		if(flagValue != null):
#			checkbox.pressed = !!flagValue
#		else:
#			checkbox.pressed = false
#
#	if(flagType == FlagType.Number):
#		spinbox.visible = true
#
#		if(flagValue != null):
#			spinbox.value = flagValue
#		else:
#			spinbox.value = 0
#
#	if(flagType == FlagType.Text):
#		lineedit.visible = true
#
#		if(flagValue != null):
#			lineedit.text = str(flagValue)
#		else:
#			lineedit.text = ""


func _on_CancelButton_pressed():
	visible = false

func _on_ClearFlag_pressed():
	emit_signal("clearFlag", flagKind, moduleID, flagID)
	visible = false

func _on_ChangeFlagButton_pressed():
	var theValue = null
	if(savedFlagType == FlagType.Bool):
		theValue = checkbox.pressed
	if(savedFlagType == FlagType.Text):
		theValue = lineedit.text
	if(savedFlagType == FlagType.Number):
		theValue = spinbox.value
	
	
	emit_signal("setFlagValue", flagKind, moduleID, flagID, theValue)
	visible = false
