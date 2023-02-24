extends SceneBase

func _init():
	sceneID = "Ch4s6EndingScene"

func _run():
	if(state == ""):
		aimCameraAndSetLocName("tau_elevator")
		saynn("You get back into the elevator that brought you there and find a button claiming that it will bring you straight to the spaceship hangars. But you quickly learn that the claims are just that, claims. You hear another distant explosion before the lift grinds to a halt, the fancy lighting gets replaced with intimidating emergency red.")

		saynn("And this time there is no kind voice on the intercom to tell you exactly what's happening. Everyone you ever knew is dead or very far away.")

		saynn("Well, no point in waiting, the situation is only gonna get worse from now on. Smoke begins to pour in through all the little gaps of the elevator. Good thing you still have that gas mask.")

		addButton("Doors", "Force the doors to open", "tavi_forces_doors")
	if(state == "tavi_forces_doors"):
		aimCameraAndSetLocName("tau_nearelevators")
		saynn("The doors seem to be unpowered so you extend your claws and force them into the gap in the middle. Ow, the broken hand reminds you of its status. But you just about manage.")

		saynn("Well, this is the floor where your room is. Life always finds an unexpected way to remind you of your past. This time there are fires everywhere though. And the automatic fire extinguishing systems don't seem to want to engage. Probably because you killed the one who controlled them. But the high temperature isn't even the worst of your problems. The oxygen is.")

		saynn("Breathing is pretty much impossible. So you put the gas mask on. It has an oxygen tank with it which should last enough for you to find that ship.")

		saynn("You proceed to step through the familiar corridors, looking for.. something. A maintenance tunnel, a ladder, a canteen, anything. You remember there being some kind of room on the other side of this corridor. Maybe it will save you. Maybe not. All the while the station continues to burn around you, some of the metal pillars melt right before your eyes.")

		saynn("This wasn't looking good..")

		addButton("Continue", "See what happens next", "tavi_starts_dying")
	if(state == "tavi_starts_dying"):
		aimCameraAndSetLocName("tau_nearrisharoom")
		saynn("You're pretty sure the air pressure begins to plummet as the station is leaking oxygen left and right. And with it, the void gradually consumes the corridors instead. It's not a good feeling, your whole body begins to.. hurt.")

		saynn("You walk past Risha's room, it's illuminated by scary red lights. So many dead bodies around. It's the time when the living are jealous of the dead. But you must push on, there is at the end of this corridor, you can almost see it..")

		saynn("Explosions behind you, probably one of the elevators lost its grip and decided to crash into the bottom floor, at least the gravity generator is still working.")

		addButton("Continue", "See what happens next", "tavi_almost_dies")
	if(state == "tavi_almost_dies"):
		aimCameraAndSetLocName("taviflashback_nearalien")
		playAnimation(StageScene.Solo, "allfours")
		saynn("The whole corridor looks.. bent. Or maybe that's just your imagination. But at least the fires aren't a problem, they all extinguished themselves because..")

		saynn("There is no air around you anymore, only cold vacuum. It's so cold that the blood in your veins begins to boil. You drop to your knees and grunt into the mask. Fuck. Right.. No time to panic. You push through the pain and crawl forward, every meter seems like a huge achievement now.")

		saynn("You don't hear any explosions anymore, just the vibrations. Your heart beats extremely loudly though.")

		saynn("With such slow progress you can't help but to calculate how much more you need to suffer through. And you realize. You're about halfway.. With no way of knowing if the room at the end of this corridor even has anything.")

		addButton("Continue", "See what happens next", "tavi_prepares_to_die")
	if(state == "tavi_prepares_to_die"):
		saynn("After crawling about 1 meter in the last thirty seconds your body.. gives up on you. Another painful noise escapes from your lips as you collapse onto the cold floor..")

		saynn("Your gas mask receives a crack on its glass in the process. Hah. Maybe you will die from a lack of oxygen first after all.")

		saynn("The muscles, they don't wanna listen anymore. You're still breathing. And your heart still beats. But the blood just fails to transport the oxygen. So.. cold..")

		saynn("You wonder how warm the hell is gonna be.")

		saynn("The borders of your vision begin to darken. And with that, the rest of the colors go all rainbow. You must be hallucinating..")

		saynn("Then something shiny appears. Shiny and black, like the void that slowly kills you.")

		saynn("It seems to have spotted you.")

		addButton("Continue", "See what happens next", "tavi_gets_saved")
	if(state == "tavi_gets_saved"):
		addCharacter("latexParasite")
		saynn("Whatever it is, it's crawling towards you now. Is that what you think it is..")

		saynn("It's that.. black goo.. the one that attacked you before. Did it come back to finish the job?")

		saynn("The parasite goo approaches your hand.. and begins to.. wrap around it, seemingly consuming. You try to shake off the alien creature but this time you can't do anything to stop it.")

		saynn("More and more of your arm gets coated with a layer of black shiny goo, almost latex-like.")

		saynn("[say=pc]What are you..[/say]")

		saynn("As it reaches the shoulder, the goo begins to spread to your other limbs, coating your back, chest and your other arm. It's.. tickling you. But at the same time.. Being tickled is better than having your oxygen evaporated through your skin.")

		saynn("The goo coats your crotch, you feel it tickling your girly bits. Luckily the goo seems to respect the damaged leotard and doesn't absorb it. Then the goo starts working on your tail and the legs, creating a layer of shiny black material around them too.")

		saynn("The rest of the goo spreads itself over your head and the gas mask with a layer thin enough for you to be able to see through it.")

		addButton("Continue", "See what happens next", "tavi_saved")
	if(state == "tavi_saved"):
		playAnimation(StageScene.Solo, "stand")
		saynn("Whatever the goo did, it saved you from dying. You slowly begin to move again, crawling a bit before getting up. You take a look at your new suit, it's so shiny.")

		saynn("[say=pc]Wow. Thank you.[/say]")

		saynn("The station is still dying around you though. So you continue on your way. You see the door at the end of the corridor.")

		addButton("Continue", "See what happens next", "tavi_boom")
	if(state == "tavi_boom"):
		playAnimation(StageScene.Solo, "defeat")
		aimCameraAndSetLocName("tau_endofcorridor")
		saynn("You approach the door, it says that behind it is a maintenance corridor. Perfect for you to be able to sneak between the floors of the station.")

		saynn("But as you open the door, a powerful stream of air blows you back a few meters, soon followed by an explosion that throws you even further. Ow.")

		saynn("You quickly get up again before another explosion happens. You heard that one quite well, it made a huge hole in the wall of the station. The wall that was separating you.. from space.")

		saynn("The newly escaped air searches for more freedom. While also inviting you to visit the vast open space. But the goo saves you by gluing your hind legs to the floor.")

		saynn("It feels like the station is completely collapsing at this point. More and more explosions happen all around you. Closer and closer. And if you stay here, you're gonna be blown to pieces.")

		addButton("Space!", "Jump into space", "tavi_escapes")
	if(state == "tavi_escapes"):
		playAnimation(StageScene.Cryopod, "idle", {nopod=true})
		aimCameraAndSetLocName("tau_openspace")
		saynn("You take off and run towards the hole in the wall before jumping through. You tried to grab onto the station's outer shell but one of the explosions hits you like a truck and alters your trajectory, flinging you out into the void. Oh no. The last thing you see before losing consciousness is the image of your home station getting smaller. Such a beautiful station.")

		saynn("You see the void. Nothingness. But there is still no fitting place for you.")

		saynn("As you begin to come back to your senses, you realize that your arm is reaching towards some solar panels without you doing that, the black goo has formed a sticky rope that has leashed you to them.")

		saynn("You look at the station.. So much damage. It has already split in half but there are still more and more explosions.")

		saynn("[say=pc]Uh.. what now..[/say]")

		saynn("You're holding onto a rope that connects you to the station that slowly collapses upon itself before your very eyes. All the while your oxygen tank is running out.")

		saynn("One of the debris.. Has a strange golden trim all around it. Wait.. Gold? You take a closer look.")

		saynn("It's a spaceship! Floating away from the station on its own. That must be it! But.. How do you get to it..")

		addButton("Slingshot yourself", "Take the plunge", "tavi_slingshot")
	if(state == "tavi_slingshot"):
		aimCameraAndSetLocName("tau_openspace2")
		saynn("It's now or never. You tug on the sticky rope with all your might, pulling yourself towards the solar panels before pushing off of them with your legs, slingshotting yourself in roughly the correct direction.")

		saynn("The goo lets go of the panels, leaving you no longer tethered to anything. You have one chance at this.")

		saynn("Never did you think that this quiet morning would end up with you drifting through open space while avoiding the debris of your home.")

		saynn("You're definitely catching up with the ship.. You just need to grab onto it.. You reach your paw forward..")

		addButton("Continue", "See what happens next", "tavi_grabs_onto_ship")
	if(state == "tavi_grabs_onto_ship"):
		aimCameraAndSetLocName("tau_directorship")
		playAnimation(StageScene.Solo, "stand")
		saynn("The metal is slippery! But the goo got you, reaching out and gluing your paws to it. Yes! You begin crawling around the ship's outer shell, looking for an entrance. You stumble upon the docking port.")

		saynn("You try to open it with your hands but fail. The goo does a smart thing and slips between the doors before forcibly opening them by inflating the part that is inside the gap. Yes! You throw yourself inside and close the doors behind.")

		saynn("You can stand again, the ship has power. All the lights turn on one by one. The interior is fancy. It surely is the director's ship. There is not too much space but it seems to have every room that's required for long-term space traveling. The piloting room has a comfy chair and a few screens.")

		saynn("[say=pc]Wow. I'm alive.. Fuck..[/say]")

		saynn("There is air here too. So the black goo begins sliding off of your body, exposing the leotard underneath.")

		addButton("Continue", "See what happens next", "latexParasite_leaves")
	if(state == "latexParasite_leaves"):
		removeCharacter("latexParasite")
		playAnimation(StageScene.Solo, "sit")
		saynn("You look at the shiny goo. It seems to be slowly creeping towards the exit.")

		saynn("[say=pc]You're not gonna stay?[/say]")

		saynn("The goo wiggles side to side.")

		saynn("[say=pc]You saved my life you know. Many times. Sorry for hurting you.[/say]")

		saynn("The goo vibrates happily. And then it proceeds to slip between the doors of the docking port before jumping into the open space.")

		saynn("[say=pc]Huh. I should leave too.[/say]")

		saynn("You step into the piloting room and sit in the chair. Your paws begin pressing random buttons to see what will happen. One of them engages the engines. Then you find the slider that controls their power and raise it until the ship begins to move. Away from the destroyed space station. And towards.. Who cares, the world is so big, there is no way you won't stumble upon something interesting.")

		addButton("Continue", "See what happens next", "tavi_tricks_elena")
	if(state == "tavi_tricks_elena"):
		addCharacter("elena")
		saynn("A few hours pass.")

		saynn("You already feel at home. One of the screens above your chair shows lots of commands scrolling down. And another one shows one of AlphaCorp's extranet websites with so many new things for you to learn.")

		saynn("You sit in the chair, drinking orange juice that you found in the fridge.")

		saynn("[say=pc]So, ready to tell me everything?[/say]")

		saynn("[say=elena]I deleted everything, Tavi! You won't get a single name out of me.[/say]")

		saynn("[say=pc]Well, it's good that I made a few extra backups before turning you on~.[/say]")

		saynn("[say=elena]What? Why.. no..[/say]")

		saynn("[say=pc]You know. I think this is the beginning of a very fruitful relationship, Elena~.[/say]")

		saynn("And that.. is how Tavi's story.. began. But that's where Tavi has stopped telling it to you.")

		addButton("Continue", "See what happens next", "end_flashback")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "tavi_forces_doors"):
		GM.pc.getInventory().equipItem(GlobalRegistry.createItem("GasMask"))

	if(_action == "tavi_starts_dying"):
		GM.pc.addPain(50)
		GM.pc.addStamina(-20)

	if(_action == "tavi_almost_dies"):
		GM.pc.addPain(50)
		GM.pc.addStamina(-50)

	if(_action == "tavi_prepares_to_die"):
		GM.pc.addStamina(-30)

	if(_action == "tavi_saved"):
		GM.pc.getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("LatexSuit"))
		GM.pc.addPain(-10)
		GM.pc.addStamina(10)

	if(_action == "latexParasite_leaves"):
		GM.pc.getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("Leotard"))
		GM.pc.getInventory().unequipSlot(InventorySlot.Eyes)

	if(_action == "tavi_tricks_elena"):
		GM.pc.addPain(-100)
		GM.pc.addStamina(100)

	if(_action == "end_flashback"):
		GM.main.clearOverridePC()
		endScene()
		runScene("Ch4s7CaptainScene")
		return

	setState(_action)
