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
		
		saynn("To enslave staff members you will need to have a collar.")
		
		# Slave types buttons here maybe
		addButton("Do it", "Go through with it", "try_enslave")
		addButton("CANCEL", "You changed your mind", "endthescene")
		
	if(state == "try_enslave"):
		playAnimation(StageScene.Choking, "idle", {npc=npcID})
		
		saynn("You intimidate them! I'm a placeholder text! Don't forget to change me!")
		
		saynn("After intimidating them, you get a better idea about how to break their spirit.")
		
		sayn("Here is what you need to do (You can check the progress inside the personality status effect):")
		
		var theChar:DynamicCharacter = getCharacter(npcID)
		var enslaveQuest:NpcEnslavementQuest = theChar.getEnslaveQuest()
		saynn(enslaveQuest.getQuestStartText())
		
		addButton("Continue", "Time to do this to them then", "endthescene")
		addButton("Choke them", "(Reroll) Ask them again nicely", "try_enslave_choke")
	
	if(state == "try_enslave_choke"):
		playAnimation(StageScene.Choking, "choke", {npc=npcID})
		
		saynn("You choke them which changes things a bit.")
		
		sayn("Here is what you need to do (You can check the progress inside the personality status effect):")
		
		var theChar:DynamicCharacter = getCharacter(npcID)
		var enslaveQuest:NpcEnslavementQuest = theChar.getEnslaveQuest()
		saynn(enslaveQuest.getQuestStartText())
		
		addButton("Continue", "Time to do this to them then", "endthescene")
		addButton("Choke more", "(Reroll) Ask them again even more nicely", "try_enslave_chokeevenmore")
		
	if(state == "try_enslave_chokeevenmore"):
		playAnimation(StageScene.Choking, "hard", {npc=npcID})
		
		saynn("You choke them so much they are close to passing out.")
		
		sayn("Here is what you need to do (You can check the progress inside the personality status effect):")
		
		var theChar:DynamicCharacter = getCharacter(npcID)
		var enslaveQuest:NpcEnslavementQuest = theChar.getEnslaveQuest()
		saynn(enslaveQuest.getQuestStartText())
		
		addButton("Continue", "Time to do this to them then", "endthescene")
		# Cancel quest button here?
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "try_enslave"):
		var theChar:DynamicCharacter = getCharacter(npcID)
		var newEnslaveQuest = NpcEnslavementQuest.new()
		newEnslaveQuest.setChar(theChar)
		newEnslaveQuest.setSlaveType(SlaveType.Slut)
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
