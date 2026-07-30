extends PanelContainer

var currentID:String = ""

onready var name_label = $"%NameLabel"
onready var desc_label = $"%DescLabel"
onready var cond_label = $"%CondLabel"
onready var progress_label = $"%ProgressLabel"
onready var status_label = $"%StatusLabel"
onready var conditions_container = $"%ConditionsContainer"
onready var how_to_progress_container = $"%HowToProgressContainer"
onready var kinks_label = $"%KinksLabel"
onready var kinks_panel = $"%KinksPanel"

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
	desc_label.bbcode_text = theBoardEntry.getDesc(true)
	
	if(theBoardEntry.isCompleted()):
		var theCompleteText:String = theBoardEntry.getCompletedDesc()
		if(!theCompleteText.empty()):
			desc_label.bbcode_text += "\n\n"+theCompleteText
	
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
		
	var _didStart:bool = theBoardEntry.isStarted()
	#how_to_progress_container.visible = _didStart
	if(_didStart):
		progress_label.bbcode_text = theBoardEntry.getProgressText()
	else:
		progress_label.bbcode_text = "-- Find a way to start this content first! --"
	
	var theKinks:Array = theBoardEntry.getKinks()
	kinks_panel.visible = !theKinks.empty()
	kinks_label.bbcode_text = Util.join(theKinks, "\n")


func _on_DescLabel_meta_clicked(meta):
	var _ok = Util.fixed_shell_open(meta)
