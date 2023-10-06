extends SceneBase

var tookRahi = false

func _init():
	sceneID = "Ch7KillEndingScene"

func _run():
	if(state == ""):
		addCharacter("tavi", ["naked"])
		addCharacter("captain")
		playAnimation(StageScene.Duo, "stand", {npc="captain", npcAction="holdpistol", pc="tavi", bodyState={naked=true}})
		saynn("You just offer Tavi a little smile.. and she understands everything. There is not much left to say anyway..")

		saynn("Tavi turns her head towards the captain.. and establishes direct eye contact. A little mean smile appears between her cheeks as she starts to close distance, bravely stepping forward.. putting all her femininity into each step.. embracing her sexy curves.")

		saynn("The captain sees that and aims his energy gun at her.")

		saynn("[say=captain]Not a step further![/say]")

		saynn("Tavi stops.. seemingly obeying.. but then proceeds her advances.. passing through the fake boundaries.")

		saynn("[say=captain]I will kill you if I have to.[/say]")

		saynn("[say=tavi]Oh yeah~?[/say]")

		saynn("[say=captain]You're not afraid to die?[/say]")

		saynn("Tavi giggles as she already makes at least a third of the way to him.")

		saynn("[say=tavi]I'm in hell already~.[/say]")

		saynn("She seductively squeezes her tits with her clawed paws in front of him.. causing the captain to frown.")

		saynn("[say=captain]You think I wouldn't kill a slut?[/say]")

		saynn("[say=tavi]Ooh~. So brave. Stating the obvious. But.. you are a bigger slut here. A slut for power~. The moment you fire, the last barrier will disappear.. And then all bets will be off..[/say]")

		saynn("Captain shakes his head.. and then raises the hand that holds the projector sphere with Elena in it. His hand is threatening to drop it. You notice the aperture of that sphere opening slightly.. almost like Elena is watching through it..")

		saynn("[say=captain]You might not care if you die. But you want this gone? What's the big plan, Tavi? You're lost. Which means that you lost.[/say]")

		saynn("Tavi tilts her head.. but doesn't stop advancing.. swaying her hips in the process.")

		saynn("[say=tavi]You don't get it..[/say]")

		saynn("Seeing that nothing works against fearless Tavi.. Captain pulls the trigger.. Tavi closes her eyes. The aperture opens fully..")

		addButton("Continue", "See what happens next", "elena_saves_tavi")
	if(state == "elena_saves_tavi"):
		playAnimation(StageScene.Duo, "dodge", {npc="captain", npcAction="firepistol", pc="tavi", bodyState={naked=true}})
		saynn("Moments before the gun fires, the sphere in the captain's hand suddenly lights up, illuminating the whole room with a bright pink flash. A blinding flash that disorients you and messes with the captain's aim, letting Tavi easily dodge the shot.")

		saynn("But that flash is also what burns all of that sphere's electronics.. The overloaded matrix burns into ashes.. Captain drops the burning sphere.. letting it smash into a million pieces against the floor..")

		saynn("Tavi's furious eyes flash.. Captain's show.. regret.")

		addButton("Continue", "See what happens next", "tavi_kills_captain")
	if(state == "tavi_kills_captain"):
		playAnimation(StageScene.Rekt, "kill", {npc="captain", pc="tavi", bodyState={naked=true}})
		saynn("Tavi dashes forward, Elena's self-sacrifice allows her to catch up with him.. before suddenly sinking her long sharp claws into his neck, effortlessly tearing through his skin and flesh..")

		saynn("Captain's feet lose the ground as Tavi lifts him high above the floor. She is assuming a powerful stance, her muscles all tensed up.")

		saynn("[say=tavi]My dream is seeing you die.[/say]")

		saynn("[say=captain]KH-h..[/say]")

		saynn("Tavi's mean eyes inspect the captain's expression in great detail. He is scared.. desperate.. His hand holds onto Tavi's.. unsure if they should try to pull the claws.. or just let them stay there.. lodged into his neck.")

		saynn("[say=tavi]Mm-mh~.. I never felt any more alive. Almost as good as fucking~.[/say]")

		saynn("Some blood begins to stream down her paw.. dripping down onto the carpet. Captain starts gasping for air.. silently..")

		saynn("[say=tavi]Has the cat got your tongue?[/say]")

		saynn("Tavi tilts her head slightly and watches the captain suffer..")

		saynn("[say=pc]Tavi, I think we should..[/say]")

		saynn("She looks at you.. her eyes lusty.")

		saynn("[say=tavi]My bad.. you're right.[/say]")

		saynn("Tavi returns her gaze back to the captain.. and then tenses her bloody paw hard.. her claws slashing through the dying guy's arteries.. causing a little fountain of pure red blood to spawn..")

		saynn("[say=tavi]This is for Elena, asshole.[/say]")

		saynn("Captain is quickly losing strength.. strength to live. There is nothing he can tug at anymore. Nothing he can exploit or abuse. No way to talk himself out of this. He is screwed.. And his last moments.. he is forced to see Tavi and think about what got him killed..")

		addButton("Continue", "See what happens next", "tavi_drops_captain")
	if(state == "tavi_drops_captain"):
		playAnimation(StageScene.Rekt, "end", {npc="captain", pc="tavi", bodyState={naked=true}})
		removeCharacter("captain")
		saynn("Tavi uses her free paw to rip the little bloody thumbdrive token that the guy is wearing on his neck.. Before letting go of his body, pulling her sharp claws out and letting the blood stream freely.")

		saynn("Captain collapses.. and loses consciousness as soon as he hits the lowest point of his life. His eyes.. become lifeless.")

		saynn("Tavi is towering over his fresh corpse.. She is trying to keep herself composed.. but she is visibly shaking anyway..")

		saynn("[say=tavi]Thanks for the torture. We would never get this strong otherwise..[/say]")

		addButton("Continue", "See what happens next", "talk_about_elena")
	if(state == "talk_about_elena"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcBodyState={naked=true}})
		saynn("You carefully approach Tavi.. She looks at her bloody paw.. and then shakes some of the blood off. Her adrenaline begins to wear off.. She starts panting heavily.. So you put a hand on her shoulder.")

		saynn("[say=pc]It's okay.. Everything is over. You did really well.[/say]")

		saynn("She looks at you.. and nods.")

		saynn("[say=tavi]Couldn't have done it without you..[/say]")

		saynn("Then she looks at the remains of the projector sphere.. Nothing seems to be recoverable.. Just burned metal and glass bits..")

		saynn("[say=tavi]And without her..[/say]")

		saynn("A little idea comes into your mind.")

		saynn("[say=pc]Don't you have.. a backup? I know that she wouldn't have the same memories but..[/say]")

		saynn("[say=tavi]An old backup.. yeah.. It's in my ship though. A ship that got confiscated by the AlphaCorp.[/say]")

		saynn("You carefully embrace Tavi..")

		saynn("[say=pc]We will find your ship. I promise you. Right now we gotta find a way to get out of here.[/say]")

		saynn("Tavi inspects the thumbdrive that she got. It seems to have some kind of blue round port on it.. Same one as what your collars have.")

		saynn("[say=tavi]Let's take these off first. We've been his slaves long enough.[/say]")

		addButton("Collars", "Remove the collars finally", "remove_collars")
	if(state == "remove_collars"):
		playAnimation(StageScene.Hug, "kiss", {npc="tavi", npcBodyState={naked=true}})
		saynn("Tavi brings the token to your collar.. and a few seconds later there is an audible click as something mechanical inside it unlocks, allowing you to freely take it off..")

		saynn("Ah.. you almost moan as your neck can finally breathe.. You rub the skin there.. and it feels so good..")

		saynn("[say=pc]Now let me.[/say]")

		saynn("You fetch the token from Tavi and press it against her collar.. unlocking it the same way.")

		saynn("[say=tavi]Ah..[/say]")

		saynn("Tavi doesn't hold back and produces a cute little moan. When the second collar hits the floor.. she reaches out to start a deep passionate kiss with you..")

		saynn("Time seems to have stopped.. For a moment you felt truly free.. Both you and Tavi want more of those moments..")

		saynn("[say=tavi]Right. Let's do this~.[/say]")

		addButton("Continue", "See what happens next", "tavi_calls_syndi")
	if(state == "tavi_calls_syndi"):
		playAnimation(StageScene.Duo, "holdpistol", {npc="tavi", npcBodyState={naked=true}})
		saynn("After that kiss, Tavi takes a spot behind the captain's desk and opens his laptop. She uses his token to login and establish an encrypted call..")

		saynn("Almost instantly, there is an unknown voice coming from the laptop's speakers.")

		saynn("[sayMale]Who is this?[/sayMale]")

		saynn("[say=tavi]Do you pick me?[/say]")

		saynn("Some time passes.. With nothing being said. The silence is deafening.")

		saynn("[sayMale]Yes I do. I will ask again. Who is this?[/sayMale]")

		saynn("Tavi looks at you.. and smiles.")

		saynn("[say=tavi]Listen. We need your help. We're inmates in a space station prison. Most.. All of us are from Syndicate. The captain is dead. But we need to get out of here before AlphaCorp gets here.[/say]")

		saynn("From Syndicate?.. You raise a brow but Tavi shows you a 'tshh-h' sign.")

		saynn("[sayMale]Huh. We will trust it when we see it. Send the coords.[/sayMale]")

		saynn("Tavi quickly punches away at the laptop's keyboard.. quickly looking up the coordinates.")

		saynn("[say=tavi]It's important not to destroy the station or its staff. Do you understand? Everyone needs to be saved. People who don't cooperate should be captured instead.[/say]")

		saynn("[sayMale]Now you listen. Either you send the coords or get the fuck off the frequency.[/sayMale]")

		saynn("His words.. are not very inspiring. But you don't have much choice anyway. So Tavi carefully tells each number of the space station's coordinates one by one through the world's most expensive telephone.")

		saynn("[sayMale]That's it? Good.[/sayMale]")

		saynn("And that's when the call abruptly ends.")

		saynn("[say=pc]Are you sure about this, Tavi? They kinda sounded like they weren't gonna save us.[/say]")

		saynn("[say=tavi]They probably won't. They will probably destroy the station.[/say]")

		saynn("[say=pc]But.. Then we are screwed?[/say]")

		saynn("[say=tavi]I have an idea~.[/say]")

		saynn("A little.. object.. grabs your attention. You watch through the window.. and see something moving. Yes, there are moving asteroids there.. But this is something different.. Way smaller.. It's a spaceship. It stops when it notices your space station glued to one of the rocks.. and then suddenly warps away.. creating some kind of blue rift before flying through it. Was that.. a recon ship?")

		saynn("[say=pc]Tavi, they must have confirmed the location.[/say]")

		saynn("[say=tavi]Good~[/say]")

		saynn("Tavi starts another call and suddenly starts speaking with a very concerned tone.")

		saynn("[say=tavi]HEY. I don't have much time! Station's location got compromised! I repeat, Syndicate knows about BDCC![/say]")

		saynn("A sleepy voice answers.")

		saynn("[sayMale]..huh? What?.. Who are you? Where is Captain Wright?[/sayMale]")

		saynn("Tavi starts pretty much screaming into the laptop.")

		saynn("[say=tavi]Wake the fuck up, stupid. Station is under Syndicate's attack. We need a whole fleet here, fast![/say]")

		saynn("[sayMale]But.. I need confirmation. At least from the captain. State your name and rank.[/sayMale]")

		saynn("Suddenly.. more blue rifts open in space.. bigger ones. And then.. Various spaceships of red color begin warping through them.. a lot of ships.. including one that is so huge it immediately collides with one of the asteroids, easily smashing through it, creating a chain reaction that causes other asteroids to bounce off each other.")

		saynn("[say=pc]They're here..[/say]")

		saynn("The big ship aims its giant laser at the station.. And starts charging it..")

		saynn("[say=tavi]You are as dumb as I thought. Send a fleet now![/say]")

		saynn("The giant ship fires its laser canon as soon as it can.. But one of the random flying asteroids saves you, taking the hit and melting into a million little rocks that start hitting the station like an ice hail.")

		saynn("Almost immediately, a loud siren activates throughout the whole station and all the lighting becomes red. Everything is shaking..")

		saynn("[sayOther]WARNING. WARNING. THE STATION'S HULL IS RECEIVING DAMAGE. ENGINEERING STAFF MUST PREVENT DEPRESSURIZATION AT ALL COSTS.[/sayOther]")

		saynn("[say=tavi]Is that enough of a confirmation, fucker?[/say]")

		saynn("[sayMale]We're sending what we can. Sit tight.[/sayMale]")

		saynn("Tavi ends the call and looks at you. She looks dead serious. Suddenly, more of these rifts open.. but this time it's the AlphaCorp ships joining in on the fun. Almost instantly, a giant battle begins in the void. It distracts the big ship from targeting the station.. but for how long..")

		saynn("[say=tavi]They will start boarding us soon. We will only have one shot at this. We must steal one of their ships.[/say]")

		saynn("Sounds like you will need a weapon.. So you grab the captain's energy gun. Looks like it's set to lethal mode already. Good.")

		saynn("Many explosions happen outside the station.. explosions that you don't hear. But there are also the ones that you do.. they shake the floor hard. You can already hear the fighting happening throughout the whole station.")

		addButton("Follow", "Follow Tavi", "syndi_appears")
	if(state == "syndi_appears"):
		playAnimation(StageScene.Duo, "holdpistol", {npc="syndiMale", further=true, npcAction=["holdpistol", "res://Inventory/UnriggedModels/EnergyPistol/EnergyPistolRed.tscn"]})
		aimCameraAndSetLocName("cd_last_intersection")
		saynn("As you and Tavi step out of the captain's office.. You hear a weird crackling noise.. before a rift opens right in the middle of the corridor, blocking your path and absolutely destroying the carpet underneath.")

		saynn("Seconds later, someone walks through it.. Someone very armored. Tavi whispers to you.")

		saynn("[say=tavi]That's our chance..[/say]")

		saynn("Oh. As he turns around, you see his helmet illuminating the corridor with green lighting coming from its visor. When he spots you and Tavi, he immediately reaches for his blaster..")

		addButton("Shoot", "Shoot to kill", "pc_kills")
	if(state == "pc_kills"):
		playAnimation(StageScene.Solo, "firepistol")
		saynn("Swiftly, you aim your energy gun and instinctively pull the trigger.. A bright flash.. followed by a painful scream.. and an armored body hitting the floor.")

		saynn("Looks like you just took a life. It had to happen at some point, didn't it..")

		saynn("Tavi runs up to the fallen Syndicate agent.. and grabs his gun before making sure he is dead.. by shooting him again point-blank.")

		saynn("[say=tavi]Wait, what's this?[/say]")

		saynn("Before moving on, Tavi crouches before him and fetches something from his wrist. A watch of sorts. Its screen displays a big 'Return' button with an icon of a portal.")

		saynn("[say=tavi]Is it what I think it is?[/say]")

		saynn("[say=pc]It must be how they are boarding us.[/say]")

		saynn("More explosions happen all around you. Screams.. gunfire.. You know that nothing good is happening in the cellblock. But you don't really care either. There are bigger problems..")

		saynn("Soon, another one of those rifts opens.. followed by a full squad of armored Syndicate agents jumping out of it.")

		saynn("They immediately start shooting at you, causing you and Tavi to hide behind one of the pillars. You stick just your hand out and pull the trigger a few times.. Until you hear some collapsing far away. Your kill counter is rising a little too fast for your liking..")

		saynn("[say=pc]We won't be able to kill a whole army.[/say]")

		saynn("[say=tavi]Then.. Let's try to escape.[/say]")

		saynn("Tavi presses the button on the Syndicate watch.. And seconds later a new bluespace rift opens right in front of you. Its positioning was a little off.. which meant it ate a huge chunk of the pillar that you were hiding behind.. leaving you with no cover.")

		saynn("[say=tavi]JUMP![/say]")

		saynn("Tavi jumps into the rift first.. Disappearing in it..")

		saynn("Lasers are flying all around you.. Either it's a certain death.. or a not so certain one..")

		addButton("Rift", "Jump into it", "jump_into_syndicate_ship")
	if(state == "jump_into_syndicate_ship"):
		aimCameraAndSetLocName("cd_syndiship")
		playAnimation(StageScene.Duo, "firepistol", {npc="syndiFemale", npcAction="defeat"})
		saynn("You jump through the rift a second before it closes.. ending up somewhere else..")

		saynn("Red colors everywhere.. A distinct S symbol.. Yeah, it's a Syndicate ship. You and Tavi seem to be in some kind of teleporter room. In the middle of it is a rift generator attached to a computer.")

		saynn("[say=tavi]Wow. Makes sense. The watch can't teleport on its own. It just talks with this huge ass machine.[/say]")

		saynn("You must have been heard because seconds later two Syndicate agents walk in from another compartment. They certainly didn't expect to see you..")

		saynn("Tavi kills one.. And you snipe the other.. adding another kill to your collection.")

		saynn("[say=tavi]Let's see what kind of ship this is.[/say]")

		saynn("You got so used to the same prison interiors.. That this looks genuinely exciting..")

		addButton("Cockpit", "Explore the ship", "cockpick_tavi")
	if(state == "cockpick_tavi"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="sit", npcBodyState={naked=true}})
		saynn("The ship seems to be some kind of.. troops transporter. There are only 3 main rooms. A teleporter, a cockpit and a room with benches and empty shelves for equipment.")

		saynn("You two enter the cockpit and.. wow.. you see the damaged space station with two giant fleets fighting around it. Syndicate ships are trying their best to destroy it while AlphaCorp ones are protecting it. You can't hear a single explosion through the vacuum of space.. But the view is truly incredible.")

		saynn("[say=tavi]We got them riled up, huh? Serves them right.[/say]")

		saynn("Tavi sits in the pilot's seat and starts inspecting the controls.")

		saynn("[say=pc]Think you can fly it?[/say]")

		saynn("[say=tavi]I will have to. Not the first time for me at least.[/say]")

		saynn("She starts pressing random buttons and interacting with switches. All the while you observe the surroundings, hoping that the big ships won't take notice of your small one.")

		saynn("When Tavi presses a button.. the ship's engines finally engage.. Allowing Tavi to start moving the ship.")

		saynn("[say=tavi]Now let's get the fuck out of here.[/say]")

		saynn("You're so close.. You can feel it. Tavi starts the process of warping..")

		saynn("[say=tavi]Fuck, the rift generator needs to charge. The big one.[/say]")

		saynn("Of course it does.")

		saynn("[say=pc]How long?[/say]")

		saynn("[say=tavi]About two minutes.[/say]")

		saynn("[say=pc]We should be fine.[/say]")

		saynn("The ship hums as it slowly routes all its energy to the rift generator.")

		saynn("At the same time.. You begin to notice something. Syndicate's main ship.. A giant battle cruiser one.. Starts to charge its big cannon again.. aiming it at the station.")

		saynn("[say=pc]You see that?[/say]")

		saynn("[say=tavi]I do. And I don't care. Everyone on that station might as well die..[/say]")

		saynn("[say=pc]Are you.. sure? There are some good people there.[/say]")

		saynn("You two silently watch as the big ship prepares to fire. AlphaCorp's chances aren't looking too good in this battle.. They're clearly losing it, their ships get destroyed left and right.")

		saynn("The ship's hum becomes louder and louder.. Less than a minute left before you can escape this hell..")

		saynn("Tavi growls.. and then sighs.")

		saynn("[say=tavi]Fine.. I already destroyed enough space stations for one life.. But how are we gonna save it?[/say]")

		saynn("Gotta think quick.. You look around.. This ship doesn't have any weapons on it.. But it does have two rift generators..")

		saynn("[say=pc]What if we.. Ram it.. At the right time.[/say]")

		saynn("[say=tavi]..and die? I'm not ready to be a hero.[/say]")

		saynn("[say=pc]We don't have to be ones..[/say]")

		saynn("Tavi raises a brow.. and then smiles.")

		saynn("[say=tavi]Sounds crazy enough. Let's fucking do this.[/say]")

		saynn("Tavi grabs the ship's controls.. and starts flying it directly into the main Syndicate battleship. All the while the rift generator is still charging..")

		addButton("Teleporter", "Go back to the teleporter room", "back_to_teleporter")
	if(state == "back_to_teleporter"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcBodyState={naked=true}})
		saynn("You rush back to the room with the teleporter. Tavi starts hacking away at the computer that is connected to the big machine.")

		saynn("[say=tavi]But I'm not returning back to the station. Fuck that.[/say]")

		saynn("The ship's autopilot starts beeping angrily from another compartment. Twenty seconds before the collision..")

		saynn("[say=pc]We don't really have time to choose.[/say]")

		saynn("[say=tavi]Giving up on your dreams already~?[/say]")

		saynn("She masterfully navigates through all the menus.. copying a bluespace frequency of some other Syndicate ship nearby.. before plugging it in as coordinates..")

		saynn("[say=pc]Are you sure that will work?[/say]")

		saynn("[say=tavi]Frequency is the position in bluespace.. I think.. I hope.[/say]")

		saynn("Ten.. Nine.. Eight.. Seven.. Six..")

		saynn("[say=tavi]Be ready.[/say]")

		saynn("[say=pc]Yes, I don't care.[/say]")

		addButton("Rift", "See what's behind", "tp_to_other_ship")
	if(state == "tp_to_other_ship"):
		playAnimation(StageScene.Duo, "firepistol", {npc="syndiMale", npcAction="defeat"})
		saynn("As soon as the small teleporter opens a rift in bluespace.. you instantly jump inside.. And instantly shoot everyone that you see, effortlessly taking the lives of three unsuspecting agents.")

		saynn("Tavi joins you seconds after.")

		saynn("[say=tavi]Wow.[/say]")

		saynn("At least you're not in the cold space. You can breathe. This ship looks similar to the last one, also having its own teleporter.")

		addButton("Continue", "See what happens next", "big_boom")
	if(state == "big_boom"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcBodyState={naked=true}})
		saynn("You rush into this ship's cockpit.. And see your old ship smashing into the armor of the big Syndicate battleship, barely leaving a dent in it.")

		saynn("[say=tavi]Uh..[/say]")

		saynn("And then, a second later, a huge bluespace rift suddenly spawns right in the middle of it, tearing the frame in half..")

		saynn("[say=tavi]Oh there we go.[/say]")

		saynn("A giant blue explosion covers the whole battleship.. destroying it instantly.. It's like a new sun was born for a few seconds.. illuminating the whole battlefield.. including the bathered space station.. that got caught in between all of this crazy fighting.. but is still somehow in one piece.")

		saynn("And then.. some time later.. the rift closes, taking a big part of the ship with it.. leaving empty space where there used to be metal.")

		saynn("[say=tavi]Fuck me.. Did we do that?[/say]")

		saynn("[say=pc]I think we did..[/say]")

		saynn("You look at each other.. Tavi's gaze is glued to your lips.. She is so horny.. in more ways than one. But then something attacks your ship, rocking it.")

		saynn("[say=tavi]Right.. We gotta get out of here.[/say]")

		saynn("Tavi sits into the pilot's seat again and starts flying the Syndicate ship away, maneuvering it between all the asteroids. Some AlphaCorp ships try to chase you down.. but after charging the bluespace teleporter, you just fly through a rift that takes you to some random point in space..")

		addButton("Continue", "See what happens next", "finally_freedom")
	if(state == "finally_freedom"):
		playAnimation(StageScene.Hug, "kiss", {npc="tavi", npcBodyState={naked=true}})
		saynn("You look through the cockpit's glass.. at the empty space. Around you is.. nothing. No rocks.. No space stations.. No other ships.. Just vast empty space.")

		saynn("[say=tavi]We're free. Hah..[/say]")

		saynn("You both just realize how much you've been panting. The sounds of your hearts beating were hidden behind some kind of white noise.. But now there is nothing.. Freedom..")

		saynn("[say=pc]That was.. crazy.[/say]")

		saynn("[say=tavi]Was it~? I'd do that again if I could.[/say]")

		saynn("You roll your eyes. Tavi hugs you and kisses you on the lips. She is still completely naked.. allowing you to feel her hard nips poking your chest.")

		saynn("[say=pc]You're excited, I can feel that.[/say]")

		saynn("[say=tavi]Let's fuck~. Right the fuck now~.[/say]")

		saynn("And so.. You two start fucking right on that pilot chair.")

		saynn("You're finally free.. Free to turn your dreams into reality.")

		saynn("[b]THE END.[/b]")

		saynn("[b]Violent Escape Ending.[/b]")

		tookRahi = getFlag("RahiModule.rahiMile8Happened")
		if (tookRahi):
			addButton("Continue..", "See what happens to everyone..", "find_rahi")
		else:
			addButton("Continue..", "See what happens to everyone..", "start_epilogues")
	if(state == "find_rahi"):
		playAnimation(StageScene.Solo, "holdpistol")
		saynn("After a passionate fuck, you finally start flying somewhere. Tavi is behind the controls.. while you get to watch.")

		saynn("Suddenly you hear a noise in the teleporter room.. Yes, the same noise of a rift opening.")

		saynn("[say=tavi]Fuck, did they track us already?[/say]")

		saynn("[say=pc]I will go check it out.[/say]")

		saynn("You hold the energy gun and start carefully stepping towards the teleporter room.. You look from behind the corner.. And see nothing. Just the old dead bodies of the Syndicate agents that you are yet to dispose of.")

		saynn("Still, you stay cautious as you start searching the room for anything unusual.. until something fluffy tickles your foot as you walk past one of the benches!")

		addButton("Aim!", "Whatever it is.. take aim", "actual_rahi")
	if(state == "actual_rahi"):
		addCharacter("rahi")
		playAnimation(StageScene.Duo, "stand", {npc="rahi"})
		saynn("You aim at the bench.. and see a brown fluffy tail sticking from underneath it. For some reason that tail feels very familiar.")

		saynn("[say=pc]Kitty? Is that you?[/say]")

		saynn("The tail instantly starts shaking.")

		saynn("[say=rahi]D-don't kill me.. please..[/say]")

		saynn("[say=pc]It's me, kitty. Get out of there. I won't hurt you.[/say]")

		var rahiChildAmount = GM.CS.getChildrenAmountOf("rahi")
		if (rahiChildAmount > 1):
			saynn("You help Rahi get from under the bench. She is still wearing her inmate uniform and a collar around her neck. But.. you also notice her holding all her kittens and other cubs in her paws.. Yes, all "+str(rahiChildAmount)+" of them.. All of them are with her.. Somehow..")

		elif (rahiChildAmount == 1):
			saynn("You help Rahi get from under the bench. She is still wearing her inmate uniform and a collar around her neck. But.. you also notice her protecting her only cub in her paws..")

		else:
			saynn("You help Rahi get from under the bench. She is still wearing her inmate uniform and a collar around her neck.")

		saynn("[say=pc]How did you..[/say]")

		saynn("[say=rahi]I found a watch..[/say]")

		saynn("Rahi shows you her wrist that has the Syndicate watch on it. Same one that you and Tavi used.")

		saynn("[say=pc]Wow. What are the chances?[/say]")

		saynn("[say=rahi]I found a few.. And was peeking just my head in.. Until I found a room with no bad people in it.. No alive bad people..[/say]")

		saynn("Smart approach. Rahi hugs you.. tightly.. just when Tavi walks in.")

		saynn("[say=tavi]Aw. Adorable.[/say]")

		saynn("The brown kitty blushes deeply when she sees a naked horny feline.")

		saynn("[say=rahi]Uh..[/say]")

		saynn("[say=tavi]It's okay, I only bite bad kitties~.[/say]")

		saynn("Rahi nods softly.")

		saynn("[say=rahi]Where are we anyway..[/say]")

		saynn("Tavi puts on a cunning smile. A smile that tells Rahi that she will stay with them no matter what.")

		addButton("Continue..", "See what happens to everyone else..", "start_epilogues")
	if(state == "start_epilogues"):
		playAnimation(StageScene.Solo, "stand")
		saynn("And so.. the "+str("three" if tookRahi else "two")+" brave inmates found a way to escape from one of the most secure prisons in the entire galaxy.. while doing so with incredible style.")

		saynn("Captain Wright, driven by his selfish goals, thought he could keep a tight leash on everyone around him. But, turns out, he wasn't ready when that leash suddenly began wrapping around his neck and choking him.")

		saynn("His creation, BDCC, managed to survive through one of the biggest fleet fights between AlphaCorp and Syndicate. It was close.. Too close.. But the balance of power tipped to the right side when Syndicate's biggest battleship got miraculously destroyed by an unknown force.")

		saynn("The prison survived the battle.. but the captain's office wasn't so lucky. His laptop was never recovered.. His body.. never found. His lies.. never uncovered. Only two people in the world know his current status. For everyone else.. Captain Wright is Missing In Action.. Stuck between being a brave hero who saved his station by sacrificing his own life and a biggest villain who sold the location of his station to Syndicate before promptly escaping with the credits.. both sides blissfully unaware that none of them are right..")

		saynn("BDCC had to be closed down because its position was compromised. Broken Dreams Correctional Center became no more. All of the inmates and surviving staff got moved to other prisons.. Prisons that don't try to cultivate the next best spies for its captains by letting inmates and staff breed each other. Normal.. prisons.. Boring ones where staff have all the power by default.")

		addButton("Nova", "See what happens to Nova", "ep_nova")
	if(state == "ep_nova"):
		playAnimation(StageScene.Solo, "stand", {pc="nova"})
		saynn("Nova managed to get through Syndicate's attack mostly unscarred. Her contraband armor set was probably the only one on the whole station that was able to withstand shots from energy weapons.")

		saynn("She didn't try to be a hero and just defended the medical wing with a few other guards, allowing it to function even when the rest of the prison was already captured by the Syndicate.")

		saynn("And so, for that, Nova got awarded with AlphaCorp's badge of honor, one of the highest awards that a soldier can receive. Nova didn't really care about some fancy pin.. but the hefty sum of credits that came with it certainly did.")

		saynn("Now that the captain is gone.. Nova's secrets are gonna stay secrets. She can finally move on and do something else with her life.")

		saynn("And so she bought a personal space biodome in one of the popular galaxies and created her own little farm called Dawfort Creamery.. A perfect little oasis.. One that you and Tavi would certainly visit from time to time.")

		addButton("Risha", "See what happens to Risha", "ep_risha")
	if(state == "ep_risha"):
		playAnimation(StageScene.Solo, "stand", {pc="risha", bodyState={naked=true, hard=true, chains=[["normal", "neck", "scene", "farleft"]]}})
		saynn("Seeing a challenge before her.. Risha happily accepted it and charged into battle.")

		saynn("Armed with only her riot gear and a stun baton, she managed to bring a whole squad of Syndicate agents down.. but eventually she got wounded and captured. Syndicate took her as a prisoner of war with intent to exchange her for one of its people sometime in the future. But.. AlphaCorp wasn't that eager to do that.")

		saynn("And so Risha remains in the hands of the Syndicate for now.. enslaved by them.. serving as an unwilling sextoy.")

		saynn("But even in such a dare situation, there is always some.. wiggle room. Eventually, Risha got more and more trust from the Syndicate.. Slowly, she kept climbing the ranks.. rising from her breeding bitch position up to.. a breeding stud.")

		saynn("Even after all that, Risha managed to find her place in the world. She was happy. She was still getting fucked and abused occasionally. But that was just making the moments when she gets to have fun that much more enjoyable.")

		addButton("Skar", "See what happened to Skar..", "ep_skar")
	if(state == "ep_skar"):
		playAnimation(StageScene.Solo, "stand", {pc="skar"})
		saynn("Skar got heavily wounded during the attack.. And even then, he kept fighting until AlphaCorp troops finally arrived. Because of him, way more inmates and staff have survived this attack.")

		saynn("His wounds led to even more of his body parts and internal organs replaced with prosthetics. By this point.. he became more of a machine rather than a person.")

		saynn("After BDCC stopped existing.. Skar had a choice. Quitting all of this and returning to a peaceful life.. Or staying a guard. Either way.. he didn't really fit anywhere. People call him a hero.. But how can a hero live a peaceful life? How can a hero be a pacifist?")

		saynn("And so he chose to return back to the frontlines. And do what he does best.. follow orders, no matter how suicidal they might be. Did he enjoy violence? Nah, the guy was sick of it. But you can't stop the wars.. if you don't fight them. And AlphaCorp was happy to supply him with an endless supply of wars.")

		addButton("Alex Rynard", "See what happens with him", "ep_alex")
	if(state == "ep_alex"):
		playAnimation(StageScene.Solo, "stand", {pc="alexrynard"})
		saynn("In the heat of the battle, Alex manages to get to and repair Sentinel-X.. his most powerful creation. And that is what saved the core of the station from getting destroyed by Syndicate. After that Alex guided other engineers to repair the hull of the station while he himself masterfully controlled its vents systems to make sure the surviving staff and inmates had at least something to breathe.")

		saynn("He never really trusted people. He much prefers machines for their lack of ability to lie. But during these critical moments, he had to work as a team. And he was good at it..")

		saynn("Sadly, being a team leader means you don't really get much credit for your deeds. Seeing the monetary rewards that come with it, others lied about their contribution to this win.. And so Alex gave up trying to convince anyone and closed up completely.")

		saynn("Yeah, he still tinkered with androids from time to time. But he could never convince AlphaCorp to restart all of his canceled projects. And without resources.. The best he could do is tinker.")

		saynn("He was trying to create a perfect reality.. but only found himself becoming more broken..")

		addButton("Eliza", "See what happens to Eliza", "ep_eliza")
	if(state == "ep_eliza"):
		playAnimation(StageScene.Solo, "stand", {pc="eliza"})
		saynn("To say the least, the medical wing was a busy place during the attack.. There were a lot more wounded than there were hands to help them. Eliza had to prioritize.. picking certain lives over others.")

		saynn("She felt awful. Not because of all the death and suffering.. but because she knew that she could have been more useful.. Eliza did some much science work.. And now, when the situation was testing her, there was nothing she could do.. other than bandaging and injecting people with simple painkillers.")

		saynn("Her bloody paws were shaking by the end of it.. and that shiver never quite went away. She felt like she failed.. failed at what she set out to do in the first place. And so, after BDCC collapsed, she returned back to her mother's lab.. and became an obedient harmless daughter that her mother always wanted her to be.")

		if (tookRahi):
			addButton("Rahi", "See what happened with Rahi", "ep_rahi")
		else:
			addButton("Jaxon", "See what happened with Jaxon", "ep_jaxon")
	if(state == "ep_rahi"):
		playAnimation(StageScene.Duo, ["holdpistol", "res://Inventory/UnriggedModels/Pistol/Pistol.tscn"], {pc="rahi", npc="rahiRabi"})
		saynn("Just as you agreed upon, you and Rahi paid her home planet, Ahdomai, a visit. To tie up some loose ends..")

		saynn("Finding her brother wasn't too hard. Pretty much every junkie in the world knew him.")

		saynn("It's snowing.. just like that day. Rahi breathes in the cold air.. and slowly exhales. You and Tavi managed to remove the collar from her neck.. but a phantom one is still making her rub her fur occasionally..")

		saynn("As her brother turns around the corner, Rahi aims a gun at him.")

		saynn("[say=rahi]Missed me, little brother?[/say]")

		saynn("His eyes go big. He tries back away.. but that's when he walks into your chest.. You yoink a gun that he has behind his belt and then shove him back.")

		saynn("[say=rahiRabi]Rahi? I thought you..[/say]")

		saynn("[say=rahi]Went away for good? Nah. You got me into a whole lotta trouble. But I pulled through. No thanks to you.[/say]")

		saynn("[say=rahiRabi]Listen.. You share part of the blame too for what happened. But we can fix everything.[/say]")

		saynn("As Rahi starts slowly stepping towards her brother, Rabi starts reaching for his gun.. the gun that's not there.")

		saynn("[say=rahi]And how are you planning to do that.. my little brother..[/say]")

		saynn("As Rahi cocks her revolver, Rabi suddenly drops to his knees and raises his paws.")

		saynn("[say=rahiRabi]W-we.. l-listen.. j-just.. don't d-do it..[/say]")

		saynn("Rahi walks up to Rabi real close.. and then puts a gun up against his head..")

		saynn("[say=rahi]You can start with simple things. Use your words~.[/say]")

		saynn("He goes through his pockets.. and finds a credit chip. He presents it to Rahi.")

		saynn("[say=rahiRabi]T-this.. fifty key creds.. fifty thousand.. Five times more than we failed to rob.. Is that gonna be e-enough?[/say]")

		saynn("Rahi shows her fangs.. and then grabs Rabi by his clothes.. She leans down closer and closer.. keeping an eye contact.. Her paw squeezing that revolver real tight, pulling attention from what the other one is doing..")

		saynn("Rabi starts sobbing.")

		saynn("[say=rahi]You know.. I was just looking for a simple.. sorry.[/say]")

		saynn("[say=rahiRabi]Y-yes! I'm sorry! I really am. I'm sorry that it happened.[/say]")

		saynn("Rahi's expression softens. She pulls the gun away from her brother's head..")

		saynn("[say=rahi]Thanks. Keep these creds to yourself. So much death is attached to them. I don't need blood money.[/say]")

		saynn("Rabi nods many times.")

		saynn("[say=rahiRabi]Okay.. okay.. Sorry..[/say]")

		saynn("[say=rahi]Take care, brother~.[/say]")

		saynn("Rahi smiles and stands up before walking past him and towards you.")

		saynn("[say=rahiRabi]..fucking bitch..[/say]")

		saynn("Rahi stops and looks at you.")

		saynn("[say=rahi]Hm.. Give him his gun back. We don't need it either.[/say]")

		saynn("[say=pc]Are you sure?[/say]")

		saynn("Rahi nods. And so walk up to Rabi and toss his gun back to him.")

		saynn("[say=rahiRabi]You're not as pure as you think, sister..[/say]")

		saynn("Rabi waits for you to start leaving again.. then he slowly gets up.. and aims the weapon at Rahi's back.")

		addButton("Continue", "See what happens next", "rahi_kills_rabi")
	if(state == "rahi_kills_rabi"):
		playAnimation(StageScene.Solo, ["firepistol", "res://Inventory/UnriggedModels/Pistol/Pistol.tscn"], {pc="rahi"})
		saynn("A gunshot.. A gasp..")

		saynn("You turn around and see Rabi holding onto his chest.. before collapsing onto the cold snow.. His dark blood creates a hot puddle around him. Rahi is still aiming her gun at him.. her paw shaking ever so slightly.")

		saynn("[say=pc]You never forgave him, did you?[/say]")

		saynn("[say=rahi]I did not.. But now it's over.[/say]")

		saynn("Rahi chuckles while watching her dead brother..")

		saynn("[say=rahi]Feels like I shot myself. My other self.[/say]")

		saynn("[say=pc]Is that.. good?[/say]")

		saynn("Rahi shrugs and finally lowers the gun.")

		saynn("[say=rahi]It's liberating..[/say]")

		saynn("You carefully embrace the feline and share some of your warmth with her. For some reason you feel her pockets being full of something..")

		saynn("[say=pc]C'mon, let's get out of here before the police show up.[/say]")

		saynn("[say=rahi]I stole all the credits that he had in his pockets.. Should I throw them out?..[/say]")

		saynn("[say=pc]Well.. What would your father say?[/say]")

		saynn("Rahi looks down at herself.")

		saynn("[say=rahi]I'm keeping them..[/say]")

		addButton("Jaxon", "See what happened with Jaxon", "ep_jaxon")
	if(state == "ep_jaxon"):
		if (!getFlag("TaviModule.TaviKilledJaxon")):
			playAnimation(StageScene.Solo, "stand", {pc="jaxontau"})
			saynn("Jaxon returned to his family.. family who was very happy to see him alive after what happened to the Exodus research space station.")

			saynn("But Jaxon wasn't happy. He kept trying to track Tavi down, seeking revenge for his brother. Or at least.. some kind of conclusion. Something.. rather than nothing..")

			saynn("After years of pointless searching.. He finally gave up.. That day is when he saw a new email in his inbox. He opened it..")

			saynn("[say=tavi]Hey. It's Tavi. I'm alive.. and doing better than ever. Yes, I killed your brother. And I know that you are looking for me. I still stand by everything that I did. Listen, I understand. Family is important and all that. But c'mon, you will never track me down.. without me wanting that. Understand what I mean? You will never get the revenge that you seek, only more pain. So yeah, if you want my suggestion.. nah, fuck you. Do whatever you want, dude, you're older than me. If you wanna talk - let's talk. I can try to explain my actions, you can try to explain to me why I am a bad person. Or.. we can just wait until we both end up in hell. Sounds good? Good. Take care.[/say]")

			saynn("Jaxon sighs.. and deletes it.")

		else:
			playAnimation(StageScene.Solo, "stand", {pc="tavi"})
			saynn("Jaxon's wife, Jill, felt destroyed when she found out what happened to him. She decided not to tell the kids and instead only carried the full grief herself.")

			saynn("She knew that it's a dangerous job.. But he convinced her.. Because of the credits that it would bring.. credits that would give their kids a chance at a good future.")

			saynn("Sadly the credits that she was now earning alone weren't enough. Years were passing.. She did her best to pay for her kids' education.. But she was in the negatives all the time.")

			saynn("Luckily, one day, she saw some random bill came in.. Bill that, for some reason, had a negative number on it. They were billed for -12345 credits. Jill thought it was some kind of error. But the credits were actually there, on her account.")

			saynn("It was enough for some things.. enough to continue the struggle. Struggle that makes all of us stronger.. right?")

		addButton("You", "What happens to you..", "ep_you")
	if(state == "ep_you"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcBodyState={naked=true}})
		saynn("You and Tavi tracked down every single person who was involved in creating her. You tracked them down.. and killed them.. all of them. Guards and other miscellaneous staff got off mostly easy.. but all the scientists shared the same fate.")

		saynn("Why? They knew exactly what they were doing. They share the blame with the director. Only makes sense for them to share the same consequences. End of story. Yeah, they cried and begged. But you know that under the right conditions, they would do it all again. For credits or for some other reason, it doesn't matter much.")

		saynn("Yeah, there will be more weapons created like Tavi. But now they will think twice before committing to it. Not because Tavi will come after them. After getting her revenge, she couldn't care less about it.. but because history tends to repeat itself.")

		saynn("And so.. after tying up all your loose ends.. you and Tavi became bounty hunters. You spy, kill, steal and blackmail people. Not because someone else orders you to.. but because it's fun. And pays well.")

		saynn("Making the world a better place? Good luck with that. Life will get worse for you the more you do something for others. While others will always want more.. they will expect more. It only makes sense to be selfish. And enjoy life while it's given to you by whatever forces.")

		if (tookRahi):
			saynn("Eventually Rahi became like you. She was always a greedy cat deep inside. And so your views aligned pretty much perfectly.")

		addButton("Continue", "See what happens next", "ep_end")
	if(state == "ep_end"):
		playAnimation(StageScene.Duo, "sit", {npc="tavi", npcBodyState={naked=true}})
		saynn("You sit on one of the uncomfortable benches, eating a slice of pizza that you bought from one of the warp-throughs that don’t care about Syndicate ships."+str(" Rahi does the same.. purring while doing so." if tookRahi else "")+" The first pizza in.. forever. All the while your ship is flying through the vast nothingness. It's.. cool.")

		saynn("Tavi looks at you and smiles. She is still naked, openly showing you her sexy body.")

		saynn("[say=tavi]What are you thinking about?[/say]")

		saynn("[say=pc]I wonder.. You said that bluespace frequency can be translated to a position in space, right?[/say]")

		saynn("[say=tavi]Maybe. Big crystals can hijack a range of frequencies while only being on one themselves. But small ones.. yeah, they map one-to-one.[/say]")

		saynn("[say=pc]Don't you remember the frequency of your old ship? The one with the backup of Elena?[/say]")

		saynn("Tavi's eyes go big. She blinks many times.")

		saynn("[say=pc]Heh. I think I know what we will do next.[/say]")

		saynn("[say=tavi]It's probably docked to one of the AlphaCorp stations.[/say]")

		saynn("[say=pc]We will need to prepare for a fight, yeah~.[/say]")

		saynn("Tavi smiles.")

		saynn("[say=pc]I think I will rest for now though.[/say]")

		saynn("She chuckles and scritches you under the chin.")

		saynn("[say=tavi]Food made you sleepy~? Sure, dream away. I will get us where we need to be.[/say]")

		saynn("You nod and continue consuming pizza. Your eyes slowly begin to close.. You lie down.."+str(" And let Rahi cuddle up to you" if tookRahi else "")+"")

		saynn("You close your eyes.. And begin dreaming.")

		saynn("- - - - - - - - - - -")

		saynn("Thank you for completing BDCC.")

		saynn("I hope you liked it <3")

		saynn("You can close the game if you want. Or you can press the button and return back to the prison.")

		addButton("Dream", "Broken dreams are still dreams. Heh.", "do_dream")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "tavi_drops_captain"):
		processTime(2*60)

	if(_action == "remove_collars"):
		processTime(3*60)
		getCharacter("tavi").getInventory().removeItemFromSlot(InventorySlot.Neck)
		GM.pc.getInventory().removeItemFromSlot(InventorySlot.Neck)

	if(_action == "tavi_calls_syndi"):
		processTime(5*60)

	if(_action == "syndi_appears"):
		processTime(3*60)

	if(_action == "cockpick_tavi"):
		processTime(5*60)

	if(_action == "back_to_teleporter"):
		processTime(2*60)

	if(_action == "finally_freedom"):
		processTime(5*60)

	if(_action == "ep_risha"):
		getCharacter("risha").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmatewristcuffs"))
		getCharacter("risha").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmateanklecuffs"))
		getCharacter("risha").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmatecollar"))
		getCharacter("risha").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("ringgag"))
		getCharacter("risha").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("blindfold"))

	if(_action == "ep_skar"):
		getCharacter("risha").resetEquipment()

	if(_action == "ep_rahi"):
		getCharacter("rahi").getInventory().clearEquippedItems()
		getCharacter("rahi").getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("LeatherJacket"))

	if(_action == "ep_jaxon"):
		getCharacter("rahi").resetEquipment()

	if(_action == "do_dream"):
		GM.main.startNewDay()
		GM.pc.afterSleepingInBed()
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmatecollar"))
		getCharacter("tavi").resetEquipment()
		GM.pc.setLocation(GM.pc.getCellLocation())
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["tookRahi"] = tookRahi

	return data

func loadData(data):
	.loadData(data)

	tookRahi = SAVE.loadVar(data, "tookRahi", false)
