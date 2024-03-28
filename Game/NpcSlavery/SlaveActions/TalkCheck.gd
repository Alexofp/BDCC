extends SlaveActionBase

func _init():
	id = "TalkCheck"
	actionType = Talk
	#extraSlaves = {}
	#sceneID = ""
	slaveResistChanceMult = 0.0

func getVisibleName():
	return "Check on slave"

func getVisibleDesc():
	return "Ask them how they feel"

func doActionSimple(_slaveID, _extraSlavesIDs = {}):
	var npcSlavery = getSlave(_slaveID)
	
	var theTexts = []
	theTexts.append("You ask {npc.name} what's on {npc.his} mind.")
	
	var slaveWords = []
	if(npcSlavery.isMindBroken()):
		slaveWords.append(RNG.pick([
			"...",
			"... ..",
			"... .. h..",
			"... nothing..",
			]))
	elif(npcSlavery.isResistingSuperActively()):
		if(npcSlavery.personalityScore({PersonalityStat.Mean: 1.0}) > 0.3):
			slaveWords.append(RNG.pick([
				"Fuck you, I won't tell you shit. Let me go now!",
				]))
			
			if(npcSlavery.getUnhappinessEscapeChance() > 0.0):
				slaveWords.append(RNG.pick([
					"I'm escaping this shithole the moment I can!",
					]))
		else:
			slaveWords.append(RNG.pick([
				"I don't want to be here. Don't touch me. Let me go..",
				]))
				
			if(npcSlavery.getUnhappinessEscapeChance() > 0.0):
				slaveWords.append(RNG.pick([
					"I'm not happy to be here. I will escape the moment I can..",
					]))
	else:
		var obedience = npcSlavery.getObedience()
		var brokenSpirit = npcSlavery.getBrokenSpirit()
		var love = npcSlavery.getLove()
		
		var awareness = npcSlavery.getAwareness()
		var trust = npcSlavery.getTrust()
		var despair = npcSlavery.getDespair()
		
		var spoiling = npcSlavery.getSpoiling()
		var fear = npcSlavery.getFear()
		
		var neediness = npcSlavery.getNeediness() # Value from 0.0 to 100.0
		
		if(!npcSlavery.isActivelyResisting()):
			if(awareness >= 0.8):
				slaveWords.append(RNG.pick([
					"You are my {npc.pcOwner}. And I'm nothing but a slave.. Your slave.",
					]))
			elif(awareness >= 0.6):
				slaveWords.append(RNG.pick([
					"I understand that.. I guess I'm a slave now.. In a prison full of other slaves..",
					]))
			elif(awareness >= 0.4):
				slaveWords.append(RNG.pick([
					"I guess I gotta treat you like you're my {npc.pcOwner}? I don't exactly know how..",
					]))
			elif(awareness >= 0.2):
				slaveWords.append(RNG.pick([
					"I understand my position more or less.. I still hope that you will just let me go.",
					]))
		
		if(obedience < 0.2 && brokenSpirit < 0.2 && love < 0.2):
			slaveWords.append(RNG.pick([
				"Why did you kidnap me into your cell?",
				]))
		else:
			if(obedience >= brokenSpirit && obedience >= love):
				# Obedience
				if(obedience <= 0.4):
					slaveWords.append(RNG.pick([
						"I should listen you more, I guess.",
						]))
				elif(obedience <= 0.6):
					slaveWords.append(RNG.pick([
						"I'm trying to obey you. Hope I'm doing well..",
						]))
				elif(obedience <= 0.8):
					slaveWords.append(RNG.pick([
						"If you want me to do something, just say the word, {npc.pcOwner}.",
						]))
				else:
					slaveWords.append(RNG.pick([
						"Obeying you is my purpose..",
						]))
			elif(brokenSpirit >= love):
				# Broken spirit
				if(brokenSpirit <= 0.4):
					slaveWords.append(RNG.pick([
						"I'm tough. You can't break me that easy.",
						]))
				elif(brokenSpirit <= 0.6):
					slaveWords.append(RNG.pick([
						"You've been doing some rough things to me..",
						]))
				elif(brokenSpirit <= 0.8):
					slaveWords.append(RNG.pick([
						"If I submit to you, will you stop torturing me?..",
						]))
				else:
					slaveWords.append(RNG.pick([
						"I'm ready to say and do anything, {npc.pcOwner}..",
						]))
			else:
				# Love
				if(love <= 0.4):
					slaveWords.append(RNG.pick([
						"I kinda like you..",
						]))
				elif(love <= 0.8):
					slaveWords.append(RNG.pick([
						"I think.. I'm falling in love with my kidnapper..",
						]))
				else:
					slaveWords.append(RNG.pick([
						"I love you so much.. I can't live without you anymore, {npc.pcOwner}.",
						]))
		
		if(trust > 0.01 && trust <= 0.1):
			slaveWords.append(RNG.pick([
				"I don't trust you.. Not one bit.",
				]))
		elif(trust <= 0.3):
			slaveWords.append(RNG.pick([
				"I don't trust you. How can I..",
				]))
		elif(trust <= 0.5):
			slaveWords.append(RNG.pick([
				"You're being pretty fair with me..",
				]))
		elif(trust <= 0.7):
			slaveWords.append(RNG.pick([
				"You have been treating me fairly so far.",
				]))
		else:
			slaveWords.append(RNG.pick([
				"I don't know why but you've been very fair with me.",
				]))
		
		if(despair <= 0.1):
			pass
		elif(despair <= 0.2):
			slaveWords.append(RNG.pick([
				"You're being pretty harsh with me..",
				]))
		elif(despair <= 0.4):
			slaveWords.append(RNG.pick([
				"Why are you doing this to me..",
				]))
		elif(despair <= 0.6):
			slaveWords.append(RNG.pick([
				"I feel awful.. Is that what you wanted? You want to break me, don't you?",
				]))
		elif(despair <= 0.8):
			slaveWords.append(RNG.pick([
				"I hate these chains. I hate what you have been doing to me. I hate this life.. When will it stop..",
				]))
		else:
			slaveWords.append(RNG.pick([
				"I hate myself.. I think I should just end it all already..",
				]))
		
		if(despair <= 0.4):
			if(spoiling >= 0.7):
				slaveWords.append(RNG.pick([
					"You're so generous, keep it up~",
					]))
			elif(spoiling >= 0.3):
				slaveWords.append(RNG.pick([
					"I like when you reward me. Could you do that more?",
					]))
		
		if(fear <= 0.2):
			slaveWords.append(RNG.pick([
				"I'm not afraid of you.",
				]))
		elif(fear <= 0.4):
			slaveWords.append(RNG.pick([
				"I'm not scared.. that much.",
				]))
		elif(fear <= 0.6):
			slaveWords.append(RNG.pick([
				"You've been fast to punish me. Ugh..",
				]))
		else:
			slaveWords.append(RNG.pick([
				"I will do anything. Just don't hurt me..",
				]))
				
		if(npcSlavery.getUnhappinessEscapeChance() > 5.0):
			slaveWords.append(RNG.pick([
				"I'm not happy to be here. Especially after everything you did to me.",
				]))
				
		if(neediness >= 70.0):
			slaveWords.append(RNG.pick([
				"I will do anything, just let me cum, ple-e-ease!.. I feel like I'm about to break..",
				]))
		elif(neediness >= 50.0):
			slaveWords.append(RNG.pick([
				"I so fucking horny, you can't even imagine it. Just let me cum already! Stop denying me!",
				]))
		elif(neediness >= 25.0):
			slaveWords.append(RNG.pick([
				"I can't remember when was the last day that I came.. I so want to cum.. Please?",
				]))
		elif(neediness >= 10.0):
			slaveWords.append(RNG.pick([
				"I want to cum so much..",
				]))
		elif(neediness >= 2.0):
			slaveWords.append(RNG.pick([
				"I'm feeling a little horny.",
				]))

	var isFirst = true
	var processedWords = []
	for slaveWord in slaveWords:
		if(!isFirst):
			processedWords.append(RNG.pick([
				"{npc.He} thinks a little and adds..",
				"{npc.He} stays quiet for a bit and then adds..",
				"{npc.He} then adds..",
				"{npc.He} then explains..",
				"{npc.He} thinks for a bit..",
			]))
		processedWords.append("[say=npc]"+slaveWord+"[/say]")
		
		isFirst = false
	theTexts.append_array(processedWords)

	return {
		text = Util.join(theTexts, "\n\n"),
	}


func getExtraActions(_slaveID, _extraSlavesIDs = {}):
	return [
		{
			name = "Release slave",
			desc = "Free your slave and let them leave your cell",
			sceneID = "ActionSlaveryFreeSlaveScene",
			args = [],
			buttonChecks = [],
		}
	]
