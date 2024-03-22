extends "res://Scenes/SceneBase.gd"

var npcID = ""
var npc:DynamicCharacter
var npc2ID = ""
var npc2:DynamicCharacter

func _initScene(_args = []):
	npcID = _args[0]
	npc = GlobalRegistry.getCharacter(npcID)
	npc2ID = _args[1]["dom"]
	npc2 = GlobalRegistry.getCharacter(npc2ID)

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID
	if(_charID == "npc2"):
		return npc2ID

func _init():
	sceneID = "ActionSlutFuckByAnotherSlaveScene"

func _run():
	if(state == ""):
		addCharacter(npcID)
		addCharacter(npc2ID)
		playAnimation(StageScene.Duo, "stand", {npc=npcID, pc=npc2ID, bodyState={chains=[["normal", "neck", "scene", "floor"]]}, npcBodyState={chains=[["normal", "neck", "scene", "floor"]]} })
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		var npc2Slavery:NpcSlave = npc2.getNpcSlavery()
		
		saynn("You order your slut named {npc.name} to obey {npc2.name} and let {npc2.him} do anything {npc.he} wants with {npc.his} body, to be {npc2.his} stress-relief fucktoy.")
		
		saynn("Since all your slave are on a short chain, your slut doesn't really have a choice anyway."+(" You do notice that your slut is pretty tired though, meaning {npc.he} won't enjoy it for sure." if npcSlavery.getWorkEfficiency() <= 0.15 else ""))
		
		if(npc2Slavery.isMindBroken()):
			saynn("Your second slave hears your order.. and looks just as spaced out as before.")
			
			saynn("Looks like {npc2.he} won't be able to do this in {npc2.his} current state.. Unless you force {npc2.him}.")
			
			addButton("Force", "Force your broken slave to fuck your slut", "do_force_sex")
			addButton("Cancel", "You changed your mind", "endthescene")
		elif(npc2Slavery.personalityScore({PersonalityStat.Subby:1.0}) > 0.0):
			saynn("Your second slave hears your order.. and lowers {npc2.his} gaze.")
			
			saynn("[say=npc2]"+RNG.pick([
				"I'm not really a dominant person.. you know?..",
				"I'm into really into dominating others.",
				"I'm a pretty subby person myself..",
			])+"[/say]")
			
			saynn("Forcing {npc2.name} to do this will actually make {npc2.him} feel more stressed than before..")
			
			addButton("Force", "Force your subby slave to fuck your slut", "do_force_sex")
			addButton("Cancel", "You changed your mind", "endthescene")
		else:
			saynn("Your second slave hears that.. and seems to be ready for some good action.")
		
			saynn("[say=npc2]"+RNG.pick([
				"Let's have some fun.",
				"A slut? For me? Wow.",
				"Let's see how much you can handle.",
			])+"[/say]")
			
			addButton("Watch", "See what your slave will do to your slut", "do_watch_sex")
	if(state == "after_sex"):
		playAnimation(StageScene.Duo, "stand", {npc=npcID, pc=npc2ID, bodyState={chains=[["normal", "neck", "scene", "floor"]]}, npcBodyState={chains=[["normal", "neck", "scene", "floor"]]} })
		
		saynn("After the sex ends, you order your slaves to get up. You make sure that both of them are still chained up to the floor.")
		
		addButton("Continue", "See what happens next", "endthescene")
		
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action in ["do_force_sex", "do_watch_sex"]):
		var npc2Slavery:NpcSlave = npc2.getNpcSlavery()
		if(_action == "do_force_sex"):
			npc2Slavery.addDespair(0.05)
		else:
			npc2Slavery.addDespair(-0.1)
		
		runScene("GenericSexScene", [npc2ID, npcID], "slavesfuck")
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
