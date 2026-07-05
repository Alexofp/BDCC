extends PanelContainer

var currentID:String = ""

onready var name_label = $"%NameLabel"
onready var desc_label = $"%DescLabel"

signal onClose


func _on_CloseButton_pressed():
	emit_signal("onClose")

func setEntry(_id:String):
	if(currentID == _id):
		return
	currentID = _id
	var theBoardEntry:ContentBoardEntryBase = GlobalRegistry.getContentBoardEntry(currentID)
	if(!theBoardEntry):
		# Fallback
		var theScript = load("res://UI/ContentBoard/Entries/"+_id+".gd")
		if(theScript):
			theBoardEntry = theScript.new()
		else:
			return
	
	name_label.text = theBoardEntry.getName()
	desc_label.bbcode_text = theBoardEntry.getDesc()
