extends "res://Scenes/SceneBase.gd"

var savedText:String = ""
var animData:Array = []

func _initScene(_args = []):
	var theResult:Dictionary = _args[0]
	
	savedText = theResult["text"]
	
	if(theResult.has("anim")):
		animData = theResult["anim"]

	var lootedAnyItems:bool = false
	if(theResult.has("lootTable")):
		var lootTable = GlobalRegistry.getLootTable(theResult["lootTable"])
		var loot:Dictionary = lootTable.generateAndCreateItems()
		if(loot.has("credits") && loot["credits"] > 0):
			var creditsChip = GlobalRegistry.createItem("WorkCredit")
			creditsChip.setAmount(loot["credits"])
			addItemToSavedItems(creditsChip)
			lootedAnyItems = true
		if(loot.has("items")):
			for item in loot["items"]:
				addItemToSavedItems(item)
				lootedAnyItems = true
	if(theResult.has("items")):
		for item in theResult["items"]:
			if(item is String):
				item = GlobalRegistry.createItem(item)
			if(item == null):
				continue
			addItemToSavedItems(item)
			lootedAnyItems = true
	
	if(theResult.has("noLootText")):
		if(!lootedAnyItems):
			savedText += "\n\n"+theResult["noLootText"]
	
func _init():
	sceneID = "DungeonEventSimpleScene"

func _run():
	if(state == ""):
		if(animData.size() <= 1):
			playAnimation(StageScene.Solo, "stand")
		else:
			playAnimation(animData[0], animData[1], animData[2] if animData.size() > 2 else {})
		saynn(savedText)
		
		addButton("Continue", "Continue on your way..", "endthescene")
		

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()
	
	data["savedText"] = savedText
	data["animData"] = animData

	return data
	
func loadData(data):
	.loadData(data)
	
	savedText = SAVE.loadVar(data, "savedText", "")
	animData = SAVE.loadVar(data, "animData", [])
