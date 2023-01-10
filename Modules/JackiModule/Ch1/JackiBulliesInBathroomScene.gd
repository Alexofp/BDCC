extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "JackiBulliesInBathroomScene"


func _run():
	if(state == ""):
		addCharacter("gymbully")
		addCharacter("gymbully2")
		addCharacter("gymbully3")
		
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="gymbully"})
		
		saynn("You walk into the bathroom and the first thing that you notice are three inmates. One of them, a girl, sits on the long counter with all the sinks. Another guy is relieving himself using one of the urinals. And the main guy just kinda standing in the middle, you can’t walk past him even if you wanted to. They all have uniforms with red colors but also red bands tied around their foreheads.")

		# (if have seen them before)
		if(getFlag("GymModule.Gym_BullyGangIntroduced")):
			saynn("You realize that you have seen them before.. They are the same group that hangs around the gym area, taking credits from inmates that wanna use the equipment.")

		saynn("The girl seems to be toying with something.. Something sharp. She notices you and a cunning smile appears on her canine face.")

		saynn("[say=gymbully3]Look! Another one![/say]")

		saynn("The main guy of the group directs his attention to you.")

		# (if has seen before)
		if(getFlag("GymModule.Gym_BullyGangIntroduced")):
			saynn("[say=gymbully]Oh, look who we have here. A familiar face. This bathroom costs 5 creds today. Pay up or leave.[/say]")

		# (else)
		else:
			saynn("[say=gymbully]Welcome. This bathroom costs 5 creds today. You can pay. Or you can leave.[/say]")

		saynn("[say=gymbully3]Yeah, bitch. Pay up or go piss somewhere else![/say]")

		saynn("Huh. They don’t seem very friendly.")

		addButton("Approach", "You’re not afraid of them", "approach")
		addButton("Leave", "You don’t feel like showering or going to the toilet anyway", "leave")

	if(state == "leave"):
		setFlag("JackiModule.BathroomBulliesSceneWillHappen", true)
		aimCameraAndSetLocName("gym_nearbathroom")
		GM.pc.setLocation("gym_nearbathroom")
		
		saynn("Instead of answering them you decide that it’s best to leave.")

		saynn("[say=gymbully3]Pfff, what a pussy.[/say]")

		saynn("Well, at least you still have your credits.")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")


	if(state == "approach"):
		saynn("Instead of pussying out you decide to approach them. The guy that was pissing finishes his deeds before joining the other two. He seems to be against the idea of washing hands. The girl has a huge grin on her face as she gets up onto the long counter and walks across it before jumping off behind you, she seems to be holding a weapon of sorts.")

		saynn("[say=gymbully]So? Does our offer interest you, kiddo?[/say]")

		saynn("You’re unsure what to say. Credits are quite valuable. The girl behind you makes sure there is no one outside the bathroom.")

		saynn("[say=gymbully3]We’re all alone~.[/say]")

		saynn("[say=gymbully]If our rates do not seem appealing, you can pay up differently.[/say]")

		saynn("Differently? You give the sleazy guy a questioning look.")

		saynn("[say=gymbully3]By being a toilet yourself![/say]")

		saynn("The girl behind you bursts from laughing. You’re not sure if she is being serious but the guy makes it clear.")

		saynn("[say=gymbully]Yeah. Being a meat toilet for an hour will give you access to this bathroom as well.[/say]")

		saynn("Wow. You’re not sure if you wanna ask what that entails.")

		# (options are Attack, Pay 5 creds, Leave)

		addButtonWithChecks("Pay 5 creds", "Pay them to make them leave maybe", "pay_5_creds", [], [[ButtonChecks.HasCredits, 5]])
		addButton("Attack", "Make them regret it", "attack1")
		addButton("Submit", "Become the meat toilet", "submit")
		addButton("Leave", "Try to leave", "leave1")


	if(state == "pay_5_creds"):
		# (needs 5 creds)

		saynn("[say=pc]What was the price?[/say]")

		saynn("The main guy smiles.")

		saynn("[say=gymbully]5 credits[/say]")

		saynn("You hand him a chip with 5 work credits.")

		saynn("[say=pc]Now can you leave this bathroom please?[/say]")

		saynn("[say=gymbully]..per minute.[/say]")

		saynn("Huh? You tilt your head slightly, trying to understand his words.")

		saynn("[say=gymbully]The rate of using this bathroom is 5 credits per minute. You’ve been standing here for about.. 4 minutes. Yes. So you owe us 15 more, kiddo.[/say]")

		saynn("The fuck is he talking about.")

		saynn("[say=gymbully3]Hahaha, look at {pc.him}. Confused as fuck. Pay, paypig![/say]")

		addButtonWithChecks("Pay 15 creds", "Well, might as well", "pay_15_creds", [], [[ButtonChecks.HasCredits, 15]])
		addButton("Attack", "Make them regret it", "returncredtisandattack")
		addButton("Leave", "Try to leave", "leave1")

	if(state == "pay_15_creds"):
		# (needs 15 creds)
		setFlag("JackiModule.BathroomBulliesPayed", true)

		saynn("You hand the guy the chip with 15 more credits. He seems satisfied enough.")

		saynn("[say=gymbully]My pleasure.[/say]")

		saynn("[say=gymbully3]Good pay pig~.[/say]")

		saynn("They let you pass them. You can’t help but to feel ripped off. But at least you weren’t turned into a meat toilet.")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")


	if(state == "returncredtisandattack"):
		# (gives back 5 creds)
		playAnimation(StageScene.Duo, "stand", {npc="gymbully3"})

		saynn("Instead of giving him what he wants, you steal the chip with your credits back and then kick the guy. He collapses onto the floor and grunts.")

		saynn("[say=gymbully]Ugh. Well, that wasn’t nice.[/say]")

		saynn("The second guy that was silent before now suddenly begins to step towards you but the girl stops him.")

		saynn("[say=gymbully3]Let me handle this one~. Hey, pay pig. Turn the fuck around before I stabbed you in the back.[/say]")

		saynn("You see that the girl is holding a shiv. A makeshift weapon that seems quite sharp.")

		saynn("The fight is inevitable.")

		# (fight button)
		addButton("Fight", "Begin the fight", "startfight")

	if(state == "leave1"):
		playAnimation(StageScene.Duo, "stand", {npc="gymbully3"})
		
		saynn("You feel that you’re done with this situation and try to leave. But the girl doesn’t let you, she holds a shiv! A makeshift sharp weapon.")

		saynn("[say=gymbully3]Where do you think you’re going? We’re not done with you yet, pay piggy~.[/say]")

		saynn("[say=gymbully]Yeah, we can’t let you go now I’m afraid.[/say]")

		saynn("The crazy girl moves the blade to her face and licks it before giggling.")

		saynn("[say=gymbully3]Let me handle this one~.[/say]")

		saynn("The fight is inevitable.")

		# (fight and submit buttons)

		addButton("Fight", "Begin the fight", "startfight")

	if(state == "attack1"):
		playAnimation(StageScene.Duo, "stand", {npc="gymbully3"})
		
		# (same at attack before but without giving the player 5 credits back)
		saynn("Instead of giving him what he wants, you kick the guy. He collapses onto the floor and grunts.")

		saynn("[say=gymbully]Ugh. Well, that wasn’t nice.[/say]")

		saynn("The second guy that was silent before now suddenly begins to step towards you but the girl stops him.")

		saynn("[say=gymbully3]Let me handle this one~. Hey, pay pig. Turn the fuck around before I stabbed you in the back.[/say]")

		saynn("You see that the girl is holding a shiv. A makeshift weapon that seems quite sharp.")

		saynn("The fight is inevitable.")

		addButton("Fight", "Begin the fight", "startfight")

	if(state == "if_won"):
		setFlag("JackiModule.BathroomBulliesWon", true)
		
		saynn("The girl falls to her knees and drops the weapon. You quickly grab it and point at the other gang members. They seem to be somewhat intimidated by it.")

		saynn("[say=gymbully3]Fucker![/say]")

		saynn("[say=gymbully]Fine-fine. You won this one. We will be leaving momentarily.[/say]")

		saynn("[say=gymbully3]I will claw {pc.his} eyes out![/say]")

		saynn("The guys grab the defeated girl under her armpits and drag her away while she cusses at you.")

		saynn("Well, that solved the problem. Now where is that wolfy?")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")


	if(state == "if_lost"):
		setFlag("JackiModule.BathroomBulliesLost", true)
		
		saynn("Since you lost the fight you can only submit to them now and see what happens.")

		# (submit button)
		addButton("Submit", "Become the meat toilet", "submit")


	if(state == "submit"):
		setFlag("JackiModule.BathroomBulliesSubmitted", true)
		# (they strip and tie you up to a urinal. They force a ring gag into your mouth)

		# (you can choose to be a cum toilet or a piss toilet)

		# (they do their thing and let you go)

		saynn("You raise your hands up slightly.")

		saynn("[say=pc]Fine.. I submit.[/say]")

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		playAnimation(StageScene.Urinal, "idle", {bodyState={naked=true}})
		
		# (if has clothing)
		if(!GM.pc.isFullyNaked()):
			saynn("Immediately the second guy grabs your arms before wrenching them behind your back while the girl {pc.undressMessageS}, exposing all your private bits. She then puts her shiv near your neck, threatening.")
		# (else)
		else:
			saynn("Immediately the second guy grabs your arms before wrenching them behind your back while the girl puts the shiv near your neck, threatening.")

		saynn("[say=gymbully3]Good choice~. Now say ahh-h~[/say]")

		saynn("You are happy to say no but the sharp tip of her weapon pokes you and reminds of its existence. You open your mouth and feel a ring gag being pushed past your lips a few seconds later, making you unable to close it anymore.")

		saynn("[say=gymbully]Now tie {pc.him} to the most clean one.[/say]")

		saynn("His goons pull you towards the urinals before using some stolen chains to tie your collar and wrists to one of the tubes. Then they pin you to the cold ceramic urinal before pulling you down to make you sit. After that they add extra chains under your knees that make you raise your legs and expose your private bits to anyone.")

		saynn("All you can do is say incoherent things while they check out the result. You tug on one of the chains but it doesn’t give, you are stuck helpless.")

		saynn("[say=gymbully3]Yeah, squirm all you want, meat toilet~. Who’s first?[/say]")

		saynn("[say=gymbully]You two have fun with {pc.him}, I’m fine.[/say]")

		addButton("Cum toilet", "Have them cum all over you", "cum_toilet")
		addButtonWithChecks("Piss toilet", "Have them piss all over you", "piss_toilet", [], [[ButtonChecks.ContentEnabled, ContentType.Watersports]])


	if(state == "cum_toilet"):
		setFlag("JackiModule.BathroomBulliesBecameCumToilet", true)
		
		saynn("The second guy pulls his canine cock out while the girl exposes her pussy. You can’t help but to drool while they both begin masturbating right in front of you.")

		saynn("[say=gymbully3]Oh yeah~. Hope you’re ready, little cum toilet.[/say]")

		saynn("The girl cums first, she fingers her pussy with two digits until it starts making wet noises and squirting transparent juices all over you. A few seconds later the guy starts to grunt as his throbbing cock shoots many strings of cum that land on your face and naked body.")

		saynn("You try to turn your head away but some cum and juices still end up landing on your tongue, letting you taste them.")

		saynn("[say=gymbully3]Fuck yeah~.[/say]")

		addButton("Continue", "See what happens next", "continue1")

	if(state == "continue1"):
		saynn("An entire hour passes during which various people come up to you, expose their cock or pussy and then masturbate before cumming all over you.")

		saynn("By the end of it you look like nothing but a cum-drenched dumpster of a toilet.")

		saynn("Eventually the gang walks up to you and finally unchains you.")

		saynn("[say=gymbully3]You’re free to use the bathroom now. You look like you need it~[/say]")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")


	if(state == "piss_toilet"):
		# (needs waterspots content)
		setFlag("JackiModule.BathroomBulliesBecamePissToilet", true)

		saynn("The second guy pulls his canine cock out while the girl exposes her pussy. You can’t help but to drool while they both begin looming over you, waiting for their urges to come.")

		saynn("[say=gymbully3]Oh yeah~. Hope you’re ready, little piss toilet.[/say]")

		saynn("Oh no, are they really gonna do it? The girl lets out a moan first, a strong stream of piss spawns from her piss hole and lands on you. She directs it to make sure your face, hair and {pc.masc} body all receive the golden shower.")

		saynn("A few seconds later the guy’s cock joins the girl’s pussy, a second stream of gross yellow fluid hits your chest and lower part of the body. Piss already drips from you as you try to avoid it getting into your mouth. But that’s really tough, impossible in fact, some of the pee lands on your tongue, very gross.")

		saynn("They piss for a while, their scent is forced into you and will be very hard to wash away.")

		saynn("[say=gymbully3]Fuck yeah~.[/say]")

		addButton("Continue", "See what happens next", "continue2")

	if(state == "continue2"):
		saynn("An entire hour passes during which various people come up to you, expose their cock or pussy and then piss all over you.")

		saynn("By the end of it you look like nothing but a piss-drenched dumpster of a toilet.")

		saynn("Eventually the gang walks up to you and finally unchains you, making sure to avoid touching your body.")

		saynn("[say=gymbully3]You’re free to use the bathroom now. You look like you need it~[/say]")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")


func _react(_action: String, _args):
	if(_action == "cum_toilet"):
		GM.pc.cummedOnBy("gymbully3")
		GM.pc.cummedOnBy("gymbully2")
		
	if(_action == "piss_toilet"):
		GM.pc.pissedOnBy("gymbully3")
		GM.pc.pissedOnBy("gymbully2")
	
	if(_action in ["continue1", "continue2"]):
		processTime(60*60)
	
	if(_action == "continue"):
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("ringgag"))
	
	if(_action == "startfight"):
		runScene("FightScene", ["gymbully3"], "gymbully3bathroomfight")
	
	if(_action == "pay_5_creds"):
		GM.pc.addCredits(-5)
	
	if(_action == "pay_15_creds"):
		GM.pc.addCredits(-15)
	
	if(_action == "returncredtisandattack"):
		GM.pc.addCredits(5)
	
	if(_action == "endthescene"):
		endScene()
		processTime(60*15)
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "gymbully3bathroomfight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("if_won")
			addExperienceToPlayer(50)
		else:
			setState("if_lost")
