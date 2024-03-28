extends "res://Scenes/SceneBase.gd"

var npcID = ""
var sawBefore = false
var npcVariation = ""
var foundIllegalItems = false

func _init():
	sceneID = "GuardCaughtOfflimitsScene"

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
		# (new guard)
		if(!sawBefore):
			if(RNG.chance(50)):
				saynn("As you carefully navigate an area that you are not supposed to be in, a sudden voice scares you.")

			# (or)
			else:
				saynn("You carefully step through the area that is off-limits for inmates. But it seems you weren’t careful enough, someone’s loud voice makes you turn around.")

			# (default lines)
			var possibleLines = [
				"[say=npc]Hey, you’re not supposed to be here.[/say]",
				"[say=npc]You got lost, inmate?[/say]",
				"[say=npc]Never seen you before. Wanna explain yourself?[/say]",
			]

			# (mean or dommy)
			if(npcVariation == "mean"):
				possibleLines = [
					"[say=npc]So what’s your excuse? Wait, I don’t care. You’re in trouble now.[/say]",
					"[say=npc]Someone is feeling risky today, huh. Care to explain yourself before I bash your skull in?[/say]",
					"[say=npc]I see a stray inmate. Don’t recall your face. But you’re in huge trouble.[/say]",
					"[say=npc]Inmates never learn, do they. Well, more thugs for me to beat up.[/say]",
					"[say=npc]So? What do we have here? A bitch forgot where her kennel is?[/say]",
				]

			# (kind)
			if(npcVariation == "kind"):
				possibleLines = [
					"[say=npc]Hey there. Whatcha doing here?[/say]",
					"[say=npc]Oh hi. Don’t remember seeing you before.[/say]",
					"[say=npc]You can’t be here, inmate. Don’t be silly~.[/say]",
					"[say=npc]Oh wow, hey! I think you’re not supposed to be here.[/say]",
				]

			# (subby)
			if(npcVariation == "subby"):
				possibleLines = [
					"[say=npc]Ohh.. Hi there, inmate..[/say]",
					"[say=npc]Oh. Hmm.. Hello?..[/say]",
					"[say=npc]I’m not sure but I think you’re not supposed to be here..[/say]",
					"[say=npc]I think you shouldn’t be here.. Right?..[/say]",
				]
				
			saynn(RNG.pick(possibleLines))
		# (old guard)
		else:
			if(RNG.chance(50)):
				saynn("As you carefully navigate an area that you are not supposed to be in, a sudden voice scares you. A voice that you remember.")

			# (or)
			else:
				saynn("You carefully step through the area that is off-limits for inmates. But it seems you weren’t careful enough, someone’s loud voice makes you turn around. A familiar voice.")

			# (default lines)
			var possibleLines = [
				"[say=npc]Hey, you. Haven't we met already? So why do I see you again?[/say]",
				"[say=npc]Got lost again, inmate?[/say]",
				"[say=npc]Oh, I remember you. Wanna explain yourself?[/say]",
			]

			# (mean or dommy)
			if(npcVariation == "mean"):
				possibleLines = [
					"[say=npc]So what’s your excuse this time? Wait, I really don’t care.[/say]",
					"[say=npc]Someone is feeling risky again, huh. Wanna explain that? Or should I break you a bit?[/say]",
					"[say=npc]I remember you, inmate. But you’re in huge trouble.[/say]",
					"[say=npc]You never learn, do you. Well, more thugs for me to beat up.[/say]",
					"[say=npc]So? What do we have here? A bitch forgot her place again?[/say]",
				]

			# (kind)
			if(npcVariation == "kind"):
				possibleLines = [
					"[say=npc]Hey there. Oh, I know you! How are you doing?[/say]",
					"[say=npc]Oh hi. I remember seeing you before.[/say]",
					"[say=npc]You can’t be here, inmate. Don’t be silly~.[/say]",
					"[say=npc]Oh wow, hey! I think you’re not supposed to be here.[/say]"
				]

			# (subby)
			if(npcVariation == "subby"):
				possibleLines = [
					"[say=npc]Ohh.. Hi there, inmate..[/say]",
					"[say=npc]Oh. Hmm.. I think I know you?..[/say]",
					"[say=npc]I’m not sure but I think you’re not supposed to be here..[/say]",
					"[say=npc]I think you shouldn’t be here.. Right?.. Although.. I remember seeing you.[/say]",
				]
				
			saynn(RNG.pick(possibleLines))
			# (end)

		saynn("You turn around and see one of the guards, judging by {npc.his} armor.")

		saynn("{npc.He} grabs {npc.his} stun baton and casually approaches you, {npc.his} eyes checking you out.")

		# (default lines)
		var possibleLines = [
			"[say=npc]Gonna submit to the search?[/say]",
			"[say=npc]Well, I will have to frisk you.[/say]",
			"[say=npc]I’m gonna search you just in case.[/say]",
			"[say=npc]Turn around for me so I can pat you down.[/say]",
			"[say=npc]I need to pat you down.[/say]",
		]

		if(npcVariation == "mean"):
		# (mean or dommy)
			possibleLines = [
				"[say=npc]Don’t move, bitch. I’m gonna frisk you.[/say]",
				"[say=npc]Don’t move a muscle while I search you or I will break you.[/say]",
				"[say=npc]Don’t move, slut. Got to frisk you.[/say]",
				"[say=npc]Gonna submit to the search or do you like to be forced?[/say]",
			]

		# (kind)
		if(npcVariation == "kind"):
			possibleLines = [
				"[say=npc]I know it’s a bit rude but the rules say I need to frisk you. So can you?[/say]",
				"[say=npc]Sorry for being a bit mean but I will have to search you. Okay?[/say]",
				"[say=npc]I can’t let you go unless I pat you down, just a prison policy.[/say]",
				"[say=npc]You probably don’t have anything but I kinda have to search you. Is that okay with you?[/say]",
			]

		# (subby)
		if(npcVariation == "subby"):
			possibleLines = [
				"[say=npc]Um.. Would you let me search you maybe? For anything.. bad.[/say]",
				"[say=npc]Can you.. turn around for me.. I need to search you..[/say]",
				"[say=npc]I might need to search you now..[/say]",
			]
		saynn(RNG.pick(possibleLines))
		# (Options are Submit, Attack, Offer body)

		addButton("Search", "Let them look through your things", "submit")
		addButton("Attack", "Well, they are asking for it", "attack")
		addButton("Offer body", "Maybe you can try to seduce them", "offer_body")

	if(state == "submit"):
		playAnimation(StageScene.SexStanding, "tease", {
			pc=npcID,npc="pc",
			bodyState={},
			npcBodyState={},
		})
		
		# (if subby or cowardly there is a change for her to not do anything)

		# (if mean/dommy she might try to fuck you anyways)

		saynn("You turn and lean against the nearest wall, letting {npc.him} do what {npc.he} wants. {npc.Name} steps behind you and puts {npc.his} hands on your body, searching for anything illegal.")

		# (if found something)
		if(foundIllegalItems):
			saynn("[say=npc]Oh, I will be taking that. You can’t have this. And I will fine you as well.[/say]")

		# (else)
		else:
			saynn("[say=npc]You don’t have anything illegal. Good. But I will fine you for trespassing.[/say]")

		saynn("{npc.Name} pressed some buttons on {npc.his} tablet, deducting some credits from you. And after that, {npc.he} leaves you alone.")

		saynn("[say=npc]Don’t cause any more trouble.[/say]")

		addButton("Leave", "Time to go", "endthescene")

	if(state == "submit_mean"):
		playAnimation(StageScene.SexStanding, "tease", {
			pc=npcID,npc="pc",
			bodyState={},
			npcBodyState={},
		})
		
		saynn("You turn and lean against the nearest wall, letting {npc.him} do what {npc.he} wants. {npc.Name} steps behind you and puts {npc.his} hands on your body, searching for anything illegal. You find {npc.his} grasp to be quite.. invasive. {npc.He} is practically groping you!")

		# (if found something)
		if(foundIllegalItems):
			saynn("[say=npc]Look what I found. Bitch, you have some contraband on you. Seems like you need to be taught a lesson.[/say]")

		# (else)
		else:
			saynn("[say=npc]You don’t have shit. But I have to teach a slut like you a lesson anyway.[/say]")

		saynn("Oh, {npc.he} is fondling you even more. You gotta do something.")

		# (attack or submit)
		addButton("Attack", "You gotta spot this", "attack")
		addButton("Submit", "Let them do whatever they want with you", "startsexsubby")

	if(state == "submit_subby"):
		saynn("You turn and lean against the nearest wall, letting {npc.him} do what {npc.he} wants. But instead of searching you, the guard blinks a lot and blushes.")

		saynn("[say=npc]Uh.. Actually.. It’s fine.. you can go..[/say]")

		saynn("{npc.Name} stammers a lot and then just quickly runs away. It was kinda cute.")

		addButton("Leave", "Time to go", "endthescene")

	if(state == "attack"):
		# (if subby, can just auto-win)
		playAnimation(StageScene.Duo, "stand", {npc=npcID})

		saynn("You lash out at {npc.name}!")

		# (if mean)
		if(npcVariation == "mean"):
			saynn("But {npc.he} is ready, shoving you back before growling at you.")

			saynn(RNG.pick([
				"[say=npc]Oh, you gonna fucking regret this.[/say]",
				"[say=npc]I guess I will have to force you then.[/say]",
				"[say=npc]Bad choice. Prepare for consequences, bitch.[/say]",
			]))

		# (options is fight)
			addButton("Fight", "Start the fight", "startfight")
		# (if subby/coward happened)
		elif(npcVariation == "subby"):
			saynn("{npc.He} totally wasn’t prepared for that. The guard gasps and collapses before you.")

			saynn(RNG.pick([
				"[say=npc]Ow.. Don’t hurt me! You can go.[/say]",
				"[say=npc]Okay okay, you won.. Do whatever you want..[/say]",
				"[say=npc]Hey!.. Ow.. you won. What are you gonna do now?..[/say]",
			]))

			addWonButton()
			# (default)
		else:
			saynn("{npc.He} staggers back but quickly recovers. The guard doesn’t look happy with you.")

			saynn(RNG.pick([
				"[say=npc]Well, I can teach you a lesson or two.[/say]",
				"[say=npc]Let’s see if this will be enough of a lesson.[/say]",
				"[say=npc]Resisting will only make this worse for you.[/say]",
			]))

			addButton("Fight", "Start the fight", "startfight")



	if(state == "if_lost"):
		saynn("You collapse, unable to continue fighting.")

		# (default)
		if(npcVariation != "mean"):
			saynn("[say=npc]Attacking a guard wasn’t such a smart idea, was it?[/say]")

		# (if mean)
		else:
			saynn("[say=npc]That’s what I thought, bitch.[/say]")

		saynn("{npc.He} goes through your things and confiscates anything illegal.")

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

		# (Options are sex or leave them be, Inventory, Struggle)

		# (Need everything to be free to fuck)

		addWonButton()

	if(state == "offer_body"):
		saynn("You really wanna avoid any fights but also don’t feel like being frisked. So instead of submitting, you offer the guard a kind smile while striking a sexy pose, showing off your {pc.masc} curves.")

		saynn("[say=pc]How about I offer you something better? Myself for example.[/say]")

		# (if mean)
		if(npcVariation == "mean"):
			saynn("{npc.He} checks you out and reaches out to grab you by the arm.")

			saynn("[say=npc]Oh yeah? Resist and you will regret it.[/say]")
			
			addButton("Get fucked", "Let them have it", "startsexsubby")

		# (if subby)
		elif(npcVariation == "subby"):
			saynn("{npc.He} blushes while sneakily glancing at you. The shy guard lowers {npc.his} head.")

			saynn("[say=npc]I mean.. You can take me if you want then..[/say]")

			saynn("Huh, this guard seems to be quite subby.")
			addWonButton()
		else:
			# (if default)

			saynn("{npc.He} checks you out and steps towards you.")

			saynn("[say=npc]Huh. Maybe. Now don’t resist.[/say]")

			addButton("Get fucked", "Let them have it", "startsexsubby")

		# (Options are sex or sex (dom) if hands untied)


	if(state == "after_sex" || state == "after_sex_won"):
		saynn("After the fun time ends, the guard just leaves you alone.")

		# (scene ends)
		addButton("Leave", "Time to go", "endthescene")
		
	if(state == "after_sex"):
		GM.ES.triggerRun(Trigger.AfterSexWithDynamicNPCThatWon, [npcID])
		
	if(state == "after_sex_won"):
		GM.ES.triggerRun(Trigger.AfterSexWithDefeatedDynamicNPC, [npcID])

