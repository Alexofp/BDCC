extends RecruitSceneBase

var gentle = false
var mean = false
var condomType = ""
var condomUsed = false
var condomBroke = false
var straponUsed = false
var cameInsideRahi = false

func _init():
	sceneID = "RahiRecSceneSexAnal"

func _run():
	if(state == ""):
		addCharacter("rahi")
		gentle = (c1 == 0)
		mean = (c1 == 2)
		condomType = extra("condom", "no")
		condomUsed = (condomType != "no")
		straponUsed = (extra("strapon", "") != "")
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcBodyState={leashedBy="pc"}})
		aimCameraAndSetLocName("hideout_breakroom")
		saynn("You tell Kait your plan.. and she gives you something.")

		saynn("Then, you enter the cell and grab Rahi's leash. Her rear paws shuffle across the cold floor as you lead her to the center of the space, her tail curling low.")

		saynn("[say=rahi]W-what is she.. meow..[/say]")

		saynn("She watches as you unbutton her shirt and pull her shorts down.")

		saynn("[say=pc]"+str(ch1("Don't worry, I'll be gentle. Let me know if I should stop. Just kneel, please?", "On your knees. Now.", "Shut up and get down, cat. You know what's coming."))+"[/say]")

		saynn("Her breath hitches. She swallows.. and obeys.. sinking to her knees..")

		saynn("Then you reveal the given item.. a small bottle of lube. The click of the cap makes her shiver.")

		addButton("Continue", "See what happens next", "sex_prepare")
	if(state == "sex_prepare"):
		saynn("You squirt a generous amount of it onto your digits.. then kneel behind her and move her tail out of the way. Rahi gasps as you press one slick digit against her tight anal ring. Then she gasps even louder as you slowly work it inside her.")

		saynn("[say=rahi]Is that.. it's too.. tight..[/say]")

		saynn("[say=pc]"+str(ch1("Shh. I'll go slow. Just breathe.", "That's the point, kitty. I'm going to stretch that tight hole.", "I don't care. You'll take it anyway, little future buttslut."))+"[/say]")

		saynn("You pump your finger gently, spreading the lube around her entrance. She clenches at first.. then slowly loosens, her tail curling around your wrist. You manage to add a second finger quite easily. Rahi's body tenses.. but she doesn't pull away.. she just tilts her head lower.")

		saynn("Her pussy, neglected, begins to shine. A few lonely beads of her juices drip down her inner thighs.")

		saynn("[say=rahi]T-this.. is a bit.. embarrassing..[/say]")

		saynn("[say=pc]"+str(ch1("That's natural. Nothing to be ashamed of.", "Good. I want to see how wet you get from just your ass.", "Such a whore. Getting this wet from anal fingering."))+"[/say]")

		if (!straponUsed):
			saynn("You withdraw your fingers and line yourself up, the tip of your cock already prodding at the entrance. "+str("You take some extra time to put a condom on.. Might as well use one." if condomUsed else "")+"")

		else:
			saynn("You withdraw your fingers and quickly secure the strapon around your waist, the shiny tip already brushing against her entrance.. prodding it.")

		addButton("Continue", "See what happens next", "sex_part")
	if(state == "sex_part"):
		saynn("Then you push inside.")

		saynn("[say=rahi]Aaah.. T-too much.. it's too thick.. meow..[/say]")

		saynn("Her claws scrape the concrete as she jerks forward. You hold her hips, keeping her in place. The anal ring clenches around your member, resisting, but the lube lets you sink deeper inch by inch.")

		saynn("[say=rahi]S-stretching.. she feels so full..[/say]")

		saynn("You pause halfway, letting her adjust. Her inner walls keep tensing up, trying to push you out. Her pussy, meanwhile, keeps dripping onto the floor.")

		saynn("You draw back slowly.. then push deeper. Rahi moans.. her body squirming as you bury more of your "+str("toy" if straponUsed else "shaft")+" inside.")

		saynn("[say=pc]"+str(ch1("See? You can take it. Such a good kitty.", "Your cute butt can take more than that.", "Look at that. The bitch is starting to enjoy it already."))+"[/say]")

		addButton("Continue", "See what happens next", "sex_fast")
	if(state == "sex_fast"):
		saynn("You pick up the pace, railing that tight ass faster. Rahi's moans grow louder, more broken, her anal star desperately clenching around you.")

		saynn("[say=rahi]Ah.. ah.. please.. slower.. meow..[/say]")

		saynn("[say=pc]"+str(ch1("Breathe with me. In and out. You're doing fine.", "You're loving it, I can feel it.", "Shut your mouth and take it, buttslut. I'll decide the pace."))+"[/say]")

		saynn("Her legs shake. Her face is buried in her forearms, ears flat, cheeks burning. The sound of your hips slapping against her ass echoes off the stone walls.")

		saynn("A long, thick string of her pussy juice drips from her clit to the floor, stretching, then breaking.")

		saynn("[say=rahi]She.. s-she can't.. c-cum..[/say]")

		saynn("[say=pc]"+str(ch1("That's okay. You don't have to. Just feel it.", "If you submit, we can work on that more.", "That's the point, you needy little bitch. Feels great for me."))+"[/say]")

		saynn("Her inner walls spasm around your "+str("{pc.penis}" if !straponUsed else "strapon")+". Her pussy continues to make a wet puddle under her..")

		if (!straponUsed):
			saynn("You're very close.")

		addButton("Cum inside", "Fill her ass!", "sex_cum")
	if(state == "sex_cum"):
		saynn("You keep fucking Rahi's ass through her trembling, through her whimpering..")

		if (straponUsed):
			saynn("After a few more thrusts, you slam the strap to the hilt! Her anal walls squeeze tight around the shaft as you grind deep inside her.. the harness presses flush against her ass, every inch of the toy buried to the base. Rahi mewls, her body shivering from each deep thrust, her tail spazzing wildly.")

			saynn("[say=pc]"+str(ch1("Yes.. This feels so good.", "Take it all in your ass.. Like a good kitty..", "Little bitch.. I knew you could fit this whole rubber cock."))+"[/say]")

		elif (condomUsed && !condomBroke):
			saynn("As soon as you reach your peak, you bury yourself to the hilt! Her anal walls squeeze tight as you spill inside her.. thick ropes of your {pc.cum} begin flooding that condom inside her rectum, pumping it full to the brim. Looks like it held! Rahi mewls, her body shivering from every pulse, her tail spazzing wildly.")

			saynn("[say=pc]"+str(ch1("Yes.. This feels so good.", "Take it all.. Like a good kitty..", "Little bitch.. I knew you could take it."))+"[/say]")

		else:
			saynn("As soon as you reach your peak, you bury yourself to the hilt!"+str(" Oh no, looks like the [b]condom broke![/b]" if condomBroke else "")+" Her anal walls squeeze tight as you spill inside her.. thick ropes of your {pc.cum} begin flooding her rectum, pumping her full of it. Rahi mewls, her body shivering from every pulse, her tail spazzing wildly.")

			saynn("[say=pc]"+str(ch1("Yes.. This feels so good.", "Take it all.. Like a good kitty..", "Little bitch.. I knew you could take it."))+"[/say]")

		saynn("After a few more quick thrusts, you stay inside her"+str(" , letting her clenching anus milk you dry" if cameInsideRahi else "")+". Rahi collapses onto her elbows, gasping, her neglected pussy still dripping onto the floor.")

		saynn("[say=rahi]She.. she can't.. ah.. f-fhhh..[/say]")

		if (gentle):
			saynn("After you're done.. you pull out.. slowly and carefully. Her anal ring gapes slightly before shrinking back.")

			saynn("[say=pc]There you go. That wasn't so bad, was it?[/say]")

			saynn("[say=rahi]Me-e-eow..[/say]")

		elif (mean):
			saynn("After you're done.. you yank your cock out hard, leaving Rahi's asshole to gape open"+str(" and leak your seed onto her thighs" if cameInsideRahi else ", dripping with lube")+".")

			saynn("[say=pc]There you go, whore. Your ass is mine now.[/say]")

			saynn("[say=rahi]Me-e-eow..[/say]")

		else:
			saynn("After you're done.. you pull your cock out, leaving Rahi's asshole to shiver"+str(" , some of your seed already leaking out" if cameInsideRahi else ", still slick with lube")+".")

			saynn("[say=pc]Good girl.. Very good girl.[/say]")

			saynn("[say=rahi]Th-thank you.. meow..[/say]")

		saynn("[say=pc]You're gonna work for me now, right?[/say]")

		if (perfect):
			saynn("[say=rahi]Of course.. she will do anything you want.. even that again..[/say]")

		elif (success):
			saynn("[say=rahi]Yes.. she will do what you ask.. just.. go easy on her ass..[/say]")

		else:
			saynn("[say=rahi]Um.. uh.. well..[/say]")

			saynn("Hm.. It doesn't look like she will.")

		saynn("You wrap it all up.. then step out of the cell to see what Kait thinks..")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "sex_prepare"):
		processTime(10*60)
		if(straponUsed):
			recWearStrapon()

	if(_action == "sex_part"):
		processTime(3*60)

	if(_action == "sex_fast"):
		processTime(3*60)

	if(_action == "sex_cum"):
		
		if(condomType == "worst"):
			if(GM.pc.shouldCondomBreakWhenFucking("rahi", GM.pc.useWorstCondom(), "anal")):
				condomBroke = true
		if(condomType == "best"):
			if(GM.pc.shouldCondomBreakWhenFucking("rahi", GM.pc.useBestCondom(), "anal")):
				condomBroke = true
		
		if(straponUsed):
			getCharacter("rahi").cummedInAnusBy("pc", FluidSource.Strapon)
		if(!straponUsed && (!condomUsed || condomBroke)):
			cameInsideRahi = true
			getCharacter("rahi").cummedInAnusBy("pc")
		if(condomUsed && !condomBroke):
			addFilledCondomToLootIfPerk(GM.pc.createFilledCondom())
		GM.pc.orgasmFrom("rahi")

	setState(_action)

func saveData():
	var data = .saveData()

	data["gentle"] = gentle
	data["mean"] = mean
	data["condomType"] = condomType
	data["condomUsed"] = condomUsed
	data["condomBroke"] = condomBroke
	data["straponUsed"] = straponUsed
	data["cameInsideRahi"] = cameInsideRahi

	return data

func loadData(data):
	.loadData(data)

	gentle = SAVE.loadVar(data, "gentle", false)
	mean = SAVE.loadVar(data, "mean", false)
	condomType = SAVE.loadVar(data, "condomType", "")
	condomUsed = SAVE.loadVar(data, "condomUsed", false)
	condomBroke = SAVE.loadVar(data, "condomBroke", false)
	straponUsed = SAVE.loadVar(data, "straponUsed", false)
	cameInsideRahi = SAVE.loadVar(data, "cameInsideRahi", false)
