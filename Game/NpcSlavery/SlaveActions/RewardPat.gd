extends SlaveActionBase

func _init():
	id = "RewardPat"
	actionType = Reward
	#extraSlaves = {}
	#sceneID = ""
	slaveResistChanceMult = 0.3
	
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
	
	if(npcSlavery.getDespair() > 0.8):
		text += "{npc.HeShe} allows the pats to happen but with a distant expression. A subtle sadness lingers in {npc.his} eyes."
	elif(npcSlavery.getSpoiling() > 0.7):
		text += "{npc.HeShe} leans into the pats and then actively seeks out more, a smug aura of entitlement surrounding {npc.him}."
	elif(npcSlavery.isResistingSuperActively() && !character.hasBoundArms()):
		text += "{npc.HeShe} swats your hand away after a single pat, eyes blazing with defiance."
	elif(npcSlavery.isResistingSuperActively()):
		text += "{npc.HeShe} avoids your pats like it's fire, {npc.his} eyes blazing with defiance."
	elif(npcSlavery.isActivelyResisting()):
		text += "{npc.HeShe} grumbles and keeps tilting {npc.his} head away from your hand."
	elif(npcSlavery.rewardBalance <= 0):
		text += "{npc.HeShe} blinks, a puzzled expression crossing {npc.his} face. The headpats seem to have caught {npc.him} off guard."
	elif(npcSlavery.getObedience() > 0.5 || npcSlavery.getLove() > 0.5 || npcSlavery.getBrokenSpirit() > 0.5):
		text += "{npc.HeShe} leans into your touch, eyes closing with contentment. A soft sigh escapes {npc.his} lips, welcoming the comfort of the affectionate gesture."
	else:
		text += "{npc.HeShe} stiffens slightly but doesn't pull away."
	
	
	npcSlavery.handleReward(2)
	return {
		text = text,
	}
