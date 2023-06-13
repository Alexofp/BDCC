extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "ForcedChastityScene1"

func _run():
	
	if(state == ""):
		aimCameraAndSetLocName("medical_confessionary")
		GM.pc.setLocation("medical_confessionary")
		playAnimation(StageScene.HangingSolo, "idle", {bodyState={naked=true}})
		
		saynn("As you open your eyes, you are immediately struck by a sense of disorientation and confusion. You try to lift your head, but it feels heavy and unsteady. Vision is blurry but you’re pretty sure your cell didn’t look like that before.. You’re not even lying on a bed, you’re.. hanging from the ceiling with your hands chained to it. You blink a few times, trying to clear your vision, and slowly the room comes into focus.")

		saynn("This room is small and cozy, with richly furnished walls made out of black concrete that are decorated with fancy paintings. The wooden floor beneath your feet is covered with a plush carpet that you can barely reach with your toes. You notice a nice chair and a soft-looking sofa made out of leather. But also a few sturdy metal hooks attached to the ceiling with your wrists chained to one of them.")

		saynn("[say=pc]Huh? Wha..[/say]")

		saynn("Slight panic settles inside you. You hear soft footsteps..")

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		addCharacter("eliza")
		playAnimation(StageScene.HangingDuo, "idle", {npc="eliza", npcAction="sit",
			bodyState={naked=true},
		})
		
		saynn("You try to resist the chains but you only make them rattle. And with how little leeway they offer, you can’t even take a step.")

		saynn("[say=eliza]How do you inmates wake up so early?[/say]")

		saynn("Doctor Quinn steps into the room, yawning. She holds her coffee mug that she takes a little sip out of. She gives you a quick look and then sits down on the chair, making herself comfy while you have to endure the cuffs and the chains that force your hands above your head.")

		saynn("You also suddenly realize that you’re naked. But you can’t even cover yourself, your {pc.penis} and {pc.breasts} are visible to the doctor.")

		saynn("[say=eliza]Only coffee makes me feel alive. Doing my job too actually.[/say]")

		addButton("Where am I", "Ask where are you", "where_am_i")

	if(state == "where_am_i"):
		saynn("[say=pc]Where am I? What is going on?[/say]")

		saynn("Your voice obviously sounds concerned. Eliza sips her coffee more while gesturing to you ‘one moment’. She then takes a deep breath before directing her attention to you.")

		saynn("[say=eliza]This room is special. It’s called ‘The Confessionary’. I ordered the nurses to bring you here.[/say]")

		saynn("[say=pc]Confessionary? I gotta confess to my sins?[/say]")

		saynn("Eliza offers you a cunning feline smile.")

		saynn("[say=eliza]People stopped doing that a while ago. But if you don’t understand why you are here, don’t worry about it.[/say]")

		saynn("The doctor finishes her coffee before placing the mug on a little round table. She takes off her lab coat and walks up to you.")

		saynn("[say=eliza]I just wanted to make sure you’re still wearing your cage. And it seems.. that you do. That’s great, isn’t it?[/say]")

		saynn("Eliza reaches out and cups your pair of orbs before tugging on your chastity cage, checking it. You can’t help but to squirm slightly while the doctor has her soft paws on your locked member and caressing it.")

		saynn("[say=eliza]How does it feel?[/say]")

		# (Options are Good, Awful, Why?)

		addButton("Good", "Tell her that it feels good", "good")
		addButton("Awful", "You don’t like the cage", "awful")
		addButton("Why?", "Ask the point of all of this", "why")


	if(state == "good"):
		saynn("[say=pc]It feels good..[/say]")

		saynn("Doctor shows off her smug expression and tries to keep an eye contact with you. Such invasion of privacy makes you blush and look away.")

		saynn("[say=eliza]That’s great~. I love the view of a locked chastity cage. It means the person has willingly given up their main pleasure source, their source of happiness.[/say]")

		saynn("Her paws land on your {pc.masc} thighs and slide up and down them, her wrists touch and rub against your balls on each peak.")

		saynn("[say=pc]I wasn’t willing though..[/say]")

		saynn("She purrs while you are exhaling audibly, your hands grab onto the chains that are connected to your cuffs.")

		saynn("[say=eliza]That doesn’t matter~. Just means that you haven't accepted it yet~.[/say]")

		saynn("The doctor plays with your ballsack more, fondling and teasing. Until a few drops of precum land on her paw. She sniffs her paw and then teasingly shows it to you before sticking her rough feline tongue out and making it look like she is about to start licking.")

		saynn("[say=eliza]Yes, sticking your member into someone’s holes feels good, I’m sure. But.. Well. We will talk about it some other time. I’m glad you like your cage~.[/say]")

		saynn("Eliza pulls her paw away from her maw and instead rubs the paw into your chest, spreading your own pre.")

		saynn("[say=eliza]Let’s just say there is more to life than just dicking each other~.[/say]")

		addButton("Continue", "See what happens next", "continue1")

	if(state == "awful"):
		saynn("[say=pc]It feels awful..[/say]")

		saynn("The doctor holds eye contact with you, her gaze reading your disappointment. You can’t help but to try to avoid her drilling eyes.")

		saynn("[say=eliza]You don’t like the cage? It looks so cute though.[/say]")

		saynn("Her paws land on your {pc.masc} thighs and slide up and down them, her wrists touch and rub against your balls on each peak.")

		saynn("[say=eliza]You think happiness is the ability to dick someone?[/say]")

		saynn("One paw keeps playing with your ballsack while another palms your cage.")

		saynn("[say=eliza]Chastity cage is about giving something up. Completely willingly. A sacrifice if you wanna call it like that.[/say]")

		# (if has vagina)
		if(GM.pc.hasReachableVagina()):
			saynn("Her paw goes further, sneaking behind your balls and landing on your pussy slit before reaching even further and brushing against your {pc.analStretch} tailhole.")

		# (else)
		else:
			saynn("Her paw goes further, sneaking behind your balls and landing your taint before reaching even further and brushing against your {pc.analStretch} tailhole.")

		saynn("[say=eliza]But in exchange.. You get something else, a different kind of pleasure. As long as you obey..[/say]")

		saynn("Eliza teases you until your caged up member leaks a few drops of precum onto her paw. She then pulls it away and sniffs your fluids before sticking her tongue out and almost licking them off but stopping at the last moment.")

		saynn("[say=eliza]The cage will stay until you understand that. And then some~.[/say]")

		saynn("Eliza pulls her paw away from her maw and instead rubs the paw into your chest, spreading your own pre.")

		addButton("Continue", "See what happens next", "continue1")

	if(state == "why"):
		saynn("The teasing made you sound almost desperate.")

		saynn("[say=pc]Why? Why did you put a cage on me? Why not everyone? What’s the point of all of this?[/say]")

		saynn("The doctor tilts her head to the side slightly, reading your expression with serious eyes. She is silent for a few seconds, waiting for you to let it all out.")

		saynn("[say=eliza]You’re that needy already? I will tell you why.[/say]")

		saynn("She reaches out for your balls and then squeezes them tightly to the point of it being uncomfortable. Her eyes stare directly into yours.")

		saynn("[say=eliza]The reason we do anything is because it generates value. Simple. If I’d be in charge, everyone around would be wearing cages unless allowed otherwise. But science requires us to test, to gather data and analyze.[/say]")

		saynn("Her paw switches to playing with your orbs, she lets them move around in her palm.")

		saynn("[say=eliza]Everyone is sacrificing something here. But you’re lucky. You can’t fuck a hole anymore but you actually get an ability to experience a different kind of pleasure.[/say]")

		saynn("So much teasing causes your member to leak out a bit of pre. Eliza catches it and sticks her tongue out, making it look like she is about to lick it off. But she doesn’t.")

		saynn("[say=eliza]As long as you obey and stop asking silly questions. You will learn to enjoy being caged. And I.. well..[/say]")

		saynn("Eliza pulls her paw away from her maw and instead rubs the paw into your chest, spreading your own pre.")

		saynn("[say=eliza]I will enjoy this~.[/say]")

		addButton("Continue", "See what happens next", "continue1")

	if(state == "continue1"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		
		saynn("Eliza takes a step back and grabs her lab coat, then puts it on.")

		saynn("[say=eliza]Well, that’s about all the time I have for you today. I will see you.. in five days. Make sure the cage is still there.[/say]")

		saynn("[say=pc]You said it’s permanent though, I can’t take it off even if I wanted to.[/say]")

		saynn("[say=eliza]Yes, you are right~.[/say]")

		saynn("And with that, Eliza unchains your cuffs from the ceiling. Before grabbing her empty coffee cup and letting you out.")

		addButton("Leave", "Step out of the room", "leave")

	if(state == "leave"):
		aimCameraAndSetLocName("medical_nearconfessionary")
		GM.pc.setLocation("medical_nearconfessionary")
		
		saynn("As you step out you realize that you’re on the medical floor. White sterile walls make you squint after being in the dimly lit room for so long.")

		saynn("Eliza follows you, the bulky door closes behind her, this one seems to require special access.")

		saynn("[say=pc]Weird place for a confession room.[/say]")

		saynn("[say=eliza]Think so? I think it’s just right~[/say]")

		saynn("She uncuffs and lets you go.")

		saynn("[say=eliza]See you, patient.[/say]")

		# (scene ends)

		addButton("Continue", "That was something", "endthescene")
		


func _react(_action: String, _args):
	if(_action in ["good", "awful", "why"]):
		GM.pc.addLust(30)
		
		setFlag("MedicalModule.Chastity_Event1Choice1", _action)
	
	if(_action in ["continue1", "leave"]):
		processTime(5*60)

	if(_action == "endthescene"):
		endScene()
		return

	
	setState(_action)

func getDevCommentary():
	return "Why did I write this? I mean.. There aren't that many games that just explore chastity play. Yes, there are games that have it. They usually also have feminization/sissification in them. I have zero problems with those kinks ^^ just wanted to write some femdom + chastity fun. These scenes also explore anal orgasms ^^. They are notoriously hard to achieve for some people so I kinda tried to show that in this content."

func hasDevCommentary():
	return true
