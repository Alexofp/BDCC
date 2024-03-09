extends "res://Scenes/SceneBase.gd"

var npcID = ""
var npc:DynamicCharacter

func _initScene(_args = []):
	npcID = _args[0]
	npc = GlobalRegistry.getCharacter(npcID)

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _init():
	sceneID = "ActionSlaveryChooseSkill"

func _run():
	if(state == ""):
		addCharacter(npcID)
		playAnimation(StageScene.Duo, "stand", {npc=npcID, npcBodyState={leashedBy="pc"}})
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		
		sayn("{npc.name}'s current slave level is "+str(npcSlavery.getLevel()))
		saynn("For each 5 slave levels {npc.he} can get a new skill/specialization.")
		
		saynn("Your slave's current main specialization is "+npcSlavery.getCurrentSkillName()+". This is the skill that will be trained by you.")
		
		sayn("Current skills of your slave:")
		for slaveType in npcSlavery.slaveSpecializations:
			var slaveTypeObj:SlaveTypeBase = GlobalRegistry.getSlaveType(slaveType)
			if(slaveTypeObj == null):
				continue
			sayn(slaveTypeObj.getVisibleName()+": "+npcSlavery.rankToLetter(npcSlavery.slaveSpecializations[slaveType]))
		
		if(npcSlavery.slaveSpecializations.keys().size() > 1):
			addButton("Main skill", "Pick your slave's main specialization", "pick_main_menu")
		else:
			addDisabledButton("Main skill", "Your slave only has a single specialization currently")
			
		if(npcSlavery.canLearnNewSkill()):
			if(npcSlavery.canLearnNewSkillAndHasAvailable()):
				addButton("Learn new", "Add a new specialization/skill to your slave!", "learn_new_menu")
			else:
				addDisabledButton("Learn new", "Your slave already has all the skills possible!")
		else:
			addDisabledButton("Learn new", "You can make your slave learn a new specialization/skill every 5 slave levels")
		addButton("Done", "Enough tinkering", "endthescene")

	if(state == "learn_new_menu"):
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		saynn("Which skill do you want to give to your slave? You will be able to train any skill that your slave has.")
		
		for slaveType in GlobalRegistry.getSlaveTypes():
			if(npcSlavery.hasSkill(slaveType)):
				continue
			var slaveTypeObj:SlaveTypeBase = GlobalRegistry.getSlaveType(slaveType)
			if(slaveTypeObj == null):
				continue
			if(!slaveTypeObj.canTeach(npc)):
				addDisabledButton(slaveTypeObj.getVisibleName(), "[color=red]Incompatible with this slave[/color]\n"+slaveTypeObj.getVisibleDesc())
				continue
			if(npcSlavery.getLevel() < slaveTypeObj.getMinimalSlaveLevel()):
				addDisabledButton(slaveTypeObj.getVisibleName(), "[color=red]Minimal slave level required: "+str(slaveTypeObj.getMinimalSlaveLevel())+"[/color]\n"+slaveTypeObj.getVisibleDesc())
				continue
			addButton(slaveTypeObj.getVisibleName(), slaveTypeObj.getVisibleDesc(), "learn_new", [slaveType])

		addButton("BACK", "You changed your mind", "")

	if(state == "pick_main_menu"):
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		saynn("Pick your slave's main specialization.")
		
		saynn("Your slave's current main specialization is "+npcSlavery.getCurrentSkillName()+". You will train your slave's selected main specialization.")
		
		sayn("Current skills of your slave:")
		for slaveType in npcSlavery.slaveSpecializations:
			var slaveTypeObj:SlaveTypeBase = GlobalRegistry.getSlaveType(slaveType)
			if(slaveTypeObj == null):
				continue
			addButton(slaveTypeObj.getVisibleName(), "Pick this one", "pick_main", [slaveType])
			sayn(slaveTypeObj.getVisibleName()+": "+npcSlavery.rankToLetter(npcSlavery.slaveSpecializations[slaveType]))
		
		addButton("Back", "Go back", "")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "pick_main"):
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		npcSlavery.setMainSkill(_args[0])
		setState("")
		addMessage("Main skill changed!")
		return
		
	if(_action == "learn_new"):
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		npcSlavery.learnNewSkill(_args[0])
		npcSlavery.setMainSkill(_args[0])
		setState("")
		addMessage("Your slave has learned a new skill!")
		return
		
	setState(_action)


func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID

	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	npc = GlobalRegistry.getCharacter(npcID)
