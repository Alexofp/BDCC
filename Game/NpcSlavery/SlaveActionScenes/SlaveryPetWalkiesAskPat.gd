extends "res://Scenes/SceneBase.gd"

var npcID = ""
var npc:DynamicCharacter
var npc2ID = ""
var npc2:DynamicCharacter
var whoStr = "inmate"
var npcVariation = "mean"

func _initScene(_args = []):
	npcID = _args[0]
	npc = GlobalRegistry.getCharacter(npcID)

#func _reactInit():
#	processTime(10*60)
#	npc.afterTakingAShower()
#
#	var npcSlavery:NpcSlave = npc.getNpcSlavery()
#	if(npcSlavery != null && npcSlavery.getActivityID()=="Walkies"):
#		npcSlavery.getActivity().satisfyWant("pee")

func _reactInit():
	if(RNG.chance(50)):
		npc2ID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Guards, [], GuardGenerator.new(), {})
		whoStr = "guard"
	else:
		npc2ID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [], InmateGenerator.new(), {})
		whoStr = "inmate"
	if(npc2ID == null || npc2ID == ""):
		addMessage("Couldn't find a good npc :(")
		endScene()
		return
	npc2 = getCharacter(npc2ID)
	addCharacter(npc2ID)
	
	var personality:Personality = npc2.getPersonality()
	
	var biggestStat = PersonalityStat.Mean
	var biggestStatNum = personality.getStat(PersonalityStat.Mean)
	var lowestStat = PersonalityStat.Mean
	var lowestStatNum = personality.getStat(PersonalityStat.Mean)
	var statsToCheck = [PersonalityStat.Subby, PersonalityStat.Coward]
	for theStat in statsToCheck:
		var theValue = personality.getStat(theStat)
		if(theValue > biggestStatNum):
			biggestStatNum = theValue
			biggestStat = theStat
		if(theValue < lowestStatNum):
			lowestStatNum = theValue
			lowestStat = theStat
	
	if(biggestStatNum > (-lowestStatNum)):
		#Big stat
		if(biggestStat == PersonalityStat.Mean):
			npcVariation = "mean"
		if(biggestStat == PersonalityStat.Subby):
			npcVariation = RNG.pick(["kind", "subby"])
		if(biggestStat == PersonalityStat.Coward):
			npcVariation = RNG.pick(["kind", "subby"])
	else:
		#Low stat
		if(lowestStat == PersonalityStat.Mean):
			npcVariation = "kind"
		if(lowestStat == PersonalityStat.Subby):
			npcVariation = RNG.pick(["kind", "mean"])
		if(lowestStat == PersonalityStat.Coward):
			npcVariation = "mean"

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID
	if(_charID == "npc2"):
		return npc2ID

func _init():
	sceneID = "SlaveryPetWalkiesAskPat"

