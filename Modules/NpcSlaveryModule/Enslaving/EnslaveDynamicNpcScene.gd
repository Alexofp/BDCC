extends "res://Scenes/SceneBase.gd"

var npcID = ""

func _init():
	sceneID = "EnslaveDynamicNpcScene"

func _initScene(_args = []):
	npcID = _args[0]
	#var npc = GlobalRegistry.getCharacter(npcID)
	
	
func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _run():
	if(state == ""):
		addCharacter(npcID)
		playAnimation(StageScene.Duo, "stand", {npc=npcID})

	if(state == ""):
		#var npc = GlobalRegistry.getCharacter(npcID)
		saynn("Do you wanna try to enslave {npc.name}?")
		
		saynn("You will have to break {npc.his} spirit and show {npc.him} {npc.his} place first.")
		
		saynn("After that, you will need enough space in your cell to store {npc.him}.")
		
		saynn("What kind of slave do you want {npc.him} to be?")

		for slaveTypeID in GlobalRegistry.getSlaveTypes():
			var theSlaveType:SlaveTypeBase = GlobalRegistry.getSlaveType(slaveTypeID)
			if(!theSlaveType.canEnslaveAs()):
				continue
			if(!theSlaveType.canTeach(getCharacter(npcID))):
				addDisabledButton(theSlaveType.getVisibleName(), "[color=red]Incompatible with this slave[/color]\n"+theSlaveType.getVisibleDesc())
				continue
			addButton(theSlaveType.getVisibleName(), theSlaveType.getVisibleDesc(), "try_enslave", [slaveTypeID])
		
		addButton("CANCEL", "You changed your mind", "endthescene")
		
	if(state == "try_enslave"):
		playAnimation(StageScene.Choking, "idle", {npc=npcID})
		
		var theChar:DynamicCharacter = getCharacter(npcID)
		var enslaveQuest:NpcEnslavementQuest = theChar.getEnslaveQuest()
		var theSlaveTypeID = enslaveQuest.slaveType
		var theSlaveType:SlaveTypeBase = GlobalRegistry.getSlaveType(theSlaveTypeID)
		if(theSlaveType != null):
			saynn(theSlaveType.getEnslaveText(theChar))
		
		saynn("After glaring at {npc.him}, you get a better idea about how to damage {npc.his} spirit.")
		
		sayn("Here is what you need to do (You can check the progress inside the personality status effect):")

		saynn(enslaveQuest.getQuestStartText())
		
		addButton("Continue", "Time to do this to them then", "endthescene")
		addButton("Choke them", "(Reroll) Ask them again nicely", "try_enslave_choke")
		addButton("CANCEL", "You changed your mind", "stopquest_endthescene")
	
	if(state == "try_enslave_choke"):
		playAnimation(StageScene.Choking, "choke", {npc=npcID})
		
		saynn("You choke {npc.him} which changes things a bit.")
		
		sayn("Here is what you need to do (You can check the progress inside the personality status effect):")
		
		var theChar:DynamicCharacter = getCharacter(npcID)
		var enslaveQuest:NpcEnslavementQuest = theChar.getEnslaveQuest()
		saynn(enslaveQuest.getQuestStartText())
		
		addButton("Continue", "Time to do this to them then", "endthescene")
		addButton("Choke more", "(Reroll) Ask them again even more nicely", "try_enslave_chokeevenmore")
		addButton("CANCEL", "You changed your mind", "stopquest_endthescene")
		
	if(state == "try_enslave_chokeevenmore"):
		playAnimation(StageScene.Choking, "hard", {npc=npcID})
		
		saynn("You choke {npc.him} so much {npc.he} {npc.isAre} close to passing out.")
		
		sayn("Here is what you need to do (You can check the progress inside the personality status effect):")
		
		var theChar:DynamicCharacter = getCharacter(npcID)
		var enslaveQuest:NpcEnslavementQuest = theChar.getEnslaveQuest()
		saynn(enslaveQuest.getQuestStartText())
		
		addButton("Continue", "Time to do this to them then", "endthescene")
		addButton("CANCEL", "You changed your mind", "stopquest_endthescene")
		# Cancel quest button here?
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "stopquest_endthescene"):
		var theChar:DynamicCharacter = getCharacter(npcID)
		theChar.setEnslaveQuest(null)
		addMessage("You stopped trying to enslave "+theChar.getName())
		endScene()
		return
	
	if(_action == "try_enslave"):
		var theChar:DynamicCharacter = getCharacter(npcID)
		var newEnslaveQuest = NpcEnslavementQuest.new()
		newEnslaveQuest.setChar(theChar)
		newEnslaveQuest.setSlaveType(_args[0])
		newEnslaveQuest.generateTasks()
		theChar.setEnslaveQuest(newEnslaveQuest)

	if(_action in ["try_enslave_choke", "try_enslave_chokeevenmore"]):
		var theChar:DynamicCharacter = getCharacter(npcID)
		if(theChar.hasEnslaveQuest()):
			var theEnslaveQuest = theChar.getEnslaveQuest()
			theEnslaveQuest.generateTasks()

	setState(_action)


func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID
	
	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")


func getDebugActions():
	return [
		{
			"id": "quickEnslave",
			"name": "Quick Enslave",
			"args": [
			],
		},
	]

func doDebugAction(_id, _args = {}):
	if(_id == "quickEnslave"):
		endScene()
		runScene("KidnapDynamicNpcScene", [npcID])
		GM.main.reRun()
