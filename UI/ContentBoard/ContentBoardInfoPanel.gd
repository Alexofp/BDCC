extends PanelContainer

var currentID:String = ""

onready var name_label = $"%NameLabel"
onready var desc_label = $"%DescLabel"
onready var cond_label = $"%CondLabel"
onready var progress_label = $"%ProgressLabel"
onready var status_label = $"%StatusLabel"
onready var conditions_container = $"%ConditionsContainer"
onready var how_to_progress_container = $"%HowToProgressContainer"

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
	
	var theStatus:int = theBoardEntry.getStatus()
	status_label.text = ContentBoardStatus.getText(theStatus)
	status_label["custom_colors/font_color"] = ContentBoardStatus.getColor(theStatus)
	
	var theReqTexts:Array = []
	var theReqs:Array = theBoardEntry.getStartConditions()
	for theReq in theReqs:
		var theReqStatus:int = theReq[0]
		var theText:String = theReq[1]
		
		theReqTexts.append("- [color=#"+ContentBoardCondition.getColor(theReqStatus).to_html(false)+"]"+theText+"[/color]")
		
	cond_label.bbcode_text = Util.join(theReqTexts, "\n")
		
	progress_label.bbcode_text = theBoardEntry.getProgressText()
	
	var _didStart:bool = theBoardEntry.isStarted()
	#how_to_progress_container.visible = _didStart
