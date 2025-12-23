extends SceneBase

func _init():
	sceneID = "PSTentaclesWindowSmall"

func _reactInit():
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS
	addCharacter(GM.main.PS.getTentaclesCharID())
	
	var possible:Array = []
	
	if(_tentacles.mind <= 0):
		possible.append("0watch")
	if(_tentacles.mind == 1):
		possible.append("1")
	if(_tentacles.mind == 2):
		possible.append("2")
	if(_tentacles.mind == 3):
		possible.append("3")
	if(_tentacles.mind == 4):
		possible.append("4")
	if(_tentacles.mind >= 5):
		possible.append("5")
	
	if(possible.size() > 0):
		setState(RNG.pick(possible))

func resolveCustomCharacterName(_charID):
	if(_charID == "ten"):
		return GM.main.PS.getTentaclesCharID()
	if(_charID == "sci1"):
		return GM.main.PS.getScientist1CharID()
	if(_charID == "sci2"):
		return GM.main.PS.getScientist2CharID()

func _run():
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(state == ""):
		saynn("You stare at the window.")

		addButton("Chat", "Do chat", "doChat")
	if(state == "doChat"):
		saynn("You chat.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "0watch"):
		# ((small idle
		saynn("The tentacle monster bumps into the huge glass window.. Luckily, the reinforced glass isn't so easy to crack.")

		saynn("But the tentacles keep trying.. bumping into the window again and again.. almost like they don't realize that there is a glass there.")

		saynn("They're not the smartest, are they..")

		addButton("Explain", "Try to explain that there is a window in the way", "0watch_explain")
		addButton("Just watch", "Watch the silly tentacles", "0watch_watch")
		addButton("Pull away", "Pull the tentacles away from the window", "0watch_pullaway")
	if(state == "0watch_explain"):
		saynn("You try to get its attention..")

		saynn("[say=pc]Hey.. look at me.[/say]")

		saynn("One of the pointy tips bends towards you.")

		saynn("[say=pc]This.. is a window.[/say]")

		saynn("You knock on it.")

		saynn("[say=pc]It might look.. transparent.. It might seem like it's not there.. but it's solid.[/say]")

		saynn("You're not sure where to look to check if the tentacles have understood anything. But then the tentacles reveal it by bumping into the window again.")

		saynn("You sigh and get their attention again.")

		saynn("[say=pc]Look at me.[/say]")

		saynn("You point at the window and then cross your wrists.")

		saynn("[say=pc]No. Bad.[/say]")

		saynn("The tentacles watch your gestures.. and seemingly listen.")

		saynn("They give up trying to escape into the void and move somewhere else..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "0watch_watch"):
		saynn("You decide to just watch the tentacles.")

		saynn("Each time they bonk themselves against the transparent window, you can't help but to giggle.")

		saynn("[say=pc]You are so dumb, you know that?[/say]")

		saynn("But they just smash themselves against the window again.. like a silly trapped fly.")

		saynn("Eventually, the tentacles give up. They sway their tentacles in a mean way towards the glass.. and move on.")

		saynn("That was fun while it lasted.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "0watch_pullaway"):
		saynn("You just can't watch the tentacles hurt themselves..")

		saynn("[say=pc]Stop it.[/say]")

		saynn("Before the next tendril has a chance to bonk into the window, you catch it and yank it back, away from the glass.")

		saynn("A second tentacle tries the same.. but you block that attempt too.")

		saynn("[say=pc]Quit it already.[/say]")

		saynn("Eventually you get too annoyed with them and just yank the whole plant away from the corner where the window is.")

		saynn("[say=pc]Do something else, don't go here.[/say]")

		saynn("Seeing you in the spot of a window.. makes them finally give up.")

		addButton("Continue", "See what happens next", "endthescene")
		saynn("The tentacle monster has stopped near a window. Its tentacles are wiping the cold, squeaky surface.")

	if(state == "1"):
		saynn("You approach the tentacles.. and find them basically glued to the window. They're not trying to smash it or anything.. but somehow you have doubts about them even realizing that there is solid glass there.")

		saynn("They don't seem to be strong enough to push the reinforced glass out.. so you should be fine.. probably.")

		addButton("Mock", "Tell the tentacles that they're silly", "1_mock")
		addButton("Explain", "Try to explain that the glass is preventing them from escaping", "1_glass")
		addButton("Let it be", "It's not hurting itself.. so whatever", "1_whatever")
	if(state == "1_mock"):
		saynn("The tentacles look so funny when they're squished into the glass.")

		saynn("[say=pc]You're a bunch of sillies, you know that? Or are you one thing? Doesn't matter.[/say]")

		saynn("They don't seem to listen to you.. so you tap the window strongly. The sudden vibrations travel through the glass and transfer to the tentacles, making them recoil back and assume a fighting position!")

		saynn("[say=pc]Really? You really thought that there is danger here? Pfff.[/say]")

		saynn("You can't help but to start laughing.")

		saynn("The tentacles don't seem to share your giggly mood.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "1_glass"):
		saynn("You carefully press the palm of your head against the glass.")

		saynn("[say=pc]This is solid. Do you understand?[/say]")

		saynn("One of the tentacles turns in your direction.. You repeat the action, showing where the window starts.")

		saynn("[say=pc]S-o-l-i-d. Yeah?[/say]")

		saynn("You nod a few times.. and the tentacle repeats after you, nodding and then brushing its tip against the solid glass.")

		saynn("[say=pc]Good. You might not be the smartest.. but you have potential.[/say]")

		saynn("Your free hand reaches out to gently pet the tentacle.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "1_whatever"):
		saynn("Whatever.. it's not hurting itself.. and it's not strong enough to destroy the window and kill all of you.. at least now.")

		saynn("So you just let it cool itself down against the cold surface of the glass..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "2"):
		saynn("You find the tentacles near the big window of your cell.. window that leads straight into the void of space.")

		saynn("They seem to be quite interested in it. You see the tentacles wiping themselves across the cold glass surface back and forth, leaving a wet trail behind.")

		saynn("They remind you of windshield wipers for some reason.")

		addButton("Give sponge", "Give each tentacle a sponge so that their wiping becomes useful!", "2_sponge")
		addButton("Explain", "Tell them that this is a window and that the tentacles can't go through it", "2_window")
		addButton("Block window", "Stand in front of the window and see what the tentacles will do", "2_block")
	if(state == "2_sponge"):
		saynn("[say=pc]Hm..[/say]")

		saynn("You grab a shower sponge and approach the monster. You carefully press the sponge against the green tentacle.. which causes it to reflexively wrap around the new object.")

		saynn("Then.. you take a step back and watch as the same tentacle begins to brush the sponge all across the window, leaving a clean wiped trail behind.")

		saynn("[say=pc]Perfect.[/say]")

		saynn("You go ahead and grab a few more sponge and hand them out to other tentacles who proceed to use them to wipe the whole window clean.")

		saynn("Maybe they didn't learn much.. but at least they got a good workout from this! And you got a clean window.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "2_window"):
		saynn("You get the tentacles' attention by lightly tapping on the glass.")

		saynn("[say=pc]Hey.[/say]")

		saynn("A few of them direct their attention towards you.")

		saynn("[say=pc]This.. is a window.. okay? How many times do I need to tell you this?[/say]")

		saynn("You press yourself against it.")

		saynn("[say=pc]S-O-L-I-D. Completely solid. You can't just walk through it. Okay?[/say]")

		saynn("The tentacles wait until you're done explaining.. and then continue sliding across the glass.")

		saynn("They don't seem dumb.. but it looks like your lesson was ignored.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "2_block"):
		saynn("You slide between the window and the tentacles, blocking the glass with your body.")

		saynn("[say=pc]What are you gonna do now, huh?[/say]")

		saynn("The tentacles stare at you for a bit.. and then try to get behind you.. or under you.. everywhere around you.")

		if (GM.pc.hasReachableVagina()):
			saynn("One of the tentacles slides directly over your crotch.. its slick tip brushing against your pussy.")

		elif (GM.pc.hasReachablePenis() || GM.pc.isWearingChastityCage()):
			saynn("One of the tentacles slides directly over your crotch.. its slick tip brushing against your {pc.penis}.")

		else:
			saynn("One of the tentacles slides directly over your crotch.. rubbing it in the process..")

		saynn("Another one keeps running into your chest.. poking your {pc.breasts}, making them jiggle a bit..")

		if (_tentacles.lust <= 3):
			saynn("It's clearly not trying to do this on purpose.. but your squirming makes it so all the tentacles keep rubbing and caressing your body in different places.. Some spots are tickling you.. and some are making you produce stifled moans..")

			saynn("After failing to get to the window.. the tentacles eventually give up.")

			saynn("At least you've got to play with them.. or maybe.. they've got to play with you?")

		else:
			saynn("At this point it kinda feels like it's doing it on purpose! All the tentacles begin rubbing and caressing your body in different places.. Some spots are tickling you.. and some are making you produce stifled moans.. You block the window as best as you can.. but you just can't stop squirming..")

			saynn("One of the tentacles manages to find your {pc.analStretch} tailhole.. and starts rubbing against it.")

			saynn("[say=pc]Mmh.. that's enough..[/say]")

			saynn("You stop before the tentacles get too far..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "3"):
		saynn("The tentacles have found some dirt and dust.. and now they're making it wet with their juice before spreading it all across the window.")

		saynn("This quickly makes the glass very dirty.. but the tentacles don't stop, they just keep adding more dirt on top.")

		addButton("Praise", "Praise the tentacles for doing this.. yeah", "3_praise")
		addButton("Scold", "Tell the tentacles that they're very bad for doing this", "3_scold")
		addButton("Think and watch", "Just let the tentacles do whatever it is that they're doing and think about it", "3_letit")
	if(state == "3_praise"):
		saynn("You approach the hard-working tentacles.")

		saynn("[say=pc]Good job! You're doing so well.. whatever it is that you're doing.[/say]")

		saynn("The tentacles hear your praise and wiggle a bit.. before continuing to slap more dirt onto the glass.")

		saynn("[say=pc]So smart, very smart. Uh..[/say]")

		saynn("One of the tentacles reaches out to you.. and rubs some dirt into you too.")

		saynn("[say=pc]No, you don't have to. I'm good, really.[/say]")

		saynn("The tentacle keeps doing it.. until you slap it away.")

		saynn("[say=pc]Stop it, silly. Ugh.[/say]")

		saynn("The monster recoils back from the slap. And quickly swipes all the dirt off of the glass.")

		saynn("[say=pc]Right.. whatever.[/say]")

		saynn("Looks like your praise didn't have much effect.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "3_scold"):
		saynn("You gather all your anger and approach the tentacles.")

		saynn("[say=pc]Hey. Stop it. The fuck are you doing?[/say]")

		saynn("The tentacles feel your mean tone.. but continue slapping the dirt onto the window.")

		saynn("[say=pc]Really? You're gonna ignore me now?[/say]")

		saynn("You yank the tentacles off of the glass.. and then again.")

		saynn("[say=pc]Stop making the window dirty.[/say]")

		saynn("The tentacles vibrate visible.. until they suddenly throw some dirt at you and quickly slither away!")

		saynn("[say=pc]You fuckers.[/say]")

		saynn("You look at the window.. you can barely see through it now.")

		saynn("[say=pc]Right..[/say]")

		saynn("You sigh and go grab a shower sponge before cleaning all the dirt off.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "3_letit"):
		saynn("Unsure of how to react to this.. you let the tentacles do their thing.")

		saynn("Maybe it's not exactly the best option.. but who knows.")

		saynn("The tentacles just continue catching dirt from the corners and crevices of the cell.. before putting it all onto the window, evenly spreading it.")

		saynn("[say=pc]Is there some reason why you are doing this?[/say]")

		saynn("They can't really answer.. and you don't blame them.")

		saynn("Watching the process has been.. kinda calming actually.")

		saynn("[say=pc]Are you doing this because you have nothing better to do?[/say]")

		saynn("The tentacles hear your question.. and then lightly tap on the glass.")

		saynn("[say=pc]The glass.. hm..[/say]")

		saynn("Wait. The glass. It's transparent.. well.. not anymore.. exactly.")

		saynn("[say=pc]Did you cover the window in dirt so you can see where the glass is?[/say]")

		saynn("You see the tentacles swaying and nodding a bit.")

		saynn("[say=pc]I mean.. huh..[/say]")

		saynn("That's one way to solve the problem. And that's not the worst one.")

		saynn("[say=pc]That's pretty smart. Good job.[/say]")

		saynn("You pet one of the tentacles.")

		saynn("[say=pc]But since you now know where the glass is.. maybe you can try to remember it?[/say]")

		saynn("The tentacles turn towards the window.. all the pointy tips spread a bit, looking into different corners.")

		saynn("[say=pc]Yeah. The scientists will get angry at us for leaving dirt everywhere. So let's try to remember that there is glass here.. and clean this up. Okay?[/say]")

		saynn("The tentacles nod again.. and begin wiping the dirt off.")

		saynn("They're getting smarter.. bit by bit..")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "doChat"):
		_tentacles.incStat(PlayerSlaveryTentacles.STAT_MIND)

	if(_action == "0watch_explain"):
		_tentacles.train(_tentacles.STAT_MIND)

	if(_action == "0watch_watch"):
		_tentacles.train(_tentacles.STAT_ANGER)

	if(_action == "0watch_pullaway"):
		_tentacles.trainNothing()

	if(_action == "1_mock"):
		_tentacles.train(_tentacles.STAT_ANGER)

	if(_action == "1_glass"):
		_tentacles.train(_tentacles.STAT_MIND)

	if(_action == "1_whatever"):
		_tentacles.trainNothing()

	if(_action == "2_sponge"):
		_tentacles.train(_tentacles.STAT_AGILITY)

	if(_action == "2_window"):
		_tentacles.trainNothing()

	if(_action == "2_block"):
		_tentacles.train(_tentacles.STAT_LUST)

	if(_action == "3_praise"):
		_tentacles.trainNothing()

	if(_action == "3_scold"):
		_tentacles.train(_tentacles.STAT_ANGER)

	if(_action == "3_letit"):
		_tentacles.train(_tentacles.STAT_MIND)

	setState(_action)
