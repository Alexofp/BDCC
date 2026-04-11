extends Control

onready var triggers_item_list = $"%TriggersItemList"
onready var effect_list = $"%EffectList"
onready var trigger_name_label = $"%TriggerNameLabel"
onready var passive_h_box = $"%PassiveHBox"
onready var start_from_label = $"%StartFromLabel"
onready var start_from_h_slider = $"%StartFromHSlider"
onready var info_accept_dialog = $"%InfoAcceptDialog"
onready var export_text_edit = $"%ExportTextEdit"
onready var config_import_dialog = $"%ConfigImportDialog"
onready var import_text_edit = $"%ImportTextEdit"
onready var info_final_accept_dialog = $"%InfoFinalAcceptDialog"

var selectedTrigger:int = 0

var effectUIEntryScene = preload("res://Util/SexToySupport/UI/SexToyEffectUIEntry.tscn")

func _ready():
	updateSelectedTrigger()

func updateTriggersList():
	var theGameplay:SexToyGameplay = SexToyManager.gameplay
	triggers_item_list.clear()
	for theTriggerID in SexToyTrigger.TOTAL_AMOUNT:
		var theTriggerName:String = SexToyTrigger.getName(theTriggerID)
		if(theGameplay.triggers.has(theTriggerID)):
			var theTrigger:SexToyTriggerEntry = theGameplay.triggers[theTriggerID]
			var efAm:int = theTrigger.effects.size()
			if(efAm > 0):
				theTriggerName += " ("+str(efAm)+" effect"+("s" if efAm != 1 else "")+")"
		triggers_item_list.add_item(theTriggerName)
	triggers_item_list.select(selectedTrigger)

func _on_TriggersItemList_item_selected(_index:int):
	if(_index < 0 || _index >= SexToyTrigger.TOTAL_AMOUNT):
		return
	selectedTrigger = _index
	updateSelectedTrigger()

func updateSelectedTrigger():
	updateTriggersList()
	Util.delete_children(effect_list)
	var gameplay:SexToyGameplay = SexToyManager.gameplay
	#if(!gameplay.triggers.has(selectedTrigger)):
	#	return
	var theTriggerEntry:SexToyTriggerEntry = gameplay.getTrigger(selectedTrigger)
	if(!theTriggerEntry):
		return
	
	passive_h_box.visible = theTriggerEntry.isPassive()
	if(passive_h_box.visible):
		updateStartFromSlider()
	#inverted_passive_checkbox.set_pressed_no_signal(theTriggerEntry.inverted)
	#inverted_passive_checkbox.visible = theTriggerEntry.isPassive()
	trigger_name_label.text = SexToyTrigger.getDesc(selectedTrigger)
	
	var _i:int = 0
	for theEffect in theTriggerEntry.effects:
		var newEffectUIEntry:Control = effectUIEntryScene.instance()
		effect_list.add_child(newEffectUIEntry)
	
		newEffectUIEntry.setEntry(_i+1, theEffect)
		newEffectUIEntry.connect("onDeleteButton", self, "onDeleteEffectButton")
		_i += 1

func updateStartFromSlider():
	var theEntry := getCurrentTrigger()
	if(!theEntry):
		return
	start_from_h_slider.value = theEntry.startFrom
	start_from_label.text = "Start from "+str(Util.roundF(theEntry.startFrom*100.0, 0))+"%"

func _on_AddNewEffectButton_pressed():
	if(selectedTrigger < 0 || selectedTrigger >= SexToyTrigger.TOTAL_AMOUNT):
		return
	var gameplay:SexToyGameplay = SexToyManager.gameplay
	if(!gameplay.triggers.has(selectedTrigger)):
		var newTrigger:SexToyTriggerEntry = SexToyTriggerEntry.new()
		newTrigger.type = selectedTrigger
		gameplay.triggers[selectedTrigger] = newTrigger
	
	
	var theTriggerEntry:SexToyTriggerEntry = gameplay.triggers[selectedTrigger]
	
	var theGroupToHave:int = theTriggerEntry.effects.size()
	if(theGroupToHave >= SexToyGroup.ALL.size()):
		theGroupToHave = SexToyGroup.Main
	
	var theNewEffect := SexToyEffectEntry.new()
	theNewEffect.groups = [theGroupToHave]
	theTriggerEntry.effects.append(theNewEffect)
	
	updateSelectedTrigger()

func getCurrentTrigger() -> SexToyTriggerEntry:
	if(selectedTrigger < 0 || selectedTrigger >= SexToyTrigger.TOTAL_AMOUNT):
		return null
	var gameplay:SexToyGameplay = SexToyManager.gameplay
	return gameplay.getTrigger(selectedTrigger)

func onDeleteEffectButton(_entry:SexToyEffectEntry):
	var theTrigger := getCurrentTrigger()
	if(!theTrigger):
		return
	theTrigger.effects.erase(_entry)
	theTrigger.checkShouldBeRemoved()
	updateSelectedTrigger()

#func _on_InvertedPassiveCheckbox_pressed():
#	var theTrigger := getCurrentTrigger()
#	if(!theTrigger || !theTrigger.isPassive()):
#		return
#	theTrigger.inverted = inverted_passive_checkbox.pressed
#	updateSelectedTrigger()

func _on_StartFromHSlider_value_changed(_value:float):
	var theTrigger := getCurrentTrigger()
	if(!theTrigger):
		return
	theTrigger.startFrom = _value
	updateStartFromSlider()

func _on_TestEffectButton_pressed():
	var theTrigger := getCurrentTrigger()
	if(!theTrigger):
		return
	theTrigger.triggerTest()

func _on_ExportConfigButton_pressed():
	info_accept_dialog.popup_centered()
	export_text_edit.text = JSON.print(SexToyManager.gameplay.saveData(), "", true)

func _on_CopyExportTextButton_pressed():
	OS.clipboard = export_text_edit.text

func _on_PasteTextButton_pressed():
	import_text_edit.text = OS.clipboard

func _on_LoadConfigButton_pressed():
	config_import_dialog.popup_centered()

func _on_ConfigImportDialog_confirmed():
	var theJsonResult := JSON.parse(import_text_edit.text)
	if(!theJsonResult || theJsonResult.error != OK || !(theJsonResult.result is Dictionary)):
		info_final_accept_dialog.dialog_text = "Bad config. Make sure it looks like JSON."
		info_final_accept_dialog.popup_centered()
		return
	
	SexToyManager.gameplay.loadData(theJsonResult.result)
	updateSelectedTrigger()
