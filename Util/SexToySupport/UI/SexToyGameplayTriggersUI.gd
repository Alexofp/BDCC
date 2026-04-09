extends Control

onready var triggers_item_list = $"%TriggersItemList"
onready var effect_list = $"%EffectList"
onready var inverted_passive_checkbox = $"%InvertedPassiveCheckbox"
onready var trigger_name_label = $"%TriggerNameLabel"

var selectedTrigger:int = -1

var effectUIEntryScene = preload("res://Util/SexToySupport/UI/SexToyEffectUIEntry.tscn")

func _ready():
	for theTriggerID in SexToyTrigger.TOTAL_AMOUNT:
		var theTriggerName:String = SexToyTrigger.getName(theTriggerID)
		triggers_item_list.add_item(theTriggerName)
	
	updateSelectedTrigger()

func _on_TriggersItemList_item_selected(_index:int):
	if(_index < 0 || _index >= SexToyTrigger.TOTAL_AMOUNT):
		return
	selectedTrigger = _index
	updateSelectedTrigger()

func updateSelectedTrigger():
	Util.delete_children(effect_list)
	var gameplay:SexToyGameplay = SexToyManager.gameplay
	#if(!gameplay.triggers.has(selectedTrigger)):
	#	return
	var theTriggerEntry:SexToyTriggerEntry = gameplay.getTrigger(selectedTrigger)
	if(!theTriggerEntry):
		return
	
	inverted_passive_checkbox.set_pressed_no_signal(theTriggerEntry.inverted)
	inverted_passive_checkbox.visible = theTriggerEntry.isPassive()
	trigger_name_label.text = SexToyTrigger.getDesc(selectedTrigger, theTriggerEntry.inverted)
	
	var _i:int = 0
	for theEffect in theTriggerEntry.effects:
		var newEffectUIEntry:Control = effectUIEntryScene.instance()
		effect_list.add_child(newEffectUIEntry)
	
		newEffectUIEntry.setEntry(_i+1, theEffect)
		newEffectUIEntry.connect("onDeleteButton", self, "onDeleteEffectButton")
		_i += 1

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

func _on_InvertedPassiveCheckbox_pressed():
	var theTrigger := getCurrentTrigger()
	if(!theTrigger || !theTrigger.isPassive()):
		return
	theTrigger.inverted = inverted_passive_checkbox.pressed
	updateSelectedTrigger()
