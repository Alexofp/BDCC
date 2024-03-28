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
	sceneID = "ActionSlaveryFreeSlaveScene"

func _run():
	if(state == ""):
		addCharacter(npcID)
		playAnimation(StageScene.Duo, "stand", {npc=npcID, npcBodyState={leashedBy="pc"}})
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		
		saynn("Are you sure you want to release {npc.name}?")
		
		saynn("As long as {npc.he} {npc.isAre} sane enough, {npc.he} will just return to whatever {npc.he} was doing before getting enslaved by you. But {npc.he} will forget anything that you taught {npc.him}.")
		
		if(npcSlavery.isMindBroken()):
			saynn("Since {npc.name} is mindbroken, {npc.he} will be committed to the mental ward indefinitely, meaning {npc.he} will be forgotten by you forever.")
		
		addButton("Release", "Let your slave go", "release_slave")
		addButton("Cancel", "You changed your mind", "endthescene")

	if(state == "release_slave"):
		aimCameraAndSetLocName("hall_mainentrance")
		playAnimation(StageScene.Duo, "stand", {npc=npcID})
		
		saynn("You grab {npc.name}'s leash and bring {npc.him} out into the main hall. After that, you just unclip the leash.")
		
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		
		if(npcSlavery.isActivelyResisting()):
			saynn("[say=pc]"+RNG.pick([
				"You're free. Go away.",
				"I'm fed up with you. You can leave.",
				"You're free. Go. Before I change my mind.",
				"Go away. You're no longer a slave.",
			])+"[/say]")
		else:
			saynn("[say=pc]"+RNG.pick([
				"You can go. You are now free.",
				"I decided to release you. You can go.",
			])+"[/say]")
		
		if(npcSlavery.isMindBroken()):
			saynn("{npc.He} doesn't say anything, just standing still. {npc.His} gaze unfocused.")
			
			saynn("You snap your fingers in front of {npc.his} face.. no reaction. Oh well.")
			
			saynn("After stepping away from {npc.him}, one of the staff members approaches and asks {npc.him} something.")
			
			saynn("Soon, a few nurses arrive and take {npc.name} away somewhere..")
		elif(npcSlavery.isResistingSuperActively()):
			saynn("[say=npc]"+RNG.pick([
				"Really? I won't thank you. In fact, you know what? Fuck you.",
				"You shouldn't messed with me in the first place."
			])+"[/say]")
		
			saynn("{npc.name} shows you the middle finger.. and quickly leaves.")
		elif(npcSlavery.hasSubmittedToPC()):
			saynn("[say=npc]"+RNG.pick([
				"Um. But I belong to you. You're serious? I'm not sure what to do now..",
				"Are you serious? But.. I was just getting used.. to being yours..",
				"Oh. But I.. What am I gonna do when there is no longer a leash to guide me?",
				"But.. what if I kinda liked being on a leash?",
				"I.. I don't know what to say. Thank you? But also, why now? I got kinda used to serving you. It's going to take some time to adjust back to living on my own..",
				"I.. I don't think I'm ready for this. Being with you has become my whole world. What am I supposed to do now? I'll miss you.. More than you'll ever know.",
			])+"[/say]")
			
			saynn("Your slave.. ex-slave.. lowers {npc.his} head.. as you step away.")
		elif(npcSlavery.getLove() > 0.95):
			saynn("[say=npc]"+RNG.pick([
				"But.. I love you.. You can't be serious..",
				"Really?.. I had feeling for you, you know.. And now you betray me like that?",
				"Seriously? You're just letting me go like that? After all we've been through? I don't know whether to feel relieved or hurt. But I guess it doesn't matter now. Goodbye.",
				"You're setting me free? But what about our bond? Our connection? I thought we had something special. I guess I was wrong. Farewell.",
				"You're actually letting me go? Well, don't expect me to be grateful. I'm done with you",
			])+"[/say]")
			
			saynn("Your ex-slave humpfs and walks away.")
		elif(npcSlavery.getObedience() > 0.5 || npcSlavery.getLove() > 0.5 || npcSlavery.getBrokenSpirit()):
			saynn("[say=npc]"+RNG.pick([
				"So this is it, then? You're just letting me go? After all the time we've spent together? I don't know whether to be relieved or heartbroken. But I suppose it doesn't matter now. Farewell",
				"Um. But I belong to you. You're serious? I'm not sure what to do now.. It's strange to think of life without you, but part of me is relieved. I'll miss you, but I'll also be glad to finally be my own person again",
			])+"[/say]")
			
			saynn("Your ex-slave looks around.. and then walks away somewhere.")
		else:
			saynn("[say=npc]"+RNG.pick([
				"Wow. I never thought I'd see the day when you'd release me. I hope you're not lying.",
				"Really? You're finally releasing me? About time. Don't expect me to thank you though. I'll be glad to be free of your control, but don't think for a second that I'll forget what you did to me.",
				"Wow, thanks for finally setting me free. Don't expect me to stick around and listen to your excuses.",
				"You're letting me go? Don't act like you're doing me a favor. I'll be just fine without being your slave.",
			])+"[/say]")
			
			saynn("Your ex-slave looks around.. and then swiftly walks away somewhere.")
		
		addButton("Continue", "See what happens next", "slave_released")
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "slave_released"):
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		playAnimation(StageScene.Solo, "stand")
		
		if(npcSlavery.isMindBroken()):
			addMessage(npc.getName()+" was committed to the mental ward.. indefinitely.")
			#GM.main.removeDynamicCharacter(npcID)
			getModule("NpcSlaveryModule").doFreeEnslavedCharacter(npcID)
			if(npc.isDynamicCharacter()):
				GM.main.removeDynamicCharacterFromAllPools(npcID)
				GM.main.addDynamicCharacterToPool(npcID, CharacterPool.MentalWard)
		else:
			addMessage(npc.getName()+" was freed and is no longer your slave.")
			getModule("NpcSlaveryModule").doFreeEnslavedCharacter(npcID)
		endScene()
		return
		
	if(_action == "release_slave"):
		#var npcSlavery:NpcSlave = npc.getNpcSlavery()
		#npcSlavery.setMainSkill(_args[0])
		#setState("")
		#addMessage("Main skill changed!")
		#return
		var returnedItems = npc.getInventory().getEquippedItemsWithTag(ItemTag.ReturnsToPCIfSlaveReleased)
		for theItem in returnedItems:
			npc.getInventory().removeEquippedItem(theItem)
			GM.pc.getInventory().addItem(theItem)
			addMessage("You recovered "+theItem.getAStackName())
		
	setState(_action)


func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID

	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	npc = GlobalRegistry.getCharacter(npcID)
