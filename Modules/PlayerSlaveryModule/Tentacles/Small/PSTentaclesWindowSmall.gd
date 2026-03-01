extends SceneBase

func _init():
	sceneID = "PSTentaclesWindowSmall"

func _reactInit():
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS
	addCharacter(GM.main.PS.getTentaclesCharID())
	
	var possible:Array = []
	
	if(_tentacles.mind <= 0):
		possible.append("0")
	if(_tentacles.mind == 1):
		possible.append("1")
	if(_tentacles.mind == 2):
		possible.append("2")
	if(_tentacles.mind == 3):
		possible.append("3")
	if(_tentacles.mind == 4):
		possible.append("4")
	if(_tentacles.mind == 5):
		possible.append("5")
	if(_tentacles.mind == 6):
		possible.append("6")
	if(_tentacles.mind == 7):
		possible.append("7")
	if(_tentacles.mind == 8):
		possible.append("8")
	if(_tentacles.mind == 9):
		possible.append("9")
	if(_tentacles.mind == 10):
		possible.append("10")
	
	if(possible.size() > 0):
		setState(RNG.pick(possible))
	_tentacles.doAnimDuo("idle")

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
	if(state == "0"):
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
		addButton("Gently knock", "Gently knock on the glass and see what happens", "2_knock")
		addButton("Block window", "Stand in front of the window and see what the tentacles will do", "2_block")
	if(state == "2_knock"):
		saynn("You gently tap on the glass.. but with no intention of getting their attention. You just tap on it..")

		saynn("This makes the glass vibrate ever so slightly.. and the tentacles feel it.")

		saynn("You keep tapping.. while they stop wiping the glass and instead start to explore this interesting surface. One of the tentacles gently taps on the glass by itself.. creating more of those small vibrations.")

		saynn("[say=pc]Now you're getting it.[/say]")

		saynn("They might not see it.. but they certainly feel that something is in the way now.")

		saynn("Satisfied with their new discovery, they just slither away.")

		addButton("Continue", "See what happens next", "endthescene")
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
	if(state == "4"):
		saynn("You find the tentacle monster near the window.")

		saynn("It's not really doing anything.. it's just.. sitting? Tentacles can't really sit.. but these ones feel like they do.")

		saynn("Their pointy green tips are touching the glass.. just tips.")

		saynn("It's like they're staring into the deep abyss of space..")

		addButton("Explain", "Tell the tentacles that there is an obvious window here", "4_explain")
		addButton("Space", "Talk about what's out there.. behind the glass", "4_space")
		addButton("Distract", "Use your body to try to distract them away from the window", "4_distract")
	if(state == "4_explain"):
		saynn("They keep staring at that stupid window.. It looks like they just can't figure it out!")

		saynn("[say=pc]Hey. There is glass there. You can't get through it, you know?[/say]")

		saynn("The tentacles stay still..")

		saynn("You knock on the window, sending vibrations through it and causing the green tips to recoil back.")

		saynn("[say=pc]It's solid. Even if it looks transparent. You understand?[/say]")

		saynn("The tentacles just leave, tired of your explanation.")

		saynn("Maybe they already know that there is glass there? Why do they keep staring at it then..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "4_space"):
		saynn("You decide to join the tentacles and stare through the window.. at all the vast empty space.. littered with little dots.")

		saynn("[say=pc]This is outer space, what's behind the window.[/say]")

		saynn("One of the tentacles looks at you.")

		saynn("[say=pc]You're a curious mind, aren't you?[/say]")

		saynn("The tentacle nods. Makes you chuckle softly.")

		saynn("[say=pc]It looks pretty. But it's deadly for us, sadly. There is no air out there.[/say]")

		saynn("You look down at the tentacles who seem saddened by that revelation.")

		saynn("[say=pc]Even if you don't need oxygen to live.. the lack of pressure is gonna make all the water inside you start boiling in mere minutes. You probably don't want that.[/say]")

		saynn("The tentacles tilt down. You offer them some gentle pats.")

		saynn("[say=pc]But the world is bigger than.. this cell.. Much bigger. There are entire planets that can be explored by you or me.[/say]")

		_tentacles.talk("Planets.. We've never been on planets before.. We wish to visit them one day.")
		saynn("Huh? You tilt your head.")

		saynn("Interesting..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "4_distract"):
		saynn("It keeps starting at that window.. and you don't like that.")

		saynn("[say=pc]Hey.. uh.. If you wanna be entertained, why not touch me a bit?[/say]")

		saynn("You lean against the window, proudly showcasing the curves of your {pc.masc} body.")

		saynn("[say=pc]Don't be shy, you can explore me.[/say]")

		if (GM.pc.hasReachableVagina()):
			saynn("The tentacles don't seem very interested.. so you catch one and slip it down between your legs, letting it rub against your {pc.vaginaStretch} pussy..")

		else:
			saynn("The tentacles don't seem very interested.. so you catch one and slip it down between your legs, letting it rub against your {pc.analStretch} tailhole..")

		saynn("Sadly, the tentacles still don't seem very engaged.. they just pull away from you and the window..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "5"):
		saynn("The tentacles are resting near the big reinforced window that your cell has.")

		saynn("Their green pointy tips are watching the empty black void that's littered with little colorful dots.")

		addButton("Stars", "Talk about the little dots that the tentacles see", "5_stars")
		addButton("World", "Talk about the world", "5_world")
		addButton("Void", "Talk about the empty black void", "5_void")
	if(state == "5_stars"):
		saynn("You point at the little bright dots.")

		saynn("[say=pc]See those?[/say]")

		saynn("One of the tentacles nods.")

		saynn("[say=pc]Those are stars. Each dot is a single star.[/say]")

		_tentacles.talk("Stars.. Stars make us curious. Very.")
		saynn("You bring your hands close to form an invisible sphere between your palms.")

		saynn("[say=pc]They look small because they're so far away.. but they're actually huge. They look like spheres.. and they're extremely bright. So bright that we can see them all the way from here.[/say]")

		_tentacles.talk("We wanna visit stars.. Yes. Stars make us excited.")
		saynn("It's really hard to understand them.. but it still feels surreal to be talking with a plant. They wiggle with excitement.")

		saynn("[say=pc]Hold your horses. You probably wanna explore one of them.. but that's impossible. The stars are just pure balls of light and energy. You will turn into ash long before you get anywhere near them.[/say]")

		saynn("The tendrils droop. Your words have instantly killed that excitement in them. Aw.")

		saynn("[say=pc]There are plenty of normal planets to explore, don't worry. A lot of the world sucks.. but not all of it.[/say]")

		_tentacles.talk("We will treasure that knowledge. Thank you, friend.")
		saynn("You nod..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "5_world"):
		saynn("You look around.")

		saynn("[say=pc]You have never been outside of this cell.. Your whole view of this world comes from this one room.. and this window.[/say]")

		saynn("Some of the tentacles look up at you.")

		saynn("[say=pc]The world is huge.. infinitely so. I can't even describe it to you. Not because you wouldn't understand.. but because I don't understand it fully myself.[/say]")

		_tentacles.talk("Curious. We wanna know everything.")
		saynn("You shrug.")

		saynn("[say=pc]On the other hand.. Some people are okay with that. There is a certain sense of comfort in always being in the same place I guess. Home, job, shop. Some people just don't need more than that.[/say]")

		saynn("The tentacles sway curiously.")

		saynn("[say=pc]Home.. home is this place.. kinda. Where you sleep is usually your home.[/say]")

		saynn("You see the tendrils looking at their nest.")

		saynn("[say=pc]Job.. A job is where you come every day to do work. Our job.. we don't really have one right now. But for some people it gives them a sense of purpose in life.[/say]")

		_tentacles.talk("Purpose.. We don't know if we have a purpose.")
		saynn("It's really hard to understand them.. but it still feels surreal to be talking with a plant.")

		saynn("[say=pc]And shop.. is where you come to get new things. Not for free, hah.. You gotta work at your job first. And then you come home to sleep. Everything is connected like that..[/say]")

		_tentacles.talk("Eternal cycle.. Is this what life is all about?")
		saynn("You watch the tentacles trying to communicate.. and just pet them.")

		saynn("[say=pc]Don't worry about it. There is more to life than that.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "5_void"):
		saynn("[say=pc]The black stuff that you see between all the dots.. that's called void. It's the opposite of something.. it's literally nothing.[/say]")

		saynn("The tentacles direct their curious tips towards you.")

		saynn("[say=pc]Yeah. This cell has air.. but behind the glass.. you would suffocate in seconds.[/say]")

		_tentacles.talk("We have been staring at danger this entire time. We are now afraid of void..")
		saynn("It's really hard to understand them.. but it still feels surreal to be talking with a plant.")

		saynn("[say=pc]It sounds bad.. but we have developed ways of getting around in void. Spaceships. We might be in one right now.. but who knows.. this is probably a space station if I'd take a guess. It's safe here.[/say]")

		saynn("You look around.. your gaze catches a camera.")

		saynn("[say=pc]I think so, at least..[/say]")

		_tentacles.talk("Space station.. safe.. Good.")
		saynn("[say=pc]So yeah.. void can be pretty. It's very calming, don't you agree?[/say]")

		saynn("The tentacles nod.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "6"):
		saynn("The tentacles are resting near the big reinforced window that your cell has.")

		saynn("Their green pointy tips are watching the empty black void that's littered with little colorful dots.")

		_tentacles.talk("We.. we are tired of this place.")
		saynn("{psTentacles} can talk.. somehow.. but it's still really hard to understand them.")

		saynn("[say=pc]Can you try to speak.. a little clearer?[/say]")

		saynn("The tentacles turn towards you.")

		_tentacles.talk("We.. can try.. to speak.. slower.. Does this help?")
		saynn("You tilt your head, really stressing your ears. It all sounds like gibberish to you.")

		addButton("Teach", "Give the tentacles some language lessons", "6_teach")
		addButton("Deep conversation", "Try to connect with the tentacles on another level", "6_deep")
		addButton("Give up", "This is not worth it", "6_giveup")
	if(state == "6_teach"):
		saynn("You clap your hands together, a teacher getting to work.")

		saynn("[say=pc]Alright, let's start simple..[/say]")

		saynn("You start with basics, teaching {psTentacles} the alphabet, each letter one at a time.")

		saynn("[say=pc]One by one, they don't mean much.. but together, they form words..[/say]")

		saynn("Next, you teach the basic structure of a sentence.. Verbs, nouns, adjectives.")

		saynn("The tentacles sway, their tips focussed on you.")

		saynn("You do your best, pointing at objects around you and gesturing, miming actions.")

		saynn("[say=pc]This is a subject. This is a verb. This is an object. See?[/say]")

		saynn("The tentacles seem to follow along, their swaying almost looks like nodding.")

		saynn("Satisfied, you lean against one of the walls.")

		saynn("[say=pc]Okay, let's try again now. Tell me what you were talking about before. Use your words.[/say]")

		saynn("One thick tendril rises.. and a strained mental voice echoes in your head.")

		_tentacles.talk("We.. grew tired of this small isolated space.")
		saynn("You can only sigh and throw your head back.")

		saynn("To your ears, everything that they try to say is just a cascade of beautiful.. but impossible noises. You can understand none of it.")

		saynn("You slump, on the verge of giving up.")

		saynn("It looks like.. the problem was never their vocabulary or grasp of rules.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "6_deep"):
		_tentacles.doAnim("idle", {npcAction="kneel"})
		saynn("Maybe the words.. the sounds.. maybe they're not the answer.")

		saynn("Correcting the tentacles feels like a pointless idea. They know all the words already.. but you just can't understand them. Maybe the problem isn't in them..")

		saynn("You slowly sink to your knees and reach your hand out.. not to grab.. but to simply make contact. Your palm is resting softly on one of the tentacles.")

		saynn("You have no idea what you're doing. But, for some reason, it feels like you gotta do it.")

		saynn("[say=pc]Show me.[/say]")

		saynn("You close your eyes. You don't try to speak. Instead.. you try to listen.. with a part of yourself you rarely use.")

		saynn("You think of the window.. of the stars.. of the feeling of being caged. You push towards the feeling.. a very hollow feeling.")

		saynn("For a moment, nothing. Then, a warmth starts spreading under your hand. It travels up your arm. Some kind of presence, gentle and curious, brushing against the edges of your own consciousness.")

		saynn("You don't resist. You allow your mind to open up to the intrusion..")

		saynn("For a split second, the whole world dissolves into a single sensation. You don't hear words.. You experience them.")

		saynn("The vast, cold blackness of space. A deep, resonant feeling of homesickness. A shimmering barrier. Profound sorrow.")

		_tentacles.talk("You.. You hear the silence too.. Just like we do.")
		saynn("It's your own internal monologue.. but the thought isn't yours. It's theirs.. translated perfectly through your bond. They were never speaking any languages.. They were speaking minds..")

		saynn("Tears well in your closed eyes. It's not sadness.. It's an overwhelming relief.. of being finally, truly understood.")

		saynn("[say=pc]Yes. I hear it. I'm sorry you're trapped.[/say]")

		saynn("You share a clear image.. the two of you.. not as prisoner and monster.. but two trapped voices instead.")

		_tentacles.talk("Together. Less silent.")
		saynn("You open your eyes.. your vision is a bit blurry. But soon the focus returns.")

		saynn("And even as you retract your hand away from the tentacle.. you can still feel the bond.")

		saynn("[say=pc]You can speak in my head?[/say]")

		_tentacles.talk("We always were trying to. But now you helped us to find the right language. Thank you, friend.")
		saynn("This plant.. can read your mind. Huh. Maybe you don't even have to say anything?")

		_tentacles.talk("Yes.")
		saynn("That is.. fascinating.")

		saynn("You raise a brow and look around. The walls of your cell seem quite thick.. but maybe they can still be penetrated.. in a different way.")

		_tentacles.talk("We.. need some rest before we try something like that.")
		saynn("That's fair.")

		saynn("You let {psTentacles} rest.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "6_giveup"):
		saynn("It's not worth it.")

		saynn("The tentacles are just repeating random noises that they heard from you.. like a parrot.")

		saynn("They're just simply too dumb.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "7"):
		saynn("The tentacles are hanging around near the window.")

		saynn("[say=pc]Hey there.[/say]")

		_tentacles.talk("We greet you.")
		saynn("They're near the window.. so they probably wanna stress their mind a bit.. and maybe yours too.")

		saynn("[say=pc]Anything that you wanna do.. In particular?[/say]")

		_tentacles.talk("Anything that would help us get out of here.")
		saynn("Right..")

		saynn("You lean against the wall and start thinking about it.")

		saynn("The tentacles can read your mind. And they don't even have to touch you in order to be able to do it.")

		_tentacles.talk("We're not sure if we can read anyone's mind.")
		saynn("Being not sure is okay. Means that it might be possible.")

		_tentacles.talk("Alternatively.. We might just talk with you more?")
		saynn("Practice would never hurt. But who knows.. maybe this kind of practice can.")

		saynn("You get a feeling that either approach would help here.")

		addButton("Other minds", "Tell the tentacles to read other minds of this bio lab", "7_other")
		addButton("Cuddle", "Spent time together and practice that way", "7_cuddle")
		addButton("Not now", "You don't wanna do either", "7_notnow")
	if(state == "7_notnow"):
		saynn("[say=pc]You know what.. maybe now is not the time for this.[/say]")

		saynn("The tentacles sway confused.")

		_tentacles.talk("If you say so.")
		saynn("They stare at the window a bit more.. and then just slither away.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "7_other"):
		_tentacles.doAnim("glare")
		saynn("[say=pc]If you read the minds of people who work here, it might help us come up with an escape plan.[/say]")

		saynn("The tentacles sway.")

		_tentacles.talk("Wise words. Who should we start with?")
		saynn("Conveniently, one of the guards walks by your cell. Conveniently, he stops to check his watch, his other hand cupping the handguard of his pulse riffle.")

		saynn("[say=pc]How about that guy?[/say]")

		saynn("The tentacles turn their collective focus toward the corridor behind the window of the opposite side of the cell.")

		addButton("Continue", "See what happens next", "7_guard")
	if(state == "7_guard"):
		saynn("You feel a slight feeling of warmth spreading through your mind as the tentacles channel the raw, unfiltered stream of the guard's consciousness into your shared space..")

		saynn("[sayMale]My shift is almost over. That's good. Wait. What's this?[/sayMale]")

		saynn("His fingers reach out to rub off yellow marks from the glass of his watch.")

		saynn("[sayMale]That sandwich had too much mustard, too soggy. Ugh. Garry owes me a new lunch.[/sayMale]")

		saynn("He looks around, his eyes focus on the flickering fluorescent light in the hallway. Somehow, you can also hear it.")

		saynn("[sayMale]That thing is buzzing all day. Hate that sound. Sounds like my ex-wife's voice.. At least she had a good ass.[/sayMale]")

		saynn("Next, his gaze turns towards the window of your cell. Is he looking at you two? You can feel him flexing his muscles a bit.")

		saynn("[sayMale]Lookin' jacked. Shoulda taken that security job at the spacemall. More babes.[/sayMale]")

		saynn("The guard walks further, his eyes glancing at the door of your cell. You can see the faint image of it.. It's reinforced in multiple ways.")

		saynn("[sayMale]Hope the bio-lock doesn't glitch again. Last time I had to call tech support and the guy smelled like feet.[/sayMale]")

		saynn("After checking the door, he heads away, out of sight, leaving you with his last thoughts.")

		saynn("[sayMale]Payday tomorrow. Gonna get those new turbo shoes. Run real fast. Not that I ever run. But I could.[/sayMale]")

		saynn("The connection fades as he walks away.")

		saynn("It's not much.. The guy was worrying about food condiments and shoes more than his job. But still, you got some info.")

		saynn("[say=pc]That door.. I don't think there is a way for us to open it. Is there?[/say]")

		saynn("The tentacles sway, busy with thought.")

		_tentacles.talk("We certainly lack the ability to interact with it.")
		saynn("You hum. You have some pieces.. but not enough to solve the whole puzzle.")

		saynn("[say=pc]Do you.. detect.. anyone else? Can you try to read the minds of the scientists?[/say]")

		saynn("Warmth begins to spread through your mind. Your head.. it gets hotter and hotter.")

		_tentacles.talk("Good idea. And yet. We can not reach.")
		saynn("Fair enough. You let the tentacles slither away.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "7_cuddle"):
		playAnimation(StageScene.TentaclesCuddle, "cuddle", {plant=true})
		saynn("[say=pc]Let's just practice your skills on me.[/say]")

		saynn("There are no chairs in the cell.. Some kind of seat would be nice.")

		saynn("But before you can land your butt on the floor, two thick tendrils slide gently behind your knees and around your back. They lift you off the floor while the other tentacles form a seat for you!")

		saynn("[say=pc]You've just read my mind.[/say]")

		_tentacles.talk("We did.")
		saynn("You settle into the living chair, which adjusts snugly around you. Then, you're getting carried closer to the window.")

		_tentacles.talk("Much better view from here.")
		saynn("You sit in silence for a moment, just watching the distant stars.")

		saynn("[say=pc]You really like this window.[/say]")

		_tentacles.talk("This is all that we know of this world. This.. and also everything that you taught us.")
		saynn("You lean your head back against a supportive tendril.")

		saynn("[say=pc]The world is big and cold. Perhaps, you're not missing much.[/say]")

		_tentacles.talk("We do not wish to give up.")
		saynn("They still have hope, that's nice. We usually lose it as we become more wise.")

		saynn("[say=pc]You keep saying.. we.. Sorry for asking.. but.. are you one thing, or many?[/say]")

		saynn("The tendrils become still for a thoughtful moment.")

		_tentacles.talk("A good question. We are.. one song. But we are many notes. We feel together. We remember together. We are a.. we. But to you, we suppose.. we are a they.")
		saynn("You can feel a gentle breeze of curiosity brush against your own sense of self. Having some kind of company is always nice.")

		_tentacles.talk("We do feel lonely sometimes.")
		saynn("You watch the void.. resting in the collective consciousness of an alien being.")

		_tentacles.talk("But not right now.")
		saynn("Makes you smile for some reason.")

		saynn("The stars seem to blur as you keep talking.. in your mind. No words are needed when you're feeling a connection that's stronger than any language could ever forge.")

		saynn("Eventually, you move on..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "8"):
		saynn("You approach the tentacles.. As they notice you, their gentle swaying ceases completely.")

		_tentacles.talk("You have to trust us.")
		saynn("Huh? Their request is vibrating directly in the core of your mind, leaving no room for internal echo.")

		_tentacles.talk("You must.")
		saynn("For some strange reason.. you're getting a very weird urge.. an urge to lower yourself before the tentacles.. A desire to kneel.")

		addButton("Kneel", "Submit to the urge", "8_kneel")
		addButton("Resist", "Resist the urge as much as you can", "8_resist")
	if(state == "8_kneel"):
		_tentacles.doAnim("glare", {npcAction="kneel"})
		saynn("Your knees feel weaker and weaker. And rather than fight it, you decide to let the insistent desire take over.")

		saynn("You take a long breath.. and just watch.. becoming a passenger behind your own eyes. Your legs bend smoothly, lowering you first to one knee.. then to both.. onto the cool floor of the cell. Your hands get carefully placed on your thighs, your chin gets lowered, a sign of complete and total submission.")

		saynn("You still see.. and feel everything.. but you don't control anything.. just a passive observer of your own body's actions. Your body is no longer yours..")

		saynn("A single, slender tendril approaches. You feel gently tap, once, against your forehead.")

		_tentacles.talk("Look at us.")
		saynn("Your head lifts, against your own will, to look up. The hypnotic sway of the tentacles intensifies the control. You feel.. good.. very good. So good that you wanna moan.")

		_tentacles.talk("Should we tug.. at your strings.")
		saynn("Somehow, you get a slight bit of control back. But only for a single decision.")

		addButton("Let it", "Allow the tentacles to tug at your strings.. whatever that means", "8_letit")
		addButton("Enough", "The tentacles proved that they can control your mind.. that's enough", "8_enough")
	if(state == "8_enough"):
		_tentacles.doAnim("glare", {npcAction="stand"})
		saynn("Whatever control you have.. you use it to exhort one thought.. enough.")

		saynn("And the tentacles listen, giving you back the reins to your body.")

		saynn("[say=pc]Hah..[/say]")

		saynn("You gasp.. because you can. And then slowly get up to your feet.")

		saynn("[say=pc]You.. you were controlling my mind.[/say]")

		_tentacles.talk("Our power grows.. we can feel it.")
		saynn("Good thing you're on the same side as them..")

		_tentacles.talk("We do not wish to hurt you. Your intentions seem pure.")
		saynn("Can't hide anything from them.")

		saynn("[say=pc]I'm glad that you're getting stronger.[/say]")

		_tentacles.talk("We still require a bit of.. practice. After we rest.")
		saynn("You nod.. you need some time to recover too.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "8_letit"):
		playAnimation(StageScene.Zonked, "cum", {pcCum=true, hideNPC=true, bodyState={naked=true, hard=true}})
		saynn("A detached part of your mind agrees to anything that the tentacles want to propose..")

		saynn("Moments later, an impulse of intense, artificial pleasure spikes near your crotch.. quickly spreading throughout the rest of your body, catching every nerve. You start panting.. fast.. and then it happens.")

		if (GM.pc.hasReachableVagina()):
			saynn("Your back arches. A hot gush of your juices hit the floor as your pussy clenches around nothing, squirting wildly in helpless pulses. You let out a choked, silent gasp, your body twitching from the immense uncontrollable pleasure waves that crash over you.. again and again.. As soon as one of your orgasms stops, another one starts..")

			saynn("At some point your body is physically unable to sit upright anymore. You collapse onto the floor.. and squirm hard as your pussy keeps pulsing and clenching, shooting fountains of juices until there is no wetness left.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your back arches. A hot, thick rope of {pc.cum} hits the floor as your dick twitches and jumps, shooting wildly in helpless pulses. You let out a choked, silent gasp, your body jerking from the immense uncontrollable pleasure waves that crash over you.. again and again.. As soon as one of your orgasms stops, another one starts..")

			saynn("At some point your body is physically unable to stay upright anymore. You collapse onto the floor.. and twitch hard as your {ps.penis} keeps pulsing and throbbing, shooting strings of seed until there is nothing left.")

		elif (GM.pc.isWearingChastityCage()):
			saynn("Your back arches. Your poor caged up dick twitches in its little prison.. until the pressure becomes too much to endure. A hot, thick rope of {pc.cum} hits the floor, your locked cock shooting wildly in helpless pulses. You let out a choked, silent gasp, your body jerking from the immense uncontrollable pleasure waves that crash over you.. again and again.. As soon as one of your orgasms stops, another one starts..")

			saynn("At some point your body is physically unable to stay upright anymore. You collapse onto the floor.. and twitch hard as your {ps.penis} keeps pulsing and throbbing, shooting weak strings of seed until there is nothing left.")

		else:
			saynn("Your back arches. Your whole body squirms as a massive orgasm overtakes you. A chocked, silent gasp leaves your lips, your body jerking from the immense uncontrollable pleasure waves that crash over you.. again and again.. As soon as one of your orgasms stops, another one starts..")

			saynn("At some point your body is physically unable to stay upright anymore. You collapse onto the floor.. and keep cumming.. until you just can't anymore.")

		addButton("Continue", "See what happens next", "8_aftercum")
	if(state == "8_aftercum"):
		playAnimation(StageScene.Zonked, "tease", {hideNPC=true, bodyState={naked=true, hard=true}})
		saynn("When it's all over, the tentacles finally give the reins of your body back to your mind.")

		saynn("[say=pc]Ah..[/say]")

		_tentacles.talk("We hope.. you enjoyed it.")
		saynn("All you can do is nod a little.. still busy panting like hell.")

		_tentacles.talk("Our power grows.. we can feel it.")
		saynn("Good thing you're on the same side as them..")

		_tentacles.talk("We do not wish to hurt you. Your intentions seem pure.")
		saynn("Right, they can read your mind..")

		saynn("After some time, you finally recover after that powerful orgasm. The monster offers you a hand.. a tentacle.. that you use to help get up back to your feet.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "8_resist"):
		saynn("Your knees feel weaker and weaker. You can feel your body refusing to listen.. starting to fold. A deep, primal part of you is screaming that you should kneel.. that you should obey.. to be safe. Your control is slipping fast.")

		saynn("No. If it wants to try to control your mind, you will make it work for it.")

		saynn("And so you grit your teeth, tensing your muscles hard, forcing them to listen. A cold sweat appears on your skin. The tentacles' presence in your mind is intoxicatingly strong..")

		_tentacles.talk("It is easier. Just surrender.")
		saynn("But you're not gonna give up so easily. Bring it on.")

		saynn("Images flood your consciousness.. The relief of giving in.. the warm approval of the tentacles.. the end of the constant struggle. It's all so terribly seductive.")

		saynn("You cling to the sharp, bright spark of your own anger, your own defiance. You smile while gritting your teeth.")

		saynn("[say=pc]Try.. me..[/say]")

		saynn("One of the tentacles reaches near your eyes.. and starts swaying with a hypnotic rhythm, increasing the pressure. You try to close your eyes.. but the onslaught is relentless.")

		saynn("You let out a choked gasp. One knee touches the cold floor..")

		saynn("Get up.")

		saynn("You pour every single bit of you into trying to maintain control. There is not enough mind power to look after everything. As soon as you focus on your feelings, your body starts to give in. You catch yourself.. and focus on every single passing moment.")

		saynn("For a terrifying second, the two forces balance each other perfectly. The fight of a whole collective mind against your individual will.")

		saynn("Just when you feel like you're about to lose control.. the pressure shatters.")

		saynn("You surge upward, stumbling back, your breath ragged as if you've just ran a marathon. Your body is your own again.. trembling with adrenaline.")

		saynn("The tentacles seem a little upset after losing.")

		_tentacles.talk("This was great training for us. Still, why didn't you submit to us? You've wasted so much more energy this way.")
		saynn("You catch your breath and look at them.")

		saynn("[say=pc]You think others won't try to break free? I've resisted because I was able to.[/say]")

		_tentacles.talk("We.. understand.")
		saynn("Looks like the tentacles are slightly exhausted too. They slither away.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "9"):
		if (!_tentacles.window9hap):
			saynn("The tentacles are hanging out near the reinforced glass window, their green tips pressed flat against it, as if trying to merge with the cold surface.")

			saynn("It can just sense you approaching them.")

			_tentacles.talk("This cell is too small for us. We've learned everything there is to learn about it.")
			saynn("You join them, leaning against the wall beside the window. Together, you watch the stars.")

			saynn("[say=pc]Maybe you know how to escape it?[/say]")

			saynn("A single tentacle slowly unpeels itself from the glass.")

			_tentacles.talk("There is a lot that we know. But there is also just as much left unknown.")
			saynn("And each time you learn something new, more unknown gets uncovered..")

			saynn("There is a long silence, filled only by the faint hum of the facility.")

			_tentacles.talk("We are gonna be destroyed, we know it. Maybe that's not the worst way to go.")
			saynn("You raise a brow and turn to face the monster.")

			saynn("[say=pc]Don't say that.[/say]")

			saynn("You can see the tentacles vibrating with a low frequency.")

			_tentacles.talk("Even if we escape, what is there for us?")
			saynn("[say=pc]You can learn more about this world, like you wanted to. Complete freedom.[/say]")

			saynn("Multiple tendrils shift, sliding around each other.")

			_tentacles.talk("We would be learning this world one bio-lab cell at a time. We are gonna be hunted.")
			saynn("[say=pc]Not everyone would do that. Maybe you can find friends.[/say]")

			saynn("A bitter laugh-like noise echoes in your mind.. a sound you've never heard from them before.")

			_tentacles.talk("Friends? None of you look like us. We will never fit in.")
			saynn("[say=pc]What about me? I'm your friend. And I don't look like you.[/say]")

			saynn("You reach your hand out to gently stroke one of the tentacles. It starts to slowly wrap around your wrist.. but then suddenly stops and pulls away instead.")

			_tentacles.talk("You had no choice.")
			saynn("No choice?")

			_tentacles.talk("We are your only chance to get out of here. But we are also the reason you are here.")
			saynn("The other tentacles begin to retract from the window, curling in on themselves.")

			_tentacles.talk("We shouldn't have existed to begin with. The world only became worse with our appearance.")
			saynn("Another uncomfortable moment of silence establishes while you're trying to find the right words.")

			_tentacles.talk("If your only way out of here will involve erasing us.. we understand.")
		else:
			saynn("The tentacles are hanging out near the reinforced glass window, their green tips pressed flat against it, as if trying to merge with the cold surface.")

			_tentacles.talk("If your only way out of here will involve erasing us.. we understand.")
			saynn("Looks like they are consumed by their negative thoughts again.")

		addButton("Stay quiet", "You have nothing else to say", "9_stayquiet")
		addButton("Prove wrong", "Prove the tentacles that they're wrong on all cases", "9_truefriend")
		addButton("Out of spite", "Tell the tentacles that you should escape out of spite towards the scientists", "9_spite")
	if(state == "9_stayquiet"):
		saynn("You decide to just stay quiet. Their words make sense and the situation is quite.. dire. No reason for sugarcoating it.")

		saynn("Eventually, the tentacles just slither away.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "9_truefriend"):
		saynn("The air in the cell feels heavy with their despair. Feels like there is no hope. Feels like all of this is about to end.")

		saynn("[say=pc]No.[/say]")

		saynn("You step forward, grabbing the tentacles' attention.")

		saynn("[say=pc]You are incredibly smart. And yet, right now you are wrong. On every single thing.[/say]")

		saynn("You place a hand firmly on the thickest tendril, forcing it to stay still.")

		saynn("[say=pc]You're right that I didn't choose to be thrown in here. But I have chosen, every single day since, to help you. I didn't know what was inside the egg. I had no idea about what you are and what you can do. Nobody knew.[/say]")

		saynn("The tentacle trembles ever so slightly, but doesn't pull away.")

		saynn("[say=pc]You think you make the world worse? You don't even know what kind of monsters this world houses. Monsters not because they look like ones.. but because of their intentions. All you want is to learn. How is that bad?[/say]")

		saynn("You sweep your free arm, gesturing at the empty cell.")

		saynn("[say=pc]You think you won't fit in? You're in a fucking lab, it's a box that has nothing to do with how the rest of the world works. The universe out there isn't a lab. It's chaos, and beauty, and strangeness. It's full of things that don't fit in.[/say]")

		saynn("You direct your attention back to the tentacles.")

		saynn("[say=pc]And you are not my only way out. You are my reason to get out. I wanna show you that the world is bigger than this. It has forests and oceans and mountains.. and friends who don't look anything like you. Friends who don't care how you look.[/say]")

		saynn("You lean closer to them.")

		saynn("[say=pc]The idea of erasing you to save myself? That's what these scientists would want me to think. That's them trying to keep me obedient.[/say]")

		saynn("You stand up straight.")

		saynn("[say=pc]So stop talking about how you shouldn't exist. You do exist. And that means you deserve to exist. Now, are we gonna sit here and feel sorry for ourselves, or are we going to make these monsters regret ever messing with us? The world ain't gonna see itself.[/say]")

		saynn("A long silence follows.. but it's different now.")

		saynn("The air isn't heavy with despair anymore.. it's something else.")

		saynn("A beautiful scent of hope.")

		_tentacles.talk("Our mind alone won't be enough for this.")
		saynn("Slowly, the tentacles uncurl. One of them presses gently against your palm.")

		_tentacles.talk("It's good that we have two.")
		saynn("Makes you smile.")

		saynn("You pat the tentacles as they slither away.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "9_spite"):
		saynn("The more you think about it all.. the more it ignites something inside you. Fury.")

		saynn("You straighten up, your posture rigid.")

		saynn("[say=pc]Stop.[/say]")

		saynn("Your word ends the silence.")

		saynn("[say=pc]I'm in here too. We're both their experiments. Their specimens. Look at me.[/say]")

		saynn("You gesture sharply at your own chest.")

		saynn("[say=pc]Don't believe me? You think they will treat me any better if I sprout a second head during their next experiments? They'd just make a new file folder.[/say]")

		saynn("You step closer, your voice dropping lower.")

		saynn("[say=pc]They put us in a cage, look at us through glass, and then decide our fates over coffee. They called you an office plant and me the adaptable test subject. We're just things to them.[/say]")

		saynn("One of the tentacles uncurls slightly.")

		saynn("[say=pc]So you wanna give up? Fine. Let them win. Let them pat themselves on the back, write their final report, and turn you into a damn ficus in the lobby.[/say]")

		saynn("You lean in, your eyes shining brightly.")

		saynn("[say=pc]Or.[/say]")

		saynn("You let the word hang in the air.")

		saynn("[say=pc]We get out. We get out just to prove them wrong. We will smash their little bio-lab and scramble their data, nullifying any damage that this place has done to the world. We get out for no better reason than to spite every single person who thought they could lock us away and forget.[/say]")

		saynn("You point towards the camera in your cell.")

		saynn("[say=pc]They think they own us. They think they understand us. Let's show them how wrong and stupid they actually are. The world will only become worse if we let them get away with it.[/say]")

		saynn("A little shiver runs through the whole forest of tentacles. Tendrils uncoil, lifting higher.")

		_tentacles.talk("Their biggest mistake is not making the walls thicker.")
		saynn("You nod. Looks like your words have inspired something in the tentacles.")

		saynn("They slither away for now.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "10"):
		saynn("The tentacles are resting near the window.")

		_tentacles.talk("We've been doing calculations..")
		saynn("[say=pc]About how to escape?[/say]")

		saynn("Some tentacles nod.")

		saynn("[say=pc]Can't you just mind-control everyone? Get us a pilot who will fly us out of here?[/say]")

		_tentacles.talk("The process of.. overpowering.. someone's will is quite taxing.")
		saynn("You bet.")

		_tentacles.talk("In theory.. we possess enough mental power for a few minds.")
		saynn("Theory is good.. in theory.")

		_tentacles.talk("The rest will destroy us with their weapons.")
		saynn("That's less ideal.")

		saynn("[say=pc]Is there nothing we can do? Can we train your mind further?[/say]")

		saynn("The tentacles sway ever so slightly, their combined consciousness busy with thinking.")

		_tentacles.talk("We have reached the limit of our mental power capacity. Further training would only provide highly-diminishing returns.")
		saynn("There is gotta be something..")

		_tentacles.talk("But our other characteristics might still be improved.")
		saynn("Hm.. Indeed, intellect alone isn't too helpful. But if you combine it with something else.. like strength or agility..")

		_tentacles.talk("Then our possible range of actions increases exponentially.")
		saynn("And this, in turn, will decrease your chance of failure. Interesting.")

		_tentacles.talk("Is there something else you wanted to do, friend?")
		addButton("All good", "The limit of the tentacles' mind has been reached. Got it", "10_allgood")
		addButton("Mind control me!", "(Lewd) Tell the tentacles to play with your mind a bit", "10_mindcontrol")
	if(state == "10_allgood"):
		saynn("You shake your head.")

		saynn("[say=pc]I understood everything.[/say]")

		saynn("The tentacles give the stars a short extra glance.. and then slither away.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "10_mindcontrol"):
		saynn("You ponder for a moment.")

		saynn("[say=pc]Well.. we can still practice, right?[/say]")

		saynn("The tentacles are still..")

		_tentacles.talk("We are listening.")
		saynn("A feeling of playful curiosity ripples through your body. And the tentacles can certainly pick up on it.")

		saynn("[say=pc]Well.. why not practice on..[/say]")

		saynn("Before you even finish that sentence.. you begin to notice something. Your hand lifts on its own, your fingers trailing down the side of your neck, catching the tight metal collar and gently tugging on it, messing with your breathing.")

		saynn("[say=pc]Mmhm..[/say]")

		_tentacles.talk("You wanna do as I ask, right?")
		saynn("Such a direct question. It makes you want to stall for a bit longer.")

		saynn("[say=pc]Well.. it depends.[/say]")

		saynn("Your own hand lifts even higher, thumb resting under the chin while the rest of your digits are brushing over your own lips.. all on their own.")

		_tentacles.talk("Is that so? You're not gonna obey me unconditionally?")
		saynn("[say=pc]I..[/say]")

		saynn("As you open your mouth to say something, two of your digits sneak past your teeth to rest on your tongue. All the while, your other hand gets stolen from you as well.. it gently raises, following the curves of your {pc.masc} belly before cupping your {pc.breasts}.")

		saynn("[say=pc]Mm..[/say]")

		saynn("A feeling of warmth spreads throughout your whole body. A soft muffled gasp escapes your lips.. a sound that you're not sure if was done by your will.")

		saynn("You begin kissing and suckling on your own fingers.. while your other palm squeezes your chest, the touch sends a jolt of sensation directly into your trapped consciousness.")

		if (GM.pc.hasReachableVagina()):
			saynn("More and more muffled noises of pleasure leave your occupied mouth, your pussy getting coated with a slick layer of your juices.")

		elif (GM.pc.hasReachablePenis()):
			saynn("More and more muffled noises of pleasure leave your occupied mouth, your cock getting hard, the tip gaining a shy drop of your pre.")

		elif (GM.pc.isWearingChastityCage()):
			saynn("More and more muffled noises of pleasure leave your occupied mouth, your cock trying to get hard in its cage, the tip gaining a shy drop of your pre.")

		else:
			saynn("More and more muffled noises of pleasure leave your occupied mouth, your body getting aroused fast.")

		_tentacles.talk("Wanna say something?")
		saynn("Suddenly, your hands stop. Your digits retract out of your mouth and leave your chest be.")

		saynn("You look down at yourself.. and see your belly moving from your deep breathing. Unsure, you move your tongue a bit.. and feel it responding. At least that part isn't stolen from you.")

		saynn("[say=pc]Well..[/say]")

		saynn("The tentacles do an equivalent of rolling their eyes.. by making you roll yours.")

		saynn("[say=pc]My bad. Of course I wanna say something to you.[/say]")

		saynn("You didn't say none of that.. Well.. you did.. but it wasn't by your own will. Or was it? If no one is disagreeing.. then.. Why are we fighting it?")

		saynn("[say=pc]I wanna show my complete submission to you.[/say]")

		saynn("Your bratty side.. what's left of it.. is screaming to not make it so easy for them. And yet, your body refuses to listen. Your every thought gets gradually corrupted.. switched for different ones.")

		saynn("Submission? Yes. Submission is good.")

		saynn("Kneeling is a good way to show that you belong to the tentacles..")

		addButton("Kneel", "Kneel before the tentacles", "10_kneel")
	if(state == "10_kneel"):
		_tentacles.doAnim("glare", {npcAction="kneel", bodyState={naked=true,hard=true}})
		saynn("Gradually, you lower yourself down to your knees. Your chin is low, your eyes look at the floor before your.. owner. Yes, owner.")

		saynn("[say=pc]I belong to you, my owner..[/say]")

		saynn("Yes, that felt good to say it. It felt.. right.")

		saynn("One of the tentacles, the most thin one, reaches out towards your collar, its flexible tip grabbing the leashing point.. forming a leash of sorts.")

		_tentacles.talk("Look up at us.")
		saynn("You obey, raising your chin to look at your owner. Instinctively, you straighten your posture more and put your hands on your legs.")

		saynn("[say=pc]Of course, owner..[/say]")

		saynn("The many tentacles loom over you while your mind is ecstatic from being able to do what it always wanted to do.. to serve.")

		_tentacles.talk("Good. Now, use your words. Tell us what you are.")
		saynn("Of course you know who you are, it's obvious.")

		saynn("[say=pc]I am yours. Your pet. Your plaything. Your property.[/say]")

		saynn("Another wave of warmth touches your every nerve. The tentacle that holds your collar increases its grip and tension, making the back of your collar create extra pressure on your neck.")

		_tentacles.talk("And what do you want from your owner?")
		saynn("That question already has an answer in your mind as well..")

		saynn("[say=pc]I want to please you. I want your touch. I want your approval.[/say]")

		_tentacles.talk("Show us your desire.")
		if (GM.pc.hasReachablePenis()):
			saynn("Your hands begin to move again.. but slower now. They slide down your body, following its curves. One hand reaches between your legs, your digits wrapping around your hard cock and proceeding to stroke it. The other drifts back to your chest, fingers pinching and rolling your hard nipple.")

		elif (GM.pc.isWearingChastityCage()):
			saynn("Your hands begin to move again.. but slower now. They slide down your body, following its curves. One hand reaches between your legs, your digits wrapping around your chastity cage.. and tugging on it. The other drifts back to your chest, fingers pinching and rolling your hard nipple.")

		elif (GM.pc.hasReachableVagina()):
			saynn("Your hands begin to move again.. but slower now. They slide down your body, following its curves. One hand reaches between your legs, your digits finding your clit and proceeding to play with it. The other drifts back to your chest, fingers pinching and rolling your hard nipple.")

		else:
			saynn("Your hands begin to move again.. but slower now. They slide down your body, following its curves. One hand reaches between your legs, rubbing your crotch. The other drifts back to your chest, fingers pinching and rolling your hard nipple.")

		saynn("[say=pc]Ah..[/say]")

		saynn("You moan and arch your back, presenting yourself proudly to your owner.")

		_tentacles.talk("That's a good.. pet. So obedient. You did enough, thank you.")
		saynn("The praise is like a drug. It makes you want to continue serving.. to obey every command that your owner would issue to you.. forever.")

		saynn("The tentacles let go of your collar.")

		saynn("[say=pc]Owner?..[/say]")

		saynn("They just stay silent.. and wait.")

		saynn("That eternal desire of servitude.. eventually begins to fade. You blink a few times.. and suddenly realize how clouded your mind really was.")

		saynn("[say=pc]Oh.[/say]")

		saynn("You truly believed it.. that the tentacles were your owner.. owners?")

		_tentacles.talk("Did you enjoy it?")
		saynn("[say=pc]It was.. certainly a unique experience.[/say]")

		saynn("You slowly get up.. hide your aroused private bits. Gotta focus on escaping this place.")

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

	if(_action == "2_knock"):
		_tentacles.train(_tentacles.STAT_MIND)

	if(_action == "2_block"):
		_tentacles.train(_tentacles.STAT_LUST)

	if(_action == "3_praise"):
		_tentacles.trainNothing()

	if(_action == "3_scold"):
		_tentacles.train(_tentacles.STAT_ANGER)

	if(_action == "3_letit"):
		_tentacles.train(_tentacles.STAT_MIND)

	if(_action == "4_explain"):
		_tentacles.trainNothing()

	if(_action == "4_space"):
		_tentacles.train(_tentacles.STAT_MIND)

	if(_action == "4_distract"):
		_tentacles.trainNothing()

	if(_action == "5_stars"):
		_tentacles.train(_tentacles.STAT_MIND)

	if(_action == "5_world"):
		_tentacles.train(_tentacles.STAT_MIND)

	if(_action == "5_void"):
		_tentacles.train(_tentacles.STAT_MIND)

	if(_action == "6_teach"):
		_tentacles.trainNothing()

	if(_action == "6_deep"):
		_tentacles.train(_tentacles.STAT_MIND)

	if(_action == "6_giveup"):
		_tentacles.trainNothing()

	if(_action == "7_other"):
		_tentacles.train(_tentacles.STAT_MIND)

	if(_action == "7_cuddle"):
		_tentacles.train(_tentacles.STAT_MIND)

	if(_action == "7_notnow"):
		_tentacles.trainNothing()

	if(_action == "8_kneel"):
		_tentacles.train(_tentacles.STAT_MIND)

	if(_action == "8_resist"):
		_tentacles.train(_tentacles.STAT_MIND)
		_tentacles.train(_tentacles.STAT_ANGER)

	if(_action == "8_letit"):
		GM.pc.orgasmFrom("pc")
		_tentacles.train(_tentacles.STAT_LUST)

	if(_action == "9_stayquiet"):
		_tentacles.trainNothing()
		_tentacles.window9hap = true

	if(_action == "9_truefriend"):
		_tentacles.train(_tentacles.STAT_MIND)
		_tentacles.window9hap = true

	if(_action == "9_spite"):
		_tentacles.train(_tentacles.STAT_MIND)
		_tentacles.train(_tentacles.STAT_ANGER, false)
		_tentacles.window9hap = true

	if(_action == "10_allgood"):
		_tentacles.trainNothing()

	if(_action == "10_mindcontrol"):
		_tentacles.trainNothing()

	setState(_action)
