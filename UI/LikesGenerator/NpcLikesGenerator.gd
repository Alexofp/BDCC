extends Control

onready var optionsList = $HBoxContainer/VBoxContainer/ScrollContainer/Options
var npcLikeLineUI = preload("res://UI/LikesGenerator/NpcLikesLineUI.tscn")
var linesUi = []
var linesByTopicID = {}

func _ready():
	resetLines()
	updateText()
	
	
func resetLines():
	Util.delete_children(optionsList)
	linesUi.clear()
	linesByTopicID.clear()
	
	for topicA in GlobalRegistry.getLustTopicObjects():
		var topic: TopicBase = topicA
		var handlesIDs = topic.handles_ids
		for id in handlesIDs:
			var uiLine = npcLikeLineUI.instance()
			
			uiLine.setInterestData(id, topic.getVisibleName(id))
			uiLine.connect("onCurrentValueChange", self, "_on_NpcLikesLineUI_onCurrentValueChange")
			
			optionsList.add_child(uiLine)
			linesUi.append(uiLine)
			linesByTopicID[id] = uiLine

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


func _on_ConvertBackButton_pressed():
	resetLines()
	
	var text = $HBoxContainer/VBoxContainer2/TextEdit.text
	var lines = text.split("\n")
	
	for line in lines:
		var middleSplit = line.split(":")
		if(middleSplit.size() != 2):
			continue
		
		var firstPartSplit = middleSplit[0].split(".")
		var secondPartSplit = middleSplit[1].split(".")
		if(firstPartSplit.size() != 2 || secondPartSplit.size() != 2):
			continue
		
		var interestTopicWord = firstPartSplit[0].strip_edges()
		var interestTopicName = firstPartSplit[1].strip_edges()
		
		if(interestTopicWord != "InterestTopic"):
			continue
		var interestWord = secondPartSplit[0].strip_edges()
		var interestName = secondPartSplit[1].strip_edges().trim_suffix(",")
		if(interestWord != "Interest"):
			continue
		if(Interest.getVisibleName(interestName).begins_with("error:")):
			continue
		
		if(linesByTopicID.has(interestTopicName)):
			linesByTopicID[interestTopicName].setCurrentValue(interestName)
		
