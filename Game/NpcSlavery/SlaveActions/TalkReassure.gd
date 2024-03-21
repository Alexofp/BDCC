extends SlaveActionBase

func _init():
	id = "TalkReassure"
	actionType = Talk
	#extraSlaves = {}
	#sceneID = ""
	slaveResistChanceMult = 0.0
	buttonPriority = 40

func getVisibleName():
	return "Reassure"

func getVisibleDesc():
	return "Offer words of comfort and reassurance to your slave"

func doActionSimple(_slaveID, _extraSlavesIDs = {}):
	var npcSlavery = getSlave(_slaveID)
	
	var theTexts = []
	theTexts.append("You offer words of reassurance to {npc.name}, ensuring {npc.him} that everything will be okay. Your goal is to ease any fears and provide comfort.")
	
	if(npcSlavery.isMindBroken()):
		theTexts.append("{npc.He} just stares blankly at you..")
	elif(npcSlavery.getTalkedTimesToday() >= 2):
		theTexts.append("It didn't have much effect on {npc.him}. {npc.He} heard you too many times today already.")
	elif(npcSlavery.getWorkEfficiency() <= 0.11):
		theTexts.append("{npc.He} {npc.isAre} too tired to fully understand your words, {npc.he} barely stands on {npc.his} feet already.")
	else:
		var awareness = npcSlavery.getAwareness()
		var despair = npcSlavery.getDespair()
		var love = npcSlavery.getLove()
		var obedience = npcSlavery.getObedience()
		var spoiling = npcSlavery.getSpoiling()
		var brokenspirit = npcSlavery.getBrokenSpirit()
		var wasAfraid = false
		
		if(npcSlavery.getFear() > 40):
			wasAfraid = true
			npcSlavery.addFear(-50)
			npcSlavery.addSpoiling(-0.05)
			npcSlavery.addDespair(-0.07)
			npcSlavery.addObedience(0.1)
			npcSlavery.addBrokenSpirit(-0.05)
			npcSlavery.addTrust(0.05)
		else:
			npcSlavery.addFear(-30)
			npcSlavery.addSpoiling(0.05)
			npcSlavery.addDespair(-0.07)
			npcSlavery.addObedience(-0.02)
			npcSlavery.addBrokenSpirit(-0.02)
			npcSlavery.addTrust(0.01)
			npcSlavery.addLove(0.04)
		
		if(despair > 0.8):
			theTexts.append("[say=npc]"+RNG.pick([
				"Okay..",
				"Mhm.. okay..",
				"..sorry..",
				"..mhm..",
				"..right..",
				"Uh huh..",
			])+"[/say]")
		elif(spoiling > 0.5):
			if(wasAfraid):
				theTexts.append("[say=npc]"+RNG.pick([
					"You had me scared there! Glad you're spoiling me again~.",
					"Oh? You're gonna stop being silly and pat me more?",
					"Next time don't leave me so scared, can you imagine what I went through?!",
					"I'm glad you changed your mind. Now pat me!",
				])+"[/say]")
			else:
				theTexts.append("[say=npc]"+RNG.pick([
					"Aww, thank you. That's sweet.",
					"You always know how to make me feel better!",
					"I'm lucky to have you.",
					"You are always spoiling me, hehe.",
				])+"[/say]")
		elif(obedience > 0.9 || brokenspirit > 0.9):
			theTexts.append("[say=npc]"+RNG.pick([
				"I will do my best..",
				"Your words mean a lot to me. I'll try harder.",
				"I appreciate your support. I won't let you down..",
			])+"[/say]")
		elif(obedience < 0.3 && brokenspirit < 0.3 && love < 0.3):
			if(wasAfraid):
				if(npcSlavery.personalityScore({PersonalityStat.Mean:1.0}) > 0.2):
					theTexts.append("[say=npc]"+RNG.pick([
						"Really? After everything you did? I don't trust you.",
						"Yeah, thanks a lot, fuckface.",
						"Uh huh, keep saying that.",
						"Why should I trust you?",
					])+"[/say]")
				elif(awareness > 0.7):
					theTexts.append("[say=npc]"+RNG.pick([
						"Thank you, your words helped to calm me down.",
						"Oh?.. Right, thank you for the kind words..",
						"I needed to hear that, thank you.."
					])+"[/say]")
				else:
					theTexts.append("[say=npc]"+RNG.pick([
						"That's a nice change of pace. I appreciate it.",
						"I was scared there. Thanks for being understanding.",
						"I guess I should calm down.",
					])+"[/say]")
			else:
				if(npcSlavery.personalityScore({PersonalityStat.Mean:1.0}) > 0.2):
					theTexts.append("[say=npc]"+RNG.pick([
						"Why don't you just let me go rather than saying all that?",
						"Thanks. Can I go maybe?",
						"I appreciate your words but I'm not your slave, let me go.",
					])+"[/say]")
				elif(awareness > 0.7):
					theTexts.append("[say=npc]"+RNG.pick([
						"Thank you..",
						"I'll try harder.. It's not like I'm getting out of here anytime soon..",
					])+"[/say]")
				else:
					theTexts.append("[say=npc]"+RNG.pick([
						"I appreciate the reassurance.",
						"It means a lot to hear that.",
						"Thanks for being understanding.",
					])+"[/say]")
			
		elif(despair > 0.4):
			if(wasAfraid):
				theTexts.append("[say=npc]"+RNG.pick([
					"I really needed to hear that. Thank you..",
					"Your words are helping, thank you..",
					"It's hard to stay positive..",
					"You're not gonna hurt me?..",
				])+"[/say]")
			else:
				theTexts.append("[say=npc]"+RNG.pick([
					"Thank you..",
					"Your words are helping, thank you..",
					"I'll try to stay positive..",
					"But you're gonna hurt me if I fuck up, right?..",
				])+"[/say]")
		else:
			if(wasAfraid):
				theTexts.append("[say=npc]"+RNG.pick([
					"Thank you for the kind words.",
					"I will try to calm down.",
				])+"[/say]")
			else:
				theTexts.append("[say=npc]"+RNG.pick([
					"Thank you for the kind words, I guess.",
					"I hear you, thanks.",
				])+"[/say]")
		
		if(wasAfraid):
			theTexts.append("Your words calmed {npc.him} down and had a good effect.")
		else:
			theTexts.append("Your words had some effect on {npc.him}.")
		
		var enemyLustInterests = npcSlavery.getChar().getLustInterests()
		if(enemyLustInterests.learnRandomInterest()):
			theTexts.append("You also learned one of {npc.his} likes/dislikes while doing this.")
			
	npcSlavery.didTalkWithToday()
	return {
		text = Util.join(theTexts, "\n\n"),
	}
