extends SceneBase

func _init():
	sceneID = "Ch3s4TransmitterScene"

func _run():
	if(state == ""):
		addCharacter("tavi")
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("You return back to Tavi, she seems to have everything under control still. Both engineers are conscious but also have their mouths taped shut. Tavi's foot is pressed into one of their backs. That engineer seems content with his position. The second one squirms and glares.")

		saynn("[say=tavi]I see that you succeeded. Good job.[/say]")

		saynn("The lights on the big wide door blink orange.")

		saynn("[say=pc]Yeah, I had some complications. But I managed to hack the console.[/say]")

		saynn("Tavi raises a brow.")

		saynn("[say=tavi]Oh wow, one day you will be better than me at this.[/say]")

		saynn("She removes her foot from one of the guys. He looks pleadingly up at her. Tall kitty leans down to him and scritches under the chin.")

		saynn("[say=tavi]Gonna miss me, handsome~? Thanks for being a good boy unlike your colleague here.[/say]")

		saynn("Tavi approaches the console and presses a few buttons. The door's pistons and hydraulic systems hum to life as it begins to open, a thick plume of smoke escaping from between the edges. It sure takes its time, the sound of grinding gears and hissing hydraulics resonates in the air as the door continues to open, revealing more and more of the room beyond.")

		saynn("[say=tavi]Well then. Shall we~?[/say]")

		addButton("Let's go", "Enter the new space", "enter_transmitter")
	if(state == "enter_transmitter"):
		aimCameraAndSetLocName("eng_bluespacetransmitter")
		saynn("[say=pc]Let's do this.[/say]")

		saynn("The door finally opens with a loud clunk, blue light shines from out of the opening. You and Tavi step inside.")

		saynn("You find yourself standing in a vast, spherical chamber. The walls are constructed from a gleaming metallic material, and in the center of the room sits a massive blue crystal, encased in a protective holder and shielded by a thick layer of reinforced glass that also dims the light that's coming from it. A catwalk circles the room, providing access to various consoles and control panels that are connected to the contraption in the middle with fat isolated cables.")

		saynn("[say=tavi]Wow.[/say]")

		saynn("The crystal is huge, almost the size of a person. You barely look at it for longer than a few seconds. But when you look through it.. it's like you're looking into another dimension. You both take a few seconds to marvel at the beauty. The light it produces is so bright. And yet.. so soft.. illuminating the whole room.")

		saynn("[say=tavi]The heart of the whole station.[/say]")

		saynn("Tavi steps on the catwalk and looks through all the control panels before pointing at one.")

		saynn("[say=tavi]This one manages power it seems. And we will need a lot of it. Find a way to increase the current flow while I set everything up.[/say]")

		saynn("[say=pc]Yes, Miss Tavi.[/say]")

		addButton("Control panel", "Increase the power input towards the crystal", "power_up")
	if(state == "power_up"):
		saynn("You stand near the panel and try to understand what means what. There are many dials, knobs and buttons but most of the labels have been scratched off with time.")

		saynn("[say=pc]This thing doesn't come with instructions.[/say]")

		saynn("Tavi is busy looking into the console, her digits dancing away at the bulky keyboard.")

		saynn("[say=tavi]Well, try everything, cutie. We can't stop now.[/say]")

		saynn("Right. What's the worst thing that can happen anyway? You start turning the knobs one by one and seeing what happens. Nothing mostly. But after playing with one of the sliders you notice that the glow coming from the crystal changes, the higher you crank it the more light begins to pulsate.")

		saynn("[say=pc]This must be it.[/say]")

		saynn("[say=tavi]Gre-e-eat. I'm almost done too. This thing supports multi-broadcast. Every single Syndicate station in the entire galaxy is gonna hear us. AlphaCorp thought they could steal this tech and not have it backfire on them.[/say]")

		addButton("Raise power", "Route more power to the bluespace crystal", "raise_power")
	if(state == "raise_power"):
		saynn("You move the slider up until the panel starts beeping angrily at you. You try to keep it happy, balancing the power draw.")

		saynn("[say=pc]I think we're ready.[/say]")

		saynn("Tavi finishes typing on the keyboard and looks at you. That cunning smile. The same one that she used on you before. This smile is impossible to forget.")

		saynn("[say=tavi]Yes, we are, cutie.[/say]")

		saynn("Her eyes exude a fierce determination and an unwavering drive. Her conviction is palpable, and her passion burns like a fire within her.")

		saynn("She looks back at the screen and presses the last key. The crystal, you can hear its hum as it starts drawing in more power. The shiny walls reflect light all over the room, creating cool patterns everywhere. Beautiful. Mesmerizing.")

		saynn("A few seconds later the speakers of Tavi's console coughed up some noises that sounded more like static. The microphone that was near them starts creating a little feedback loop until Tavi pulls it closer to her. It's working. It must.")

		saynn("Tavi looks at you again and then brings her lips closer to the mic.")

		saynn("[say=tavi]Anyone hears me?[/say]")

		saynn("Silence. Only a low static hum. These seconds feel like forever.")

		addButton("Continue", "See what happens next", "after_asking")
	if(state == "after_asking"):
		saynn("[sayMale]Can you repeat that?[/sayMale]")

		saynn("The sudden voice startles both of you. Yes! You're ready to cheer. Someone hears you. Tavi instantly cuts them off.")

		saynn("[say=tavi]I'm a prisoner on a space station under AlphaCorp's control. Broken Dreams Correctional Center. I don't have much time. Can you triangulate my position?[/say]")

		saynn("The suspense is killing you. Both of you. Tavi sounds the most serious she has ever been. She holds the mic and stares at the speakers.")

		saynn("[sayMale]Uhh.. Again, I didn't catch that.[/sayMale]")

		saynn("[say=tavi]What? Why not?[/say]")

		saynn("Tavi brings the mic to her lips and repeats the same sentence, as clear as possible. Something is not right.")

		saynn("A few more seconds pass.")

		saynn("[sayMale]You're coming in completely garbled. Check your encryption keys.[/sayMale]")

		saynn("You see something in Tavi's eyes. A realization. And fear.")

		saynn("[say=tavi]The.. encryption keys?.. Fuck..[/say]")

		saynn("You're still trying to regulate the power to that hungry crystal. It's kinda warm here. And the heat only goes up.")

		saynn("[say=pc]What's happening, Tavi?[/say]")

		saynn("Tavi steps away from the console. Her muscles tensed up. Eyes open wide. Hands clenched into fists.")

		saynn("[say=tavi]We can hear them because the console has Syndicate's encryption keys stored. But they don't have ours.[/say]")

		saynn("[say=pc]Can we do something?![/say]")

		saynn("[say=tavi]We can exchange keys. But we gotta have them in the first place.[/say]")

		saynn("[say=pc]And who has them?[/say]")

		saynn("Tavi looks at you, her eyes full of hatred.")

		saynn("[say=tavi]The captain.[/say]")

		saynn("Tavi is shaking, you can hear her gritting her teeth. This sure didn't go according to plan. You're almost ready to give up.")

		saynn("You both are standing still. Paralyzed. Discouraged. Defeated.")

		addButton("Continue", "This is bad", "tavi_rage")
	if(state == "tavi_rage"):
		saynn("Suddenly Tavi springs back to the console and starts furiously typing again.")

		saynn("[say=tavi]No, I won't give up that easily.[/say]")

		saynn("Her voice rings with determination. She stops for a second to remember something and then continues to type in command after command.")

		saynn("[say=tavi]Not after everything. Keep the power stable, cutie.[/say]")

		saynn("[say=pc]What are you gonna do? We need to get to the captain you said.[/say]")

		saynn("[say=tavi]Fuck the captain. I know a ship that we can talk to with our encryption keys.[/say]")

		saynn("She types in the frequency and presses the key to start the live voice transmission again. The crystal glows bright. Tavi leans into the microphone and waits for the static to go away. It does.")

		saynn("[say=tavi]Hey. Do you hear me? Please. I'm trapped here, AlphaCorp's prison.[/say]")

		saynn("Silence. More time passes. Tavi stares into the speaker, her paw gripping that mic tightly.")

		saynn("[say=elena]..Tavi?.. Is that you?[/say]")

		saynn("A clear female voice comes through. A voice that you never heard before.")

		addButton("Continue", "Hope?", "alex_walksin")
	if(state == "alex_walksin"):
		addCharacter("alexrynard")
		playAnimation(StageScene.Duo, "defeat", {pc = "tavi", npc="alexrynard"})
		saynn("But before Tavi can answer, her collar suddenly engages and shocks the wearer. Tavi lets out an angry growl as she grabs onto her collar and tries to fight it.")

		saynn("[say=alexrynard]I'm giving you a single second to get the fuck down on the floor.[/say]")

		saynn("You turn around and see the engineer that was blocking your path not that long ago. You gotta do something because he now aims the shock remote straight at you, waiting for it to be able to send another signal. And he isn't happy.")

		saynn("You stumble a step back and almost trip over the power control panel. Huh. Gotta think fast.")

		addButton("Turn off power", "Cut off power to the bluespace transmitter completely", "turn_power_off")
		addButton("Full power", "Create a huge power spike", "power_spike")
	if(state == "turn_power_off"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		setFlag("TaviModule.Ch3TurnedOffPower", true)
		saynn("Without even looking at it, you find the slider that controls the power and yank it down to zero. Just in time for the foxy's remote to send another signal but to your collar this time. You shut your eyes and brace.")

		saynn("Unfortunately for Alex, the transmission didn't happen. You open your eyes and notice that the little light on yours and Tavi's collars isn't on. The foxy huffs.")

		saynn("[say=alexrynard]Touching my shit was a bad idea. A level of bad that earns you a few extra charges.[/say]")

		saynn("Tavi is hissing and panting, trying to get up but failing. But she is not ready to give up just yet and that means so is you.")

		saynn("[say=tavi]Fuck him up.[/say]")

		if (getFlag("TaviModule.ch3AlexDefeatedHim")):
			saynn("[say=alexrynard]Give me a break.[/say]")

		else:
			saynn("[say=alexrynard]You couldn't do it before. Think you can win now?[/say]")

		saynn("Alex puts the remote away and gets ready for a fight.")

		addButton("Fight", "Fight the foxy", "fight_foxy")
	if(state == "if_won_alex"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard", npcAction="defeat"})
		saynn("Alex grunts loudly as he hits the floor, defeated. He grabs onto the nearby railing and tries to pull himself up, the servos in his spine working overtime.")

		saynn("But that's when Tavi jumps on him and shoves him back onto the floor before delivering multiple hits to his back, each one more violent than the last one. You hear growling, cries of pain and metal screeching. The guy's back creates sparks while Tavi continues to break him and is seemingly not planning to stop any time soon.")

		saynn("[say=alexrynard]Hh-h..[/say]")

		saynn("Hatred shines in Tavi's eyes. The poor guy is grunting louder and louder. Until he starts getting weaker. You can't let Tavi kill him.")

		saynn("You grab onto the tall cat's shit and pull her away but she just glares at you before kicking you away and returning to beating the poor engineer up.")

		saynn("[say=pc]Tavi! Stop![/say]")

		saynn("Adrenaline flows through your blood as you jump on her and throw her off Alex. The cat hisses and bares her fangs and claws, seemingly about to attack you too.")

		saynn("[say=captain]I would listen to {pc.him} if I were you.[/say]")

		saynn("Suddenly, a voice.")

		addButton("Continue", "See what happens next", "captain_appears")
	if(state == "if_lost_alex"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard", npcAction="defeat"})
		saynn("You hit the floor, no more fighting for you. Alex does some neck cracking as he slowly approaches you, improvised cuffs in his hands.")

		saynn("[say=alexrynard]It's over.[/say]")

		saynn("But just before he crouches, Tavi jumps on him and makes him take the painful fall before proceeding to deliver multiple hits to his back, each one more violent than the last one. You hear growling, cries of pain and metal screeching. The guy's back creates sparks while Tavi continues to break him and is seemingly not planning to stop any time soon.")

		saynn("[say=alexrynard]Hh-h..[/say]")

		saynn("Hatred shines in Tavi's eyes. The poor guy is grunting louder and louder. Until he starts getting weaker. You can't let Tavi kill him.")

		saynn("You grab onto the tall cat's shit and pull her away but she just glares at you before kicking you away and returning to beating the poor engineer up.")

		saynn("[say=pc]Tavi! Stop![/say]")

		saynn("Adrenaline flows through your blood as you jump on her and throw her off Alex. The cat hisses and bares her fangs and claws, seemingly about to attack you too.")

		saynn("[say=captain]I would listen to {pc.him} if I were you.[/say]")

		saynn("Suddenly, a voice.")

		addButton("Continue", "See what happens next", "captain_appears")
	if(state == "power_spike"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard", npcAction="defeat"})
		setFlag("TaviModule.Ch3SpikedPower", true)
		saynn("Without even looking at it, you find the slider that controls the power and yank as high as you can. The control panel screams at you but you don't give a damn and just hold it high. A bright flash happens, blinding all of you. Followed by every single electrical device around you turning off.")

		saynn("Alex cries out from pain as he falls onto the floor, the shock remote hits the floor soon after and shatters.")

		saynn("[say=pc]Don't get up.[/say]")

		saynn("[say=alexrynard]Ugh.. Touching my shit was a bad idea.[/say]")

		saynn("The crystal is still illuminating the room, letting you see. Tavi's green spots on her fur are even more visible now. The console near her is dead. She catches her breath and then gets up, her eyes glaring at the defeated guy.")

		saynn("[say=pc]Tavi?[/say]")

		saynn("Her gaze fixated on him. She clenches her fists as she starts approaching him. All the while the guy tries to get up using the nearest railing as support.")

		saynn("[say=alexrynard]..a level of bad that earns you a few extra charges.[/say]")

		saynn("Tavi jumps on him and shoves him back onto the floor before delivering multiple hits to his back, each one more violent than the last one. You hear growling, cries of pain and metal screeching. The guy's back creates sparks while Tavi continues to break him and is seemingly not planning to stop any time soon.")

		saynn("[say=alexrynard]Hh-h..[/say]")

		saynn("Hatred shines in Tavi's eyes. The poor guy is grunting louder and louder. Until he starts getting weaker. You can't let Tavi kill him.")

		saynn("You grab onto the tall cat's shit and pull her away but she just glares at you before kicking you away and returning to beating the poor engineer up.")

		saynn("[say=pc]Tavi! Stop![/say]")

		saynn("Adrenaline flows through your blood as you jump on her and throw her off Alex. The cat hisses and bares her fangs and claws, seemingly about to attack you too.")

		saynn("[say=captain]I would listen to {pc.him} if I were you.[/say]")

		saynn("Suddenly, a voice.")

		addButton("Continue", "See what happens next", "captain_appears")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "enter_transmitter"):
		processTime(6*60)

	if(_action == "raise_power"):
		processTime(60*6)

	if(_action == "tavi_rage"):
		processTime(60*10)

	if(_action == "fight_foxy"):
		runScene("FightScene", ["alexrynard"], "alexfight")

	if(_action == "captain_appears"):
		processTime(10*60)
		runScene("Ch3s5CaptainScene")
		endScene()
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "alexfight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		#var wonHow = _result[1]
		
		if(battlestate == "win"):
			setState("if_won_alex")
			addExperienceToPlayer(50)
		else:
			setState("if_lost_alex")
			addExperienceToPlayer(20)
