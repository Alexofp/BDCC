extends "res://Scenes/SceneBase.gd"

var npcID = ""
var sawBefore = false
var npcVariation = ""
var foundIllegalItems = false

func _init():
	sceneID = "GuardOfflimitsCanSlipByScene"

func _initScene(_args = []):
	npcID = _args[0]
	var npc = GlobalRegistry.getCharacter(npcID)
	
	if(npc.getFlag(CharacterFlag.Introduced)):
		sawBefore = true
	#else:
		#npc.setFlag(CharacterFlag.Introduced, true)
	
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
		playAnimation(StageScene.Duo, "stand", {npc=npcID, flipNPC=true, npcAction="stand", further=true})

	if(state == ""):
		saynn("While carefully stepping through the area you spot one of the guards. You caught {npc.him} at a very good moment because {npc.his} back is turned away so you can try to just sneak past.")
		
		if(sawBefore):
			saynn("It's hard to tell from where you are but you think you saw {npc.him} before.")
		
			if(npcVariation == "subby"):
				saynn("You remember {npc.him} being "+RNG.pick(["quite shy", "of the nervous type", "shy", "on the shy side", "on the quiet side"])+".")
			if(npcVariation == "mean"):
				saynn("You remember {npc.him} being "+RNG.pick(["one of the mean ones", "quite mean", "one of the rough ones", "mean", "not of the kind type"])+".")
		else:
			saynn("You don't recall meeting {npc.him} before.")
			
		saynn("You try to stay quiet while thinking about your options.")
		
		addButton("Confront", "Grab their attention", "confront")
		addButton("Sneak past", "Success chance: "+str(Util.roundF(getSlipByChance(), 1))+"%. Try to avoid them", "sneak_past")

	if(state in ["confront", "spotted", "spottedstealing"]):
		playAnimation(StageScene.Duo, "stand", {npc=npcID})

		if(state == "confront"):
			saynn("You decide not to hide in the shadows and openly confront the guard. You step towards {npc.him} and get {npc.his} attention.")
		elif(state == "spotted"):
			saynn("You try to slip past the guard unnoticed but fail!")
		elif(state == "spottedstealing"):
			saynn("You try to steal from the guard but fail!")

		if(npcVariation == "mean"):
			if(sawBefore):
				saynn("The guard "+RNG.pick(["catches your silhouette with {npc.his} gaze", "hears your steps"])+" and turns around, {npc.his} stun baton already makes sparks.")
				
				saynn(RNG.pick([
					"[say=npc]Huh, you again. Are you one of those masochistic bitches?[/say]",
					"[say=npc]It's you again. Breaking of rules is punished with breaking of bones.[/say]",
					"[say=npc]Brave. And incredibly stupid. I thought you learned your lesson, inmate.[/say]",
					"[say=npc]You know I'm not just gonna let you through.[/say]",
					]))
			else:
				saynn("The guard "+RNG.pick(["catches your silhouette with {npc.his} gaze", "hears your steps"])+" and turns around, {npc.his} stun baton already makes sparks. {npc.He} quickly checks you out.")
				
				saynn(RNG.pick([
					"[say=npc]Who do we have here? More painsluts?[/say]",
					"[say=npc]You're trespassing, inmate. But I guess you like fucking around? Me too.[/say]",
					"[say=npc]Brave. And incredibly stupid.[/say]",
					"[say=npc]I'm never tired of fresh faces. They change so fast after a few beatings.[/say]",
					]))
			
			saynn("It seems fighting is the only option with this one.")
			
			addButton("Fight", "Begin the fight", "startfight")
		elif(npcVariation == "subby"):
			if(sawBefore):
				saynn("The guard "+RNG.pick(["gasps", "eeks", "staggers back", "jumps"])+" when {npc.he} notices you. And then {npc.he} blushes.")
				
				saynn("[say=npc]"+RNG.pick([
					"You wanted something?.. I'm not gonna stop you.",
					"Oh, hi. I'm just patrolling here..",
					"Hey there, inmate. How are you doing?",
					"Oh. You're not supposed to be here. I think? Maybe you are..",
					"Do you wanna do something with me?..",
				])+"[/say]")
			else:
				saynn("The guard "+RNG.pick(["gasps", "eeks", "staggers back", "jumps"])+" when {npc.he} notices you. The stun baton almost slips out of {npc.his} hands.")
			
				saynn("[say=npc]"+RNG.pick([
					"Oh! Another inmate. What are you gonna do with me?..",
					"You're not supposed to be here.. What should we do?",
					"Ah! Hey there..",
					"Don't remember you.. Are you one of the new ones?.."
				])+"[/say]")
			
			saynn("It seems this guard doesn't plan on bashing your skull in.")
			
			addWonButton()
		else:
			if(sawBefore):
				saynn("The guard "+RNG.pick(["raises {npc.his} brow at you", "turns around to face you", "gives you a strict look"])+" as {npc.he} spots you. The guard turns {npc.his} stun baton on and carefully watches you.")
				
				saynn("[say=npc]"+RNG.pick([
					"I remember you. You're not allowed to be here, inmate.",
					"Hey, you! Craving for more punishments?",
					"You're not supposed to be here. Now I will have to punish you.",
					"Gonna surrender? Not as painful for you that way."
				])+"[/say]")
			else:
				saynn("The guard "+RNG.pick(["raises {npc.his} brow at you", "turns around to face you", "gives you a strict look"])+" as {npc.he} spots you. The guard turns {npc.his} stun baton on and carefully watches the unfamilliar face.")
				
				saynn("[say=npc]"+RNG.pick([
					"Don't recall you. But you're not allowed to be here, inmate.",
					"Hey! Looking for a punishment?",
					"You're not supposed to be here. Now I will have to punish you.",
					"Hey! Hands up. No funny movements."
				])+"[/say]")
			
			saynn("It seems you can't just turn around and leave now.")
			
			addButton("Fight", "Begin the fight", "startfight")
			addButton("Surrender", "Let them have it their way with you", "surrender")
	
	if(state == "surrender"):
		saynn("Instead of fighting, you just raise your hands up and surrender.")
		
		saynn("[say=npc]"+RNG.pick([
			"Good choice. Now we're gonna have some fun.",
			"That was the correct choice. Ready to have some fun?",
			"Good inmate. Now for your punishment.",
			"That's what I wanna see. I will still punish you for trespassing.",
		])+"[/say]")
		
		saynn("You are completely at {npc.his} mercy.")
		
		addButton("Submit to", "Let them have it their way with you", "startsexsubby")
			
	if(state == "after_sex" || state == "after_sex_won"):
		saynn("After the fun time ends, the guard just leaves you alone.")

		# (scene ends)
		addButton("Leave", "Time to go", "endthescene")
		
	if(state == "after_sex"):
		GM.ES.triggerRun(Trigger.AfterSexWithDynamicNPCThatWon, [npcID])
		
	if(state == "after_sex_won"):
		GM.ES.triggerRun(Trigger.AfterSexWithDefeatedDynamicNPC, [npcID])

	if(state == "sneak_past"):
		saynn("You managed to sneak past the guard without {npc.him} noticing!")
		
		addButton("Leave", "Time to go", "endthescene")

	if(state == "sneak_past_canSteal"):
		saynn("You managed to sneak past the guard!")
		
		saynn("But just before you leave your eye catches some helpful supplies that you can steal from {npc.his} belt.")

		saynn("It would be risky though.")

		addButtonWithChecks("Steal", "Chance: 50%. Try to steal some things from the guard", "trysteal", [], [ButtonChecks.NotArmsRestrained, ButtonChecks.NotHandsBlocked])
		addButton("Just leave", "Time to go", "endthescene")
	
	if(state == "sneak_past_canAttack"):
		saynn("You managed to sneak past the guard!")
		
		saynn("But the guard is still standing in a such a good spot. You think you can try to grab {npc.him} and cuff using {npc.his} own cuffs.")

		saynn("It can be somewhat risky though.")

		addButtonWithChecks("Attack", "Chance: 70%. Try to restrain them", "trycuff", [], [ButtonChecks.NotArmsRestrained, ButtonChecks.NotHandsBlocked])
		addButton("Just leave", "Time to go", "endthescene")
	
	if(state == "cuff_subby"):
		playAnimation(StageScene.Duo, "stand", {npc=npcID})
		
		saynn("You sneak up behind the guard and suddenly grab {npc.him} by the neck while your other hand searches through {npc.his} equipment.")
		
		saynn("[say=npc]"+RNG.pick([
			"Eek!",
			"AH!",
			"Huh?",
			"Who..",
			"Wha..",
		])+"[/say]")
		
		saynn("To your surprise {npc.he} doesn't seem to resist at all. You manage to find some cuffs that quickly lock around {npc.his} arms, forcing them behind.")
		
		if(sawBefore):
			saynn("[say=npc]"+RNG.pick([
				"Oh, it's you. You could have just asked..",
				"Oh, hi.. kinky.",
				"Oh, hey there..",
			])+"[/say]")
		else:
			saynn("[say=npc]"+RNG.pick([
				"Uh.. Hi there, new face.",
				"That's a bit fast, isn't it? I almost don't mind though.",
				"Who are you now?",
				"Kinky..",
			])+"[/say]")
		
		saynn("{npc.He} is blushing a lot, you can just leave {npc.him} like that or have some fun.")
		
		addButtonWithChecks("Sex!", "Time to fuck them", "startsexasdom", [], [ButtonChecks.CanStartSex])
		addButton("Leave", "Just leave before anyone else sees you", "endthescene")
		
	if(state == "cuff_fail"):
		playAnimation(StageScene.Duo, "stand", {npc=npcID})

		saynn("You sneak up behind the guard and suddenly grab {npc.him} by the neck while your other hand searches through {npc.his} equipment.")
		
		saynn("[say=npc]"+RNG.pick([
			"The fuck?!",
			"Hey!",
			"What?!",
			"Ugh!",
			"Huh!?",
		])+"[/say]")
		
		saynn("But {npc.he} quickly manages to pull your hand away before shoving {npc.his} elbow into your chest and turning around.")
		
		saynn("[say=npc]"+RNG.pick([
			"Now that was rude.",
			"Big mistake.",
			"That won't work on me, inmate.",
			"Seems like you need to be taught a lesson.",
		])+"[/say]")
	
		saynn("Oops. Seems like you gotta fight now.")
		
		addButton("Fight", "Begin the fight", "startfight")
	
	if(state == "cuff_success"):
		playAnimation(StageScene.Duo, "stand", {npc=npcID})
		
		saynn("You sneak up behind the guard and suddenly grab {npc.him} by the neck while your other hand searches through {npc.his} equipment.")
		
		saynn("[say=npc]"+RNG.pick([
			"The fuck?!",
			"Hey!",
			"What?!",
			"Ugh!",
			"Huh!?",
		])+"[/say]")
		
		saynn("{npc.He} tries to resist but one little jab into {npc.his} side calms {npc.him} down. You manage to find some cuffs that quickly lock around {npc.his} arms, forcing them behind.")
		
		if(sawBefore):
			saynn("[say=npc]"+RNG.pick([
				"Really? It's you? Fuck me.",
				"Oh fuck. What's your plan, inmate?",
				"Uncuff me right now or you will regret it.",
			])+"[/say]")
		else:
			saynn("[say=npc]"+RNG.pick([
				"Who the fuck are you? Uncuff me.",
				"Oh fuck. What's your plan, inmate?",
				"Uncuff me right now or you will regret it.",
			])+"[/say]")
		
		saynn("{npc.He} is still resisting a lot. You can just leave {npc.him} like that or have some fun.")
		
		addButtonWithChecks("Sex!", "Time to fuck them", "startsexasdom", [], [ButtonChecks.CanStartSex])
		addButton("Leave", "Just leave before anyone else sees you", "endthescene")
	
	if(state == "if_lost"):
		saynn("You collapse, unable to continue fighting.")

		# (default)
		if(npcVariation != "mean"):
			saynn("[say=npc]Attacking a guard wasn’t such a smart idea, was it?[/say]")

		# (if mean)
		else:
			saynn("[say=npc]That’s what I thought, bitch.[/say]")

		saynn("{npc.He} crouches near and looks at you.")

		saynn("[say=npc]And now it’s time to have some fun with you.[/say]")

		saynn("Since you can’t really fight back anymore, your only choice is to submit.")

		# (sex)
		addButton("Get fucked", "Well, you lost", "startsexsubby")


	if(state == "if_won"):
		saynn("You pin the defeated guard to the floor. {npc.He} doesn’t seem to struggle much.")

		saynn(RNG.pick([
			"[say=npc]What’s your plan?[/say]",
			"[say=npc]Don’t leave me like this, inmate.[/say]",
			"[say=npc]What now? Gonna kiss me at least?[/say]",
		]))

		addWonButton()
		
