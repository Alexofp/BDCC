extends "res://Scenes/SceneBase.gd"

var npcID = ""
var sawBefore = false
var npcVariation = ""
var triedToScam = false
var amountStole:int = 0
var amountRequested:int = 0

func _init():
	sceneID = "InmateExposureProstitutionScene"

func _initScene(_args = []):
	npcID = _args[0]
	var npc = GlobalRegistry.getCharacter(npcID)
	
	if(npc.getFlag(CharacterFlag.Introduced)):
		sawBefore = true
	else:
		npc.setFlag(CharacterFlag.Introduced, true)
	
	var personality:Personality = npc.getPersonality()
	if(personality.getStat(PersonalityStat.Mean) > 0.3 || personality.getStat(PersonalityStat.Subby) < -0.6):
		npcVariation = "mean"
	if(personality.getStat(PersonalityStat.Mean) < -0.3):
		npcVariation = "kind"
	if(personality.getStat(PersonalityStat.Subby) > 0.6 || personality.getStat(PersonalityStat.Coward) > 0.8):
		npcVariation = "subby"
	
func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _run():
	if(state == ""):
		addCharacter(npcID)
		playAnimation(StageScene.Duo, "stand", {npc=npcID})

	if(state == ""):
		saynn("You were going somewhere when your gaze catches one of the inmates posing seductively at anyone who walks past. {npc.He} catches your stare and gestures to come closer.")

		# (if didn’t saw)
		if(!sawBefore):
			saynn(RNG.pick([
				"[say=npc]Wanna have some fun? I’m offering. I’m well worth the price.[/say]",
				"[say=npc]Name is {npc.name}. Wanna fuck? Show me some creds~.[/say]",
				"[say=npc]Looking for company, new face? I can provide. For a price~.[/say]",
			]))
		else:
			saynn(RNG.pick([
				"[say=npc]Wanna have.. oh hi, familiar face. Looking to have some fun?[/say]",
				"[say=npc]Hey there. Wanna fuck? Show me some creds and I will give you a good time.[/say]",
				"[say=npc]Looking for company, sweetie? I can provide. For a price~.[/say]",
			]))

		saynn("Huh, seems like {npc.he} is a prostitute. Or maybe just trying to earn some credits.")

		# (Options are Leave, How much and Attack?)

		addButton("How much", "Ask the prostitute how much they cost", "how_much")
		addButton("Attack", "You don’t wanna pay", "attack")
		addButton("Leave", "You don’t require their services", "leave")

	if(state == "leave"):
		saynn("You tell {npc.him} that you are not interested and just leave.")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")

	if(state == "attack"):
		saynn("You take a strong pose and show your intimidating voice.")

		saynn("[say=pc]Why would I pay if I can get something for free.[/say]")

		saynn("{npc.name} gasps and takes one step back.")

		# (if mean)
		if(npcVariation == "mean"):
			saynn(RNG.pick([
				"[say=npc]You fucker. The only free thing you're gonna get is some broken bones.[/say]",
				"[say=npc]Oh fuck off, I’m not scared. I will break you in half.[/say]",
			]))
		# (if subby)
		elif(npcVariation == "subby"):
			saynn(RNG.pick([
				"[say=npc]Hey! No, that’s not how it works..[/say]",
				"[say=npc]You’re not getting me for free..[/say]",
			]))
		# (if normal or kind)
		else:
			saynn(RNG.pick([
				"[say=npc]Oh yeah? Well, try and get me.[/say]",
				"[say=npc]Good luck getting anything for free in this world.[/say]",
			]))

		saynn("Seems like it’s a fight.")

		# (fight button)
		addButton("Fight", "Start the fight", "startfight")

	if(state == "how_much"):
		saynn("You ask the inmate how much {npc.his} services cost. {npc.He} offers you a cute smile.")

		var npc = GlobalRegistry.getCharacter(npcID)
		var personality:Personality = npc.getPersonality()
		var subbyStat = personality.getStat(PersonalityStat.Subby)
		# (if npc is subby)
		if(subbyStat > 0.2):
			saynn(RNG.pick([
				"[say=npc]I can be a total sub bitch for you for just "+str(amountRequested)+" credits~.[/say]",
				"[say=npc]"+str(amountRequested)+" credits and I will be yours to do whatever you want with me~.[/say]",
				"[say=npc]Give me "+str(amountRequested)+" credits and I will be your slut~.[/say]",
			]))
			addButtonWithChecks("Agree", "Start sex as dom", "paytodom", [], [[ButtonChecks.HasCredits, amountRequested]])
			addButton("Attack", "You don’t wanna pay", "attack")
			addButton("Leave", "You don’t require their services", "leave")
			addButton("Ask to dom", "Maybe they can dom", "ask_to_dom")

		# (if npc is switch)
		elif(subbyStat >= -0.2):
			saynn(RNG.pick([
				"[say=npc]I’m a switch, give me "+str(amountRequested)+" credits and you can fuck me or allow me to fuck your precious body~.[/say]",
				"[say=npc]"+str(amountRequested)+" credits and you will be able to choose who fucks who~.[/say]",
				"[say=npc]"+str(amountRequested)+" credits for a fuck. I can top or bottom, your choice~.[/say]",
			]))
			
			addButtonWithChecks("Dom them", "Start sex as dom", "paytodom", [], [[ButtonChecks.HasCredits, amountRequested]])
			addButtonWithChecks("Sub to them", "Start sex as sub", "paytosub", [], [[ButtonChecks.HasCredits, amountRequested]])
			addButton("Attack", "You don’t wanna pay", "attack")
			addButton("Leave", "You don’t require their services", "leave")
		# (if npcs is dom)
		else:
			saynn(RNG.pick([
				"[say=npc]I can dom your ass for "+str(amountRequested)+" credits, not a credit less.[/say]",
				"[say=npc]I can fuck you for "+str(amountRequested)+" credits, cutie.[/say]",
				"[say=npc]"+str(amountRequested)+" credits. I’m a dom so I decide how we will fuck, understand?[/say]",
			]))
			addButtonWithChecks("Agree", "Start sex as sub", "paytosub", [], [[ButtonChecks.HasCredits, amountRequested]])
			addButton("Attack", "You don’t wanna pay", "attack")
			addButton("Leave", "You don’t require their services", "leave")
			addButton("Ask to sub", "Maybe they can sub", "ask_to_sub")

		# (subs get options Agree, Leave, Attack, Ask to dom)
		# (switches get options Sub to them, Dom them, Leave, Attack)
		# (doms get options Agree, Leave, Attack, Ask to sub)
		# (Agree deducts the credits and starts sex)

	if(state == "agree_mean_sometimes"):
		saynn("You agree and give {npc.him} a chip with some credits. {npc.He} looks at you with a cunning smile and puts the chip away.")

		saynn(RNG.pick([
			"[say=npc]You know what? I changed my mind. I don’t feel like fucking.[/say]",
			"[say=npc]Thank you very much. Now get lost, bitch, I changed my mind.[/say]",
			"[say=npc]You know what? I decided that I won’t fuck with you. Thanks for the creds though.[/say]",
		]))

		saynn("{npc.He} is totally trying to scam you!")

		# (Options are Attack, Just leave)

		addButton("Attack", "You can’t let them just steal your credits like that!", "attack1")
		addButton("Just leave", "Let them have it", "just_leave")

	if(state == "attack1"):
		saynn("Enraged by the unfairness of the situation, you shove the inmate back and take a fighting stance. {npc.He} staggers back and then growls at you.")

		saynn(RNG.pick([
			"[say=npc]Should have just left, fucker.[/say]",
			"[say=npc]Big mistake, bitch.[/say]",
			"[say=npc]Try me, fucker.[/say]",
		]))

		saynn("Seems like it’s a fight.")

		# (fight button. Winning recovers credits)
		addButton("Fight", "Start the fight", "startfight")

	if(state == "just_leave"):
		saynn("You tilt your head down and let {npc.him} keep your credits.")
		
		saynn(RNG.pick([
			"[say=npc]Good paypig, you would have wasted all your credits on sluts anyways.[/say]",
			"[say=npc]What a good payslut~.[/say]",
		]))

		# (scene ends)
		addButton("Continue", "Huff", "endthescene")

		addButton("Ask to dom", "Ask if they can dominate you", "ask_to_dom")

	if(state == "ask_to_dom"):
		saynn("You ask the inmate if {npc.he} can be a dominant and fuck you.")

		saynn(RNG.pick([
			"[say=npc]Uhh.. I can try? You would have to pay way more though, at least "+str(amountRequested)+" credits.[/say]",
			"[say=npc]You understand that I’m a sub, right?.. Bu-u-ut.. "+str(amountRequested)+" credits and we can try something..[/say]",
			"[say=npc]I.. I’m not.. hm.. I will do it for "+str(amountRequested)+" credits, how about that.[/say]",
		]))

		# (Options are Agree, Leave, Attack)
		addButtonWithChecks("Agree", "Start sex as sub", "paytosub", [], [[ButtonChecks.HasCredits, amountRequested]])
		addButton("Attack", "You don’t wanna pay", "attack")
		addButton("Leave", "You don’t require their services", "leave")

	if(state == "ask_to_sub"):
		saynn("You ask the inmate if {npc.he} can be subby to you and let you fuck {npc.him}.")

		saynn(RNG.pick([
			"[say=npc]Are you serious? Me? Sub to you? I won’t do it.. Unless you have at least "+str(amountRequested)+" credits.[/say]",
			"[say=npc]Bitch, I’m a dominant, I will never sub. But I can pretend for "+str(amountRequested)+" credits, how about that.[/say]",
			"[say=npc]Ugh. Fine, I can let you fuck me. But the price is higher. "+str(amountRequested)+" credits.[/say]",
		]))

		# (Options are Agree, Leave, Attack)
		addButtonWithChecks("Agree", "Start sex as dom", "paytodom", [], [[ButtonChecks.HasCredits, amountRequested]])
		addButton("Attack", "You don’t wanna pay", "attack")
		addButton("Leave", "You don’t require their services", "leave")

	if(state == "if_lost"):
		saynn("You collapse, unable to continue fighting.")

		if(npcVariation != "mean"):
			saynn("[say=npc]What did you think was gonna happen?[/say]")

		else:
			saynn("[say=npc]Know your place, bitch.[/say]")

		saynn("Since you can’t really fight {npc.him} back anymore, your only choice is to submit.")

		addButton("Get fucked", "Well, you lost", "startsexsubby")

	if(state == "if_won"):
		saynn("You pin the defeated inmate to the floor. {npc.He} doesn’t seem to struggle much.")

		saynn("[say=npc]"+RNG.pick([
			"What a slut.",
			"Ugh.. Bitch.",
			"Go fuck yourself.",
		])+"[/say]")

		addWonButton()

	if(state == "after_sex"):
		saynn("After the fun time ends, the inmate just leaves you alone.")

		# (scene ends)
		addButton("Leave", "Time to go", "endthescene")

