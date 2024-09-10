extends "res://Scenes/SceneBase.gd"

var npcID = ""
var sawBefore = false
var npcVariation = ""
var attackSuccessful = false

func _init():
	sceneID = "InmateExposureFlashScene"

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
		# (if naked)
		if(GM.pc.isFullyNaked()):
			saynn(RNG.pick([
				"You can’t help but to feel like someone is watching you. You look around a spot one of the inmates checking you out. {npc.His} stare makes you tactically cover your privates a bit.",
				"You’re completely naked so obviously eyes are gonna be attracted to you. One set in particular is quite curious in your {pc.masc} curves.",
			]))

		# (if not naked)
		else:
			saynn(RNG.pick([
				"You can’t help but to feel like someone is watching you. You look around a spot one of the inmates checking you out. {npc.His} stare makes your heart beat a bit harder.",
				"You’re quite exposed so eyes are gonna be attracted to you. One set in particular is quite curious in your {pc.masc} curves.",
			]))

		var ehibit = GM.pc.getSkillLevel(Skill.Exhibitionism)

		if(ehibit < 2):
			saynn("Maybe you can use this opportunity to test yourself..")
		elif(ehibit < 4):
			saynn("A lewd thought crosses your mind. Maybe you can offer {npc.him} a little show?")
		elif(ehibit < 6):
			saynn("You feel pretty confident about your body. Lewd thoughts keep appearing in your head.")
		else:
			saynn("You can’t wait to expose yourself more. All these surprised and embarrassed looks that you are getting give you so much pleasure.")

		addButton("Avoid", "You don’t feel like exposing yourself more", "avoid")
		
		addButtonWithChecks("Tits", "Show off your chest", "tits", [], [[ButtonChecks.SkillCheck, Skill.Exhibitionism, 1], ButtonChecks.NotArmsRestrained, ButtonChecks.NotHandsBlocked])
		if(ehibit >= 1):
			addButtonWithChecks("Ass", "Show off your butt", "ass", [], [[ButtonChecks.SkillCheck, Skill.Exhibitionism, 3], ButtonChecks.NotArmsRestrained, ButtonChecks.NotHandsBlocked])
		if(ehibit >= 3):
			addButtonWithChecks("Pussy", "Flash your pussy", "pussy", [], [ButtonChecks.HasReachableVagina, [ButtonChecks.SkillCheck, Skill.Exhibitionism, 5], ButtonChecks.NotArmsRestrained, ButtonChecks.NotHandsBlocked])
			addButtonWithChecks("Cock", "Flash your dick", "cock", [], [ButtonChecks.HasPenis, [ButtonChecks.SkillCheck, Skill.Exhibitionism, 5], ButtonChecks.NotArmsRestrained, ButtonChecks.NotHandsBlocked])
		if(ehibit >= 5):
			addButtonWithChecks("Show yourself off", "Don’t hide anything", "show_yourself_off", [], [[ButtonChecks.SkillCheck, Skill.Exhibitionism, 7], ButtonChecks.NotArmsRestrained, ButtonChecks.NotHandsBlocked])
		addButton("Attack", "What is their problem", "attack")
		
	if(state == "avoid"):
		saynn("You hide your face and escape the area as quickly as possible while trying to avoid any eyes.")

		saynn("Luckily the inmate doesn’t seem to follow you.")

		# (scene ends)
		addButton("Leave", "Time to go", "endthescene")
		
	if(state == "failed_to_get_away"):
		saynn("But before you leave, the inmate grabs you by the collar and tries to grope your body!")
		
		saynn(RNG.pick([
			"[say=npc]Where are you going, slut? Your job is to serve inmates like me.[/say]",
			"[say=npc]Hold it right there, whore. I’m not letting you go unless we fuck right here.[/say]",
			"[say=npc]Think I will just let you go, little fucktoy? Think again.[/say]",
			"[say=npc]Think I will let you go after what I saw? I’m gonna fuck you.[/say]",
		]))

		addButton("Attack", "What is their problem", "attack")
		addButton("Submit to", "Let them have it their way", "startsexsubby")

	if(state == "attack"):
		saynn("You quickly turn around and shove your elbow into {npc.his} chest.")

		# (if success)
		if(attackSuccessful):
			saynn("That forces all the air out of {npc.him}. The inmate drops onto {npc.his} knees and gasps.")
			
			saynn(RNG.pick([
				"[say=npc]You.. fucker..[/say]",
				"[say=npc]What a bitch..[/say]",
				"[say=npc]Ugh.. you whore..[/say]",
				
			]))

			saynn("Seems like now is a good time to leave.")
			
			addWonButton()
		# (addwonbuttons)

		# (if fail)
		else:
			saynn("That makes {npc.him} cough but {npc.he} is still standing. And {npc.he} is still angry.")

			saynn(RNG.pick([
				"[say=npc]Ugh.. Prepare to be my bitch.[/say]",
				"[say=npc]You little bitch. You will learn your place soon.[/say]",
				
			]))

			# (fight)
			addButton("Fight", "Start the fight", "startfight")

		# (if won, if lose are the same)

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

	if(state == "tits"):
		# (Requires level 1)

		# (if flat tits)
		if(!GM.pc.hasBigBreasts()):
			saynn("You expose and show off your {pc.breasts}, teasing and caressing the nipples that perk up from the touch. Your chest is not very big but sometimes size doesn’t matter.")

		# (if big tits)
		else:
			saynn("You expose and show off your {pc.breasts}, squeezing and caressing them. You teasingly hide just the nipples, so lewd. Why hide such nice funbags when you can embarrass others with them.")

		saynn("The inmate raises {npc.his} brow. Doing lewd things like this makes you more confident and proud of your body.")

		addButton("Leave", "That was lewd", "leavecheck")

	if(state == "ass"):
		# (Requires level 3)

		saynn("You expose your {pc.thick} butt and wiggle it slightly while looking behind you. You spank your ass, making it bounce. (or) You spread your buttcheks, showing off your {pc.analStretch} star.")

		saynn("You see the inmate's big eyes. Doing lewd things like this makes you more confident and proud of your body.")

		addButton("Leave", "That was lewd", "leavecheck")

	if(state == "pussy"):
		# (Requires level 5)

		saynn("You flash your {pc.pussyStretch} pussy for a second and stick your tongue out. But just that one moment made you feel lusty.")

		saynn("The inmate might have caught just the right moment. But you don’t mind exposing some skin, it’s just your pussy after all.")

		addButton("Leave", "That was lewd", "leavecheck")

	if(state == "cock"):
		# (requires level 5)
		if(GM.pc.isWearingChastityCage()):
			saynn("You quickly flash your caged up dick and offer any watcher a cheeky smile. The thrill of exposing yourself so boldly feels good.")
		else:
			saynn("You quickly flash your {pc.penis} and offer any watcher a cheeky smile. The thrill of exposing yourself so boldly feels good.")

		saynn("You even manage to keep an eye contact with the inmate. Doing lewd things like this makes you more confident and proud of your body.")

		addButton("Leave", "That was lewd", "leavecheck")

	if(state == "show_yourself_off"):
		# (requires level 7)

		saynn("There is nothing better than showing your body off and seeing people’s reaction. You look directly at the inmate while touching yourself.")

		# (if has flat tits)
		if(!GM.pc.hasBigBreasts()):
			saynn("You start by flashing your {pc.breasts} and teasing your nipples until they’re nice and hard. Who needs big milkers anyways, they’re too distracting.")

		# (if has big tits)
		else:
			saynn("You start by flashing your {pc.breasts} and squeezing them between your hands. Your nipples quickly get hard poke against your palms while you rub them. You have some great tits that are worth showing off.")

		# (if has pussy)
		if(GM.pc.hasReachableVagina()):
			saynn("One of your hands then slips down to your pussy. You keep groping your chest while spreading your folds and showing off the sensitive flesh. Lewd.")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("A big smirk shines on your face while you flash your locked up {pc.penis}. Your digits wrap around your chastity cage and give it a slight stroke. You don't get any pleasure from that but it still feels nice.")
		elif(GM.pc.hasReachablePenis()):
			saynn("A big smirk shines on your face while you flash your {pc.penis}. Your digits wrap around your shaft and give it a slight stroke.")

		saynn("You turn around and slide your hands down your {pc.thick} thighs before giving them a smack. Then you spread buttcheeks and show off your {pc.analStretch} tailhole!")

		saynn("So exciting, you’re showing all of you for that one inmate. And then you quickly run away.")

		# (scene ends)
		if(npcVariation in ["kind", "subby"]):
			addButton("Continue", "So lewd", "endthescene")
		else:
			addButton("Continue", "So lewd", "failed_to_get_away")

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
	
	
	if(_action == "openinventory"):
		runScene("InventoryScene")
		return
	
	if(_action == "strugglemenu"):
		runScene("StrugglingScene")
		return
	
	if(_action == "leavecheck"):
		if(npcVariation == "mean" || (npcVariation == "" && RNG.chance(50))):
			setState("failed_to_get_away")
		else:
			endScene()
		return
	
	if(_action == "attack"):
		if(RNG.chance(50)):
			attackSuccessful = true
		else:
			attackSuccessful = false

	if(_action == "tits"):
		GM.pc.addSkillExperience(Skill.Exhibitionism, 10)
	if(_action == "ass"):
		GM.pc.addSkillExperience(Skill.Exhibitionism, 20)
	if(_action in ["pussy", "cock"]):
		GM.pc.addSkillExperience(Skill.Exhibitionism, 30)
	if(_action in ["show_yourself_off"]):
		GM.pc.addSkillExperience(Skill.Exhibitionism, 50)

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
	data["attackSuccessful"] = attackSuccessful
	
	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	sawBefore = SAVE.loadVar(data, "sawBefore", false)
	npcVariation = SAVE.loadVar(data, "npcVariation", "")
	attackSuccessful = SAVE.loadVar(data, "attackSuccessful", false)
