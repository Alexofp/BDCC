extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "NovaWonScene"

func _run():
	if(state == ""):
		addCharacter("nova")
		playAnimation(StageScene.Duo, "stand", {npc="nova", npcAction="kneel"})

	if(state == ""):
		saynn("Nova is defeated, she lets out a soft cry before losing her weapon and dropping down to her knees, her light power armor shuts down due to the capacitors being overloaded.")

		saynn("[say=nova]Grr-r.. that was so unfair.[/say]")

		saynn("The husky glares at you.")

		saynn("[say=pc]Says the one who brought a power suit to a fist fight?[/say]")

		saynn("Nova rolls her eyes and shuts up, focusing on getting her breathing right.")

		addButton("Leave", "Nova suffered enough", "leave")
		addButton("Power suit", "Her suit seems to be quite advanced, maybe it has some hidden functions", "power_suit")
		GM.ES.triggerRun("ArenaFighterPCWon", ["nova"])

	if(state == "leave"):
		saynn("[say=pc]Consider yourself lucky, I’m not gonna fuck you.[/say]")

		saynn("Nova raises her brow.")

		saynn("[say=nova]Why not?[/say]")

		saynn("That was a strange question. You crouch before the husky and look her into the eyes.")

		saynn("[say=pc]Because I don’t want to?[/say]")

		saynn("Nova tilts her head to the side, avoiding eye contact. You can tell she is blushing.")

		saynn("[say=nova]But.. You won. It would only be fair for you to do something with me![/say]")

		saynn("You offer the guard a few headpats, causing the husky’s tail to go wild. Then you just hop over the fence and go get your reward.")

		addButton("Continue", "Time to leave", "endthescene")


	if(state == "power_suit"):
		playAnimation(StageScene.Duo, "stand", {npc="nova", npcAction="allfours"})
		
		saynn("You notice something. Something very interesting. Nova seems to be wearing some kind of PDA with a screen on her wrist. You approach the husky and shove her onto the ground before pinning her arm with your leg. Nova is growling and snarling at you but she can’t do anything about you taking that device off of her wrist.")

		saynn("[say=nova]Hey! Bitch, that’s not for you to touch![/say]")

		saynn("You look at the thing, it looks like a mini-computer, has a screen and a few buttons and switches. As you try to press any button, a message appears that says ‘Authorization required’. Dammit.")

		saynn("[say=nova]Haha, you can’t do shit without my fingerprints.[/say]")

		saynn("Well, that might be true. You can’t. But Nova can. You move the PDA down to her hand and forcefully make the husky tap on the screen. She realizes the mistake she made and swiftly starts to growl and struggle again. But too late, the computer beeps happily and lets you in. So easy.")

		saynn("[say=nova]Bitch! Whatever. It’s just suit controls.[/say]")

		saynn("If she was so combative about it, surely there must be something special in there. You flick through the many menus, some screens show stats like how much power is left, some show controls for turning off and on certain pieces. Nothing interesting.")

		saynn("But then you stumble upon a menu entry that says ‘Debug’. This one is special because it’s colored in red while the rest of the options are blue. You select it and a huge list of strange options suddenly appears. ‘Self-binding’, ‘Shock play’, ‘Vibration’, ‘Deny mode’ and many more. The text on the side mentions some Syndicate hacking group and a link to an intergalactic web.")

		saynn("[say=pc]Oh wow, look at that. Your suit is hacked. By you.. You uploaded some sketchy firmware to it. Does the captain know about it?[/say]")

		saynn("Nova blushes instantly and desperately tries to reach you and snatch the PDA. You decide to instead select the first option, causing Nova’s suit systems to suddenly engage. Her wrist armor pieces begin magnetizing to each other. You stop pinning Nova’s arm and hear a satisfying metal clank as her wrists connect to each other behind Nova’s back, restraining her.")

		saynn("[say=nova]Fuck.. Don’t press anything![/say]")

		saynn("Of course you’re not gonna listen to her, you found such a cool toy. You step back a few times and explore the debug menu more. All the while Nova finds enough strength to stand up even with her arms tied. She then tries to pounce at you but just before she could do that, you press another button that causes her ankle armor pieces to snap to each other too, making her collapse instead. She whines and wiggles around on the floor like a cute worm, completely helpless.")

		saynn("[say=pc]Is that what you are doing during the night? Doing bondage using your own suit? Kinky, I must say.[/say]")

		saynn("[say=nova]Bitch, I will break you.[/say]")

		saynn("You press a button that says ‘Shock play’ and hear more whining as Nova’s suit sends little electricity shocks all throughout her body. The husky squirms and crawls around, unable to do anything else but to be forced to endure it.")

		saynn("[say=pc]What was that?[/say]")

		saynn("[say=nova]Fuck you..[/say]")

		saynn("Well that ain’t gonna cut it, you turn a dial that makes the shocks way more stronger, you can actually hear Nova’s suit buzz each time it uses energy to shock its wearer now. The husky cries out a moan and starts rolling around on the floor, all her muscles tense up and relax many times in a row, burning through stamina.")

		saynn("[say=nova]Fine! I’m sorry! Please! I will do anything![/say]")

		saynn("You turn down the shocks, letting Nova take a breather. The husky pants heavily and glares at you. You didn’t like that look she gave you so you press another button, it makes Nova’s wrists and ankles attract to each other, causing the husky to get hogtied. Now she can’t even crawl, more whining escapes from her maw, her eyes actually show she is sorry. No matter how much she wiggles and struggles, her electromagnetic restraints give absolutely zero room, that reactor on her back is doing wonders.")

		saynn("[say=pc]That’s what you get, brat. Now, what is this ‘Deny mode’? Guess we will find out in a second.[/say]")

		saynn("[say=nova]No! It will make me.. go insane..[/say]")

		saynn("That only made you even more curious, you press the button and notice how Nova’s suit pieces suddenly begin to.. vibrate. For now it’s mostly her crotch piece that is covered by her skirt. As you turn the dial up, the vibrations become more audible. It’s not too long before the husky starts wiggling harder and producing moans.")

		saynn("[say=pc]Oh wow, it can pleasure you. Bitch, you’ve been fucking with your suit and you’re calling me a slut?[/say]")

		saynn("You turn Nova around, making her lie on her side. Then you pull up her skirt and notice a huge wet bulge, under the vibrating crotch armor piece, her stretchy undersuit seems to hold her erection nicely.")

		saynn("You turn the dial up even more and now you hear her chest piece buzzing too, right under the spots where her nipples are. Nova opens her mouth and lets out more and more passionate moans, her eyes shift from sorry to lusty really fast.")

		saynn("It doesn’t take long for her to start shivering and squirming, Nova’s suit vibrates against her privates bringing her really close to her peak but as soon as it detects that, the strength of the vibrations cuts down tremendously, so much that the husky is unable to get off to that. She sticks her tongue out and drools while moaning desperately.")

		saynn("[say=nova]It stole my orgasm! F-fuck..[/say]")

		saynn("That’s cute. You wait a bit to let Nova cool down before turning up the dial again, causing the suit to vibrate loudly again. But the husky knows she will be robbed of her climax again, she eagerly humps the ground and actively tries to make the suit send her over the edge. But alas, the suit stops vibrating completely just before the point of no return, denying the guard.")

		saynn("[say=nova]No-o-o… Fuck.. I need it! Please! Please! Let me cum! Fuck me! Use me any way you want! I’m a slut! Just let me cum..[/say]")

		addButton("Deny", "Nope, Nova is not cumming today", "deny")
		addButtonWithChecks("Offer pussy", "Make her work for it", "offer_pussy", [], [ButtonChecks.HasReachableVagina])
		if(GM.pc.hasReachablePenis() || GM.pc.isWearingChastityCage()):
			addButtonWithChecks("Offer cock", "Make her work for it", "offer_cock", [], [])
		else:
			addDisabledButton("Offer cock", "You need a cock for this")


	if(state == "deny"):
		saynn("You crouch before the hogtied husky and move her loose hair strand out of the way. Nova’s eyes are slutty, hungry for release, she drools and moans desperately into your face.")

		saynn("[say=pc]I’m afraid, I can’t let you do that.[/say]")

		saynn("[say=nova]Wh-.. why.. wh- ah..[/say]")

		saynn("You move your lips to her ear and turn the vibrations up to full again while also checking an ‘auto’ box that will restart the cycle automatically. You whisper in the ear of the desperate dickgirl.")

		saynn("[say=pc]Because sluts like you need to learn their place.[/say]")

		saynn("You move away and watch how Nova begins to desperately squirm and wiggle again. Her suit vibrates against her nips and sheath, slowly making her go insane. Her undersuit looks all wet from the precum and girly juices near her crotch and there is nothing she can do to get that relief, she is forced to endure the pleasure and then experience it being stolen from her, it quickly becomes a torture.")

		saynn("You leave the PDA on the floor nearby and begin climbing up the fence. All the while Nova keeps moaning and squirming, entertaining the crowd. As the husky reaches her edge, her suit stops vibrating once again, making the girl thrash around in desperation. Just to begin vibrating half a minute later when the climax is far away again. So evil.")

		# (scene ends)
		addButton("Continue", "Time to leave", "endthescene")


	if(state == "offer_pussy"):
		# (needs pussy)
		playAnimation(StageScene.SexFaceSitting, "sit", {
			pc="pc", npc="nova", 
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={},
		})

		saynn("Hmm. Yeah, using a desperate husky for your pleasure sounds kinda nice about now. You expose your cute pussy slit and lie down before shoving your crotch into Nova’s face. The husky quickly realizes what she needs to do and starts eagerly nuzzling your pussy. She then sticks her tongue out and starts dragging it across the sensitive petals and the clit, making you moan. All the while the suit is still denying the husky time after time, turning her more desperate and subby.")

		saynn("[say=pc]Such a good girl~. Ready to do anything, even licking pussies.[/say]")

		saynn("Nova uses her tongue to spread your slit, she then finds the little entering and starts prodding at it. A few attempts and she manages to slip her wide canine tongue inside, sending waves of pleasure that bounce around inside you. The husky quickly finds the g-spot and starts tongue-fucking you, the desperate dickgirl is clearly going for efficiency here.")

		saynn("But it works, you start moaning louder, your body squirms around that tongue until the moment you are shoved over the edge. Your legs shake, your finger accidently hits the ‘allow to cum’ button on the PDA, causing Nova’s suit to keep vibrating no matter what. It only takes a few seconds before Nova starts moaning loudly too, her covered up cock is shooting cum inside the undersuit, creating quite a mess underneath. But she doesn’t care, she is arching her back and eagerly licking you through your orgasm, causing your pussy to squirt juices into the girl’s face. It feels so good!")

		# (if has cock)
		if(GM.pc.hasPenis()):
			saynn("Your own {pc.cock} starts shooting {pc.cum} onto Nova’s face and hair, making her look like a used cum slut!")

		saynn("You leave the PDA on the floor and stand up. Nova is panting heavily, her suit has stopped pleasuring her after she came.")

		saynn("[say=nova]F-f-fuuck.. uhhh-hah…[/say]")

		saynn("[say=pc]Good girl~. Take care now.[/say]")

		saynn("[say=nova]W-waai..t..[/say]")

		saynn("She is still restrained but you’re not planning to do anything about that, you are sure that she can somehow escape, it’s her personal suit after all. You get over the fence and go get your reward, leaving Nova alone with the hungry crowd.")

		# (scene ends)
		addButton("Continue", "Time to leave", "endthescene")


	if(state == "offer_cock"):
		# (needs cock)
		if(GM.pc.isWearingChastityCage()):
			playAnimation(StageScene.SexOral, "tease", {
				pc="pc", npc="nova", 
				bodyState={exposedCrotch=true,hard=true},
				npcBodyState={},
			})
			
			saynn("Hmm. Yeah, using a desperate husky for your pleasure sounds kinda nice about now. You expose your {pc.cock} and kneel before Nova, offering her some work. The husky quickly realizes what she needs to do and starts eagerly nuzzling your chastity cage. She then sticks her tongue out and starts trying to reach your member through it, making it feel good in the process. All the while the suit is still denying the husky time after time, turning her more desperate and subby.")
			
			saynn("[say=pc]Such a good girl~. Don’t stop, do it properly.[/say]")
			
			saynn("Nova parts her lips and lets the head of your caged up cock inside. She then starts licking it while moving her head up and down, slowly allowing more of you inside. The whole thing looks somewhat humiliating for her but she keeps trying to pleasure you, poking her tongue through the holes in your cage and rubbing your skin and the sensitive tip of a cock as best as she can.")
			
			saynn("And it works, you start moaning, your body squirms around that mouth until the moment you are shoved over the edge. Your {pc.cock} starts shooting {pc.cum} deep down the girl’s mouth, your finger accidently hits the ‘allow to cum’ button on the PDA, causing Nova’s suit to keep vibrating no matter what. It only takes a few seconds before Nova starts moaning loudly too, her covered up cock is shooting cum inside the undersuit, creating quite a mess underneath. But she doesn’t care, she is arching her back and eagerly abusing her throat on your cock through the orgasm, milking your balls for every last drop of {pc.cum}.")
		else:
			playAnimation(StageScene.SexOral, "sex", {
				pc="pc", npc="nova", 
				bodyState={exposedCrotch=true,hard=true},
				npcBodyState={},
			})
			
			saynn("Hmm. Yeah, using a desperate husky for your pleasure sounds kinda nice about now. You expose your {pc.cock} and kneel before Nova, offering her your shaft. The husky quickly realizes what she needs to do and starts eagerly nuzzling your cock. She then sticks her tongue out and starts dragging it across the length of your member, making it feel good. All the while the suit is still denying the husky time after time, turning her more desperate and subby.")

			saynn("[say=pc]Such a good girl~. Don’t stop, do it properly.[/say]")

			saynn("Nova parts her lips and lets the head of your cock inside. She then starts licking it while moving her head up and down, slowly allowing more of your shaft inside. The head of your cock quickly reaches the back of her mouth but she is too aroused to care about her gag reflex, she forces herself onto your member, allowing it to go down her throat, stretching it. Little tears escape from Nova’s eyes when she is gagging on your cock but she keeps deepthroating you like a good slut. The husky quickly finds a good rhythm and starts pleasuring you with both, her tight throat and her canine tongue, the desperate dickgirl is clearly going for efficiency here.")

			saynn("But it works, you start moaning, your body squirms around that mouth until the moment you are shoved over the edge. Your {pc.cock} starts shooting {pc.cum} deep down the girl’s throat, your finger accidently hits the ‘allow to cum’ button on the PDA, causing Nova’s suit to keep vibrating no matter what. It only takes a few seconds before Nova starts moaning loudly too, her covered up cock is shooting cum inside the undersuit, creating quite a mess underneath. But she doesn’t care, she is arching her back and eagerly abusing her throat on your cock through the orgasm, milking your balls for every last drop of {pc.cum}.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("Your neglected pussy sprays the floor with your juices, it just felt so fucking good!")

		saynn("After your orgasm is over, you pull your cock out and rub it dry against Nova’s cheek. You give her a strict look and after a few seconds you see her swallowing your load. You leave the PDA on the floor and stand up. Nova is panting heavily, her suit has stopped pleasuring her after she came.")

		saynn("[say=pc]Good girl~. Take care now.[/say]")

		saynn("[say=nova]W-waai..t..[/say]")

		saynn("She is still restrained but you’re not planning to do anything about that, you are sure that she can somehow escape, it’s her personal suit after all. You get over the fence and go get your reward, leaving Nova alone with the hungry crowd.")

		# (scene ends)

		addButton("Continue", "Time to leave", "endthescene")


func _react(_action: String, _args):
	if(_action == "offer_pussy"):
		GM.pc.orgasmFrom("nova")
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "nova_suitfuck")
	
	if(_action == "offer_cock"):
		getCharacter("nova").cummedInMouthBy("pc")
		GM.pc.orgasmFrom("nova")
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "nova_suitfuck")
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

