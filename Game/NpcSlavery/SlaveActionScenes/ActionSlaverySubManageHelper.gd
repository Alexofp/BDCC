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
	sceneID = "ActionSlaverySubManageHelper"

func _run():
	if(state == ""):
		addCharacter(npcID)
		playAnimation(StageScene.Duo, "stand", {npc=npcID})
		
		saynn("Your submissive is trained enough for you to let {npc.him} to walk around the prison. You can order {npc.him} to automatically shower your other slaves that are covered in cum or bring pregnant slaves into the nursery.")
		
		var npcSlave:NpcSlave = npc.getNpcSlavery()
		var willWash = false
		var willHelpBirth = false
		if(npcSlave.isDoingActivity() && npcSlave.getActivityID() == "SubHelper"):
			var subHelper = npcSlave.getActivity()
			willWash = subHelper.willWashSlaves
			willHelpBirth = subHelper.willHelpGiveBirth
		
		if(!willWash):
			saynn("Currently, your sub will [b]not[/b] automatically wash your other slaves when they are covered in cum.")
		else:
			saynn("Currently, your sub [b]will[/b] automatically wash your other slaves.")
			
		if(!willHelpBirth):
			saynn("Also, {npc.he} will [b]not[/b] automatically bring your pregnant slaves into nursery to give birth.")
		else:
			saynn("Also, {npc.he} [b]will[/b] automatically bring your pregnant slaves into nursery to give birth.")
		
		addButton("Toggle wash", "Make/stop your slave wash other slaves", "toggle_wash")
		addButton("Toggle birth", "Make/stop your slave bring pregnant slaves into nursery", "toggle_birth")
		
		addButton("Close", "Enough manipulating", "endthescene")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "toggle_wash"):
		var npcSlave:NpcSlave = npc.getNpcSlavery()
		if(npcSlave.isDoingActivity() && npcSlave.getActivityID() == "SubHelper"):
			var subHelper = npcSlave.getActivity()
			subHelper.willWashSlaves = !subHelper.willWashSlaves
			
			if(!subHelper.hasAnythingToggledOn()):
				npcSlave.stopActivity()
		else:
			var subHelper = npcSlave.startActivity("SubHelper")
			if(subHelper != null):
				subHelper.willWashSlaves = true
		return
		
	if(_action == "toggle_birth"):
		var npcSlave:NpcSlave = npc.getNpcSlavery()
		if(npcSlave.isDoingActivity() && npcSlave.getActivityID() == "SubHelper"):
			var subHelper = npcSlave.getActivity()
			subHelper.willHelpGiveBirth = !subHelper.willHelpGiveBirth
			
			if(!subHelper.hasAnythingToggledOn()):
				npcSlave.stopActivity()
		else:
			var subHelper = npcSlave.startActivity("SubHelper")
			if(subHelper != null):
				subHelper.willHelpGiveBirth = true
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
