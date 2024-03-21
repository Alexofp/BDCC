extends SlaveActionBase

func _init():
	id = "TalkIntimidate"
	actionType = Talk
	#extraSlaves = {}
	#sceneID = ""
	slaveResistChanceMult = 0.0
	buttonPriority = 50

func getVisibleName():
	return "Intimidate"

func getVisibleDesc():
	return "Threaten your slave to make them obey better"

func doActionSimple(_slaveID, _extraSlavesIDs = {}):
	var npcSlavery = getSlave(_slaveID)
	
	var theTexts = []
	theTexts.append("With a menacing tone, you make it clear to {npc.name} that resistance is futile. {npc.HeShe} {npc.isAre} now under your complete control, and defiance will not be tolerated.")
	
	if(npcSlavery.isMindBroken()):
		theTexts.append("{npc.He} just stares blankly at you..")
	elif(npcSlavery.getTalkedTimesToday() >= 2):
		theTexts.append("It didn't have much effect on {npc.him}. {npc.He} heard you too many times today already.")
	elif(npcSlavery.getWorkEfficiency() <= 0.11):
		theTexts.append("{npc.He} {npc.isAre} too tired to fully understand your words, {npc.he} barely stands on {npc.his} feet already.")
	elif(npcSlavery.getFear() >= 80):
		theTexts.append("{npc.He} {npc.isAre} too scared already for your words to have any effect.")
	
		npcSlavery.addTired(0.3)
	else:
		var awareness = npcSlavery.getAwareness()
		var despair = npcSlavery.getDespair()
		var love = npcSlavery.getLove()
		var obedience = npcSlavery.getObedience()
		var spoiling = npcSlavery.getSpoiling()
		var brokenspirit = npcSlavery.getBrokenSpirit()
		
		npcSlavery.addFear(30)
		
		npcSlavery.addSpoiling(-0.1)
		npcSlavery.addDespair(0.07)
		npcSlavery.addTired(0.3)
		npcSlavery.addObedience(0.05)
		npcSlavery.addTrust(-0.1)
		npcSlavery.addBrokenSpirit(0.01)
		
		if(despair > 0.8):
			theTexts.append("[say=npc]"+RNG.pick([
				"Okay..",
				"You might as well just do whatever you wanted to do..",
				"Why don't you just do it then.. Get it over with..",
				"Mhm.. okay..",
				"..sorry..",
				"..mhm..",
				"..right..",
			])+"[/say]")
		elif(spoiling > 0.5):
			theTexts.append("[say=npc]"+RNG.pick([
				"Really? But we were doing so well, why are you being so mean now..",
				"Why so mean now..",
				"So mean..",
				"Too mean!..",
				"Okay, okay, whatever, relax..",
				"Wow, I didn't know the rules were so strict..",
			])+"[/say]")
		elif(obedience > 0.9 || brokenspirit > 0.9):
			theTexts.append("[say=npc]"+RNG.pick([
				"I will obey without question. Please, spare me..",
				"I will do anything you want, please.. I'm sorry.",
				"Tell me what I should do and I will do it, sorry..",
			])+"[/say]")
		elif(obedience < 0.3 && brokenspirit < 0.3 && love < 0.3):
			if(npcSlavery.personalityScore({PersonalityStat.Mean:1.0}) > 0.2 && npcSlavery.getFear() < 0.4):
				theTexts.append("[say=npc]"+RNG.pick([
					"Fuck you, okay? I'm not afraid.",
					"Bring it on, fucker, I will wreck you.",
					"I won't bow to threats, do your worst, bitch.",
					"I won't break, I can endure anything you throw my way.",
					"Put your money where your mouth is, fucker.",
					"You can't keep me here forever.",
				])+"[/say]")
			elif(awareness > 0.7):
				theTexts.append("[say=npc]"+RNG.pick([
					"I'm very sorry, I will try better. Please..",
					"I know I'm gonna be here for a while.. I will try, please..",
				])+"[/say]")
			else:
				theTexts.append("[say=npc]"+RNG.pick([
					"Just let me go.",
					"Why don't you just let me go?",
					"Sorry, I'm not even supposed to be here..",
				])+"[/say]")
			
		elif(despair > 0.4):
			theTexts.append("[say=npc]"+RNG.pick([
				"Sorry, okay? I'm stressed out enough already..",
				"I will try better, don't hurt me..",
				"I'm trying my best here..",
				"Don't hurt me..",
			])+"[/say]")
		else:
			theTexts.append("[say=npc]"+RNG.pick([
				"Okay, okay, I hear you.",
				"No need for violence, I hear you.",
			])+"[/say]")
		
		theTexts.append("Your words had some effect on {npc.him}.")
		
		var enemyLustInterests = npcSlavery.getChar().getLustInterests()
		if(enemyLustInterests.learnRandomInterest()):
			theTexts.append("You also learned one of {npc.his} likes/dislikes while doing this.")
		
	npcSlavery.didTalkWithToday()
	return {
		text = Util.join(theTexts, "\n\n"),
	}
