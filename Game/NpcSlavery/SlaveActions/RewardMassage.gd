extends SlaveActionBase

func _init():
	id = "RewardMassage"
	actionType = Reward
	#extraSlaves = {}
	#sceneID = ""
	slaveResistChanceMult = 1.0
	slaveOnlyActiveResist = true
	
	buttonPriority = 70
	rewardHint = 3

func getVisibleName():
	return "Massage"

func getVisibleDesc():
	return "Give your slave a back massage as a reward"

func doActionSimple(_slaveID, _extraSlavesIDs = {}):
	var character:DynamicCharacter = GlobalRegistry.getCharacter(_slaveID)
	var npcSlavery:NpcSlave = character.getNpcSlavery()
	
	var text = "You instruct {npc.name} to lie down and then give {npc.him} a gentle, back massage, a big reward for {npc.his} efforts.\n\n"
	
	if(npcSlavery.getDespair() > 0.8):
		text += "{npc.HeShe} remains passive, showing no interest in the massage. Or anything really.."
	elif(npcSlavery.getSpoiling() > 0.7):
		text += "As you massage, {npc.heShe} points out flaws and insists on adjustments, expecting a perfect experience."
	elif(npcSlavery.isResistingSuperActively() && !character.hasBoundArms()):
		text += "{npc.HeShe} tenses up under your touch. Eventually you hear an audible sigh of irritation followed by {npc.him} pulling away abruptly."
	elif(npcSlavery.isResistingSuperActively()):
		text += "{npc.HeShe} tenses up under your touch. Eventually you hear an audible sigh of irritation followed by {npc.him} trying to pull away. The restraints keep {npc.him} still for you though."
	elif(npcSlavery.isActivelyResisting()):
		text += "Though initially resistant, {npc.his} rigid posture gradually softens under your touch. {npc.HeShe} doesn't protest, but a subtle tension remains."
	elif(npcSlavery.rewardBalance <= 0):
		text += "Despite being confused, {npc.heShe} expresses gratitude for the massage, offering a soft smile."
	elif(npcSlavery.getObedience() > 0.5 || npcSlavery.getLove() > 0.5 || npcSlavery.getBrokenSpirit() > 0.5):
		text += "Closing {npc.his} eyes, {npc.heShe} leans into your touch, appreciating the tenderness of the massage. A soft sigh escapes {npc.him}, expressing gratitude for the moment of care."
	else:
		text += "{npc.HeShe} remains indifferent to the massage, neither resisting nor welcoming the touch."
	
	npcSlavery.handleReward(3)
	npcSlavery.addTired(-0.8)
	return {
		text = text,
	}

func getAnimationInfo(_slaveID, _extraSlavesIDs = {}):
	return [StageScene.Massage, "back", {pc="pc", npc=_slaveID, npcBodyState={naked=true}}]

func getTimePass(_slaveID, _extraSlavesIDs = {}):
	return 60*25
