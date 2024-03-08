extends "res://Scenes/SceneBase.gd"

var npcID = ""
var npc:DynamicCharacter
var npc2ID = ""
var npc2:DynamicCharacter

func _initScene(_args = []):
	npcID = _args[0]
	npc = GlobalRegistry.getCharacter(npcID)
	npc2ID = _args[1]
	npc2 = GlobalRegistry.getCharacter(npc2ID)

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID
	if(_charID == "npc2"):
		return npc2ID

func _init():
	sceneID = "SlaveryStocksLetFuck"

func _run():
	if(state == ""):
		addCharacter(npcID)
		addCharacter(npc2ID)
		if(GM.pc.getLocation() == "fight_slutwall"):
			playAnimation(StageScene.SlutwallSex, "tease", {npc=npcID, pc=npc2ID, bodyState={naked=true}})
		else:
			playAnimation(StageScene.StocksSexOral, "tease", {npc=npcID, pc=npc2ID})
		
		saynn("Do you want to let {npc.name} fuck {npc2.name}?")
		
		addButton("Yes", "Let them have fun", "make_on_slave_fuck_another")
		addButton("Cancel", "You changed your mind", "endthescene")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "make_on_slave_fuck_another"):
		var npc2Slavery:NpcSlave = npc2.getNpcSlavery()
		if(npc2Slavery != null):
			if(npc2Slavery.isActivelyResisting()):
				npc2.addEffect("SexActivelyResisting")
				
			npc2Slavery.addTired(1)
			if(npc2Slavery.getTiredEffect() >= 0.9):
				npc2Slavery.addDespair(0.06)
			else:
				npc2Slavery.addDespair(0.01)
				npc2Slavery.addBrokenSpirit(0.05 * npc2Slavery.getWorkEfficiency())
		
		if(GM.pc.getLocation() == "fight_slutwall"):
			npc2.lustStateFullyUndress()
			runScene("GenericSexScene", [npcID, npc2ID, SexType.SlutwallSex], "usesex")
		else:
			runScene("GenericSexScene", [npcID, npc2ID, SexType.StocksSex], "usesex")
		
		endScene()
		return
		
	setState(_action)


func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID
	data["npc2ID"] = npc2ID

	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	npc = GlobalRegistry.getCharacter(npcID)

	npc2ID = SAVE.loadVar(data, "npc2ID", "")
	npc2 = GlobalRegistry.getCharacter(npc2ID)
