extends SlaveActionBase

func _init():
	id = "RewardPraise"
	actionType = Reward
	#extraSlaves = {}
	#sceneID = ""
	slaveResistChanceMult = 0.0
	
	buttonPriority = 90
	rewardHint = 1

func getVisibleName():
	return "Praise"

func getVisibleDesc():
	return "Tell your slave that they are doing quite good."

func doActionSimple(_slaveID, _extraSlavesIDs = {}):
	var character:DynamicCharacter = GlobalRegistry.getCharacter(_slaveID)
	var npcSlavery:NpcSlave = character.getNpcSlavery()
	
	var text = "You gently praise your slave, acknowledging {npc.his} obedience and good behavior.\n\n"
	
	text += RNG.pick([
		"[say=pc]Good job.[/say]",
		"[say=pc]Keep it up.[/say]",
		"[say=pc]I like what I'm seeing so far.[/say]",
		"[say=pc]Nice job.[/say]",
		"[say=pc]You did well. Keep it up.[/say]",
		"[say=pc]You did well.[/say]",
		"[say=pc]Not bad.[/say]",
	])
	
	text += "\n\n"
	
	if(npcSlavery.getDespair() > 0.8):
		text += "{npc.HeShe} continues with {npc.his} current activity of staring at a blank wall, as if your words had little impact."
	elif(npcSlavery.getSpoiling() > 0.7):
		text += "{npc.HeShe} smirks, reveling in the excessive praise."
	elif(npcSlavery.isResistingSuperActively()):
		text += "A flicker of discomfort crosses {npc.his} face, and {npc.heShe} averts {npc.his} gaze."
	elif(npcSlavery.isActivelyResisting()):
		text += "{npc.HeShe} nods briefly, seemingly unfazed by your praise."
	elif(npcSlavery.rewardBalance <= 0):
		text += "{npc.HeShe} smiles hesitantly, clearly confused but accepting the unexpected praise."
	elif(npcSlavery.getObedience() > 0.5 || npcSlavery.getLove() > 0.5 || npcSlavery.getBrokenSpirit() > 0.5):
		text += "{npc.HeShe} smiles warmly, appreciating the recognition. Your praise seems to resonate with {npc.him}."
	else:
		text += "{npc.HeShe} gives a slow, hesitant nod, acknowledging your praise with a hint of reservation."
	
	npcSlavery.handleReward(1)
	return {
		text = text,
	}
