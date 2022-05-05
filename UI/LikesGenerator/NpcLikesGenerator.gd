extends Control

onready var optionsList = $HBoxContainer/VBoxContainer/ScrollContainer/Options
var npcLikeLineUI = preload("res://UI/LikesGenerator/NpcLikesLineUI.tscn")
var linesUi = []

func _ready():
	Util.delete_children(optionsList)
	linesUi.clear()
	
	for topicA in GlobalRegistry.getLustTopicObjects():
		var topic: TopicBase = topicA
		var handlesIDs = topic.handles_ids
		for id in handlesIDs:
			var uiLine = npcLikeLineUI.instance()
			
			uiLine.setInterestData(id, topic.getVisibleName(id))
			uiLine.connect("onCurrentValueChange", self, "_on_NpcLikesLineUI_onCurrentValueChange")
			
			optionsList.add_child(uiLine)
			linesUi.append(uiLine)
			
	updateText()


func _on_NpcLikesLineUI_onCurrentValueChange(_interestID, _newValue):
	#print(_interestID, " ", _newValue)
	updateText()
	
func updateText():
	var result = "\tnpcLustInterests = {\n"
	
	for uiLine in linesUi:
		if(uiLine.getCurrentValue() == Interest.Neutral):
			continue
		
		result += "\t\t"+"InterestTopic."+uiLine.getInterestID()+": "+"Interest."+str(uiLine.getCurrentValue())+",\n"
		
	result += "\t}"
	
	$HBoxContainer/VBoxContainer2/TextEdit.text = result
