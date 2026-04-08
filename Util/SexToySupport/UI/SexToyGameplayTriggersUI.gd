extends Control

onready var triggers_item_list = $"%TriggersItemList"
onready var effect_list = $"%EffectList"

var selectedTrigger:int = -1

var effectUIEntryScene = preload("res://Util/SexToySupport/UI/SexToyEffectUIEntry.tscn")

func _ready():
	for theTriggerID in SexToyTrigger.TOTAL_AMOUNT:
		var theTriggerName:String = SexToyTrigger.getName(theTriggerID)
		triggers_item_list.add_item(theTriggerName)
