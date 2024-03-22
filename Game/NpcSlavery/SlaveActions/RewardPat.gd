extends SlaveActionBase

func _init():
	id = "RewardPat"
	actionType = Reward
	#extraSlaves = {}
	#sceneID = ""
	slaveResistChanceMult = 0.0
	
	buttonPriority = 80
	rewardHint = 2

func getVisibleName():
	return "Headpats"

func getVisibleDesc():
	return "Give your slave a pat on the head"

func doActionSimple(_slaveID, _extraSlavesIDs = {}):
	var character:DynamicCharacter = GlobalRegistry.getCharacter(_slaveID)
	var npcSlavery:NpcSlave = character.getNpcSlavery()
	
	var text = "You offer {npc.name} a few soothing headpats for {npc.his} efforts.\n\n"
	
	var deservesPunishment = false
	
	if(npcSlavery.getDespair() > 0.8):
		text += "{npc.HeShe} allows the pats to happen but with a distant expression. A subtle sadness lingers in {npc.his} eyes."
	elif(npcSlavery.getSpoiling() > 0.7):
		text += "{npc.HeShe} leans into the pats and then actively seeks out more, a smug aura of entitlement surrounding {npc.him}."
	elif(npcSlavery.isResistingSuperActively() && !character.hasBoundArms()):
		if(RNG.chance(15 + npcSlavery.personalityScore({PersonalityStat.Mean:1.0})*20.0)):
			text += "{npc.HeShe} swats your hand away after a single pat, eyes blazing with defiance. Wow! That deserves a small punishment!"
			deservesPunishment = true
		else:
			text += "{npc.HeShe} endures the pats but {npc.his} eyes are blazing with defiance."
	elif(npcSlavery.isResistingSuperActively()):
		text += "{npc.HeShe} avoids your pats like it's fire, {npc.his} eyes blazing with defiance."
	elif(npcSlavery.isActivelyResisting()):
		if(RNG.chance(15 + npcSlavery.personalityScore({PersonalityStat.Mean:1.0})*20.0)):
			text += "{npc.HeShe} grumbles and keeps tilting {npc.his} head away from your hand. Kinda rude. That deserves a small punishment!"
			deservesPunishment = true
		else:
			text += "{npc.HeShe} endures the pats but {npc.his} eyes are blazing with defiance."
		
	elif(npcSlavery.rewardBalance <= 0):
		text += "{npc.HeShe} blinks, a puzzled expression crossing {npc.his} face. The headpats seem to have caught {npc.him} off guard."
	elif(npcSlavery.getObedience() > 0.5 || npcSlavery.getLove() > 0.5 || npcSlavery.getBrokenSpirit() > 0.5):
		text += "{npc.HeShe} leans into your touch, eyes closing with contentment. A soft sigh escapes {npc.his} lips, welcoming the comfort of the affectionate gesture."
	else:
		text += "{npc.HeShe} stiffens slightly but doesn't pull away."
	
	npcSlavery.handleReward(2)
	if(deservesPunishment):
		text += "\n\nYour slave earned {npc.himself} a punishment.. right after getting rewarded."
		npcSlavery.deservesPunishment(1)
	return {
		text = text,
	}

func getAnimationInfo(_slaveID, _extraSlavesIDs = {}):
	return [StageScene.Grope, "pat", {npc="pc", pc=_slaveID}]
