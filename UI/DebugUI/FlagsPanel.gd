extends Control

var flagPanelEntryScene = preload("res://UI/DebugUI/FlagPanelEntry.tscn")
var flagPanelDividerScene = preload("res://UI/DebugUI/FlagPanelDivider.tscn")

func updateFlags():
	Util.delete_children($ScrollContainer/VBoxContainer/VBoxContainer)
	
	if(GM.main == null):
		return
		
	addDivider("GLOBAL FLAGS")
	var flags = GM.main.flags
	for flagID in flags:
		var newflagpanelentry = flagPanelEntryScene.instance()
		$ScrollContainer/VBoxContainer/VBoxContainer.add_child(newflagpanelentry)
		newflagpanelentry.setNameAndValue(flagID, flags[flagID])

	var modflags = GM.main.moduleFlags
	for moduleID in modflags:
		addDivider(str(moduleID)+" MODULE FLAGS")
		var moduleFlags = modflags[moduleID]
		for flagID in moduleFlags:
			var newflagpanelentry = flagPanelEntryScene.instance()
			$ScrollContainer/VBoxContainer/VBoxContainer.add_child(newflagpanelentry)
			newflagpanelentry.setNameAndValue(flagID, moduleFlags[flagID])

func addDivider(text):
	var flagPanelDividerObject = flagPanelDividerScene.instance()
	$ScrollContainer/VBoxContainer/VBoxContainer.add_child(flagPanelDividerObject)
	flagPanelDividerObject.setText(text)


func _on_Button_pressed():
	updateFlags()


func _on_FlagsPanel_visibility_changed():
	if(visible):
		updateFlags()
