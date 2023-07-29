extends Control

var data = {
	selectedStage = StageScene.SexAllFours,
	selecedAnim = "tease",
	selectedPC = "domID",
	selectedNPC = "subID",
}

func _ready():
	$HBoxContainer/OptionButton3.add_item("domID")
	$HBoxContainer/OptionButton3.add_item("subID")
	
	$HBoxContainer/OptionButton4.add_item("domID")
	$HBoxContainer/OptionButton4.add_item("subID")
	$HBoxContainer/OptionButton4.selected = 1
	
	for animID in GlobalRegistry.getStageScenesCachedStates().keys():
		$HBoxContainer/OptionButton.add_item(animID)
	#setData(data)
	
	
func setData(theData):
	data = theData
	
	var allAnims = GlobalRegistry.getStageScenesCachedStates()[data["selectedStage"]]
	$HBoxContainer/OptionButton2.clear()
	for anim in allAnims:
		$HBoxContainer/OptionButton2.add_item(anim)
	
	if(true):
		var index = 0
		for item in ["domID", "subID"]:
			if(item == data["selectedPC"]):
				$HBoxContainer/OptionButton3.selected = index
				break
			index += 1
	if(true):
		var index = 0
		for item in ["domID", "subID"]:
			if(item == data["selectedNPC"]):
				$HBoxContainer/OptionButton4.selected = index
				break
			index += 1
	if(true):
		var index = 0
		for item in GlobalRegistry.getStageScenesCachedStates().keys():
			if(item == data["selectedStage"]):
				$HBoxContainer/OptionButton.selected = index
				break
			index += 1
	if(true):
		var index = 0
		for item in allAnims:
			if(item == data["selecedAnim"]):
				$HBoxContainer/OptionButton2.selected = index
				break
			index += 1
		if($HBoxContainer/OptionButton2.selected >= 0):
			data["selecedAnim"] = allAnims[$HBoxContainer/OptionButton2.selected]


func _on_OptionButton_item_selected(index):
	data["selectedStage"] = GlobalRegistry.getStageScenesCachedStates().keys()[index]
	setData(data)

func _on_OptionButton2_item_selected(index):
	data["selecedAnim"] = GlobalRegistry.getStageScenesCachedStates()[data["selectedStage"]][index]
	setData(data)

func _on_OptionButton3_item_selected(index):
	data["selectedPC"] = ["domID", "subID"][index]
	setData(data)

func _on_OptionButton4_item_selected(index):
	data["selectedNPC"] = ["domID", "subID"][index]
	setData(data)