func addWonButton(sextext = "Sex!", sexdesc = "Time to fuck them!"):
	addButton("Leave", "Just leave before anyone else sees you", "endthescene")
	addButtonWithChecks(sextext, sexdesc, "startsexasdom", [], [ButtonChecks.CanStartSex])
	addButton("Submit to", "Let them have it their way with you", "startsexsubby")
	addButton("Inventory", "Look at your inventory", "openinventory")
	if(GM.pc.getInventory().hasRemovableRestraints()):
		addButton("Struggle", "Struggle out of your restraints", "strugglemenu")
	GM.ES.triggerRun(Trigger.DefeatedDynamicNPC, [npcID])

func _react(_action: String, _args):
	if(_action in ["confront", "startfight"]):
		getCharacter(npcID).setFlag(CharacterFlag.Introduced, true)

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "trysteal"):
		if(RNG.chance(50)):
			setState("spottedstealing")
			getCharacter(npcID).setFlag(CharacterFlag.Introduced, true)
		else:
			var lootTableClass = preload("res://Inventory/LootTable/GuardLoot.gd")
			var lootTable = lootTableClass.new()
			
			var loot = lootTable.generateAndCreateItems()
			
			if(loot.has("items") && loot["items"].size() > 0):
				runScene("LootingScene", [loot])
				addMessage("You manage to get into the guard's belt")
			else:
				addMessage("You manage to get into the guard's belt but didn't find anything useful")
			endScene()
		return

	if(_action == "sneak_past"):
		if(!RNG.chance(getSlipByChance())):
			setState("spotted")
		else:
			getCharacter(npcID).setFlag(CharacterFlag.Introduced, true)
			if(RNG.chance(33)):
				setState("sneak_past")
			elif(RNG.chance(33)):
				setState("sneak_past_canSteal")
			else:
				setState("sneak_past_canAttack")
		return

	if(_action == "trycuff"):
		getCharacter(npcID).setFlag(CharacterFlag.Introduced, true)
		if(npcVariation == "subby"):
			setState("cuff_subby")
			getCharacter(npcID).getInventory().equipItem(GlobalRegistry.createItem("inmatewristcuffs"))
			return
		
		if(RNG.chance(70)):
			setState("cuff_success")
			getCharacter(npcID).getInventory().equipItem(GlobalRegistry.createItem("inmatewristcuffs"))
			return

		setState("cuff_fail")
		return

	if(_action == "startfight"):
		runScene("FightScene", [npcID], "guardfight")
	
	if(_action == "startsexsubby"):
		getCharacter(npcID).prepareForSexAsDom()
		GlobalRegistry.getCharacter(npcID).addPain(-50)
		runScene("GenericSexScene", [npcID, "pc"], "subbysex")
	
	if(_action == "startsexasdom"):
		runScene("GenericSexScene", ["pc", npcID], "domsex")
	
	if(_action == "openinventory"):
		runScene("InventoryScene")
		return
	
	if(_action == "strugglemenu"):
		runScene("StrugglingScene")
		return


	setState(_action)


func _react_scene_end(_tag, _result):
	if(_tag in ["subbysex"]):
		setState("after_sex")
	if(_tag in ["domsex"]):
		setState("after_sex_won")
	
	if(_tag == "guardfight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		#var wonHow = _result[1]
		
		if(battlestate == "win"):
			setState("if_won")
			addExperienceToPlayer(30)
		else:
			setState("if_lost")
			addExperienceToPlayer(5)
			
func getSlipByChance():
	var baseChance = 60.0
	
	if(GM.pc.hasBoundLegs()):
		baseChance *= 0.6
	
	if(GM.pc.isBlindfolded()):
		baseChance *= 0.6

	if(GM.pc.hasBoundArms()):
		baseChance *= 0.8
	
	return max(5.0, baseChance)

func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID
	data["sawBefore"] = sawBefore
	data["npcVariation"] = npcVariation
	data["foundIllegalItems"] = foundIllegalItems
	
	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	sawBefore = SAVE.loadVar(data, "sawBefore", false)
	npcVariation = SAVE.loadVar(data, "npcVariation", "")
	foundIllegalItems = SAVE.loadVar(data, "foundIllegalItems", false)
