extends RecruitSceneBase

var gentle = false
var mean = false
var condomType = ""
var condomUsed = false
var condomBroke = false
var straponUsed = false
var cameInsideRahi = false

func _init():
	sceneID = "RahiRecSceneSexBondage"

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
		saynn("This plan will require lots of bondage gear.. but Kait is kind enough to share the missing required pieces.")

		saynn("And so you enter Rahi's cell and grab her leash. Her ears go flat as you lead her to the center of the room and then turn towards her.")

		saynn("[say=pc]"+str(ch1("I'm gonna be very gentle.", "You're gonna stand still for me, like a good kitty.", "One wrong move.. and I will make it hurt.. a lot."))+"[/say]")

		saynn("[say=rahi]Meow?..[/say]")

		saynn("Time to have some fun.")

		addButton("Cuff her", "Time for bondage!", "do_bondage")
	if(state == "do_bondage"):
		playAnimation(StageScene.HangingDuo, "idle", {pc="pc", npc="rahi", npcBodyState={naked=true, hard=true}})
		saynn("That shirt is only gonna get in the way. Without saying anything, you begin unbuttoning and taking it off.")

		saynn("[say=rahi]W-what are you.. meow![/say]")

		saynn("Then you grab her paws and cuff them together! You repurpose the leash, disconnecting it from her collar and clipping it to her cuffs instead, the other end gets looped over a sturdy ceiling hook that was conveniently installed here at some point.")

		saynn("[say=rahi]Oh.. wait! Ah![/say]")

		saynn("The metal rattles as you pull on the leash, making the cat pull her arms above her head. Rahi rises onto her tippy toes, barely touching the floor.")

		saynn("Her exposed chest is moving up and down, pink nips catching the cold wind. She blushes as you look at her.")

		saynn("But you're not done yet. You grab her shorts by the waistband and pull them down, the helpless feline can't do anything as you expose her fluffy thighs and a cute little flower between her legs.")

		saynn("[say=rahi]Meow-w..[/say]")

		saynn("[say=pc]"+str(ch1("I'm gonna make you wear some more things. I hope this is okay. Let me know if I should stop.", "I'm just getting started, kitty cat.", "Fucktoys like you don't deserve freedom."))+"[/say]")

		saynn("You secure a pair of cuffs around her ankles next. But instead of connecting them together, you use a metal spreader in between, which forces her to hold her legs spread for you.")

		saynn("[say=rahi]She.. she can't cover herself up anymore..[/say]")

		saynn("[say=pc]"+str(ch1("Again, let me know if I should stop.", "Good.", "Shut up, little slut."))+"[/say]")

		saynn("Indeed, her pink folds are now on full display. You slide your digits over the sensitive parts and hear a little moan from her, your digits catching some of her arousal.")

		saynn("Still, you're not done yet.")

		addButton("More toys", "Put more things on Rahi", "more_toys")
	if(state == "more_toys"):
		playAnimation(StageScene.HangingSex, "tease", {pc="pc", npc="rahi", bodyState={naked=true, hard=true, condom=condomUsed}, npcBodyState={naked=true, hard=true}})
		saynn("A strip of black cloth goes over her eyes, pulling her into complete darkness. Then comes the ballgag. You push the rubber ball against her lips until she parts them, the rubber sphere now holding her jaw open, her tongue drooling.")

		saynn("[say=rahi]Mmph..[/say]")

		saynn("Her tail curls between her legs, the only part of her that wasn't made helpless.")

		saynn("Almost done.. The last toy that you have is a little bullet vibrator. You strap the remote around her thigh and then use a piece of tape to attach the little pink egg directly onto her clit. As you turn the dial, the toy starts buzzing ever so audibly, making kitty sways her butt.")

		saynn("[say=rahi]Mhh-h.. mhhphh..[/say]")

		saynn("[say=pc]"+str(ch1("That looks great. Lovely.", "I know you like it. You will like what I will do with you next even more.", "Nothing but a needy whore. Not even trying to resist."))+"[/say]")

		saynn("The chains hold her helpless, her toes barely touching the floor, her perky tits bouncing free, her pussy dripping juices onto the floor. Rahi throws her head back and lets out muffled moans into the gag..")

		if (!straponUsed):
			saynn("That's when you get behind her, your cock getting lined up with her folds, the tip already prodding at the entrance. "+str("You take some extra time to put a condom on.. Might as well use one." if condomUsed else "")+"")

		else:
			saynn("That's when you quickly secure the strapon around your waist, the shiny tip already brushing against her folds, prodding at the entrance.")

		addButton("Continue", "See what happens next", "sex_part")
	if(state == "sex_part"):
		playAnimation(StageScene.HangingSex, "sex", {pc="pc", npc="rahi", bodyState={naked=true, hard=true, condom=condomUsed}, npcBodyState={naked=true, hard=true}})
		saynn("Then you push inside..")

		saynn("[say=rahi]Mmph-![/say]")

		saynn("Her whole body tenses, chains rattling more. She tries to instinctively close her thighs.. but the ankle spreader holds her open for you. Her claws scratch uselessly at the metal.")

		saynn("You don't rush it. You draw back slowly.. allowing her slick tunnel to close up.. before pushing deep inside again! Each thrust makes her swing gently forward and back, meeting your motions.")

		saynn("[say=rahi]Nnnh.. hhh.. ah… mphh..[/say]")

		saynn("Her tail wraps around your waist, desperate for something to hold. Each thrust pulls a soft noise out of her, her toes curling, her bound paws straining against the cuffs.")

		addButton("Continue", "See what happens next", "sex_fast")
	if(state == "sex_fast"):
		playAnimation(StageScene.HangingSex, "fast", {pc="pc", npc="rahi", bodyState={naked=true, hard=true, condom=condomUsed}, npcBodyState={naked=true, hard=true}})
		saynn("You pick up the pace, railing that slick pussy faster. Rahi's muffled moans get louder, her body squirming in the restraints, her inner walls clenching tightly around you, her clit still getting pleasured by the toy at the same time.")

		saynn("[say=rahi]Mmmphh.. mmmphh-..[/say]")

		saynn("[say=pc]"+str(ch1("You're doing great, kitty.. just let it happen..", "Good. Squirm. The chains won't break.", "Shut up and cum on my cock, cat."))+"[/say]")

		saynn("Seconds later, her pussy slit begins to spasm around you as your "+str("cock" if !straponUsed else "strapon")+" hammers against a particular spot that makes her whole body go rigid.. and then the opposite.")

		saynn("Her back arches. Her toes curl so hard they probably cramp. A long, passionate cry gets caught by her ballgag.")

		saynn("Her orgasm shakes the chains, her tails tightens around you like a rope.")

		saynn("But you're not done..")

		addButton("Cum inside", "Breed the kitty!", "sex_cum")
	if(state == "sex_cum"):
		playAnimation(StageScene.HangingSex, "inside", {pc="pc", npc="rahi", pcCum=cameInsideRahi, bodyState={naked=true, hard=true, condom=condomUsed}, npcBodyState={naked=true, hard=true}})
		saynn("You keep fucking Rahi through her orgasm, through her squirming.. until she is whimpering and trying to push back against the chains."+str(" The pressure builds in your {pc.penis}.." if !straponUsed else "")+"")

		if (straponUsed):
			saynn("As soon as her peak begins to fade, you slam the strap to the hilt! Her walls squeeze tight around the shaft again as you grind deep inside her.. the harness presses flush against her thighs, every inch of the toy buried to the base. Rahi mewls into the gag, her body shivering from each deep thrust, her tail spazzing wildly.")

			saynn("[say=pc]"+str(ch1("Yes.. This feels so good.", "Take it all.. Like a good bound kitty..", "Little bitch.. getting fucked with a rubber cock."))+"[/say]")

		elif (condomUsed && !condomBroke):
			saynn("As soon as you reach your peak, you bury yourself to the hilt! Her walls squeeze tight as you spill inside her.. thick ropes of your {pc.cum} begin flooding that condom inside her, pumping it full to the brim. Looks like it held! Rahi mewls, her body shivering from every pulse, her tail spazzing wildly.")

			saynn("[say=pc]"+str(ch1("Yes.. This feels so good.", "Take it all.. Like a good kitty..", "Breeding bitch.. getting her cunt fucked like that."))+"[/say]")

		else:
			saynn("As soon as you reach your peak, you bury yourself to the hilt!"+str(" Oh no, looks like the [b]condom broke![/b]" if condomBroke else "")+" Her walls squeeze tight as you spill inside her.. thick ropes of your {pc.cum} begin flooding her, pumping her womb full of it. Rahi mewls, her body shivering from every pulse, her tail spazzing wildly.")

			saynn("[say=pc]"+str(ch1("Yes.. This feels so good.", "Take it all.. Like a good kitty..", "Breeding bitch.. getting her cunt stuffed while completely helpless."))+"[/say]")

		saynn("After a few more quick thrusts, you stay inside her"+str(", letting her clenching slit milk you dry" if cameInsideRahi else "")+". Her ragged breathing is loud through her nose, the blindfold soaked.")

		addButton("Continue", "See what happens next", "after_care")
	if(state == "after_care"):
		playAnimation(StageScene.Cuddling, "idle", {pc="pc", npc="rahi", bodyState={naked=true}, npcBodyState={naked=true, hard=true}})
		if (gentle):
			saynn("After you're done.. you pull out slowly and carefully. Her legs are shaky so you lower her wrists gently, unclipping the cuffs one by one. Rahi slumps into your arms"+str(", your seed dripping out of her used pussy" if cameInsideRahi else ", her pussy dripping with juices")+". You unstrap the gag last.")

			saynn("[say=rahi]Th-thank you.. meow..[/say]")

			saynn("[say=pc]There you go. Wasn't this fun?[/say]")

		elif (mean):
			saynn("After you're done.. you yank your cock out hard, leaving Rahi's pussy gaping"+str(" and gushing with your seed" if cameInsideRahi else " and dripping with her juices")+". She hangs limp in the chains, barely responding. You leave a little bite on her neck..")

			saynn("[say=pc]There you go, whore. You're mine.[/say]")

			saynn("You leave her hanging for a moment longer before lowering and catching her.")

		else:
			saynn("After you're done.. you pull your cock out, leaving Rahi's pussy"+str(" to drip your seed onto her thighs" if cameInsideRahi else " to drip juices onto her thighs")+". Her legs are shaky.. so you catch her as you unclip the cuffs, then give her a little bite on the neck through the gag.")

			saynn("[say=pc]Good girl.. Very good girl.[/say]")

			saynn("You remove the blindfold and gag last. She blinks up at you, tears on her cheeks.")

		saynn("[say=pc]You're gonna work for me now, right?[/say]")

		if (perfect):
			saynn("[say=rahi]Of course.. she will do everything you want.. meow..[/say]")

		elif (success):
			saynn("[say=rahi]Yes.. she will do what you ask..[/say]")

		else:
			saynn("[say=rahi]Um.. uh.. well..[/say]")

			saynn("Hm.. It doesn't look like she will.")

		saynn("You wrap up and step out of the cell to see what Kait thinks..")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_bondage"):
		putOn("rahi", "inmatewristcuffs")
		putOn("rahi", "inmateanklecuffs")

	if(_action == "more_toys"):
		processTime(10*60)
		putOn("rahi", "blindfold")
		putOn("rahi", "ballgag")
		if(straponUsed):
			recWearStrapon()

	if(_action == "sex_part"):
		processTime(3*60)

	if(_action == "sex_fast"):
		processTime(3*60)

	if(_action == "sex_cum"):
		
		if(condomType == "worst"):
			if(GM.pc.shouldCondomBreakWhenFucking("rahi", GM.pc.useWorstCondom())):
				condomBroke = true
		if(condomType == "best"):
			if(GM.pc.shouldCondomBreakWhenFucking("rahi", GM.pc.useBestCondom())):
				condomBroke = true
		
		if(straponUsed):
			getCharacter("rahi").cummedInVaginaBy("pc", FluidSource.Strapon)
		if(!straponUsed && (!condomUsed || condomBroke)):
			cameInsideRahi = true
			getCharacter("rahi").cummedInVaginaBy("pc")
		if(condomUsed && !condomBroke):
			addFilledCondomToLootIfPerk(GM.pc.createFilledCondom())
		GM.pc.orgasmFrom("rahi")

	if(_action == "after_care"):
		processTime(3*60)
		recRemoveStrapons()
		putOff("rahi", "blindfold")
		putOff("rahi", "ballgag")
		putOff("rahi", "inmatewristcuffs")
		putOff("rahi", "inmateanklecuffs")

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
