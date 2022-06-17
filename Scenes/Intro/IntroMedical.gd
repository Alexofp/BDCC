extends "res://Scenes/SceneBase.gd"

# Heavy work in progress, the text is just to get a feel for how the game is gonna start

func _init():
	sceneID = "IntroMedical"

func _run():
	if(state == ""):
		aimCamera("intro_beforeelevator")
		setLocationName("Intake area")
		
		addCharacter("eliza")

		saynn("You hear a subtle machine hum as you get close to the medical section of the intake block. It looks small and cozy, spotting a surgical bed, some chairs, drawers, an instrument table and some other medical equipment. Between all of that you spot a doctor just standing there looking into a tablet. She looks about 1.7 meters tall and is clearly a feline. You notice her pastel yellow fur, eyes the color of a green emerald and cat ears that show pink flesh on the inside. Normal reading glasses, a green top, long skirt, dark stockings, a belt with many pouches and a lab coat is what she is wearing. The lab coat is of a sterile white color with a bright green trim.")

		saynn("You tug on your tight collar, unsure what to do.")

		addButton("Introduce self", "Don't test your luck", "introduce_self")
		addButton("Sneak up", "This seems like an opportunity", "sneak_up")

	if(state == "sneak_up"):
		aimCamera("intro_medicalarea")
		setLocationName("Medical area")
		GM.main.playAnimation(StageScene.Solo, "defeat")
		
		saynn("You decide not to announce your presence and instead begin to slowly creep up to the lady, who seems to be too busy with reading something off of her tablet. You keep watching her as you make your steps as light as possible. You notice her feline ears twitching ever so slightly. As you approach the instrument table, you notice a variety of tools: syringes, clamps, retractors but most importantly, a few scalpels. Your hand hovers over one as you try to grab it. But as soon as you do, you hear a voice.")

		saynn("[say=eliza]You will regret it, inmate. Put it down[/say]")

		saynn("You turn your head and notice the doctor pointing some kind of remote at you, her eyes strict. You decide to hold onto the weapon for now, unsure how much of a threat a single doctor is.")

		saynn("[say=pc]Or else?[/say]")

		saynn("[say=eliza]Or else I will do this[/say]")

		saynn("She clicks some red button on her remote, which causes your collar to beep and then send a powerful shock through your body a second later. It was enough for you to drop everything and drop to your knees. The collar doesn’t stop while the doctor holds the button.")

		saynn("[say=pc]I get it, enough![/say]")

		saynn("She holds it for a few seconds longer before finally letting go but still pointing the remote at your neck")

		saynn("[say=eliza]That was the weakest setting. Apologize.[/say]")

		saynn("You’re still grunting and panting, slowly getting back up. You tug on your collar, trying to pull it off but it sits very tight and seems incredibly sturdy.")

		saynn("[say=pc]ughh.. What do you mean apologize.[/say]")

		saynn("[say=eliza]Say that you’re sorry[/say]")

		saynn("[say=pc]Why would I?[/say]")

		saynn("Instead of talking, the doctor presses a button on the remote again. You hear your collar beep and you instinctively brace for the worst, grabbing onto it.")

		saynn("[say=pc]Wait! Fine! I will![/say]")

		saynn("The shock never comes. You open your eyes and see the doctor watching you with a smirk on her face.")

		saynn("[say=eliza]I’m waiting[/say]")

		saynn("[say=pc]I’m sorry?[/say]")

		saynn("Doctor shakes her head.")

		saynn("[say=eliza]Too weak. Put some effort into it[/say]")

		saynn("[say=pc]Um. I’m very sorry that I snuck up on you and tried to steal the scalpel[/say]")

		saynn("Doctor’s smirk turns into a smile as she puts away the remote into her pocket. She then gestures towards the surgical bed.")

		saynn("[say=eliza]Take a seat. And no funny business[/say]")

		addButton("Sit", "Take a sit", "sit")

	if(state == "introduce_self"):
		aimCamera("intro_medicalarea")
		setLocationName("Medical area")
		
		saynn("You cough slightly to try and get her attention. Her feline ears quickly pick up on the noise and direct themselves towards you, followed soon by her glance.")

		saynn("[say=pc]Um. I’m {pc.name}.[/say]")

		saynn("She quickly scans the number that's printed on your uniform and then you as a whole from toes to ears.")

		saynn("[say=eliza]Ah, yes. Inmate number.. {pc.inmateNumber}. Take a seat.[/say]")

		saynn("She puts away her tablet and gestures towards the bed.")

		addButton("Sit", "Take a sit", "sit")

	if(state == "sit"):
		GM.main.playAnimation(StageScene.Solo, "sit")
		
		saynn("You sit on the side of a bed, it’s not the most comfy one but what can you do.")

		saynn("[say=eliza]You can call me doctor Quinn, inmate. Since this is your first time here I will need to do some procedures. Nothing too painful but still[/say]")

		saynn("[say=pc]Well, okay[/say]")

		saynn("The doctor rummages through some drawers and finds a small pill bottle that says “Spacecillin” on it. She grabs one pill and offers it to you as well as a glass of water.")

		saynn("[say=eliza]Strong antibiotics with a long term effect. Will protect you from most STDs.[/say]")

		saynn("You take the offered pill and toss it into your mouth. You don’t really feel any different after it. The doc quickly gives you a visual checkup and puts some data into her tablet.")

		# (if red)
		if(GM.pc.getInmateType() == InmateType.HighSec):
			saynn("[say=eliza]So you’re joining reds, huh. Just remember that others will fear you only if you don't show any weaknesses. Lilacs are basically sextoys but that doesn’t mean they won’t get into a fight with you.[/say]")

			saynn("[say=pc]I don’t think that this is your problem.[/say]")

			saynn("[say=eliza]Sewing you or any other inmate back together is my problem.[/say]")

		# (if orange)
		if(GM.pc.getInmateType() == InmateType.General):
			saynn("[say=eliza]Listen. If you want to get out of here as fast as possible, the lilac block is your best bet. Even if you don’t get paroled, you will at least get access to a better cell and comfortable furniture[/say]")

			saynn("[say=pc]As a reward for letting others fuck me?[/say]")

			saynn("[say=eliza]You know, some like it. Just avoid the reds, most of them are psychopaths.[/say]")

		# (if pink)
		if(GM.pc.getInmateType() == InmateType.SexDeviant):
			saynn("[say=eliza]You’re lucky to be a lilac, inmate. Spacious cell, comfy furniture, all of that. Though the catch is that others will see a sextoy in you so be careful. Maybe you will like it, I don’t know. And avoid the reds, they’re all psychopaths.[/say]")
			
		saynn("You watch the doctor put all her things away and then pull out a somewhat long chain.")

		saynn("[say=eliza]I will escort you to the cellblock now[/say]")

		saynn("[say=pc]And why do you need that chain[/say]")

		saynn("She taps on a handy hook on your collar.")

		saynn("[say=pc]You gonna leash me? Like a dog?[/say]")

		saynn("[say=eliza]Can’t have you running away now, you know[/say]")

		saynn("She offers you a cheeky smile")

		addButton("Fine", "Let her leash you", "fine")
		addButton("Fuck no", "You’re not a dog", "fuck_no")

	if(state == "fuck_no"):
		GM.main.playAnimation(StageScene.Solo, "shove")
		
		aimCamera("intro_beforeelevator")
		setLocationName("Intake area")
		
		saynn("[say=pc]Yeah, that’s not happening. How about you go screw yourself instead[/say]")

		saynn("Doctor raises her brows but tries to clip the leash to your collar anyways which is met with your resistance. You take a hold of her hand and try to wrench it which proves to be effective, considering the doctor is not that strong. She hisses from pain but then uses her free hand to punch you directly in the stomach. You grunt and let go, giving the doctor just enough time to press something on your wrist cuffs which made them connect to each other with a very strong magnetic force. She then grabs you by the collar and threatens to punch again with the second hand.")

		saynn("[say=eliza]You know, I can always use another test subject for my drug experiments. Willing or unwilling, I don’t really care.[/say]")

		saynn("You don’t resist her clipping the leash to your collar, just weakly growling at her. She tugs you off the bed and pulls you out of this room. You try to fight the leash at first but you feel it choking you as the doctor tugs harder and harder. So you have no other option but to obey it.")

		saynn("[say=pc]Easy, I’m going[/say]")

		saynn("Doctor walks you to some huge secure lift, even to just call it she uses her badge.")

		addButton("Lift", "Enter the lift", "lift")

	if(state == "fine"):
		GM.main.playAnimation(StageScene.Solo, "stand")
		
		aimCamera("intro_beforeelevator")
		setLocationName("Intake area")
		
		saynn("[say=pc]Fine[/say]")

		saynn("You raise your chin and present the collar to the doctor, she doesn’t take much time to clip the leash to it.")

		saynn("[say=eliza]You’re not a dog, it's just a safety measure.[/say]")

		saynn("She smiles again and gently tugs on the leash. You obey and get off the bed. Slight blush on your cheeks exposes your embarrassment.")

		saynn("[say=pc]Sure, it’s for safety[/say]")

		saynn("Doctor chuckles and escorts you out of the room and to some kind of lift. She makes sure you are following so the leash doesn’t choke you out. She uses her badge to call it.")

		addButton("Lift", "Enter the lift", "lift")

	if(state == "lift"):
		aimCamera("intro_elevator")
		setLocationName("Lift")
		
		addCharacter("tavi")
		
		saynn("You step into the spacious lift. It’s control panel shows that this prison has quite a few levels to it but their names are shortened to two letters so it's hard to figure out what is what.")

		say("Levels:\n")
		say("CO\n") # Captain's office
		say("HG\n") # Hangar
		say("CB\n") # CellBlock
		say("MN\n") # Mineshafts
		say("MB\n") # Medical bay
		say("EN\n\n") # Engineering

		saynn("Doctor Quinn presses the third button and the lift begins to descend, screeching a bit in the progress. You take a look around, there don’t seem to be anything interesting, not even cameras. Your collar is constantly reminding you that you’re on a tight leash.")
		addButton("Wait", "Wait until the lift arrives", "liftarrives")
		
	if(state == "liftarrives"):
		aimCamera("hall_elevator")
		setLocationName("Checkpoint")
		
		GM.main.playAnimation(StageScene.Solo, "walk")
		
		saynn("It takes a minute but the lift finally arrives. When the doors open, the first thing you see is a checkpoint with a few guards standing around.")

		saynn("[say=eliza]That inmate is with me[/say]")

		saynn("One of them nods and lets you two pass freely. When you exit the checkpoint, you are presented to a huge open room, about 20x20 meters. The walls seem to be made out of dark concrete but there are massive metal pillars there and there which make the design not as dull. The middle is taken mostly by a huge raised platform with stairs connecting it to the lower level.")

		saynn("[say=eliza]This is the main hall[/say]")
		
		addButton("Look around", "Look around the main hall", "lookaroundmainhall")
	
	if(state == "lookaroundmainhall"):
		aimCamera("hall_mainentrance")
		setLocationName("Main hall")
		
		saynn("You spot a few inmates around. All sorts of inmates of different species. Some wear orange uniforms, others wear red or pink. Obviously they weren’t told that you’re arriving but you do begin to catch their stares. Almost every inmate is now watching you being led around on a leash, you can hear some voices talking about you but it’s all incomprehensible to you.")

		saynn("One particular stare steals your attention. One of the reds. It’s clearly a female feline, a very tall one, about 2 meters. Her unusual fur is mostly purple with a toxic-green pattern added to it, cunning eyes are of different colors, green and red. She is standing by herself, away from everyone, arms crossed, eyes are staring at you, the lips form a very subtle smile. As the doctor leads you somewhere, that inmate stays silent, just watching you.")

		saynn("The doctor leads you to some stairs to the lower floor where all the cells are. She finds the orange block and quickly checks her tablet.")
		
		addButton("Follow", "Follow the leash", "followtocell")

	if(state == "followtocell"):
		GM.main.playAnimation(StageScene.Solo, "walk")
		
		aimCamera("cellblock_nearcells")
		setLocationName("Cellblock")
		
		saynn("[say=eliza]Here, that’s your cell[/say]")

		saynn("Doctor points at one of the cells. Each cell is a small room about 2x5 meters of space with some furniture inside: a bed that's built into the wall, a normal stool and a window outside. The door into the cell is always open but there seems to be a staff console nearby that might be able to control it.")

		saynn("[say=pc]So.. what now?[/say]")

		saynn("Doctor removes all the cuffs, unleashes you and puts the chain away before looking at you.")

		saynn("[say=eliza]Well, settle down, I need to go get coffee for myself[/say]")

		saynn("She gives you a last glance before leaving you at last, alone, near your new cell.")

		addButton("Walk inside", "Check it out", "walk_inside")

	if(state == "walk_inside"):
		removeCharacter("tavi")
		removeCharacter("eliza")
		aimCamera(GM.pc.getCellLocation())
		GM.pc.setLocation(GM.pc.getCellLocation())
		setLocationName("My new home")
		
		saynn("You step into your cell and take a look around.")

		saynn("The bed is awfully stiff, a single pillow and a blanket is all you get with it. Walls made out of solid metal with orange accents everywhere. A simple stool to sit on. Suddenly, you begin to feel the effects of an ftl jump, you feel extremely tired. Between sleeping naked and in your inmate clothes you pick the latter and just get into the bed. Yeah, your back won’t like any of this. But you push all the thoughts away and try to get some sleep. Not that much time passes before you slip into the darkness.")

		addButton("Wake up", "", "wake_up")

func _react(_action: String, _args):
	if(_action in ["walk_inside", "followtocell", "liftarrives", "open_mouth", "let_her_do_it"]):
		processTime(5 * 60)
		
	if(_action == "followtocell"):
		GM.pc.getInventory().removeItemFromSlot(InventorySlot.Wrists)
		GM.pc.getInventory().removeItemFromSlot(InventorySlot.Ankles)
	
	if(_action == "wake_up"):
		startNewDay()
		GM.pc.afterSleepingInBed()
		runScene("IntroWakeup")
		endScene()
		
	if(_action == "sneak_up"):
		GM.pc.addPain(30)
		
	setState(_action)

func _react_scene_end(_tag, _result):
	pass
