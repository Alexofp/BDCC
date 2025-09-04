extends SceneBase

func _init():
	sceneID = "PSShaftMinerEnding1"

func _run():
	if(state == ""):
		addCharacter("psricky")
		playAnimation(StageScene.Duo, "stand", {npc="psricky"})
		saynn("You bang on the reinforced voidsteel door until the hinges begin to screech.")

		saynn("As it opens, you see Ricky.")

		saynn("[say=psricky]Yeah? Oh, it's you, the funny collared one.[/say]")

		saynn("[say=pc]It's done. I hit the target.[/say]")

		saynn("Behind him, you notice his goons loading up his spaceship with final crates of raw, pulsing ore. A distant rumble of engines vibrates the dusty ground.")

		saynn("[say=psricky]Job is done, then, eh? Time to share the news with the rest of your cage buddies.[/say]")

		saynn("He snaps his fingers, causing some of his goons to approach him.")

		saynn("[say=psricky]Line the slaves up for me, will ya?[/say]")

		addButton("Continue", "See what happens next", "near_cages")
	if(state == "near_cages"):
		playAnimation(StageScene.Solo, "stand", {pc="psricky"})
		aimCameraAndSetLocName("psmine_sleep")
		saynn("You watch as the armed goons gather all of you up near the big cage, your sleeping spot.")

		saynn("Ricky steps forward, clearing his throat theatrically, catching everyone's attention.")

		saynn("[say=psricky]Enjoying the vacation so far? Well.. I've brought bad news.[/say]")

		saynn("The slaves all look between each other, their gazes concerned.")

		saynn("[say=psricky]Everything good has a tendency to end one day. Tragic, isn't it?[/say]")

		saynn("A collective sigh of relief ripples through the line. Looks like this 'vacation' is over.")

		saynn("[say=psricky]You did this job for me. And for that, you certainly deserve something. Why wouldn't I reward those who got me here? That'd be unfair, cruel, fucked.[/say]")

		saynn("Hope is flickering in the slaves' eyes.")

		saynn("[say=psricky]We'll get to that. First, I've got some actual bad news.[/say]")

		saynn("He pauses for effect.. and an effect it sure has.")

		saynn("[say=psricky]After loading up the spaceship with all that precious ore, I noticed a problem.[/say]")

		saynn("He casts a quick glance at his crew.")

		saynn("[say=psricky]What's the problem you might ask? Ricky, what's the problem?[/say]")

		saynn("He raises a brow, the silence tugging on the strings of your nerves.")

		saynn("[say=psricky]Let me say it straight to ya. We're low on space, barely enough for my people. Sad shit, eh? I guess I made a bit of.. how do you say it.. miscalculation. An oopsie.[/say]")

		saynn("The pressure rises every second. Ambience turning hostile real quick..")

		saynn("One of the shaky slaves can't bear it anymore. They take off and bolt for the ship..")

		addButton("Continue", "See what happens next", "slave_gets_shot")
	if(state == "slave_gets_shot"):
		playAnimation(StageScene.Solo, ["firepistol", "res://Inventory/UnriggedModels/Pistol/Pistol.tscn"], {pc="psricky"})
		saynn("Shouts echo as the slave dashes across the hard rock.. then a single, deafening gunshot cracks. The poor lad collapses instantly, blood spilling across their back.")

		saynn("Ricky adopts a classic gunslinger stance.. legs apart, revolver still drawn. His goons aim their rifles at you.. fingers twitching on triggers.")

		saynn("[say=psricky]My bad, really. Now, here's a thought to soften the blow: I wasn't gonna take anyone back on board anyway.[/say]")

		saynn("He holsters his revolver with a casual snap.")

		saynn("[say=psricky]Your reward, right. Curious what it is? This lovely cage right here. I'm generous, eh? Enjoy the rest of your vacation.[/say]")

		saynn("He gives you all a final nod.. before spitting onto the ground and turning around.")

		saynn("[say=psricky]Light up everyone who tries to follow us, boys. Time to leave.[/say]")

		saynn("Panic erupts. A handful of braver.. or more desperate.. slaves rush after the goons, pickaxes in hand.")

		saynn("In a blur of a second, gunfire erupts.")

		saynn("Screams echo, bodies crumple, blood gets spilled fast.")

		saynn("Seeing the literal slaughter, there is only one correct choice.")

		addButton("Hide", "Try to hide", "do_hide")
	if(state == "do_hide"):
		removeCharacter("psricky")
		playAnimation(StageScene.Solo, "stand")
		aimCameraAndSetLocName("psmine_hide")
		saynn("You get away from the bloodshed, cramming yourself against the cold jagged walls of the caves, panting raggedly, heart hammering away as the last gunshots fade into the oppressive silence.")

		saynn("Around you, a handful of battered survivors slump against the rocky floor, some are clearly wounded.")

		saynn("In the distance, Ricky's spaceship rumbles to life. You and the others watch in stunned horror as it lifts off, its engines churning dust into the air before rising into the dim, red sky. For a moment it hangs there, like a cruel joke of a promise.. before flying off, its silhouette gradually reducing down to a single dot.. before.. gone completely..")

		saynn("Slowly, the terrible truth settles in.. you're abandoned. Unarmed. Stranded on this god-forsaken rock of a planet with nothing but desperation for company. Your chest becomes heavier with each breath.")

		saynn("[say=pc]Fuck.[/say]")

		saynn("Beep..")

		saynn("[say=pc]Huh?[/say]")

		saynn("You look around, trying to find the source of that beeping.")

		saynn("Beep.. beep..")

		saynn("Your confused stare illuminates the bland surroundings.. but the rest of the lost souls already found the cause.. they back away from you and your beeping collar.")

		saynn("Beep.. beep.. beep-beep-beep..")

		saynn("Oh shit, it's flashing lights. Tiny red lights pulse fast..")

		addButton("Continue", "See what happens next", "pc_gets_shocked")
	if(state == "pc_gets_shocked"):
		playAnimation(StageScene.Solo, "defeat")
		saynn("Then, without warning, a jolt of electricity surges through your body.. sharp and searing, like molten knives sliding through your veins. You convulse mid-breath, a strangled scream ripping from your throat.")

		saynn("The world tilts, your vision fracturing into shards of red and black.. and then.. everything goes dark..")

		addButton("Continue", "See what happens next", "everything_dark")
	if(state == "everything_dark"):
		playAnimation(StageScene.Sleeping, "sleep")
		saynn("Everything is dark..")

		saynn("Very dark..")

		saynn("Still dark..")

		saynn("Dark..")

		addButton("Continue", "See what happens after the darkness..", "got_saved")
	if(state == "got_saved"):
		playAnimation(StageScene.GivingBirth, "idle")
		aimCameraAndSetLocName("intro_interogation")
		addCharacter("intro_detective")
		saynn("A faint hiss of recycled air greets you as consciousness seeps back in. You lie on something hard yet oddly cushioned, your limbs heavy as though weighted by steel. Blurred shapes drift in and out of focus.")

		saynn("The sharp scent of antiseptic stings your nostrils.")

		saynn("[say=intro_detective]Thanks, doctor. I will take it from here.[/say]")

		saynn("Familiar voice.. Where did you hear it before?")

		saynn("The vision is blurry.. but you see a silhouette.. well-tailored wolf in a white shirt and grey trousers.")

		saynn("He snaps his fingers in front of your face, making your ears perk. After that, he just takes a seat on a chair. You open your eyes fully and look around.. you're in a rolling bed.. comfy. The guy offers you a cool gaze.")

		saynn("[say=intro_detective]You've been brought back under AlphaCorp's protection. You're safe now.[/say]")

		saynn("Somehow, you don't feel that much more safe.")

		saynn("[say=pc]Yeah, hello to you too..[/say]")

		saynn("[say=intro_detective]My name is Jake, IIPF, threat..[/say]")

		saynn("It hits you.")

		saynn("[say=pc]I know who you are.[/say]")

		saynn("He tilts his head slightly down, brow raised.")

		saynn("[say=pc]How did you find me?[/say]")

		saynn("Jake grabs a few papers and swipes his gaze through them.")

		saynn("[say=intro_detective]We intercepted your signal.[/say]")

		saynn("Your personal escort team, how convenient..")

		saynn("Your hand reaches to tug on your collar.. it's still there.. and it's still sitting just as tight as before.")

		saynn("[say=pc]Was the shock part really that necessary?[/say]")

		saynn("[say=intro_detective]It's for your own protection, really.[/say]")

		saynn("You let out a bitter laugh.")

		saynn("[say=pc]Of course. What about the others?[/say]")

		saynn("Jake's pen hovers over the files as he raises a brow.")

		saynn("[say=intro_detective]Others?[/say]")

		saynn("[say=pc]There were other.. people.. on that planet.[/say]")

		saynn("He shuffles his papers and then puts them away.")

		saynn("[say=intro_detective]I'm certain they've been processed accordingly.[/say]")

		saynn("Alright..")

		saynn("[say=pc]So.. what now?[/say]")

		saynn("[say=intro_detective]I'm here to assess the failed escape attempt from one of our correctional facilities, do a clinical review of your actions, and perform all of the required legal procedures. I also gotta make sure this.. incident doesn't happen again.[/say]")

		saynn("[say=pc]Escape attempt? Listen. I got kidnapped by one of the staff! I got sold away on a slave auction.[/say]")

		saynn("He nods subtly after each of your sentences.")

		saynn("[say=pc]You don't believe me, do you?[/say]")

		saynn("You glare at him.")

		saynn("[say=intro_detective]I have no reason to think that any of AlphaCorp's secret facilities are compromised.[/say]")

		saynn("You growl.")

		saynn("[say=pc]Well, you're dumb as bricks, then.[/say]")

		saynn("He stays quiet, his expression barely reacting to your words.")

		saynn("After a few seconds, he grabs a datapad and starts looking up something.")

		saynn("[say=pc]You're not even gonna ask who it was?[/say]")

		saynn("[say=intro_detective]Any of your claims will lack the most important part. Proof.[/say]")

		saynn("Nothing you say can change anything. So you just sigh.. and relax in bed. Feels so much better than that cage..")

		saynn("[say=intro_detective]I'm finishing the required paperwork.[/say]")

		saynn("[say=pc]How are you gonna make sure that this doesn't happen?[/say]")

		saynn("[say=intro_detective]Your sentence has been extended - an administrative penalty for the illegal actions.[/say]")

		saynn("[say=pc]It's already indefinite anyway.[/say]")

		saynn("He stares at you.. intently.")

		saynn("[say=intro_detective]I will now invite the officers in.[/say]")

		saynn("Next many moments blur into one..")

		saynn("The officers cuff you and bring you onto a spaceship.")

		saynn("Soon enough, you're already placing your foot back onto the BDCC's grounds.")

		addButton("Continue", "See what happens next", "risha_items")
	if(state == "risha_items"):
		aimCameraAndSetLocName(GM.pc.getLocation())
		playAnimation(StageScene.Duo, "stand", {npc="risha"})
		removeCharacter("intro_detective")
		addCharacter("risha")
		saynn("[say=risha]Here is your shit.[/say]")

		saynn("At least.. you don't have to start from zero.")

		saynn("[say=risha]Be glad that I decided against just throwing it all out.[/say]")

		saynn("You nod.")

		saynn("You're back in your cell. Home, sweet home.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "near_cages"):
		processTime(3*60)
		GM.main.PSH.unlockEndingAddMessage("ShaftMiner", "mined")

	if(_action == "slave_gets_shot"):
		processTime(3*60)

	if(_action == "do_hide"):
		processTime(3*60)

	if(_action == "pc_gets_shocked"):
		GM.pc.addPain(1000)
		GM.pc.addCredits(-GM.pc.getCredits())

	if(_action == "everything_dark"):
		processTime(10*60)

	if(_action == "got_saved"):
		GM.main.startNewDay()
		GM.pc.addPain(-1000)
		processTime(60*83)

	if(_action == "risha_items"):
		processTime(3*60)
		GM.pc.setLocation(GM.pc.getCellLocation())
		GM.main.stopPlayerSlavery()
		addMessage("All your items were returned to you.")

	setState(_action)
