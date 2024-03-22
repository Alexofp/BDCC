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
	
	var deservesPunishment = false
	
	if(npcSlavery.getDespair() > 0.8):
		text += "{npc.HeShe} continues with {npc.his} current activity of staring at a blank wall, as if your words had little impact."
	elif(npcSlavery.getSpoiling() > 0.7):
		text += "{npc.HeShe} smirks, reveling in the excessive praise."
	elif(npcSlavery.isResistingSuperActively()):
		if(RNG.chance(10 + npcSlavery.personalityScore({PersonalityStat.Mean:1.0})*10.0)):
			text += "A flicker of discomfort crosses {npc.his} face before {npc.heShe} rolls {npc.his} eyes."
			text += "\n\n[say=npc]"+RNG.pick(["Screw you.", "Fuck you.", "Whatever."])+"[/say]"
				
			if(character.isGagged()):
				text += "\n\n[say=pc]What was that?[/say]"
				
				text += "\n\n{npc.He} stays quiet, refusing to repeat it. Looks like the gag saved your slave from a punishment."
			else:
				text += "\n\nWow. You're trying to praise your slave but {npc.he} {npc.isAre} being all rude about it."
				
				deservesPunishment = true
		else:
			text += "A flicker of discomfort crosses {npc.his} face before {npc.heShe} rolls {npc.his} eyes."
	elif(npcSlavery.isActivelyResisting()):
		text += "{npc.HeShe} nods briefly, seemingly unfazed by your praise."
	elif(npcSlavery.rewardBalance <= 0):
		text += "{npc.HeShe} smiles hesitantly, clearly confused but accepting the unexpected praise."
	elif(npcSlavery.getObedience() > 0.5 || npcSlavery.getLove() > 0.5 || npcSlavery.getBrokenSpirit() > 0.5):
		text += "{npc.HeShe} smiles warmly, appreciating the recognition. Your praise seems to resonate with {npc.him}."
	else:
		text += "{npc.HeShe} gives a slow, hesitant nod, acknowledging your praise with a hint of reservation."
	
	npcSlavery.handleReward(1)
	if(deservesPunishment):
		text += "\n\nYour slave earned {npc.himself} a punishment.. right after getting rewarded."
		npcSlavery.deservesPunishment(1)
	return {
		text = text,
	}
