extends "res://Scenes/SceneBase.gd"

var npcID = ""
var npc:DynamicCharacter

var howMuchEarned:int = 0

func _initScene(_args = []):
	npcID = _args[0]
	npc = GlobalRegistry.getCharacter(npcID)

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _reactInit():
	var npcSlave:NpcSlave = npc.getNpcSlavery()
	if(npcSlave == null || npcSlave.getActivityID() != "Prostitution"):
		setState("something_wrong")
		return
	var prostitution = npcSlave.getActivity()
	howMuchEarned = prostitution.getEarnedCredits()
	GM.pc.addCredits(howMuchEarned)
	npcSlave.addTired(5)
	if(howMuchEarned <= 1):
		npcSlave.deservesPunishment(3)
	elif(howMuchEarned <= 4):
		npcSlave.deservesPunishment(1)
	elif(howMuchEarned <= 10):
		npcSlave.deservesReward(1)
	elif(howMuchEarned <= 20):
		npcSlave.deservesReward(2)
	else:
		npcSlave.deservesReward(3)

func _init():
	sceneID = "SlutProstitutionReceiveCredits"

func _run():
	if(state == ""):
		addCharacter(npcID)
		playAnimation(StageScene.Duo, "stand", {npc=npcID})
		
		var npcSlave:NpcSlave = npc.getNpcSlavery()
		var prostitution = npcSlave.getActivity()
		
		saynn("{npc.name} finds you, looking quite exhausted after whoring {npc.himself} out for "+str(prostitution.workHoursRemember)+" hours!")
		
		if(howMuchEarned <= 0):
			saynn("{npc.He} walks up to you and gives you.. nothing.. somehow, {npc.he} didn't earn anything.")
		else:
			saynn("{npc.He} walks up to you and gives you "+str(howMuchEarned)+" credit"+("s" if howMuchEarned != 1 else "")+"!")
		
		if(howMuchEarned <= 4):
			if(npcSlave.getObedience() < 0.3 && npcSlave.getLove() < 0.3 && npcSlave.getBrokenSpirit() < 0.3):
				saynn("[say=npc]"+RNG.pick([
					"Listen.. Screw you, okay? I don't want to do this.",
					"I hate doing this. I'm not a slut, okay?",
					"I tried my best, fuck you.",
					"I'd love to see you spreading your legs for all the horny fucks!",
				])+"[/say]")
			else:
				saynn("[say=npc]"+RNG.pick([
					"Sorry, I tried my best..",
					"Maybe being a slut is not for me.",
					"Maybe I'm just a bad slut.",
					"Sorry, I really tried.",
				])+"[/say]")
		else:
			if(npcSlave.getObedience() < 0.3 && npcSlave.getLove() < 0.3 && npcSlave.getBrokenSpirit() < 0.3):
				saynn("[say=npc]"+RNG.pick([
					"Fuck you, you don't even know what I did to earn these.",
					"You can't even imagine what I did to earn these.",
					"I'd like to see you earn more. I bet you can't.",
				])+"[/say]")
			else:
				saynn("[say=npc]"+RNG.pick([
					"There you go, {npc.pcOwner}.",
					"Hope that's enough, {npc.pcOwner}.",
					"Here is what I earned, {npc.pcOwner}.",
				])+"[/say]")
		
		if(howMuchEarned == 0):
			saynn("Zero credits? Really? That's pathetic and deserves a good punishment!")
		elif(howMuchEarned == 1):
			saynn("A single credit? Really? That's pathetic and deserves a good punishment!")
		elif(howMuchEarned <= 4):
			saynn("Only "+str(howMuchEarned)+" credits? That's not a lot, deserves a small punishment.")
		elif(howMuchEarned <= 10):
			saynn("That's not a lot.. but it's still something, deserves a small reward.")
		elif(howMuchEarned <= 20):
			saynn("That's a very fair amount, {npc.he} deserves a normal reward.")
		else:
			saynn("Wow, that's a lot. {npc.He} deserves a big reward!")
		
		if(npcSlave.getObedience() < 0.3 && npcSlave.getLove() < 0.3 && npcSlave.getBrokenSpirit() < 0.3):
			saynn("[say=npc]I will return to your cell, I guess.[/say]")
		else:
			saynn("[say=npc]"+RNG.pick([
				"I'm pretty tired, gonna return to your cell.",
				"I will go put myself back on a leash..",
			])+"[/say]")
		
		addButton("Continue", "See what happens next", "endthescene")
	
	if(state == "something_wrong"):
		saynn("Something went wrong, they weren't a whore at all!")
		addButton("Continue", "Oh well", "endthescene")
		return

func _react(_action: String, _args):
	if(_action == "endthescene"):
		var npcSlave:NpcSlave = npc.getNpcSlavery()
		npcSlave.stopActivity()
		endScene()
		return

	setState(_action)


func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID
	data["howMuchEarned"] = howMuchEarned

	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	howMuchEarned = SAVE.loadVar(data, "howMuchEarned", 0)
	npc = GlobalRegistry.getCharacter(npcID)
