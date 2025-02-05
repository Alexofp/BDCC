extends "res://Scenes/SceneBase.gd"

var savedText:String = ""

func _initScene(_args = []):
	var theResult:Dictionary = _args[0]
	
	savedText = theResult["text"]

	if(theResult.has("lootTable")):
		var lootTable = GlobalRegistry.getLootTable(theResult["lootTable"])
		var loot:Dictionary = lootTable.generateAndCreateItems()
		if(loot.has("credits")):
			var creditsChip = GlobalRegistry.createItem("WorkCredit")
			creditsChip.setAmount(loot["credits"])
			addItemToSavedItems(creditsChip)
		if(loot.has("items")):
			for item in loot["items"]:
				addItemToSavedItems(item)
	if(theResult.has("items")):
		for item in theResult["items"]:
			if(item is String):
				item = GlobalRegistry.createItem(item)
			if(item == null):
				continue
			addItemToSavedItems(item)
		
func _init():
	sceneID = "DungeonEventSimpleScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "stand")
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

	return data
	
func loadData(data):
	.loadData(data)
	
	savedText = SAVE.loadVar(data, "savedText", "")