func _run():
	if(state == ""):
		addCharacter(npcID)
		playAnimation(StageScene.PuppyDuo, "stand", {pc=npc2ID, npc=npcID, npcBodyState={naked=true}})

		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		
		saynn("As you walk your puppy around the station, you walk into one of the "+str(whoStr)+"s.")
		
		if(npcVariation == "kind"):
			saynn("[say=npc2]"+RNG.pick([
				"Oh, what a cute little pup you have there.",
				"That is an adorable pup!",
				"What a cutie!",
				"I see a cutie on a leash.",
				"I see a pup out on walkies, hah.",
				"Oh wow, cute pup.",
			])+"[/say]")
			
			saynn("The "+whoStr+"'s eyes light up with excitement.")
			
			saynn("[say=npc2]"+RNG.pick([
				"Mind if I give {npc.him} a pat?",
				"Can I pat {npc.him}?",
				"I really wanna pat!",
			])+"[/say]")
			
			addButton("Sure", "Let them pat your pup", "let_pat")
			addButton("No", "No patting", "no_pat")
		if(npcVariation == "mean"):
			saynn("[say=npc2]"+RNG.pick([
				"Do you really have to walk your stupid mutt here?",
				"Hey, I'm walking here.",
				"Get out of the way.",
				"Control your pet better.",
			])+"[/say]")
			
			saynn("The "+whoStr+"'s furrows {npc.his} brows.")
			
			saynn("[say=npc2]"+RNG.pick([
				"Don't sniff me.",
				"Don't look at me, stupid dog.",
				"The fuck do you want? Fuck off.",
				"Go away before I step on your mutt.",
			])+"[/say]")
			
			addButton("Bite!", "Order your pet to bite them", "make_bite")
			addButton("Leave", "You'd rather not get into trouble", "do_mean_leave")
		if(npcVariation == "subby"):
			saynn("[say=npc2]"+RNG.pick([
				"Oh.. What a cute puppy.",
				"Ohh..",
				"Oh wow. Don't mind me..",
				"Puppy!",
			])+"[/say]")
			
			saynn("The "+whoStr+"'s blushes a bit.")
			
			saynn("[say=npc2]"+RNG.pick([
				"Wish I'd be on a leash like that.. Does {npc.he} bite?",
				"I like walkies a lot. Does {npc.he} bite?",
				"I'm not drooling.. Does {npc.he} bite?",
			])+"[/say]")
			
			addButton("Give paw", "Order your pet to give them a paw", "make_subby_paw")
			addButton("Bite playfully", "Order your pet to bite them", "make_subby_bite")
			addButton("Leave", "Just walk past", "endthescene")
			if(npcSlavery.getSlaveSkill(SlaveType.Pet) >= 8):
				addButton("Lick", "Order your pet to lick their crotch", "make_subby_lick")
			else:
				addDisabledButton("Lick", "Pet skill A or higher required")

	if(state == "make_subby_lick"):
		playAnimation(StageScene.PuppyDuo, "stand", {pc=npc2ID, npcAction="sit", npc=npcID, npcBodyState={naked=true}})
		
		saynn("[say=pc]Nah, {npc.he} can do something better.[/say]")
		
		saynn("You point at the "+whoStr+" and order your puppy.")
		
		saynn("[say=pc]Lick.[/say]")
		
		saynn("Your puppy obeys eagerly, crawling up to {npc2.him} before sitting up and nuzzling {npc2.his} crotch.")
		
		if(npc2.hasReachablePenis() || npc2.isWearingChastityCage()):
			saynn("That's not it though, your puppy also sticks {npc.his} tongue out and drags it along {npc2.his} {npc2.penis}"+(" through the clothing." if !npc2.isFullyNaked() else "."))
		elif(npc2.hasReachableVagina()):
			saynn("That's not it though, your puppy also sticks {npc.his} tongue out and drags it along {npc2.his} {npc2.pussyStretch} pussy"+(" through the clothing." if !npc2.isFullyNaked() else "."))
		else:
			saynn("That's not it though, your puppy also sticks {npc.his} tongue out and drags it along it"+(" through the clothing." if !npc2.isFullyNaked() else "."))
		
		saynn("[say=npc2]"+RNG.pick([
			"You trained {npc.him} well..",
			"Good puppy..",
		])+"[/say]")
		
		saynn("Your puppy receives lots of headpats for that.")
		
		addButton("Continue", "See what happens next", "endthescene")

	if(state == "make_subby_paw"):
		playAnimation(StageScene.PuppyDuo, "stand", {pc=npc2ID, npcAction="paw", npc=npcID, npcBodyState={naked=true}})

		saynn("[say=pc]Nah, {npc.he} doesn't.[/say]")

		saynn("You order your puppy.")
		
		saynn("[say=pc]Give paw to {npc2.him}, pup.[/say]")
		
		saynn("Your pet obeys, sitting up and offering {npc.his} paw to the "+whoStr+". {npc2.He} shakes it.")
		
		saynn("[say=npc2]"+RNG.pick([
			"You trained {npc.him} well..",
			"Good puppy..",
		])+"[/say]")
		
		addButton("Continue", "See what happens next", "endthescene")
	
	if(state == "make_subby_bite"):
		playAnimation(StageScene.PuppySexOral, "tease", {pc=npc2ID, npc=npcID, npcBodyState={naked=true}})
	
		saynn("[say=pc]{npc.He} can. But you shouldn't be afraid.[/say]")
		
		saynn("You order your puppy with a kind voice.")
		
		saynn("[say=pc]Show {npc2.him} how you bite, pup.[/say]")
		
		saynn("Your pet obeys and crawls up to the "+whoStr+", who crouches down. {npc.Name} opens {npc.his} mouth.. and starts nibbling on the "+whoStr+"'s hand, looking quite cute.")
		
		saynn("[say=npc2]"+RNG.pick([
			"Ohh, that tickles..",
			"Good puppy..",
		])+"[/say]")
		
		addButton("Continue", "See what happens next", "endthescene")
	
	if(state == "do_mean_leave"):
		playAnimation(StageScene.PuppyDuo, "stand", {npc=npcID, npcBodyState={naked=true, leashedBy="pc"}})
		
		saynn("You decide that it's not worth it.. and just leave.")
		
		saynn("[say=npc2]"+RNG.pick([
			"That's right, go away.",
			"Yeah, go away.",
		])+"[/say]")
		
		addButton("Continue", "See what happens next", "endthescene")
		
	if(state == "make_bite_won"):
		playAnimation(StageScene.PuppyDuo, "defeat", {pc=npc2ID, npc=npcID, npcBodyState={naked=true}})
		
		saynn("You point at the "+whoStr+" and order your pet!")
		
		saynn("[say=pc]Bite![/say]")
		
		saynn("Your puppy sees the enemy and starts crawling towards {npc2.him}, scary growling can be heard from {npc.him}! The "+whoStr+" sees that and chuckles.. until {npc2.his} ankle gets bitten! And then the second one too!")
		
		saynn("The "+whoStr+" grunts and drops to {npc2.his} knees before your pup.. And, before {npc2.he} can stand up, {npc2.he} gets headbutted firmly!")
		
		saynn("[say=npc2]"+RNG.pick([
			"Argh.. Fuck! Stupid mutt!.",
			"I give up. Keep your stupid dog away!",
			"Fine, whatever, go away.",
		])+"[/say]")
		
		if(OPTIONS.isContentEnabled(ContentType.Watersports)):
			saynn("You chuckle while your puppy pees on the defeated enemy, as a final act of total humiliation.")
		else:
			saynn("You chuckle while your puppy lightly headbutts the defeated enemy, as a final act of total humiliation.")
		
		saynn("[say=npc2]"+RNG.pick([
			"HEY! No! Bad!",
			"Stop it, stupid pup!",
			"What the fuck?!",
		])+"[/say]")
		
		saynn("You pat your puppy and continue on your journey.")
		
		addButton("Continue", "See what happens next", "endthescene")
		
	if(state == "make_bite_fail"):
		playAnimation(StageScene.PuppyDuo, "stand", {pc=npc2ID, npc=npcID, npcAction="sad", npcBodyState={naked=true}})
		
		saynn("You point at the "+whoStr+" and order your pet!")
		
		saynn("[say=pc]Bite![/say]")
		
		saynn("Your puppy sees the enemy.. and, sadly, gets too scared to bite {npc2.him}. Instead, {npc.he} flops onto the floor and whines while covering {npc.himself} with {npc.his} paws. Looks like {npc.he} still could use some more training..")
		
		saynn("[say=npc2]"+RNG.pick([
			"Pff. Pathetic.",
			"Hah. Couldn't even train your slutty mutt properly.",
			"Bite me? Your pup knows better.",
		])+"[/say]")
		
		saynn("Looks like it's a fight..")
		
		addButton("Fight", "You will have to bite them instead", "mean_start_fight")
		
	if(state == "let_pat"):
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		playAnimation(StageScene.PuppySexOral, "tease", {pc=npc2ID, npc=npcID, npcBodyState={naked=true, hard=true}})
		
		saynn("You nod, allowing {npc2.him} to do it.")
		
		saynn("Your puppy wags {npc.his} tail eagerly as the "+whoStr+" pats {npc.him}.")
		
		saynn("[say=npc2]"+RNG.pick([
			"Who's a good puppy?",
			"Who's a good {npc.boy}?",
			"Adorable, precious puppy.",
			"Look at you, so cute.",
		])+"[/say]")
		
		saynn("Your pet barks back playfully.")
		
		if(RNG.chance(40) && npc2.hasReachablePenis() && !npc.isOralBlocked()):
			saynn("[say=npc2]"+RNG.pick([
				"Wish I could test that little maw of yours.",
				"Wish I could see how well you can treat a bone.",
			])+"[/say]")
			
			addButton("Just leave", "See what happens next", "endthescene")
			if(npcSlavery.getSlaveSkill(SlaveType.Pet) >= 8):
				addButton("Let them", "Let them have some fun with your pet", "let_pat_suck")
			else:
				addDisabledButton("Let them", "Pet skill B- or higher required")
		elif(RNG.chance(40) && npc2.hasReachableVagina() && !npc.isOralBlocked()):
			saynn("[say=npc2]"+RNG.pick([
				"Wish I could see how well you can lick.",
			])+"[/say]")
			
			addButton("Just leave", "See what happens next", "endthescene")
			if(npcSlavery.getSlaveSkill(SlaveType.Pet) >= 8):
				addButton("Let them", "Let them have some fun with your pet", "let_pat_lick")
			else:
				addDisabledButton("Let them", "Pet skill B- or higher required")
		else:
			addButton("Continue", "See what happens next", "endthescene")
	
	if(state == "let_pat_suck_inside"):
		playAnimation(StageScene.PuppySexOral, "sex", {pc=npc2ID, npc=npcID, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		
		saynn("You nod, letting {npc2.him} have some fun with your pet.")
		
		saynn("Your puppy obediently opens {npc.his} maw and lets the "+whoStr+" fuck it raw.. before swallowing the whole load.")
	
		saynn("[say=npc2]"+RNG.pick([
			"Oh yeah, that's a good slutty pet.",
			"Swallow it all, cutie.",
			"There we go. Such a nice mouth.",
		])+"[/say]")
		
		addButton("Continue", "See what happens next", "endthescene")
		
	if(state == "let_pat_suck_outside"):
		playAnimation(StageScene.PuppySexOral, "sex", {pc=npc2ID, npc=npcID, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		
		saynn("You nod, letting {npc2.him} have some fun with your pet.")
		
		saynn("Your puppy obediently opens {npc.his} maw and lets the "+whoStr+" fuck it raw.. before receiving the sticky load onto {npc.his} face.")
	
		saynn("[say=npc2]"+RNG.pick([
			"Enjoy being messy, pup.",
			"You like cum, don't you?",
			"Oops, marked you with my cum.",
			"You lick it off if you want.",
		])+"[/say]")
		
		addButton("Continue", "See what happens next", "endthescene")
		
	if(state == "let_pat_lick"):
		playAnimation(StageScene.PuppySexOral, "grind", {pc=npc2ID, npc=npcID, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		
		saynn("You nod, letting {npc2.him} have some fun with your pet.")
		
		saynn("Your puppy obediently parts {npc.his} lips and rolls {npc.his} tongue out, letting the "+whoStr+" press {npc2.his} {npc2.pussyStretch} pussy against it. {npc2.He} grinds your pup's face.. releasing a shower of fluids onto {npc.his} face.")
	
		saynn("[say=npc2]"+RNG.pick([
			"Enjoy being messy, pup.",
			"That felt good, thank you pup.",
			"Oops, marked you.",
			"You have a nice tongue, puppy.",
		])+"[/say]")
		
		addButton("Continue", "See what happens next", "endthescene")
	
	if(state == "no_pat"):
		playAnimation(StageScene.Duo, "stand", {npc=npc2ID})
		
		saynn("[say=pc]{npc.He} {npc.isAre} not in the mood for strangers today.[/say]")
		
		saynn("The "+whoStr+" frowns slightly.")
		
		saynn("[say=npc2]I see. Oh well.[/say]")
		
		addButton("Continue", "See what happens next", "endthescene")
		
	if(state == "won_mean_fight"):
		playAnimation(StageScene.Duo, "stand", {npc=npc2ID, npcAction="defeat"})
		
		saynn("Hell yeah, the "+whoStr+" hits the floor, unable to continue fighting.")
		
		saynn("[say=npc2]"+RNG.pick([
			"Argh. Fuck you.",
			"Screw you.",
		])+"[/say]")
		
		saynn("Your pup seems to trust you a bit more after that.")
		
		addButton("Continue", "See what happens next", "endthescene")
		
	if(state == "lost_mean_fight"):
		playAnimation(StageScene.Duo, "defeat", {npc=npc2ID})
		
		saynn("Fuck. You hit the floor, unable to continue fighting.")
		
		saynn("[say=npc2]"+RNG.pick([
			"Now take your mutt and go the fuck away.",
			"Go away before I beat up your stupid dog too.",
		])+"[/say]")
		
		saynn("Your pup seems to trust you less after that.")
		
		addButton("Continue", "See what happens next", "endthescene")
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "let_pat"):
		processTime(5*60)
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		npcSlavery.getActivity().onPat()
		#return
	
	if(_action == "let_pat_suck"):
		processTime(5*60)
		if(RNG.chance(50)):
			npc.cummedInMouthBy(npc2ID)
			npc.gotThroatFuckedBy(npc2ID)
			setState("let_pat_suck_inside")
			var npcSlavery:NpcSlave = npc.getNpcSlavery()
			if(npcSlavery != null && npcSlavery.getActivityID()=="Walkies"):
				npcSlavery.getActivity().satisfyWant("food")
		else:
			npc.cummedOnBy(npc2ID)
			npc.gotThroatFuckedBy(npc2ID)
			setState("let_pat_suck_outside")
			var npcSlavery:NpcSlave = npc.getNpcSlavery()
			if(npcSlavery != null && npcSlavery.getActivityID()=="Walkies"):
				npcSlavery.getActivity().satisfyWant("shower")
		return
	
	if(_action == "let_pat_lick"):
		processTime(5*60)
		npc.cummedOnBy(npc2ID, FluidSource.Vagina, RNG.randf_range(0.3, 0.5))
		npc.cummedInMouthBy(npc2ID, FluidSource.Vagina, RNG.randf_range(0.3, 0.7))
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(npcSlavery != null && npcSlavery.getActivityID()=="Walkies"):
			npcSlavery.getActivity().satisfyWant("food")
			npcSlavery.getActivity().satisfyWant("shower")
			
	if(_action == "make_bite"):
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		var winChance = npcSlavery.getSlaveSkill(SlaveType.Pet) * 10
		if(!RNG.chance(winChance)):
			setState("make_bite_fail")
		else:
			setState("make_bite_won")
			npcSlavery.getActivity().onPat()
			npcSlavery.getActivity().satisfyWant("play")
			npcSlavery.getActivity().satisfyWant("train")
			npcSlavery.getActivity().satisfyWant("pee")
		return
		
	if(_action == "mean_start_fight"):
		runScene("FightScene", [npc2ID], "fight_mean")
		return
		
	if(_action == "make_subby_paw"):
		processTime(3*60)
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		npcSlavery.getActivity().satisfyWant("train")
		
	if(_action == "make_subby_bite"):
		processTime(3*60)
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		npcSlavery.getActivity().satisfyWant("play")
	
	if(_action == "make_subby_lick"):
		processTime(3*60)
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		npcSlavery.getActivity().onPat()
		
	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "fight_mean"):
		processTime(10 * 60)
		var battlestate = _result[0]
		#var wonHow = _result[1]
		
		if(battlestate == "win"):
			setState("won_mean_fight")
			addExperienceToPlayer(10)
			var npcSlavery:NpcSlave = npc.getNpcSlavery()
			npcSlavery.addTrust(0.03)
		else:
			setState("lost_mean_fight")
			var npcSlavery:NpcSlave = npc.getNpcSlavery()
			npcSlavery.addTrust(-0.05)

func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID
	data["npc2ID"] = npc2ID
	data["whoStr"] = whoStr
	data["npcVariation"] = npcVariation

	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	npc = GlobalRegistry.getCharacter(npcID)
	
	npc2ID = SAVE.loadVar(data, "npc2ID", "")
	npc2 = GlobalRegistry.getCharacter(npc2ID)
	whoStr = SAVE.loadVar(data, "whoStr", "")
	npcVariation = SAVE.loadVar(data, "npcVariation", "")
