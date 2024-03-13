extends "res://Scenes/SceneBase.gd"

var npcID = ""
var npc:DynamicCharacter
var theCancelMessage = "You stop your slave from doing whatever they were doing."

func _initScene(_args = []):
	npcID = _args[0]
	npc = GlobalRegistry.getCharacter(npcID)
	if(_args.size() > 2):
		theCancelMessage = _args[2][0]

func _reactInit():
	var npcSlavery:NpcSlave = npc.getNpcSlavery()
	npcSlavery.stopActivity()

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _init():
	sceneID = "SlaveryCancelActivity"

func _run():
	if(state == ""):
		addCharacter(npcID)
		playAnimation(StageScene.Duo, "stand", {npc=npcID, npcBodyState={leashedBy="pc"}})
		#var npcSlavery:NpcSlave = npc.getNpcSlavery()
		
		saynn(theCancelMessage)
		
		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	setState(_action)


func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID
	data["theCancelMessage"] = theCancelMessage

	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	npc = GlobalRegistry.getCharacter(npcID)
	theCancelMessage = SAVE.loadVar(data, "theCancelMessage", "")
