extends SlaveActionBase

func _init():
	id = "PunishSpank"
	actionType = Punishment
	#extraSlaves = {}
	#sceneID = "MeScene"
	#endsTalkScene = true
	slaveResistChanceMult = 1.0
	slaveOnlyActiveResist = true
	
	buttonPriority = 80
	rewardHint = -2

func getVisibleName():
	return "Spank"

func getVisibleDesc():
	return "Give your slave a good spank"

func doActionSimple(_slaveID, _extraSlavesIDs = {}):
	var npcSlavery:NpcSlave = getSlave(_slaveID)
	
	var text = "Annoyed with your slave, you bring {npc.him} down to all fours and then deliver a series of firm spanks to {npc.his} {npc.thick} butt!\n\n"
	
	if(npcSlavery.getSpoiling() > 0.7):
		text += "{npc.He} gasps and complains audibly while also trying to protect {npc.his} rear with {npc.his} hands.. just to get them slapped too."
	elif(npcSlavery.isActivelyResisting()):
		text += "Each spank is met with active resistance as {npc.heShe} attempts to evade the punishment. Even though {npc.he} {npc.isAre} trying to fight back, you still manage to get a few good impacts in."
	elif(npcSlavery.getFear() > 0.6 && npcSlavery.personalityScore({PersonalityStat.Coward: 1.0}) > 0.1):
		text += "Fear clouds {npc.his} eyes as each spank lands, making {npc.him} compliant but anxious, {npc.heShe} visibly trembles after each impact."
	elif(npcSlavery.rewardBalance >= 0):
		text += "Each spank is met with noises of confusion and frustration, {npc.name} is doing {npc.his} best to endure the unfair punishment."
	elif(npcSlavery.getObedience() > 0.5 || npcSlavery.getLove() > 0.5 || npcSlavery.getBrokenSpirit() > 0.5):
		text += "{npc.HeShe} submits willingly, absorbing each spank with a quiet acceptance. Eyes downcast, butt sticked out high, each impact forcing a stiffled noise out of {npc.him}."
	else:
		text += "Each spank is met with a stiffled grunt, {npc.name} squirming uncomfortably. Hopefully it will be a good leasson for {npc.him}."
	
	text += "\n\nBy the end of the punishment, {npc.his} ass receives a nice warm red tint to it."
	
	npcSlavery.handlePunishment(2)
	return {
		text = text,
	}

func getAnimationInfo(_slaveID, _extraSlavesIDs = {}):
	return [StageScene.Spanking, "spankonce", {pc="pc", npc=_slaveID}]