func addWonButton():
	addButton("Leave", "Just leave before anyone else sees you", "endthescene")
	addButtonWithChecks("Sex!", "Time to fuck them!", "startsexasdom", [], [ButtonChecks.CanStartSex])
	addButton("Submit to", "Let them have it their way with you", "startsexsubby")
	addButton("Inventory", "Look at your inventory", "openinventory")
	if(GM.pc.getInventory().hasRemovableRestraints()):
		addButton("Struggle", "Struggle out of your restraints", "strugglemenu")
	GM.ES.triggerRun(Trigger.DefeatedDynamicNPC, [npcID])

func _react(_action: String, _args):

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
	
	if(_action == "openinventory"):
		runScene("InventoryScene")
		return
	
	if(_action == "strugglemenu"):
		runScene("StrugglingScene")
		return
	
	if(_action == "submit"):
		if(npcVariation == "subby" && RNG.chance(100)):
			setState("submit_subby")
			return
		
		if(npcVariation == "mean"):
			setState("submit_mean")
		else:
			setState("submit")
		GM.pc.addCredits(-5)
		addMessage("5 credits were taken from you")
		
		if(GM.pc.hasIllegalItems()):
			foundIllegalItems = true
			GM.pc.getInventory().removeItemsList(GM.pc.getInventory().getItemsWithTag(ItemTag.Illegal))
			GM.pc.getInventory().removeEquippedItemsList(GM.pc.getInventory().getEquippedItemsWithTag(ItemTag.Illegal))
		
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
			
			GM.pc.getInventory().removeItemsList(GM.pc.getInventory().getItemsWithTag(ItemTag.Illegal))
			GM.pc.getInventory().removeEquippedItemsList(GM.pc.getInventory().getEquippedItemsWithTag(ItemTag.Illegal))

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
