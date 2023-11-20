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

		saynn("[say=pc]Um.. I don't know. For some reason I was focusing a lot on myself.[/say]")

		saynn("Alex hums.")

		saynn("[say=alexrynard]Hm.. Maybe that was happening because your surroundings, the prison, carries a lot of negative emotions with it?[/say]")

		saynn("You shrug.")

		saynn("[say=alexrynard]I really want to test it for a little longer. Would that be okay?[/say]")

		saynn("You don't see why not so you nod.")

		saynn("[say=alexrynard]Ready?[/say]")

		addButton("Yes", "Start the experiment", "do_start")
	if(state == "stage2"):
		saynn("Ow. The visor suddenly flashes [color=red]red[/color] a few times before returning back to [rainbow freq=0.05 sat=0.2 val=1.0]soft warm colors[/rainbow]. If the cameras wanted to see muscles in your eyes twitch, they certainly got what they wanted..")

		saynn("The soft colors are obviously way nicer to look at.. making you appreciate them a lot more.")

		saynn("[rainbow freq=0.05 sat=0.9 val=1.0]Everything is so colorful.[/rainbow]")

		saynn("You don't even notice that there are some kind of words appearing on the visor. Very calming words like 'Free', 'Happy', 'Fun'. They're nice to look at too.")

		saynn("Ow. There goes the red flashing again. Very annoying.. Why do you have to look at the throbbing red colors.. You don't wanna do that..")

		saynn("[say=alexrynard]All good?[/say]")

		saynn("Soon, the bright red transitions back into a [color=pink]nice pink color[/color].. Very pretty. Feels like you could look at it all day.. Fuck that red color.")

		addButton("Continue", "See what happens next", "stage3")
		addButton("RED", "Say it", "stage2_red")
	if(state == "stage2_red"):
		saynn("[say=pc]..red?[/say]")

		saynn("For some reason it took a lot of your will power to say that damned word.")

		saynn("Alex turns off the prototype as fast as he can.. but your peripheral vision still has that [rainbow freq=0.05 sat=0.2 val=1.0]colorful pretty[/rainbow] haze.")

		saynn("[say=alexrynard]Something went wrong?[/say]")

		saynn("[say=pc]Oh.. I don't actually know. I saw a lot of red flashes.. I didn't like those.[/say]")

		saynn("[say=alexrynard]Let me look at you.[/say]")

		saynn("He does a quick visual check of your eyes.")

		saynn("[say=alexrynard]I'm not a doctor but they do look slightly bigger than usual. Huh.[/say]")

		saynn("[say=pc]If you could remove those flashes, I'd be happy to look at the colors more.[/say]")

		saynn("Alex hums.")

		saynn("[say=alexrynard]I don't think I can. They're part of the calibration like I said. They should stop after there is enough entropy. Would you be willing to try again? We still don't know if it does what it should, block negative thoughts.[/say]")

		saynn("For some reason your brain doesn't want to say no.. You feel like you should be concerned.. but you're not..")

		addButton("Yes", "Start the experiment", "do_start")
	if(state == "stage3"):
		saynn("Soon, the red flashing stops.. leaving just the [rainbow freq=0.05 sat=0.9 val=1.0]nice pretty colors and kind words.[/rainbow]")

		saynn("You're looking at a wall.. and realize how good it is. Years of engineering and then months of actual assembly lead you to being able to see it. So much effort, you can't help but to appreciate it.")

		saynn("Then you turn your head a little.. and see Alex. Oh wow. His previously orange fur now has [rainbow freq=0.05 sat=0.9 val=1.0]all sorts of tints[/rainbow] to it. So much detail to it, you can't help but part your lips a little more.. and even begin to drool.")

		saynn("Some part of your brain tries to tell you that you should be concerned by now.. Drooling while examining someone's fur isn't normal.. But then your mind throws that negative thought away. Why worry if you're.. happy.")

		saynn("[say=alexrynard]How do you.. feel?[/say]")

		saynn("You can still fully control your body. You look at your hands and smile. Wiggling your fingers is so entertaining for some reason..")

		saynn("[say=pc]I feel nice..[/say]")

		saynn("[say=alexrynard]Can you.. walk around a bit?[/say]")

		addButton("Do it", "Obey his words", "stage4")
		addButton("RED", "Say it", "stage3_red")
	if(state == "stage3_red"):
		saynn("You open your mouth more, about to say the word.. but nothing comes out.")

		saynn("Huh?")

		saynn("[rainbow freq=0.05 sat=0.9 val=1.0]Colors are so pretty...[/rainbow]")

		saynn("No.. yes. Wait.")

		saynn("You're so confused. And now you're not.")

		saynn("What is happening? Everything is good!")

		saynn("[rainbow freq=0.05 sat=0.9 val=1.0]Just look at the colors...[/rainbow]")

		saynn("It's like your brain is fighting you! No, it is obviously just helping.")

		saynn("It's helping you stay happy. No.. You must.. resist.")

		addButton("Close eyes", "Try to close your eyes", "stage3_red_try_close_eyes")
		addButton("Give in", "Just let it continue..", "stage4")
	if(state == "stage3_red_try_close_eyes"):
		saynn("You close your eyes shut! But.. you still see those [rainbow freq=0.05 sat=0.9 val=0.4]pretty colors.[/rainbow] Oh no, they're very dark though.")

		saynn("Soon, the darkness starts to get replaced with throbbing red.. You keep your eyes shut..")

		saynn("[say=alexrynard]Should I stop?![/say]")

		saynn("[color=red]Pain![/color] It hurts not to look.")

		saynn("[say=pc]N-no..[/say]")

		saynn("You just wanna be happy.. You don't want red.")

		saynn("You open your eyes.. because you really-really want to see those [rainbow freq=0.05 sat=0.9 val=1.0]pretty colors[/rainbow] again..")

		addButton("Continue", "Just let it continue..", "stage4")
	if(state == "stage4"):
		playAnimation(StageScene.Duo, "walk", {npc="alexrynard"})
		saynn("You proceed to step around the room, exactly like Alex ordered you to. The [rainbow freq=0.05 sat=0.9 val=1.0]colors[/rainbow] follow you no matter where you go. But if you stop even for a second.. those colors go away.. can't let that happen.")

		saynn("Lap after lap, you keep doing the given task while Alex rubs his chin, clearly fascinated by the effect.")

		saynn("[say=alexrynard]You feel tired yet?[/say]")

		saynn("[say=pc]No, I feel great.[/say]")

		saynn("[say=alexrynard]Come to me.[/say]")

		saynn("That's a great task. You get a strong desire to kneel before him.")

		addButton("Do it", "Obey his words", "stage5")
		addButton("RED", "Say it", "stage4_red")
	if(state == "stage4_red"):
		saynn("No.. you don't wanna kneel..")

		saynn("You try to say the [color=red]word[/color].. but you can't. It's too bad of a word.")

		saynn("Colorful lights fade away.. replaced by.. red flashes. Ow.. it hurts. No, it feels great..")

		saynn("You feel like your mind is about to break.. no, you're feeling great. You just want to get a taste of the lights and read more of those kind words..")

		saynn("It's so overwhelming.. and yet.. you are the calmest you ever were. You can't win this. No, you already won.. just grab your prize..")

		addButton("Do it", "Obey his words", "stage5")
		addButton("Close eyes", "Try to close your eyes", "stage4_red_try_close_eyes")
	if(state == "stage4_red_try_close_eyes"):
		saynn("You try to close your eyes as the last resort.. but you can't even do that anymore.")

		saynn("You're completely screwed! And feel awesome about it!")

		saynn("You can only blink. But even that ability is stripped from you when you try to do it too fast. Your own brain works against you.. No, it actually doesn't.")

		saynn("How can it? You are the brain. And you are doing exactly what you want to do. How can some colors and words affect your mind? Don't be silly.")

		saynn("Yeah. It's fun.")

		saynn("Time to kneel.")

		addButton("Do it", "Obey his words", "stage5")
	if(state == "stage5"):
		playAnimation(StageScene.Duo, "kneel", {npc="alexrynard"})
		saynn("[say=pc]Of course![/say]")

		saynn("You nod and swiftly approach Alex.. before getting on your knees before him.")

		saynn("[say=pc]I'm here.[/say]")

		saynn("[say=alexrynard]Oh wow. Did the prototype make you do that?[/say]")

		saynn("[say=pc]No.[/say]")

		saynn("[say=alexrynard]I see. Huh. [rainbow freq=0.05 sat=0.9 val=1.0]Good job.[/rainbow][/say]")

		saynn("You smile as the [rainbow freq=0.05 sat=0.9 val=1.0]colors[/rainbow] become brighter.")

		saynn("[say=alexrynard]Wait. Are you lying to me though?[/say]")

		saynn("Yes. No. Of course not. But.. wait.. were you?")

		saynn("You look up at him, your eyes shine with obedience.")

		saynn("[say=pc]Were I allowed to?[/say]")

		saynn("[say=alexrynard]No.[/say]")

		saynn("[say=pc]Then.. of course I didn't lie. I am doing this because I want to do this. Sorry if I made you doubt me.[/say]")

		saynn("[say=alexrynard]Interesting. Tell me why you are here.[/say]")

		saynn("You nod.")

		saynn("[say=pc]To help you test this prototype![/say]")

		saynn("[say=alexrynard]Uh huh.[/say]")

		saynn("[say=pc]And obey you and your every word to the best of my ability![/say]")

		saynn("Alex raises a brow. He has so much power and control over you at this very moment. So many things he could do to you.. And you wouldn't mind anything in this state.. You would have loved all of it.. He just gotta say a word..")

		saynn("[say=alexrynard]What did I create..[/say]")

		saynn("[say=pc]I don't know. But I truly feel great.[/say]")

		saynn("[say=alexrynard]We have to stop now.[/say]")

		saynn("What? But that will end the [rainbow freq=0.05 sat=0.9 val=1.0]colors[/rainbow]!")

		saynn("[say=pc]Why-y? I will do anything for you..[/say]")

		saynn("But before you can stop him, he quickly powers off the prototype, causing the [fade]lights to disappear..[/fade]")

		addButton("Continue", "See what happens next", "in_trance")
	if(state == "in_trance"):
		saynn("With no fancy lights or kind words.. you just sit still now.. Nothing matters..")

		saynn("[say=alexrynard]Um.. Are you with me?[/say]")

		saynn("His words just fly past you. He tries to shake your shoulder.. but again.. there is no reaction from you.")

		saynn("[say=alexrynard]Oh fuck. Please tell me I didn't fry your brain or something.[/say]")

		saynn("He shakes you a bit more.. and then snaps his fingers before your eyes. And that is what finally makes you snap out of your trance-like state.")

		saynn("[say=pc]Oh.[/say]")

		saynn("[say=alexrynard]Are you okay?[/say]")

		saynn("[say=pc]Yeah.. I'm back.[/say]")

		saynn("[say=alexrynard]That's.. a relief. Do you remember what just happened?[/say]")

		saynn("You think you do.. yeah, you definitely saw everything with your own eyes.")

		saynn("[say=pc]Yes. I almost couldn't control myself. But I remember it feeling.. nice.. too nice. Like nothing bad matters anymore at all.[/say]")

		saynn("Alex stays quiet for some time, watching you.. while you are still on your knees before him.")

		saynn("[say=alexrynard]I don't know how I feel about it.[/say]")

		saynn("You can still notice faint signs of the colorful haze in your peripheral vision.")

		saynn("[say=pc]Depression is gonna be the last of your problems if you wear it.[/say]")

		saynn("[say=alexrynard]Very funny.[/say]")

		saynn("[say=pc]It certainly.. has some effect. For a first prototype, it's not bad. You gotta work on it more, fix the program maybe.[/say]")

		saynn("Alex scratches the back of his head.")

		saynn("[say=alexrynard]Well.. I think I gotta talk with the captain about it.[/say]")

		saynn("[say=pc]Can I keep it?[/say]")

		saynn("[say=alexrynard]It costs a lot, you know.[/say]")

		saynn("[say=pc]I can pay with credits.[/say]")

		saynn("Alex shrugs.")

		saynn("[say=alexrynard]You might break someone's brain with it.[/say]")

		saynn("[say=pc]I will be careful. More testing is good, right?[/say]")

		saynn("He sighs while looking at his prototype on your head.")

		saynn("[say=alexrynard]Fine, I guess I could use some extra data about how it works to make a better one. Thank you for the help.[/say]")

		saynn("Great. He takes off the visor and puts it away for now.")

		saynn("[say=alexrynard]And.. get up already. I will show you the way out.[/say]")

		saynn("Time to go.")

		addButton("Continue", "See what happens next", "endthescene")

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

	if(_action == "in_trance"):
		GM.pc.getInventory().clearSlot(InventorySlot.Eyes)
		addMessage("You can now buy a Hypnovisor mk1 from Alex")

	setState(_action)
