extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "TakingAShowerScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "stand", {bodyState={naked=true}})
		
		if(GM.pc.isFullyNaked()):
			saynn("You look around for an empty spot and go towards it")
			
			addButton("Continue", "Take a shower", "doShower")
		else:
			saynn("You take off your clothes and put them into one of the lockers. It has a lock so no one should be able to just steal them.")
			
			saynn("Now, completely naked, you proceed into the shower room and find an available spot")

			addButton("Continue", "Go take a shower", "doShower")
		
	if(state == "doShower"):
		saynn("You get under one of the shower heads and begin tinkering with the faucets.")
		
		saynn("But no matter what you do, all you get is cold water. It's not freezing but it's clear enough how the prison saves on costs")

		saynn("You begin washing yourself, starting with the hair and going down, cleaning your face, neck, shoulders, chest, arms and legs")
		
		if(GM.pc.hasReachableVagina()):
			saynn("Your hands slip down between your legs and give your slit a little rub to make sure it's all clean there as well")
		
		if(GM.pc.hasReachablePenis()):
			saynn("Your cock gets some attention too, you take your time to wash the shaft and the ballsack")
		
		saynn("Eventually, you finish cleaning yourself and just stand still under the running water for a bit, pondering")
		
		addButton("Done", "Finish showering", "finish")
		addButton("Clean inside", "Wash out any bodily fluids from inside too", "clean_inside")
		addButton("Cold shower", "Helps to calm down", "cold_shower")
		addButton("Masturbate", "Do something extra..", "masturbateselect")
		GM.ES.triggerRun(Trigger.TakingAShower)
			
	if(state == "cold_shower"):
		saynn("You switch the water to the coldest it can be. It's refreshing and helps you to get away from the horny thoughts")
			
		addButton("Done", "Finish showering", "finish")
			
	if(state == "clean_inside"):
		saynn("You use the shower to remove any fluids from your orifices")
		
		addButton("Done", "Finish showering", "finish")
		addButton("Masturbate", "Do something extra..", "masturbateselect")
			
	if(state == "finish"):
		playAnimation(StageScene.Solo, "stand")
		aimCamera(GM.pc.location)
		
		saynn("You turn off the water and go grab a towel to rub yourself dry")
		
		if(!GM.pc.isFullyNaked()):
			saynn("Then you open your locker and put your clothing back on, ready to leave")
		
		addButton("Continue", "Feeling fresh", "endthescene")



