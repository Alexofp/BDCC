extends "res://Scenes/SceneBase.gd"

var npcID = ""
var sawBefore = false
var npcVariation = ""
var bribeSuccess = false
var subOffered = ""

func _init():
	sceneID = "InmateExposureForcedSexScene"

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
		# (default)
		if(!(npcVariation in ["mean", "kind", "subby"])):
			saynn(RNG.pick([
				"You were going somewhere when you suddenly feel someone reaching out and groping your {pc.thick} {pick('ass', 'butt')}! You turn around and see one of the inmates staring at your curves.",
				"A hand spanks your {pc.thick} {pick('ass', 'butt')}. You turn around and see one of the inmates with a cheeky smile on {npc.his} face.",
				"An inmate blocks your path! {npc.He} rubs {npc.his} chin while eyeing you out. You try to walk around {npc.him} but {npc.he} blocks you again.",
				"One of the inmates gets into your way. {npc.He} is clearly not interested in letting you pass, {npc.his} hungry eyes are {pick('fucking', 'molesting', 'teasing')} you already.",
			]))

			# (if never met)
			if(!sawBefore):
				saynn("[say=npc]"+RNG.pick([
					"Hey there, babe. I need to fuck someone and you look quite fuckable.",
					"Fresh blood? I need a piece of that ass.",
					"Think you can just walk around like that, new bitch? I’m gonna fuck you.",
					"Where are you going, bitch? Think I will let you go? You’re practically begging to be fucked.",
					"Fresh sex toys have arrived? I won’t let you go without a fuck.",
				])+"[/say]")

			# (if met before)
			else:
				saynn("[say=npc]"+RNG.pick([
					"It’s you again. I need to fuck someone and you look quite fuckable.",
					"I need a piece of that ass.",
					"Think you can just walk around like that, bitch? I’m gonna fuck you.",
					"Where are you going, bitch? Think I will let you go? You’re practically begging to be fucked.",
					"I won’t let you go without a fuck.",
				])+"[/say]")
				
			addButton("Be fucked", "Let them have it their way with you", "startsexsubby")
			addButton("Attack", "Show them that it was a bad idea", "attack")
			addButtonWithChecks("Offer 5 credits", "Maybe that will make them fuck off", "offer_5_credits", [], [[ButtonChecks.HasCredits, 5]])
			
		# (kind version)
		if(npcVariation == "kind"):
			if(RNG.chance(50)):
				saynn("One of the inmates gets your attention. You look at {npc.him} and realize that {npc.he} doesn’t seem to be very threatening.")
			else:
				saynn("An inmate points at you to get your attention. You stop and watch {npc.him} stepping towards you, {npc.his} lusty eyes tracing your {pc.masc} curves.")

			# (if never met)
			if(!sawBefore):
				saynn("[say=npc]"+RNG.pick([
					"Hey there, beautiful. I’m kinda horny and you look slutty. Wanna fuck?",
					"You seem to be open for casual sex. Wanna fuck?",
					"Hi there, little slut. Wanna fuck?",
				])+"[/say]")
			
		# (if met before)
			else:
				saynn("[say=npc]"+RNG.pick([
					"I remember you. I’m kinda horny and you are still slutty. Wanna fuck?",
					"You seem to be open for casual sex. Wanna fuck?",
					"Wanna fuck?",
				])+"[/say]")
			
			addButton("Agree", "Let them have it their way with you", "startsexsubby")
			addButton("Decline", "You’d rather not get fucked", "decline")
			addButton("Attack", "Show them that it was a bad idea", "attack")

		# (mean version)
		if(npcVariation == "mean"):
			saynn(RNG.pick([
				"One of the inmates grabs you by the shoulder and tries to pin you against the floor!",
				"One of the inmates blocks your path and then tackles you!",
				"An inmate suddenly shoves you before trying to wrench your arm and pin to the floor.",
			]))

			# (if never saw or saw)
			saynn("[say=npc]"+RNG.pick([
				"Don’t move, bitch. Or it will get worse.",
				"Don’t resist, slut. I know you want it.",
				"Scream all you want, slut. No one cares.",
				"Look at you. You’re begging to be used.",
				"Shut up and let me fuck you.",
			])+"[/say]")

			saynn("{npc.He} is trying to fuck you!")
			
			addButton("Be fucked", "Let them have it their way with you", "startsexsubby")
			addButton("Attack", "Show them that it was a bad idea", "attack")
			addButtonWithChecks("Offer 5 credits", "Maybe that will make them fuck off", "offer_5_credits", [], [[ButtonChecks.HasCredits, 5]])

		# (subby version)
		if(npcVariation == "subby"):
			saynn(RNG.pick([
				"One of the inmates catches your attention. {npc.He} walks up to you, holding {npc.his} hands behind {npc.him} and looking down at the floor.",
				"An inmate approaches you and wiggles {npc.his} butt seductively at you.",
				"Someone gets your attention. You turn around to face {npc.him} and see a subby-looking inmate.",
			]))

			# (if never saw)
			if(!sawBefore):
				saynn("[say=npc]"+RNG.pick([
					"Oh, hi.. You look lewd. Wanna have some fun maybe?..",
					"Hello-o.. I’m horny.. Wanna fuck?",
					"Never saw you before.. Want some sex?",
				])+"[/say]")

			# (if saw before)
			else:
				saynn("[say=npc]"+RNG.pick([
					"Oh, I remember you. Wanna have some fun maybe?..",
					"I’m horny again.. Wanna fuck?",
					"Heya.. Want some sex?",
				])+"[/say]")

			#addButton("Submit to", "Let them have it their way with you", "startsexsubby")
			addButtonWithChecks("Sex!", "Time to fuck them!", "startsexasdom", [], [ButtonChecks.CanStartSex])
			addButton("Submit to", "Let them have it their way with you", "startsexsubby")
			addButton("Inventory", "Look at your inventory", "openinventory")
			if(GM.pc.getInventory().hasRemovableRestraints()):
				addButton("Struggle", "Struggle out of your restraints", "strugglemenu")
			addButton("Decline", "You’d rather not get fucked", "decline")
			# (OPTIONS ARE)

			# (if normal = Be fucked, Attack, Offer credits)

			# (if mean = Same but offer credits has a chance to fail)

			# (if kind = Agree, Decline)

			# (if subby = Submit to, Fuck them, Decline. Decline might end up with them offering something?)


	if(state == "attack"):
		# (if normal)
		if(npcVariation != "mean"):
			saynn("You lash out at {npc.him} and shove away! The inmate growls back and gets ready for a fight.")

			saynn("[say=npc]"+RNG.pick([
				"Fine, we can play rough.",
				"I will force you if I have to.",
				"Sure, I will rough you up a bit before we fuck.",
				"Bad idea, slut.",
			])+"[/say]")

		# (if mean)
		else:
			saynn("You gather all your strength and shove {npc.him} away from you. The inmate growls and gets up, ready to fight.")

			saynn("[say=npc]"+RNG.pick([
				"Huge mistake, bitch.",
				"This won’t end well for you, bitch.",
				"You should have just let me fuck you.",
				"What a whore. It’s your fault you gonna get fucked senseless.",
				"Hope you like pain, bitch. Actually, I hope you don’t.",
			])+"[/say]")

		addButton("Fight", "Start the fight", "startfight")


	if(state == "if_lost"):
		saynn("You collapse, unable to continue fighting.")

		# (default)
		if(npcVariation != "mean"):
			saynn("[say=npc]What did you think was gonna happen?[/say]")

		# (if mean)
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

		# (Options are sex or leave them be, Inventory, Struggle)

		# (Need everything to be free to fuck)

		addWonButton()

	if(state == "offer_5_credits"):
		# (if success)
		if(bribeSuccess):
			saynn("You produce a chip with 5 credits and offer it to the inmate.")

			saynn("[say=npc]"+RNG.pick([
				"Huh, consider yourself lucky.",
				"That works too. See you around.",
				"Fine. I can find a more willing slut with that.",
			])+"[/say]")

			saynn("{npc.He} snatches it and leaves you alone.")

			addButton("Leave", "Time to go", "endthescene")
		# (if mean and fails)
		else:
			saynn("You huff and struggle for a bit before finally showing a chip with some credits to the inmate.")

			saynn("But {npc.he} slaps your hand away and instead wrenches it behind your back.")

			saynn("[say=npc]"+RNG.pick([
				"You think you can bribe me? Bitch, you’re gonna get fucked.",
				"Keep that for the doctor, bitch. You will need one after I’m done with you.",
			])+"[/say]")

			# (options are get fucked and attack)
			addButton("Be fucked", "Let them have it their way with you", "startsexsubby")
			addButton("Attack", "Show them that it was a bad idea", "attack")

	if(state == "decline"):
		if(subOffered == ""):
			saynn("You refuse politely. The inmate shrugs.")

			saynn("[say=npc]"+RNG.pick([
				"Sure, I won’t force you.",
				"Well, take care then.",
				"Be careful around here.",
			])+"[/say]")

		# (scene ends)
			addButton("Leave", "Time to go", "endthescene")

		# (if subby and chance)
		else:
			saynn("You refuse politely. The inmate sighs audibly and looks through {npc.his} pockets before presenting you "+subOffered+".")

			saynn("[say=npc]"+RNG.pick([
				"Pretty please?..",
				"Maybe that will change your mind?..",
				"I’m very horny..",
			])+"[/say]")

			# (Options are the same but starting sex will give you a pill or credits)

			addWonButton()

	if(state == "after_sex" || state == "after_sex_won"):
		saynn("After the fun time ends, the inmate just leaves you alone.")

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
	
	if(_action in ["startsexsubby", "startsexasdom"]):
		if(subOffered == "some pill"):
			var item:ItemBase = GlobalRegistry.createItem(RNG.pick([
				"AnaphrodisiacPill",
				"BirthControlPill",
				"BreederPill",
				"HeatPill",
			]))
			GM.pc.getInventory().addItem(item)
			addMessage("You received "+item.getAStackName())
		if(subOffered == "some credits"):
			var credAmount = RNG.randi_range(2, 5)
			GM.pc.addCredits(credAmount)
			addMessage("You received "+str(credAmount)+" credits")
	
	if(_action == "openinventory"):
		runScene("InventoryScene")
		return
	
	if(_action == "strugglemenu"):
		runScene("StrugglingScene")
		return
	
	if(_action == "offer_5_credits"):
		if(npcVariation == "mean"):
			if(RNG.chance(50)):
				GM.pc.addCredits(-5)
				bribeSuccess = true
			else:
				bribeSuccess = false
		else:
			GM.pc.addCredits(-5)
			bribeSuccess = true

	if(_action == "decline"):
		if(npcVariation == "subby"):
			if(RNG.chance(50)):
				subOffered = RNG.pick(["some pill", "some credits"])

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

func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID
	data["sawBefore"] = sawBefore
	data["npcVariation"] = npcVariation
	data["bribeSuccess"] = bribeSuccess
	data["subOffered"] = subOffered
	
	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	sawBefore = SAVE.loadVar(data, "sawBefore", false)
	npcVariation = SAVE.loadVar(data, "npcVariation", "")
	bribeSuccess = SAVE.loadVar(data, "bribeSuccess", false)
	subOffered = SAVE.loadVar(data, "subOffered", "")
