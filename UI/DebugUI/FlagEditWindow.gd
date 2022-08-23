extends WindowDialog

var moduleID
var flagID
var savedFlagType

signal clearFlag(moduleID, flagID)
signal setFlagValue(moduleID, flagID, value)

onready var checkbox = $VBoxContainer/ScrollContainer/VBoxContainer/VBoxContainer/CheckBox
onready var spinbox = $VBoxContainer/ScrollContainer/VBoxContainer/VBoxContainer/SpinBox
onready var lineedit = $VBoxContainer/ScrollContainer/VBoxContainer/VBoxContainer/LineEdit

func setFlag(newmoduleID, newflagID):
	moduleID = newmoduleID
	flagID = newflagID
	
	checkbox.visible = false
	spinbox.visible = false
	lineedit.visible = false
	
	var flagType = null
	var flagValue = null
	savedFlagType = null
	if(moduleID == null || moduleID == ""):
		if(GM.main.flagsCache.has(flagID)):
			var flagData = GM.main.flagsCache[flagID]
			flagType = flagData["type"]
			flagValue = GM.main.getFlag(flagID)
			
			$VBoxContainer/ScrollContainer/VBoxContainer/FlagLabel.text = str(flagID)+" ("+FlagType.getVisibleName(flagType)+")"
			
	else:
		var modules = GlobalRegistry.getModules()
		if(modules.has(moduleID)):
			var module:Module = modules[moduleID]
			
			var cashedFlags = module.getFlagsCache()
			if(cashedFlags.has(flagID)):
				var flagData = cashedFlags[flagID]
				flagType = flagData["type"]
				flagValue = GM.main.getModuleFlag(newmoduleID, flagID)
				
				$VBoxContainer/ScrollContainer/VBoxContainer/FlagLabel.text = str(flagID)+" ("+FlagType.getVisibleName(flagType)+")"

	$VBoxContainer/ScrollContainer/VBoxContainer/CurrentValueLabel.text = "Current value: "+str(flagValue)
	savedFlagType = flagType
	
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


func _on_CancelButton_pressed():
	visible = false

func _on_ClearFlag_pressed():
	emit_signal("clearFlag", moduleID, flagID)
	visible = false

func _on_ChangeFlagButton_pressed():
	if(savedFlagType == FlagType.Bool):
		emit_signal("setFlagValue", moduleID, flagID, checkbox.pressed)
	if(savedFlagType == FlagType.Text):
		emit_signal("setFlagValue", moduleID, flagID, lineedit.text)
	if(savedFlagType == FlagType.Number):
		emit_signal("setFlagValue", moduleID, flagID, spinbox.value)
	visible = false