#Hi im new and done by Ace
	if(state == "masturbateselect"):
		playAnimation(StageScene.Solo, "stand")
		
		if(GM.pc.hasPerk(Perk.NakedNoShame)):
			saynn("As you stand idle and let the water wash over your body for a while longer, you decide you might as well take care of your lust.")
			saynn("Your hands feel over your stomach as a mimicry of cleaning yourself as you mull over how exactly you should satiate yourself.")
			saynn("Who cares if anyone watches?")
		else:
			saynn("Thinking it over, you check over your shoulder if any one is gonna instantly spot you.")
			saynn("The showers stay pretty empty and your tucked away in your little corner so it should be safe if you don't take too long.")
		
		saynn("How should you masturbate?")

		addButtonWithChecks("Penis", "Jerk off with your cock", "masturbate_penis", [], [ButtonChecks.HasReachablePenis])
		addButtonWithChecks("Penis Milker", "Use your cockmilker in the public showers", "masturbate_penismilk", [], [ButtonChecks.HasPenisPump, ButtonChecks.HasReachablePenis])
		addButtonWithChecks("Vaginal", "Finger your vagina", "masturbate_vaginal", [], [ButtonChecks.HasReachableVagina])
		addButtonWithChecks("Anal", "Try and get off using you ass", "masturbate_anal", [], [ButtonChecks.HasReachableAnus])
		if(GM.pc.isLactating()):
			addButton("Breasts", "Try and milk yourself", "masturbate_milk")
		elif(!GM.pc.isLactating()):
			addDisabledButton("Breasts", "You arent lactating enough to get off on being milked")
		addButton("Nevermind", "Just finish up and leave.", "endthescene")
	
	
	
	if(state == "masturbate_penis"):
		playAnimation(StageScene.Solo, "stand", {pc="pc", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		if(GM.pc.hasPerk(Perk.NakedNoShame)):
			saynn("Without so much as a thought for anyone who could be in here with you, your hands reach down your hips and start to tease your cock to get hard enough, feeling it over in your hands.")
			if(GM.pc.isVisiblyPregnant()):
				saynn("Its a fair bit awkward to reach around your gravid stomach with your advancing pregnancy but you manage just fine as you give your firm stomach a quick rub with your other hand.")
			if(GM.pc.hasVagina()):
				saynn("As you reach further downwards with your other hand, you begin to tease the outer lips of your wet snatch, giving it a rub over and a grazing with your fingers")
			saynn("Your {pc.cock} hardens enough for you start stroking away at it.")
			saynn("Even as you work on bringing yourself off there isnt a whole lot to do besides feel the slightly cold water dance down your body.")
			saynn("As such, you put no effort into hiding yourself or the noises you're making. Calmly huffing and panting as your feel and stroke your hand over the places you know arouse you the best, making drowned out wet schlicks as you go.")
			saynn("Time passes but you dont really keep track, putting your hand against the wall in front of you and spreading your legs a bit to really start going at it. Not caring to suppress the new moans you make.")
			saynn("A quick look up to see if youre gonna get caught and it seems like no one has bothered or just doesn't care.")
			saynn("Uneventful, Maybe you should head out into the main hall if you want some attention...")
			saynn("The building feeling of an orgasm welling up inside you distracts from your idle thoughts, and you get a really lecherous idea in your head. Your {pc.cock} pulses in your hands and you have just enough time to turn around and put your back to wall to keep you from slipping...")
		else:
			saynn("You keep looking over your shoulder as your hands trace down your body and start to fondle your sex. Pushing your body up against the shower wall and doing your best to cover what your doing with your back and legs.")
			if(GM.pc.isVisiblyPregnant()):
				saynn("Its a fair bit awkward to reach around your gravid stomach with your advancing pregnancy but you manage just fine as you give your firm stomach a quick rub with your other hand.")
			if(GM.pc.hasVagina()):
				saynn("Even as you try and hide yourself away you spread your thighs a bit and give your {pc.vagina} a quick tease giving it a shallow graze with your other hand.")
			saynn("As your {pc.cock} hardens and you start stroking it's length, you try and stifle the sounds you make as best as you can.")
			saynn("You inadvertenly keep looking around as you try and spot any prying eyes and listen for the sounds of approaching people.")
			saynn("It feels like time passes slower as you stay alert, it takes forever to get up to a good pace. Seeing as your still in the clear. You simply just put your head down between your arms and try and focus on finishing as fast as possible.")
			saynn("Getting closer to your release you become more paranoid someone is gonna spot you, you try and speed up the process by focusing on the spots you know your {pc.cock} has.")
			saynn("You welcome the continuing build-up of an orgasm, you're going to cum soon enough...")
			
		addButton("Cum!", "", "masturbate_peniscum")
	if(state == "masturbate_peniscum"):
		playAnimation(StageScene.Solo, "stand", {pc="pc", npc="pc", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		
		if(GM.pc.hasPerk(Perk.NakedNoShame)):
			saynn("You shut your eyes as the shower water sprays the back of your head. Having turned around you aim your impending cumshot from your little shower area and out into the open.")
			saynn("One more stroke along your cock and you feel yourself finally give, shooting a nice load in a vauge direction out into the open. But you just continue stroking away, milking as much as you can from your balls.")
			if(GM.pc.hasVagina()):
				saynn("Your negelected vagina follows in tandem, coating your inner thighs in girlcum as they squeeze against nothing.")
			saynn("As your orgasm passes you open your eyes once more. Bracing an arm against the wall as you peel yourself off it on weak legs.")
			saynn("Looking down to find you left a good string of cum on the tile floor, and the echo of voices at the far end of the showers seeing something. It might be best to leave now.")
			if(GM.pc.isVisiblyPregnant()):
				saynn("You press your hands into your pregnant stomach to help get it back into a comfortable enough position.")
			saynn("Using the shower to quickly wash any leftovers from your hands you head back to the locker room grabbing a towel as you go.")
			
		else:
			saynn("Feeling yourself starting to slip over the edge you tease your more sensitive spots and shut your eyes, pressing yourself against the wall.")
			saynn("You bite your tongue and suppress a cry as you forcefully bend your cock between your legs to conceal your cumshot.")
			if(GM.pc.hasVagina()):
				saynn("Your neglected vagina freely squirts and leaks girlcum against your squished together thighs and balls since your hiding your orgasm.")
			saynn("As your orgasm passes you finally give up hiding anything, putting your arm and head against the wall and panting heavily and dripping your own cum down your legs.")
			saynn("You dart your head up as if you were spotted and sigh in relief as you got away with it.")
			if(GM.pc.isVisiblyPregnant()):
				saynn("Righting yourself back on your feet, you try your best adjusting your pregnant stomach into a more comfortable position.")
			saynn("Quickly washing any excess cum or sweat off you manage to calm yourself back down.")
			saynn("You take your time heading back to the locker rooms, toweling off as you go.")
		
		addButton("Finished", "Time to go.", "endthescene")
	
	
	if(state == "masturbate_penismilk"):
		playAnimation(StageScene.Solo, "stand", {pc="pc", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		if(GM.pc.hasPerk(Perk.NakedNoShame)):
			saynn("You casually walk back to the locker rooms still naked and never grabbing a towel. Opening the locker you grab a cock milker and start heading back to your spot.")
			saynn("Passing a few inmates on your way back, they're all focused on scrubbing themselves but if one notices you give them a quick flash of your body.")
			saynn("Back in your spot you waste no time getting your cock hard and strapped into your penis pump.")
			if(GM.pc.isVisiblyPregnant()):
				saynn("Your gravid stomach makes trying to fit into it a bit of a guess but you find it just fine with a bit of effort.")
			saynn("Flipping the switch the pump gets to work with a little hum.")
			saynn("Not wanting to waste the opportunity you turn the water back on and just relax in the bliss of having your {pc.cock} pumped while in the shower.")
			if(GM.pc.hasVagina()):
				saynn("Not wanting to leave your {pc.vagina} behind you reach under your balls and begin to just idly thumb over your clitorus and finger your sex.")
			saynn("You let the pump do it's work as your cock twitches an throbs against the masturbation ring, loudly moaning it each time it runs over your dick.")
			saynn("The shower definitely helps you relax as you have a dumb smile on your face with your back against the wall.")
			saynn("Eventually you feel your orgasm well up within you...")
		else:
			saynn("You leave the water running as you use your hands to cover yourself up and head back to your locker to quickly snatch your penis pump.")
			saynn("Running back as quick as you can with the pump behind your back you find a good spot to settle in while you work on getting hard...")
			if(GM.pc.isVisiblyPregnant()):
				saynn("Your gravid stomach makes trying to fit into it a bit of a guess but you find it just fine with a bit of effort.")
			saynn("Finally with your {pc.cock} inside the pump you turn it on as the little mechanical masturbator does it's work.")
			saynn("To help hide the noise of the pump you turn the shower valve as high as it will go, letting the sound of the water drown out the sounds of what you're doing.")
			if(GM.pc.hasVagina()):
				saynn("It's probably best if you got off as fast you can. You reach under your balls and start fingering away at your {pc.vagina}.")
			saynn("Biting your lip to keep your moaning quiet you feel your orgasm approaching fast...")
		addButton("Cum!", "", "masturbate_penismilkcum")

	if(state == "masturbate_penismilkcum"):
		playAnimation(StageScene.Solo, "stand", {pc="pc", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		
		if(GM.pc.hasPerk(Perk.NakedNoShame)):
			saynn("You let out a sharp cry as the pump milks you dry and continues going at your cock as you baste the inside of it with your {pc.cum}...")
			if(GM.pc.hasVagina()):
				saynn("Your {pc.vaginaStretch} pussy follows your cock and similarly coats your inner thighs with girlcum.")
			saynn("Coming down from your orgasm you right yourself and push off the shower wall.")
			if(GM.pc.isVisiblyPregnant()):
				saynn("Putting an arm around your pregnant belly as you get back into proper order.")
			saynn("You switch the penis pump off and pull it off your softening cock with a really wet, lewd sounding plap.")
			saynn("Giving the pump a look, you probably cant use any of the cum inside it because of the running water, but you have a better idea...")
			saynn("Holding the end of the pump up to the still running shower head you give a good clean out, like a responsible cum slut.")
			saynn("Finishing up, you put the pump under your arm and grab two towels to dry you and the pump and get back to whatever you were doing.")
		else:
			saynn("You cover your mouth to mask a sultry groan as your throbbing {pc.cock} starts filling the pump with fresh cum.")
			saynn("You squirm against the shower wall as the pump milks your balls dry while you try to keep quiet.")
			if(GM.pc.hasVagina()):
				saynn("Girlcum leaks onto your inner thighs as your unused vagina follows with it's own orgasm.")
			saynn("You waste no time in getting the pump off your cock with a wet, lewd squelch. The last of your cum dripping from the tip of your dick in one long strand down your legs, and another still hanging from your tip to the pump.")
			saynn("Hurridly, you clean all evidence from you and the pump. Wrapping it in a towel as you make your getaway.")
		
		addButton("Finished", "Just finish up and leave.", "endthescene")



	if(state == "masturbate_vaginal"):
		playAnimation(StageScene.Solo, "stand", {pc="pc", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		
		if(GM.pc.hasPerk(Perk.NakedNoShame)):
			saynn("Without so much as a thought for anyone who could be in here with you, your hands reach down your hips and start to tease your {pc.vaginaStretch} pussy as the water flows down your body.")
			if(GM.pc.isVisiblyPregnant()):
				saynn("Its a fair bit awkward to reach around your gravid stomach with your advancing pregnancy but you manage just fine as you give your firm stomach a quick rub with your other hand.")
			if(GM.pc.isWearingChastityCage()):
				saynn("Your offhand follows your other one down giving your locked away {pc.cock} a tease.")
			elif(GM.pc.hasReachablePenis()):
				saynn("Your offhand follows your other one down giving your growing {pc.cock} a tease.")
			saynn("You dont waste effort hiding your huffing and moaning as you work. Getting your fingers deep as they will go and blindly feeling around.")
			saynn("Satisfied with teasing you move onto rubbing the spots you know the best with your fingers while giving your clit a rub with the other hand.")
			saynn("Even as you work on bringing yourself off there isnt a whole lot to do besides feel the slightly cold water dance down your body.")
			saynn("Time passes but you dont really keep track, putting your hand against the wall in front of you and spreading your legs a bit to really start going at it. Not caring to suppress the new moans you make.")
			saynn("Everything continues uneventfully, maybe you should head out into the main hall if you want some attention...")
			saynn("The building feeling of an orgasm welling up inside you distracts from your idle thoughts, and in preparation you turn your back and lean against the shower wall...")
		else:
			saynn("You keep looking over your shoulder as your hands trace down your body and start to tease your {pc.vaginaStretch} pussy. Pushing your body up against the shower wall and doing your best to cover what your doing with your back and legs.")
			if(GM.pc.isVisiblyPregnant()):
				saynn("Its a fair bit awkward to reach around your gravid stomach with your advancing pregnancy but you manage just fine as you give your firm stomach a quick rub with your other hand.")
			if(GM.pc.isWearingChastityCage()):
				saynn("Your offhand follows your other one down giving your locked away {pc.cock} a tease.")
			elif(GM.pc.hasReachablePenis()):
				saynn("Your offhand follows your other one down giving your growing {pc.cock} a tease.")
			saynn("Getting your fingers deep as they will go and blindly feeling around. You try and stifle the sounds you make as best as you can.")
			saynn("Wanting to get off faster you move onto rubbing the spots you know the best with your fingers while giving your clit a rub with the other hand.")
			saynn("You stay on alert if anyone is approaching you or could see you, keeping your legs as closed as they can get while your work you fingers on getting off.")
			saynn("Thankfully the showers remain empty as you feel the familiar building of a orgasm approaching...")
			
		addButton("Cum!", "", "masturbate_vaginalcum")
	
	if(state == "masturbate_vaginalcum"):
		playAnimation(StageScene.Solo, "stand", {pc="pc", npc="pc", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		if(GM.pc.hasPerk(Perk.NakedNoShame)):
			saynn("You let out an orgasmic cry as you're pushed over the edge from fingering yourself, your {pc.vaginaStretch} pussy covering your hands and thighs with girlcum.")
			if(GM.pc.isWearingChastityCage()):
				saynn("Your cute caged {pc.cock} lets out a weak cumshot from the hole in the cage as it cums as well.")
			elif(GM.pc.hasReachablePenis()):
				saynn("Your {pc.cock} sprays a few cumshots against the floor and wall, to all get washed away from the falling water.")
			if(GM.pc.isVisiblyPregnant()):
				saynn("Your hand goes your heavy and pregnant belly to support your self as you recover from cumming.")
			saynn("Pulling your hand from your snatch you simply wash all the fresh cum from your body as you calm back down. Heading for the locker rooms and towels without mess.")
		else:
			saynn("You put a hand over your mouth to muffle an orgasmic cry as you're pushed over the edge from fingering yourself, your {pc.vaginaStretch} pussy covering your hands and thighs with girlcum.")
			if(GM.pc.isWearingChastityCage()):
				saynn("Your cute caged {pc.cock} lets out a weak cumshot from the hole in the cage as it cums as well. Having no real control over it, it splatters the walls and floor.")
			elif(GM.pc.hasReachablePenis()):
				saynn("Despite trying to hide yourself and control where you cum, Your {pc.cock} sprays a few cumshots against the floor and wall. Thankfully to get all get washed away from the falling water.")
			if(GM.pc.isVisiblyPregnant()):
				saynn("Your hand goes your heavy and pregnant belly to support your self as you recover from your ordeal, satitisfied.")
			saynn("You hurridly wash all the evidence from your body and calm down so you can act normal heading back to grab a towel and your stuff.")
		addButton("Finished", "Time to go", "endthescene")

#Is now a bad time to say im not into most of solo-anal or anal fingering and dont really know how write it?

	if(state == "masturbate_anal"):
		playAnimation(StageScene.Solo, "stand", {pc="pc", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		if(GM.pc.hasPerk(Perk.NakedNoShame)):
			saynn("Making a decision you reach behind yourself and start fooling around with your ass, giving yourself a loud spank and spreading your asscheeks.")
			saynn("Having left all your stuff in a locker, looks like your stuck fingering yourself. Oh well.")
			#Herm
			if(GM.pc.hasVagina() && GM.pc.hasPenis()):
				saynn("One hand reaches down over both sets of your genitals giving them a tease while the other starts poking around your {pc.analStretch} ass. Giving it a good feel before starting to finger at some of the spots you know best...")
				if(GM.pc.isWearingChastityCage()):
					saynn("You feel your cock press against your chastity cage as you begin to fool around with yourself.")
				saynn("Reaching deep, you always know a safe bet to get off. Trying to find where your prostate is you tease your other genitals, reaching your other hand into your vagina to see if you can find it from that hole as well...")
				saynn("Eventually you do find your g-spot and you start fingering away at it, your {pc.cock} responding by instantly getting hard and drooling cum from it's tip as you continue.")
				saynn("The added fingers in your {pc.vaginaStretch} pussy help you get off way sooner than maybe you were expecting...")
				saynn("You dont care if anyone hears the noises you make.")
			#Penis Only
			if(!GM.pc.hasVagina() && GM.pc.hasPenis()):
				saynn("One hand reaches down over your {pc.cock} giving it a tease while the other starts poking around your {pc.analStretch} ass. Giving it a good feel before starting to finger at some of the spots you know best...")
				if(GM.pc.isWearingChastityCage()):
					saynn("You feel your cock press against your chastity cage as you begin to fool around with yourself.")
				saynn("Reaching deep, you always know a safe bet to get off. Trying to find where your prostate is you idly start to fondle your penis as well.")
				saynn("Eventually you do find your g-spot and you start fingering away at it, your {pc.cock} responding by instantly getting hard and drooling cum from it's tip as you continue.")
				saynn("Finding where your prostate is you add more fingers to the mix, trying to get off on anal alone.")
				saynn("You dont care if anyone hears the noises you make.")
				saynn("A few minutes of this you feel your cock throb in an approaching orgasm...")
			#Vagina Only
			if(GM.pc.hasVagina() && !GM.pc.hasPenis()):
				saynn("As you reach behind to poke around your {pc.analStretch} ass, you use your other hand to idly thumb away at your clit to help get more into it.")
				saynn("Reaching deep, you always know a safe bet to get off. Trying to find where your g-spot is, your {pc.vaginaStretch} starts leaking down your thighs. Closing your eyes while feeling the water hit your body while you toy with both of your holes")
				saynn("You dont care if anyone hears the noises you make.")
				saynn("Lying there for a few minutes, you feel your orgasm coming up...")
			#Null
			if(!GM.pc.hasVagina() && !GM.pc.hasPenis()):
				saynn("You reach behind to poke around your {pc.analStretch} ass, you feel over your null bulge.")
				saynn("Without other genitals, you don't know when your orgasm will come... Maybe you you should go get your hole properly fucked by someone instead...")
		else:
			saynn("Making a decision you have a look around to make sure your nice and hidden away while you reach behind yourself and start fooling around with your ass.")
			saynn("It'll be best if you get this done fast to not risk being exposed")
			#Herm
			if(GM.pc.hasVagina() && GM.pc.hasPenis()):
				saynn("One hand reaches down over both sets of your genitals giving them a tease while the other starts poking around your {pc.analStretch} ass. Giving it a quick tease before starting to finger at some of the spots you know best...")
				if(GM.pc.isWearingChastityCage()):
					saynn("You feel your cock press against your chastity cage as you begin to fool around with yourself.")
				saynn("Reaching deep, you always know a safe bet to get off quick. Trying to find where your prostate is you tease your other genitals, reaching your other hand into your vagina to see if you can find it from that hole as well...")
				saynn("Eventually you do find your g-spot and you start fingering away at it, your {pc.cock} responding by instantly getting hard and drooling cum from it's tip as you continue.")
				saynn("The added fingers in your {pc.vaginaStretch} pussy help you get off way sooner than maybe you were expecting...")
			#Penis Only
			if(!GM.pc.hasVagina() && GM.pc.hasPenis()):
				saynn("One hand reaches down over your {pc.cock} giving it a tease while the other starts poking around your {pc.analStretch} ass. Giving it a quick tease before starting to finger at some of the spots you know best...")
				if(GM.pc.isWearingChastityCage()):
					saynn("You feel your cock press against your chastity cage as you begin to fool around with yourself.")
				saynn("Reaching deep, you always know a safe bet to get off. Trying to find where your prostate is you idly start to fondle your balls as well.")
				saynn("Eventually you do find your g-spot and you start fingering away at it, your {pc.cock} responding by instantly getting hard and drooling cum from it's tip as you continue.")
				saynn("Finding where your prostate is you add more fingers to the mix, trying to get off on anal alone.")
				saynn("A few minutes of this you feel your cock throb in an approaching orgasm...")
			#Vagina Only
			if(GM.pc.hasVagina() && !GM.pc.hasPenis()):
				saynn("As you reach behind to poke around your {pc.analStretch} ass, you use your other hand to quickly thumb away at your clit to help get off faster.")
				saynn("Reaching deep, you always know a safe bet to get off. Trying to find where your g-spot is, your {pc.vaginaStretch} starts leaking down your thighs. Closing your eyes while feeling the water hit your body while you toy with both of your holes")
				saynn("Lying there for a few minutes, you feel your orgasm coming up...")
			#Null
			if(!GM.pc.hasVagina() && !GM.pc.hasPenis()):
				saynn("You reach behind to poke around your {pc.analStretch} ass, you feel over your null bulge.")
				saynn("Without other genitals, you don't know when your orgasm will come... Maybe you you should go get your hole properly fucked by someone instead...")
		
		addButton("Cum!", "Cum!", "masturbate_analcum")
		
	if(state == "masturbate_analcum"):
		playAnimation(StageScene.Solo, "stand", {pc="pc", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		if(GM.pc.hasPerk(Perk.NakedNoShame)):
			saynn("You start you hammer your fingers faster as your orgasm hits. Letting out a loud moan as you go at it.")
			#Herm
			if(GM.pc.hasVagina() && GM.pc.hasPenis()):
				if(GM.pc.isWearingChastityCage()):
					saynn("Your cute caged {pc.cock} lets out a weak cumshot from the hole in the cage as it cums as well.")
				elif(!GM.pc.isWearingChastityCage()):
					saynn("Your {pc.cock} sprays a few cumshots against the floor and wall, to all get washed away from the falling water.")
				if(GM.pc.isVisiblyPregnant()):
					saynn("Your offhand goes your heavy and pregnant belly to support your self as you recover from cumming.")
			saynn("Pulling your hand from your {pc.analStretch} ass, you simply wash all the fresh cum from your body as you calm back down. Heading for the locker rooms and towels without mess.")
			#Penis Only
			if(!GM.pc.hasVagina() && GM.pc.hasPenis()):
				if(GM.pc.isWearingChastityCage()):
					saynn("Your cute caged {pc.cock} lets out a weak cumshot from the hole in the cage as it cums as well.")
				elif(!GM.pc.isWearingChastityCage()):
					saynn("Your {pc.cock} sprays a few cumshots against the floor and wall, to all get washed away from the falling water.")
				if(GM.pc.isVisiblyPregnant()):
					saynn("Your offhand goes your heavy and pregnant belly to support your self as you recover from cumming.")
				saynn("Pulling your hand from your {pc.analStretch} ass, you simply wash all the fresh cum from your body as you calm back down. Heading for the locker rooms and towels without mess.")
			#Vagina Only
			if(GM.pc.hasVagina() && !GM.pc.hasPenis()):
				saynn("Your other hand rubs wildly at your slit as you have your anal orgasm")
				saynn("Coming back down from your orgasm, you stand back up on semi-shaky legs.")
				if(GM.pc.isVisiblyPregnant()):
					saynn("Your offhand goes your heavy and pregnant belly to support your self as you recover from cumming.")
				saynn("With everything over with and satisfied, you simply wash everything off once more and then head to grab a towel and back to your stuff...")
			#Null
			if(!GM.pc.hasVagina() && !GM.pc.hasPenis()):
				saynn("After enough time, you feel a really weak orgasm, your ass twitching and squeezing against your finger.")
				saynn("Without genitals, its hard to tell if anything really happened at all...")
				saynn("...")
				saynn("That was anti-climatic.")
				saynn("You just wash everything off and go to grab a towel.")
		else:
			saynn("You start you hammer your fingers faster as your orgasm hits. Biting your lip to muffle your own orgasmic cry as you go.")
			#Herm
			if(GM.pc.hasVagina() && GM.pc.hasPenis()):
				if(GM.pc.isWearingChastityCage()):
					saynn("Your cute caged {pc.cock} lets out a weak cumshot from the hole in the cage as it cums as well.")
				elif(!GM.pc.isWearingChastityCage()):
					saynn("Your {pc.cock} sprays a few cumshots against the floor and wall, to all get washed away from the falling water.")
				if(GM.pc.isVisiblyPregnant()):
					saynn("Your offhand goes your heavy and pregnant belly to support your self as you recover from cumming.")
				saynn("Pulling your hand from your {pc.analStretch} ass, you simply wash all the fresh cum from your body as you calm back down. Heading for the locker rooms and towels without mess.")
			#Penis Only
			if(!GM.pc.hasVagina() && GM.pc.hasPenis()):
				if(GM.pc.isWearingChastityCage()):
					saynn("Your cute caged {pc.cock} lets out a weak cumshot from the hole in the cage as it cums as well.")
				elif(!GM.pc.isWearingChastityCage()):
					saynn("Your {pc.cock} sprays a few cumshots against the floor and wall, to all get washed away from the falling water.")
				if(GM.pc.isVisiblyPregnant()):
					saynn("Your offhand goes your heavy and pregnant belly to support your self as you recover from cumming.")
				saynn("Pulling your hand from your {pc.analStretch} ass, you simply wash all the fresh cum from your body as you calm back down. Heading for the locker rooms and towels without mess.")
			#Vagina Only
			if(GM.pc.hasVagina() && !GM.pc.hasPenis()):
				saynn("Your other hand rubs wildly at your slit as you have your anal orgasm")
				saynn("Coming back down from your orgasm, you stand back up on semi-shaky legs.")
				if(GM.pc.isVisiblyPregnant()):
					saynn("Your offhand goes your heavy and pregnant belly to support your self as you recover from cumming.")
				saynn("After seeing that you weren't found, you simply wash everything off once more and then head to grab a towel and back to your stuff...")
			#Null
			if(!GM.pc.hasVagina() && !GM.pc.hasPenis()):
				saynn("After enough time, you feel a really weak orgasm, your ass twitching and squeezing against your finger.")
				saynn("Without genitals, its hard to tell if anything really happened at all...")
				saynn("...")
				saynn("That was anti-climatic.")
				saynn("You just wash everything off and go to grab a towel.")
		
		addButton("Finished", "Time to go.", "endthescene")


	if(state == "masturbate_milk"):
		playAnimation(StageScene.Solo, "stand", {pc="pc", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		if(GM.pc.hasEffect(StatusEffect.SoreNipplesAfterMilking)):
			saynn("having a relaxed shower like this helps your sore nipples feel better, you could probably milk yourself even with them still sore...")
		else:
			saynn("Looking down at your leaking chest, you choose to to take care your breasts before anything else")
		if(GM.pc.hasPerk(Perk.NakedNoShame)):
			saynn("You begin to feel over your milky {pc.breasts}. Grabbing both in either hand and giving your areolae a light squeeze, little streams of your {pc.milk} leak free from your nipples")
			saynn("you put your back against the wall and start to squeeze your nipples, streams of {pc.milk} mixing in with the showers flowing water, getting hornier as more milk starts flowing from your {pc.breasts}.")
			if(GM.pc.isVisiblyPregnant()):
				saynn("Once the stream has started, you let one of your breast hang free to leak all over yourself while you rub over your gravid pregnant belly.")
			if(GM.pc.isWearingChastityCage()):
				saynn("While not the main focus of your attention, you feel your cock hardening against the metal of your chastity cage.")
			elif(GM.pc.hasPenis()):
				saynn("While not the main focus of your attention, you feel your cock hardening while focusing on milking yourself")
			if(GM.pc.hasVagina()):
				saynn("As you continue to work on your now freely milk-streaming {pc.breasts}, you feel your nethers become far wetter...")
			if(GM.pc.hasPerk(Perk.MilkSelfFeed)):
				if(GM.pc.hasBigBreasts()):
					saynn("You quickly reach your hands to your {pc.breasts} and squeeze them very tight while guiding the nipples towards your mouth. Your tits are big enough for you to reach towards one of the nips with your lips and latch onto it.")
					saynn("After enough stimulation, your nipples suddenly shoot a strong stream of {pc.milk} that is aimed directly into your mouth. You let out a moan while tasting your own product.")
				else:
					saynn("You quickly reach your hands to your {pc.breasts} and squeeze them very tight while guiding the nipples towards your mouth. Your tits aren't big enough for you to reach them with your lips so you just knead them harder and open your mouth.")
					saynn("After enough stimulation, your nipples suddenly shoot a strong stream of {pc.milk} that is aimed directly into your mouth. You let out a moan while tasting your own product.")
			saynn("Your arousal continues to build as you milk yourself. Your mind goes a little blank while more and more milk continues to stream down more and more of your body, mixing with the water and spreading the both of them around your body.")
			saynn("Before you know it your orgasm is about to hit you...")
		
		else:
			saynn("While you probably could get away with milking yourself in the shower without anyone caring or confronting you, your own resverations about nudity are still enough to be paranoid about it.")
			saynn("You put your back against the wall and start to squeeze your nipples, streams of {pc.milk} mixing in with the showers flowing water, getting hornier as more milk starts flowing from your {pc.breasts}.")
			if(GM.pc.isHeavilyPregnant()):
				saynn("You weren't gonna do anything with your pregnancy but it seems your pregnancy had other plans, feeling the kicks from within making it hard to stay concealed.")
			if(GM.pc.isWearingChastityCage()):
				saynn("While not the main focus of your attention, you feel your {pc.cock} hardening against the metal of your chastity cage.")
			elif(GM.pc.hasPenis()):
				saynn("While not the main focus of your attention, you feel your {pc.cock} hardening while focusing on milking yourself")
			if(GM.pc.hasVagina()):
				saynn("As you continue to work on your now freely milk-streaming {pc.breasts}, you feel your nethers become far wetter...")
			saynn("Your arousal continues to build as you milk yourself. Your mind goes a little blank while more and more milk continues to stream down more and more of your body, mixing with the water and spreading the both of them around your body.")
			saynn("Before you know it your orgasm is about to hit you...")
		
		addButton("Cum!", "", "masturbate_milkcum")
	
	if(state == "masturbate_milkcum"):
		playAnimation(StageScene.Solo, "stand", {pc="pc", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		
		saynn("Your orgasm washes over you as you keep pinching at your nipples, overstimulating yourself while trying to milk yourself.")
		if(GM.pc.hasPerk(Perk.NakedNoShame)):
			saynn("In response you let out a deep moan and squeeze your full breasts as hard as you can, letting strong projectile streams of milk spray from your {pc.breasts}")
			if(GM.pc.isWearingChastityCage()):
				saynn("Riding out your prolonged orgasm, your cute, locked away {pc.cock} lets out a weak shot of cum from the hole in the cage.")
			elif(GM.pc.hasPenis()):
				saynn("Riding out your prolonged orgasm, your {pc.cock} gives off a few shots of cum to land against the floor")
			if(GM.pc.hasVagina()):
				saynn("Your under-stimulated vagina finally reaches it's peak and it coats your inner thighs in girlcum")
			saynn("By the time you finish with your climax your breasts have been milked throughly.")
			saynn("Peeling yourself off the wall, you wash everything up once again and go to grab a towel and get your stuff.")
		else:
			saynn("In response you have to bite your tongue out a deep moan and squeeze your full breasts as hard as you can, letting strong projectile streams of milk spray from your {pc.breasts}")
			if(GM.pc.isWearingChastityCage()):
				saynn("Riding out your prolonged orgasm, your cute, locked away {pc.cock} lets out a weak shot of cum from the hole in the cage.")
			elif(GM.pc.hasPenis()):
				saynn("Riding out your prolonged orgasm, your {pc.cock} gives off a few shots of cum to land against the floor")
			if(GM.pc.hasVagina()):
				saynn("Your under-stimulated vagina finally reaches it's peak and it coats your inner thighs in girlcum")
			saynn("By the time you finish with your climax your breasts have been milked throughly.")
			saynn("Peeling yourself off the wall, you wash everything up once again and go to grab a towel and get your stuff.")
		
		addButton("Finish", "Time to go.", "endthescene")

func _react(_action: String, _args):
	if(_action == "doShower"):
		GM.pc.afterTakingAShower()
		processTime(60 * 30)
		
		if(GM.pc.location == "main_dressing1"):
			aimCamera("main_shower1")
		if(GM.pc.location == "main_dressing2"):
			aimCamera("main_shower2")
		
		if(GM.ES.triggerReact(Trigger.TakingAShower)):
			#endScene()
			setState(_action)
			return
		
		addMessage("You feel fresh and clean")

	if(_action == "cold_shower"):
		GM.pc.addLust(-50)

	if(_action == "clean_inside"):
		if(!GM.pc.clearOrificeFluidsCheckBlocked()):
			addMessage("Something prevented you from clearing every hole")
		processTime(60 * 10)

	if(_action == "masturbate_peniscum"):
		processTime(60 * 20)
		GM.pc.orgasmFrom("pc")
 
	if(_action == "masturbate_penismilkcum"):
		GM.pc.orgasmFrom("pc")
		GM.pc.milkSeed()
		processTime(60 * 20)

	if(_action == "masturbate_vaginalcum"):
		GM.pc.orgasmFrom("pc")
		processTime(60 * 20)

	if(_action == "masturbate_analcum"):
		GM.pc.orgasmFrom("pc")
		processTime(60 * 20)


	if(_action == "masturbate_milkcum"):
		if(GM.pc.hasEffect(StatusEffect.SoreNipplesAfterMilking)):
			setState("nipplessore")
		GM.pc.orgasmFrom("pc")
		GM.pc.milk()
		processTime(60 * 20)

	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)

func getSceneCreator():
	return "Rahi & AverageAce"
