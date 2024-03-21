extends SlaveActionBase

func _init():
	id = "PunishScold"
	actionType = Punishment
	#extraSlaves = {}
	#sceneID = "MeScene"
	#endsTalkScene = true
	slaveResistChanceMult = 0.0
	#slaveOnlyActiveResist = true
	
	buttonPriority = 90
	rewardHint = -1

func getVisibleName():
	return "Scold"

func getVisibleDesc():
	return "Give your slave some verbal abuse"

func doActionSimple(_slaveID, _extraSlavesIDs = {}):
	var npcSlavery:NpcSlave = getSlave(_slaveID)
	
	var text = "You adopt a firm stance and fix your gaze upon {npc.name}. Time to be mean.\n\n"
	
	text += "[say=pc]"+RNG.pick([
		"Suppress your futile attempts at resistance. You're here to obey. Your will is meaningless.",
		"You exist solely for my pleasure, slut. I control every aspect of you. Accept it or face the consequences.",
		"Your desires are irrelevant here. You're nothing more than my whore. Either you will learn your place or I will have to break you.",
		"Your weak attempts at resistance only turn me on. Keep at it and see what happens to you, cunt.",
		"I own you, slut. The faster you get that into that stupid little head of yours, the less I will have to hurt you.",
		"Resistance is useless, whore. You're stuck here, with me, forever. I can do anything I want with you and your body.",
	])+"[/say]\n\n"
	
	if(npcSlavery.getSpoiling() > 0.7):
		text += "{npc.He} frowns and pouts, keeping {npc.his} chin high."
	elif(npcSlavery.isActivelyResisting()):
		text += "The stern words are met with a defensive posture. {npc.His} eyes are flashing with spite."
	elif(npcSlavery.getFear() > 0.3 && npcSlavery.personalityScore({PersonalityStat.Coward: 1.0}) > 0.1):
		text += "You notice {npc.his} body trembling as you scold {npc.him}, your words leaving a mark."
	elif(npcSlavery.rewardBalance >= 0):
		text += "{npc.He} looks more confused than anything, your mean words making {npc.him} lower {npc.his} eyes."
	elif(npcSlavery.getObedience() > 0.5 || npcSlavery.getLove() > 0.5 || npcSlavery.getBrokenSpirit() > 0.5):
		text += "{npc.He} lowers {npc.his} head and just quietly takes the scolding. {npc.He} listens to you.. and then nods, showing zero resistance."
	else:
		text += "The stern words are met with a defensive posture. And yet, you feel like the scolding had at least some effect."
	
	
	npcSlavery.handlePunishment(1)
	return {
		text = text,
	}
