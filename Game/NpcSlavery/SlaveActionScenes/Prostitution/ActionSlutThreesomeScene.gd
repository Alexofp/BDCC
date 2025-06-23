extends "res://Scenes/SceneBase.gd"

var npcID = ""
var npc:DynamicCharacter
var npc2ID = ""
var npc2:DynamicCharacter

func _initScene(_args = []):
	npcID = _args[0]
	npc = GlobalRegistry.getCharacter(npcID)
	npc2ID = _args[1]["sub2"]
	npc2 = GlobalRegistry.getCharacter(npc2ID)

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID
	if(_charID == "npc2"):
		return npc2ID

func _init():
	sceneID = "ActionSlutThreesomeScene"

func _run():
	if(state == ""):
		addCharacter(npcID)
		addCharacter(npc2ID)
		playAnimation(StageScene.Duo, "stand", {npc=npcID, pc=npc2ID, bodyState={chains=[["normal", "neck", "scene", "floor"]]}, npcBodyState={chains=[["normal", "neck", "scene", "floor"]]} })
		#var npcSlavery:NpcSlave = npc.getNpcSlavery()
		#var npc2Slavery:NpcSlave = npc2.getNpcSlavery()
		
		saynn("You grab two of your sluts, about to have fun with them!")
		
		addButton("Sex", "Time to have some fun", "do_sex")
	if(state == "after_sex"):
		playAnimation(StageScene.Duo, "stand", {npc=npcID, pc=npc2ID, bodyState={chains=[["normal", "neck", "scene", "floor"]]}, npcBodyState={chains=[["normal", "neck", "scene", "floor"]]} })
		
		saynn("After the sex ends, you order your slaves to get up. You make sure that both of them are still chained up to the floor.")
		
		addButton("Continue", "See what happens next", "endthescene")
		
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action in ["do_sex"]):
		runScene("GenericSexScene", ["pc", [npcID, npc2ID], SexType.DefaultSex, {SexMod.DisableDynamicJoiners: true}], "slavesfuck")
		setState("after_sex")
		return
		
	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "slavesfuck"):
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(npcSlavery.getWorkEfficiency() > 0.15):
			npcSlavery.addExperience(20)
			npcSlavery.addAwareness(0.05)
		else:
			npcSlavery.addDespair(0.05)
		npcSlavery.addTired(1)
		
		var npc2Slavery:NpcSlave = npc2.getNpcSlavery()
		if(npc2Slavery.getWorkEfficiency() > 0.15):
			npc2Slavery.addTrust(0.04)
			npc2Slavery.addExperience(10)
			npc2Slavery.addUnhappiness(-5 * sqrt(npcSlavery.getSlaveSkill(SlaveType.Slut)+1)) # Why would I leave if I get to fuck stuff for free!
		npc2Slavery.addTired(1)
		
		endScene()
		return

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