func addWonButton():
	addButton("Leave", "Just leave before anyone else sees you", "endthescene")
	addButtonWithChecks("Sex!", "Time to fuck them!", "startsexasdom", [], [ButtonChecks.NotArmsRestrained, ButtonChecks.NotHandsBlocked, ButtonChecks.NotLegsRestrained, ButtonChecks.NotOralBlocked])
	addButton("Submit to", "Let them have it their way with you", "startsexsubby")
	addButton("Inventory", "Look at your inventory", "openinventory")
	if(GM.pc.getInventory().hasRemovableRestraints()):
		addButton("Struggle", "Struggle out of your restraints", "strugglemenu")
	GM.ES.triggerRun(Trigger.DefeatedDynamicNPC, [npcID])

func _react(_action: String, _args):
	if(_action == "how_much"):
		amountRequested = 5

		var npc = GlobalRegistry.getCharacter(npcID)
		var personality:Personality = npc.getPersonality()
		var cowardStat = personality.getStat(PersonalityStat.Coward)
		var naiveStat = personality.getStat(PersonalityStat.Naive)
		
		amountRequested += int(round(-3 * cowardStat))
		amountRequested += int(round(-3 * naiveStat))
		amountRequested = Util.maxi(2, amountRequested)

	if(_action in ["ask_to_dom", "ask_to_sub"]):
		amountRequested *= RNG.randi_range(2, 4)

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "startfight"):
		runScene("FightScene", [npcID], "guardfight")
	
	if(_action == "startsexsubby"):
		getCharacter(npcID).prepareForSexAsDom()
		GlobalRegistry.getCharacter(npcID).addPain(-50)
		runScene("GenericSexScene", [npcID, "pc"], "subbysex")
	
	if(_action == "startsexasdom"):
		runScene("GenericSexScene", ["pc", npcID], "domsex")
	
	if(_action in ["paytosub", "paytodom"]):
		var npc = GlobalRegistry.getCharacter(npcID)
		var personality:Personality = npc.getPersonality()
		var meanStat = personality.getStat(PersonalityStat.Mean)
		var bratStat = personality.getStat(PersonalityStat.Brat)
		
		var chanceToScam = max(0.0, meanStat * 50.0) + max(0.0, bratStat * 50.0)
		if(RNG.chance(chanceToScam)):
			GM.pc.addCredits(-amountRequested)
			amountStole = amountRequested
			triedToScam = true
			setState("agree_mean_sometimes")
			return
	
	if(_action == "paytosub"):
		GM.pc.addCredits(-amountRequested)
		
		getCharacter(npcID).prepareForSexAsDom()
		GlobalRegistry.getCharacter(npcID).addPain(-50)
		runScene("GenericSexScene", [npcID, "pc"], "subbysex")
		return
	
	if(_action == "paytodom"):
		GM.pc.addCredits(-amountRequested)
		
		runScene("GenericSexScene", ["pc", npcID], "domsex")
		return
	
	if(_action == "openinventory"):
		runScene("InventoryScene")
		return
	
	if(_action == "strugglemenu"):
		runScene("StrugglingScene")
		return
	

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag in ["subbysex", "domsex"]):
		setState("after_sex")
	
	if(_tag == "guardfight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		#var wonHow = _result[1]
		
		if(battlestate == "win"):
			setState("if_won")
			addExperienceToPlayer(30)
			
			if(triedToScam):
				GM.pc.addCredits(amountStole)
				addMessage("You recovered the stolen credits")
		else:
			setState("if_lost")
			addExperienceToPlayer(5)
			
			if(triedToScam):
				addMessage("You lost the stolen credits..")

func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID
	data["sawBefore"] = sawBefore
	data["npcVariation"] = npcVariation
	data["triedToScam"] = triedToScam
	data["amountStole"] = amountStole
	data["amountRequested"] = amountRequested
	
	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	sawBefore = SAVE.loadVar(data, "sawBefore", false)
	npcVariation = SAVE.loadVar(data, "npcVariation", "")
	triedToScam = SAVE.loadVar(data, "triedToScam", false)
	amountStole = SAVE.loadVar(data, "amountStole", 0)
	amountRequested = SAVE.loadVar(data, "amountRequested", 0)
