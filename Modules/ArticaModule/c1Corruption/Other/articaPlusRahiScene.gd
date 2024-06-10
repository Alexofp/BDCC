extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false
var isSlave = false
var isFullSlave = false
var isStrapon = false

func _init():
	sceneID = "articaPlusRahiScene"

func _run():
	if(state == ""):
		addCharacter("artica")
		addCharacter("rahi")
		isNaked = getFlag("ArticaModule.NoClothes", false)
		isCaged = getCharacter("artica").isWearingChastityCage()
		corruption = getModule("ArticaModule").getCorruption()
		isSlut = getModule("ArticaModule").isSlut()
		isVerySlut = getModule("ArticaModule").isVerySlut()
		isLusty = getModule("ArticaModule").isLusty()
		nakedAndShy = (isNaked && !isSlut)
		isSlave = getModule("RahiModule").isInSlavery()
		isFullSlave = getModule("RahiModule").canTalkInFirstPerson()
		playAnimation(StageScene.Duo, "stand", {npc="rahi"})
		saynn("You tell Artica to head into her cell.. while you go and grab Rahi. You get a feeling that pairing the shy kitty and the shy fluff might lead to something interesting.")

		saynn("[say=rahi]Hang around with Artica? She is fun.. Sounds good.. meow..[/say]")

		saynn("It doesn't take much effort to convince the kitty. So you bring her into Artica's cell too.")

		addButton("Continue", "See what happens next", "in_cell")
	if(state == "in_cell"):
		playAnimation(StageScene.Duo, "stand", {npc="artica", pc="rahi"})
		aimCameraAndSetLocName("cellblock_lilac_nearcell")
		GM.pc.setLocation("cellblock_lilac_nearcell")
		saynn("Kitty waves to the"+str(" naked" if isNaked else "")+" lilac girl.")

		saynn("[say=rahi]Hello-o..[/say]")

		saynn("Artica waves back. They're standing near each other.. while you just go sit on a chair, hoping to see a great show.")

		if (isFullSlave):
			saynn("[say=artica]Heyas.. Rahi..[/say]")

		else:
			saynn("[say=artica]Heyas.. Kitty..[/say]")

		saynn("Rahi sees how you just sat in the corner with your legs crossed.. and hums, her sly kitty eyes already begin to make the fluff blush.")

		saynn("[say=artica]What is t-this about..[/say]")

		saynn("[say=rahi]Hmm..[/say]")

		saynn("Artica tilts her head.. while Rahi makes a single step towards her.")

		if (isFullSlave):
			saynn("[say=rahi]I think.. {rahiMaster} here wants to see.. who is the biggest slut out of the two of us..[/say]")

		else:
			saynn("[say=rahi]She thinks.. {pc.name} wants to see.. who is the biggest slut out of the two of us..[/say]")

		saynn("Rahi smiles and looks at you for confirmation. Even though she is an incredibly subby kitty.. subbyness is relative.. A single cat can be both a prey and predator..")

		saynn("What do you want Rahi to do with Artica?")

		addButton("Play", "See what Rahi can do with the fluff", "do_play")
		addButton("Go full out", "(Sex) Let Rahi bully Artica into full submission", "do_fullout")
		addButton("Train sex!", "Have a threesome with Artica in the middle", "do_trainsex")
	if(state == "do_trainsex"):
		playAnimation(StageScene.Duo, "stand", {npc="artica", npcBodyState={naked=true,hard=true}})
		addCharacter("artica", ["naked"])
		saynn("Your gaze sparks with lust.")

		saynn("[say=pc]You know.. I'm actually thinking of double-teaming a certain someone together.[/say]")

		saynn("[say=rahi]Ohh.. Sounds good..[/say]")

		saynn("You get up from the chair and stand in another corner of the room, making it so Artica is now between you and Rahi.. Both your gazes are staring at the slightly confused fluff..")

		saynn("Artica looks around while you just smile. You see how Rahi is bracing, trying to focus on something.")

		saynn("[say=artica]Um.. I.. eek![/say]")

		saynn("Suddenly Rahi steps closer and puts her paws all over the girl,"+str(" forcibly undressing her and then" if !isNaked else "")+" bravely groping and caressing her butt. Artica is moaning and acting incredibly subby while kitty's paws already reach between the herm's legs, finding the cute wet slit and"+str(" the caged up sheath" if isCaged else " the sheath that her cyan member already peeking from")+"..")

		if (isCaged):
			saynn("[say=rahi]That is cute.. Luckily, we won't have to remove the cage..[/say]")

			saynn("[say=artica]Oh?..[/say]")

			saynn("Rahi pulls out a strapon harness.. that she has from somewhere.. and quickly secures it around Artica's waist, putting a rubber cock over her caged one and making sure her slit is still available..")

			saynn("[say=rahi]That is your new cock, stupid slut.. You are now our bitch..[/say]")

		else:
			saynn("[say=rahi]Shut up, stupid slut.. You are now our bitch..[/say]")

		saynn("Rahi is certainly.. very mouthy.. But it seems to work on Artica, the intimidated fluff is shivering.. but also dripping juices all over the floor, the scent of an aroused slutty girl hits your senses..")

		saynn("[say=rahi]You're such a cute little bitch, aren't you?[/say]")

		saynn("Rahi tries to sound dommy, her voice low and husky. She keeps rubbing Artica's"+str(" new rubber" if isCaged else "")+" cock and pussy with slow strokes and rubs, feeling"+str(" her shaft swell and" if !isCaged else " her strapon harness twitching above the cage and")+" her pussy getting more slick under her touch. Artica shivers, her breath hitching..")

		saynn("[say=artica]R-Rahi..[/say]")

		if (isFullSlave):
			saynn("[say=rahi]Miss Rahi. Call me Miss Rahi or I will.. kick your balls![/say]")

		else:
			saynn("[say=rahi]Miss Rahi. Call her Miss Rahi or she will.. kick your balls![/say]")

		saynn("[say=artica]M-Miss Rahi.. ah..[/say]")

		saynn("The fluff is whimpering as Rahi squeezes her balls, the mix of fear and arousal making her tremble.")

		saynn("Artica is gonna be in the middle of a sex train.. But which spot do you want to take?")

		addButton("First", "Be the one who is getting fucked by Artica. Rahi will be fucking Artica with a strapon while Artica fucks you", "train_be_first")
		if (GM.pc.hasReachablePenis() || (GM.pc.hasStrapons() && GM.pc.canWearStrapon())):
			addButton("Last", "Be the one who is fucking Artica. Rahi will be getting fucked by Artica while you fuck Artica", "train_be_last")
		else:
			addDisabledButton("Last", "You don't have any strapons to fuck Artica while she fucks Rahi..")
	if(state == "train_be_last"):
		playAnimation(StageScene.SexTrain, "tease", {pc="artica", npc="rahi", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2="pc", npc2BodyState={naked=true,hard=true}})
		saynn("You twirl your finger while looking at Rahi.. and she understands everything.")

		saynn("[say=rahi]Kneel![/say]")

		saynn("Together, you forcibly bring Artica onto her knees. You position yourself behind, your hands gripping Artica's hips, keeping her still.")

		saynn("Rahi grabs Artica's chin.. and makes the fluff look up at her.. as she undresses, dropping her shorts and shirt, exposing her {rahi.breasts} and cute pink pussy.. Artica gulps audibly.")

		saynn("[say=rahi]We're gonna use you.. like the stupid slutty fucktoy that you are..[/say]")

		saynn("Rahi then turns around and gets on all fours, her pussy wet and ready.. She reaches one of her hands out to guide Artica's "+str("rubber canine cock" if isStrapon else "canine cock")+" into her slick entrance.. while you put pressure on her back from behind, preventing her from escaping but also aligning your own cock with her cyan cunt and letting it rub against her wet sensetive folds..")

		if (isFullSlave):
			saynn("[say=rahi]Fuck me.. you little whore.[/say]")

		else:
			saynn("[say=rahi]Fuck her.. you little whore.[/say]")

		saynn("[say=artica]Eek.. I.. oh..[/say]")

		saynn("Rahi growls, trying to maintain her dom persona. All the while Artica is sandwiched between you two, her body shivering from the overwhelming sensations coming from both ends..")

		addButton("Thrust!", "Start fucking the fluff", "behind_do_thrust")
	if(state == "behind_do_thrust"):
		playAnimation(StageScene.SexTrain, "sex", {pc="artica", npc="rahi", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2="pc", npc2BodyState={naked=true,hard=true}})
		saynn("With a fast thrust, you enter Artica, ramming your cock down her slit and eliciting a sharp gasp from her. As your hips collide with Artica's butt, it makes her thrust her hips forward too, causing her"+str(" rubber" if isStrapon else "")+" cock to part Rahi's pussy folds wide and slide inside..")

		saynn("[say=artica]EEP-.. nhh..[/say]")

		saynn("[say=rahi]Ah..[/say]")

		saynn("As Artica recoils from your thrust, you meet her ass with another, pounding her pussy raw.. while she, in turn, fucks Rahi.")

		saynn("[say=rahi]You like this, don't you, slut? Being used like.. the bitch that you are? Ah..[/say]")

		saynn("Artica's response is just a series of whimpers and moans, her body betraying her as her arousal skyrockets, her"+str(" rubber member getting squeezed tightly by Rahi's pussy.. and she somehow feels it.." if isStrapon else " canine member getting squeezed tightly by Rahi's pussy..")+"")

		addButton("Faster", "Thrust faster", "behind_faster")
	if(state == "behind_faster"):
		playAnimation(StageScene.SexTrain, "fast", {pc="artica", npc="rahi", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2="pc", npc2BodyState={naked=true,hard=true}})
		saynn("Gradually, you increase the pace, thrusting down that cyan slit harder while your grip on her hips is tightening. You lean in closer to her ear and whisper..")

		saynn("[say=pc]You're such a good girl, Artica.. Take it all..[/say]")

		saynn("[say=artica]Nyahh..[/say]")

		saynn("..and instantly feel her pussy clench around your cock.")

		if (isFullSlave):
			saynn("[say=rahi]Ah.. You're gonna knot my pussy, slut, you hear? Your whole cock is going inside me.. or I'm gonna.. ah.. g-gonna.. s-step.. ah..[/say]")

		else:
			saynn("[say=rahi]Ah.. You're gonna knot her pussy, slut, you hear? Your whole cock is going inside her.. or she is gonna.. ah.. g-gonna.. s-step.. ah..[/say]")

		saynn("The cell is filled with the sounds of your bodies moving together, mixed with all the moans and gasps of pleasure. Artica was lost in the sensations, her mind probably a complete haze from submission and lust. As you continue to fuck her clenching pussy, Rahi also picks up the pace and impales herself on Artica's cock harder and faster.. her pink folds slapping against the"+str(" growing" if !isStrapon else " fat rubber")+" knot..")

		addButton("Continue", "See what happens next..", "behind_cum")
	if(state == "behind_cum"):
		playAnimation(StageScene.SexTrain, "inside", {pc="artica", npc="rahi", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npc2="pc", npc2BodyState={naked=true,hard=true}})
		saynn("With a final, desperate thrust, Rahi manages to knot herself on Artica's cock, the sudden spike of pleasure sending them both over the edge!")

		saynn("[say=rahi]Myaa-ah..[/say]")

		if (isStrapon):
			saynn("Rahi is shaking while Artica's cock is throbbing.. inside of its little cage.. cum leaking from under Artica's strapon harness as her pussy clenches around your cock, trying to milk it.. and succeeding..")

		else:
			saynn("Rahi is shaking while Artica's cock is throbbing and pulsing, flooding the cat's womb full of her seed.. At same time, Artica's pussy clenches around your cock, trying to milk it.. and succeeding..")

		saynn("You groan and throw your hips forward, ramming your {pc.penis} deep inside and breaking into Artica's babymaker.. before pumping it full of your {pc.cum}.. The intensity of this rough treatment pushed Artica deeper into the abyss of pleasure, her entire body shaking between you and Rahi..")

		saynn("Rahi, who was equally overwhelmed by this, her pussy squirting, producing a fountain of juices, milking Artica's"+str(" fake" if isStrapon else "")+" cock while the room echoing with her moans, her legs shaking wildly.")

		saynn("As you all begin to come down from your highs, you continue to hold Artica gently, your member inside her.. while her"+str(" rubber" if isStrapon else "")+" member is inside Rahi..")

		saynn("[say=rahi]Ah.. f-feels so good.. h-hh..[/say]")

		saynn("[say=artica]Hhhnnhh.. mhhh..[/say]")

		saynn("[say=pc]You two are so cute.[/say]")

		saynn("[say=rahi]N-no.. y-you..[/say]")

		addButton("Continue", "See what happens next", "aftercuddle")
	if(state == "aftercuddle"):
		playAnimation(StageScene.Sleeping, "sleep", {pc="rahi", npc="artica", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("After so much fun.. you let the girls cuddle together. Rahi is licking Artica's ear.. while the white fluff moans softly.")

		saynn("Who knew that they would get along so well.")

		saynn("You join the cuddle pile and spend some time together with them..")

		saynn("But soon it was time to go..")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "in_cell"):
		processTime(3*60)

	if(_action == "do_trainsex"):
		getCharacter("artica").getInventory().equipItem(GlobalRegistry.createItem("StraponCanine"))
		isStrapon = true

	if(_action == "train_be_first"):
		processTime(3*60)

	if(_action == "train_be_last"):
		processTime(3*60)
		if(!GM.pc.hasReachablePenis()):
			setState("be_last_pickstrapon")
			return

	if(_action == "behind_do_thrust"):
		processTime(3*60)

	if(_action == "behind_faster"):
		processTime(3*60)

	if(_action == "behind_cum"):
		processTime(3*60)
		if(!isStrapon):
			getCharacter("rahi").cummedInVaginaBy("artica")
		getCharacter("artica").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("artica")

	if(_action == "aftercuddle"):
		processTime(10*60)
		getCharacter("artica").removeStrapon()
		GM.pc.unequipStrapon()

	setState(_action)

func saveData():
	var data = .saveData()

	data["isNaked"] = isNaked
	data["isCaged"] = isCaged
	data["corruption"] = corruption
	data["isSlut"] = isSlut
	data["isVerySlut"] = isVerySlut
	data["isLusty"] = isLusty
	data["nakedAndShy"] = nakedAndShy
	data["isSlave"] = isSlave
	data["isFullSlave"] = isFullSlave
	data["isStrapon"] = isStrapon

	return data

func loadData(data):
	.loadData(data)

	isNaked = SAVE.loadVar(data, "isNaked", false)
	isCaged = SAVE.loadVar(data, "isCaged", false)
	corruption = SAVE.loadVar(data, "corruption", 0.0)
	isSlut = SAVE.loadVar(data, "isSlut", false)
	isVerySlut = SAVE.loadVar(data, "isVerySlut", false)
	isLusty = SAVE.loadVar(data, "isLusty", false)
	nakedAndShy = SAVE.loadVar(data, "nakedAndShy", false)
	isSlave = SAVE.loadVar(data, "isSlave", false)
	isFullSlave = SAVE.loadVar(data, "isFullSlave", false)
	isStrapon = SAVE.loadVar(data, "isStrapon", false)
