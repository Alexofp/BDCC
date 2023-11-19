extends SceneBase

func _init():
	sceneID = "AlexS5HypnovisorIntroScene"

func _run():
	if(state == ""):
		addCharacter("alexrynard")
		aimCameraAndSetLocName("eng_breakroom")
		GM.pc.setLocation("eng_bay_corridor")
		playAnimation(StageScene.Duo, "walk", {npc="alexrynard", npcAction="walk", flipNPC=true})
		saynn("The whole space station seems to be sleeping by now. All the lights are dimmed down, offering a moody atmosphere while you follow Alex through the corridors of the engineering block.")

		saynn("The foxy opens the staff-only door by entering some code and then invites you into a cozy-looking room.")

		saynn("It looks like.. a break room. You've been here already. But now you can get a better look. You notice a tv, a sofa, chairs, a vendomat with some drinks. There is even a little shower cabin. It seems that engineers can't stop thinking about work even during their break time because one of the corners has a long work table with a board above it that has a crazy amount of notes pinned to it.")

		saynn("[say=alexrynard]Right. Give me a second.[/say]")

		saynn("Alex quickly pushes the big sofa out of the way and then invites you to stand in the middle of the room.")

		saynn("[say=alexrynard]Just stand there.[/say]")

		addButton("Continue", "See what happens next", "stand_in_middle")
	if(state == "stand_in_middle"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("Alright. You take the offered spot and just.. wait.")

		saynn("Alex approaches the work table and opens one of the locked drawers, grabbing a box full of unfinished prototypes. He finds the right one.. and returns to you.")

		saynn("It looks like.. fancy glasses. But with some electronics and wires sticking out of them.")

		saynn("[say=pc]Glasses?[/say]")

		saynn("[say=alexrynard]Yeah. I wired up a few highly-precise cameras to them that read your irises and there are also some LED strips that can send highly-concentrated light impulses.[/say]")

		saynn("[say=pc]Sounds.. dangerous.[/say]")

		saynn("[say=alexrynard]Well, it can be. But these are just off the shell components. It should be better than the sum of its parts.[/say]")

		saynn("You realize that you still don't understand what it will do.")

		saynn("[say=pc]What will they do though?[/say]")

		saynn("Alex shrugs.")

		saynn("[say=alexrynard]The obvious use case is in medicine. These LEDs are so strong, they are capable of performing laser eye surgery. The high-range high-density matrices of the cameras allows for the whole procedure to be completely automated. All the while being smaller than any auto-doc.[/say]")

		saynn("Really cool tech. But you don't really have any problems with your eyes..")

		saynn("[say=alexrynard]But.. I decided to do something else with them. Do you know how your brain works? Any brain.[/say]")

		saynn("What a weird question.")

		saynn("[say=pc]Well, yeah, kinda. Lots of connected neurons..[/say]")

		saynn("[say=alexrynard]Yeah, exactly. Your brain has inputs, like your eyes, internal layers that consist of neurons and some outputs, like your muscles.[/say]")

		saynn("You feel like you won't be able to follow him for long..")

		saynn("[say=alexrynard]Basically, lights can trigger some of your neurons to fire. The cameras in these goggles can catch that through the microscopic twitches of your eye muscles and use that info to try to guess the internal logic of your brain. Obviously it takes a lot of time to gather enough entropy so this process is quite slow.[/say]")

		saynn("Wow..")

		saynn("[say=pc]You're saying that it can read minds?[/say]")

		saynn("[say=alexrynard]Yeah. Well, no. But it can guess some stuff. There is way too much information to process to be able to actually 'read' someone's mind. And the error is too huge for any data to be considered reliable.[/say]")

		saynn("Doesn't stop them from using mindtesters to find guilty people..")

		saynn("[say=alexrynard]I programmed this particular prototype to find layers that are responsible for negative thoughts and then.. use the carefully crafted LED patterns to negate their values.[/say]")

		saynn("Blocking negative thoughts.. You feel like you can make a pretty guess about who he is making that prototype for.")

		saynn("[say=pc]Right. All of that amounts to.. Anti-depression goggles?[/say]")

		saynn("He shrugs.")

		saynn("[say=alexrynard]Why not, that's a good description.[/say]")

		saynn("He begins to carefully put this prototype on your head. It still seems to be disabled so it shouldn't do anything. But you stand very still just in case.")

		addButton("Continue", "See what happens next", "wear_disabled_goggles")
	if(state == "wear_disabled_goggles"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("They now look more like a.. visor.. when they land on your head.")

		saynn("[say=alexrynard]Alright. We will do a few tests but I want to let you know that you will always be in control. If you feel like something is wrong, tell me immediately and I will turn them off. Hm.. yeah, just say 'RED' if something is wrong, okay?[/say]")

		saynn("So caring.")

		saynn("[say=alexrynard]And if something goes really-really wrong and you will stop being able to talk, just close your eyes. Without access to your eyes, the LEDs shouldn't be able to affect you in any way.[/say]")

		saynn("That's.. concerning. But you've gone so far already.")

		saynn("[say=alexrynard]Ready?[/say]")

		addButton("Yes", "Start the experiment", "do_start")
		addButton("RED", "Say it", "do_prestart_red")
	if(state == "do_prestart_red"):
		saynn("You don't know why but you have a strong desire to say it now..")

		saynn("[say=pc]RED.[/say]")

		saynn("Alex rolls his eyes and sighs.")

		saynn("[say=alexrynard]I didn't even turn it on yet, brat.[/say]")

		saynn("[say=pc]Oh, sorry. I was just testing the safeword.[/say]")

		saynn("He rolls his eyes even harder.")

		saynn("[say=alexrynard]Ready?[/say]")

		addButton("Yes", "Start the experiment", "do_start")
	if(state == "do_start"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("[say=pc]Yes, I'm ready.[/say]")

		saynn("Alex nods and then uses a screwdriver to short-circuit the power switch of the main board..")

		saynn("Almost instantly, some of the LED's light up with a cozy yellow color. You hear a pleasing low-pitched hum near your ears as the prototype gradually warms up around your head.")

		saynn("[say=alexrynard]Good. Don't forget to say RED if you think that something is wrong.[/say]")

		saynn("He doesn't have to repeat it twice, you got it already.. At least his words make you feel safe.")

		saynn("You look around the room. It's still the same room, it just now has a pink-yellow tint to it.")

		saynn("Fancy glasses, huh.")

		addButton("Continue", "See what happens next", "stage1")
		addButton("RED", "Say this", "do_start_red")
	if(state == "do_start_red"):
		saynn("[say=pc]RED.[/say]")

		saynn("Alex tilts his head slightly. But then snaps out of it and quickly turns off the prototype.")

		saynn("[say=alexrynard]You felt something bad?[/say]")

		saynn("[say=pc]Um.. I thought these were voice-controlled. I wanted them to glow red rather than yellow.[/say]")

		saynn("He sighs.")

		saynn("[say=alexrynard]They're not. Let's try again.[/say]")

		saynn("At least he seems to be patient with you.")

		saynn("[say=alexrynard]Ready?[/say]")

		addButton("Yes", "Start the experiment", "do_start")
	if(state == "stage1"):
		saynn("As the time passes, you notice that the yellow glow is now only in your peripheral vision.. It begins to slowly cycle through various tints of yellow.. then various tints of blue and green.. Ohh, it just went from green to purple. And then from blue to orange.")

		saynn("[rainbow freq=0.05 sat=0.2 val=1.0]Very colorful.[/rainbow]")

		saynn("[say=pc]It looks nice.[/say]")

		saynn("[say=alexrynard]Uh huh. Feel any different yet?[/say]")

		saynn("Not really.. you don't really feel anything. Just calmness. The low-pitched hum helps you focus on yourself.")

		saynn("[say=pc]Not really.[/say]")

		saynn("[say=alexrynard]Nothing can be something.[/say]")

		saynn("[rainbow freq=0.05 sat=0.2 val=1.0]You smile.[/rainbow]")

		saynn("[say=alexrynard]Very rarely though.[/say]")

		saynn("Huh. You are breathing right now. Every few seconds, you catch some air, just to exhale it soon after. Feels nice. You even part your lips a tiny bit to catch more of that sweet air.")

		addButton("Continue", "See what happens next", "stage2")
		addButton("RED", "Say it", "stage1_red")
	if(state == "stage1_red"):
		saynn("[say=pc]Red.[/say]")

		saynn("Alex hears that and pretty much instantly turns off the prototype, causing the colorful lights to go away, just like the hum.")

		saynn("[say=alexrynard]Something went wrong?[/say]")

		saynn("[say=pc]Um.. I don't know. For some reason I was focussing a lot on myself.[/say]")

		saynn("Alex hums.")

		saynn("[say=alexrynard]Hm.. Maybe that was happening because your surroundings, the prison, carries a lot of negative emotions with it?[/say]")

		saynn("You shrug.")

		saynn("[say=alexrynard]I really want to test it for a little longer. Would that be okay?[/say]")

		saynn("You don't see why not so you nod.")

		saynn("[say=alexrynard]Ready?[/say]")

		addButton("Yes", "Start the experiment", "do_start")
	if(state == "stage2"):
		saynn("Colors..")

		saynn("[rainbow freq=0.05 sat=0.9 val=1.0]Very colorful.[/rainbow]")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "stand_in_middle"):
		processTime(5*60)

	if(_action == "wear_disabled_goggles"):
		processTime(3*60)
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("HypnovisorDisabled"))

	if(_action == "do_start"):
		processTime(5*60)

	if(_action == "stage1"):
		GM.pc.getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("HypnovisorMk1"))

	setState(_action)
