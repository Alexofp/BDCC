extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "Ch2a2CorridorScene"


func _run():
	#if(state == ""):
	#	addCharacter("alexrynard")
		
	if(state == ""):
		playAnimation(StageScene.Solo, "stand")
		
		saynn("You approach the airlock that leads to some area you have no access to. But there is a little reinforced window. You peek through it and try to see anything interesting. It's just a bland corridor with a few doors and occasional engineers walking around. Not too useful.")

		saynn("You check the airlock controls. It’s a panel that requires a pin code or an id card. And you have none of these.")

		saynn("Maybe Tavi can think of something. Time to go.")

		addButton("Leave?", "See what happens next", "leave?")

	if(state == "leave?"):
		addCharacter("alexrynard")
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		
		saynn("But just before you can leave you see Alex Rynard walking up to you, he seems quite angry.")

		saynn("[say=alexrynard]Now wait a second. It’s my turn to ask questions.[/say]")

		saynn("He grabs you by the collar and shoves against the wall. Ow. It seems he snapped out of his working mood.")

		saynn("[say=alexrynard]How the heck did you know what happened with the bluespace transmitter? And that it even exist?[/say]")

		addButton("Intimidate", "Try to scare him", "intimidate")
		addButton("Excuses", "Try to lie yourself out of the situation", "excuses")
		addButton("Grab crotch", "Maybe you can soften him up by making him hard", "grab_crotch")



	if(state == "intimidate"):
		saynn("You break free of his grasp and push him back a bit.")

		saynn("[say=pc]It’s not your problem. And if you don’t want to end up in the medical wing you better stop asking questions.[/say]")

		saynn("The guy frowns at your response and keeps his shock remote ready.")

		# (if highsec)
		if(GM.pc.getInmateType() == InmateType.HighSec):
			saynn("[say=alexrynard]It doesn’t work like that, red. You better convince me real good if you don’t want your neck to be fried.[/say]")

		# (if general)
		if(GM.pc.getInmateType() == InmateType.General):
			saynn("[say=alexrynard]You ain’t got enough teeth to scare me, orange toy. But you better convince me real good if you don’t want your neck to be fried.[/say]")

		# (if lilac)
		if(GM.pc.getInmateType() == InmateType.SexDeviant):
			saynn("[say=alexrynard]A lilac sextoy is trying to scare me? That’s funny. You better convince me real good if you don’t want your neck to be fried.[/say]")

		saynn("He doesn’t seem to be overly intimidated by you, he needs answers that you really don’t wanna share.")


	if(state == "excuses"):
		saynn("You let him hold your collar and just raise your hands slightly to show that you mean no harm.")

		saynn("[say=pc]I just heard someone talk about it. Really. I’m fascinated by anything that involves bluespace.[/say]")

		saynn("He squints slightly.")

		saynn("[say=alexrynard]Who did you hear it from?[/say]")

		saynn("Oh no.")

		saynn("[say=pc]Uhh.. Risha?[/say]")

		saynn("Seems like that was a wrong answer because he frowns more.")

		saynn("[say=alexrynard]She is the last person who would care about that.[/say]")

		saynn("You put on a nervous smile and just shrug. The guy is clearly not buying it.")

	if(state == "grab_crotch"):
		saynn("Instead of trying to explain yourself, you just reach your hand out and put it on his pants. Your digits dig in and find the outline of his sheath before giving it a rub.")

		saynn("[say=pc]You like it~?[/say]")

		saynn("Foxy is more confused than anything by your act.")

		saynn("[say=alexrynard]Really? I asked you a question. The answer better be convincing.[/say]")

		saynn("It’s not working. But maybe you just need to double down on that tactic.")

		# (Options are Seduce, Attack, Surrender,)

	if(state in ["intimidate", "excuses", "grab_crotch"]):
		addButton("Seduce", "Maybe he will let you go if you make him feel good", "seduce")
		addButton("Attack", "Make him tell you the code", "attack")
		addButton("Surrender", "Stop resisting and see what happens", "surrender")


	if(state == "use_stun_baton"):
		# (nees a stun baton)
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard", npcAction="defeat"})

		saynn("While the foxy is busy holding your collar, your hand pulls out a contraband stun baton that you then quickly shove into the guy’s back, your digit finds the switch that makes it send out a powerful shock through the metal spine.")

		saynn("Foxy lets out a painful grunt and then collapses as his body gets stunned, a reaction much more powerful than you get normally. He seems to be unable to move his limbs at all.")

		saynn("[say=alexrynard]Aghrh.. Fuck![/say]")

		saynn("His loud scream was probably heard so you must act swift. You quickly get on top of him and threaten to do another strike.")

		saynn("[say=pc]What’s the code? Spill it or I will break your fucking back.[/say]")

		saynn("[say=alexrynard]4125. What are you gonna do with it?[/say]")

		saynn("[say=pc]That’s all I wanted.[/say]")

		addButton("Just leave", "He had enough", "just_leave")
		addButton("Hit him again", "Just so he doesn’t do anything stupid", "hit_him_again")


	if(state == "just_leave"):
		aimCameraAndSetLocName("eng_lobby")
		GM.pc.setLocation("eng_lobby")
		removeCharacter("alexrynard")
		addCharacter("maleguard_canine")
		
		saynn("You decide not to hit the poor foxy again, instead just leaving. And turns out, that was a great choice because outside of the engineering there is a guard patrolling the area. He sees you and frowns.")

		saynn("[say=maleguard_canine]What are you looking at, inmate? Stocks always have space for more fucktoys.[/say]")

		saynn("Phew, it seems he didn’t hear the foxy. You just politely ignore the guard’s words and walk past him.")

		# (Task completed, scene ends)
		addButton("Leave", "Time to go", "endthescene")

	if(state == "hit_him_again"):
		aimCameraAndSetLocName("eng_lobby")
		GM.pc.setLocation("eng_lobby")
		removeCharacter("alexrynard")
		addCharacter("maleguard_canine")
		
		saynn("You turn the stun baton again and press it against the guy’s chest, making him cry out from pain before losing his conciseness shortly after. The stick seems to be out of charge so you just throw it away.")

		saynn("Time to make your escape. You try to run away but it seems the loud screams were heard by someone.")

		saynn("[say=maleguard_canine]Where do you think you are going?[/say]")

		saynn("You stumble right into the sight of some guard. Seems like there is no other option but to fight.")

		addButton("Fight", "Fight the guard", "fight_guard")


	if(state == "if_lost_guard"):
		saynn("You drop to your knees, unable to fight anymore. The guard quickly apprehends you and cuffs your hands before clipping a leash to your collar.")

		saynn("[say=maleguard_canine]Stocks will be a good lesson for you, inmate.[/say]")

		saynn("He pulls on the leash, forcing you to stand up and follow him.")

		saynn("At least you know the code.")

		# (Task completed)

		addButton("Follow", "See where he brings you", "follow_guard")

	if(state == "follow_guard"):
		# (also runs a scene that pulls you towards the stocks)

		saynn("The guard opens the stocks and throws you into them before uncuffing your arms and trapping you in the metal contraption.")

		saynn("[say=maleguard_canine]Have fun being the prison’s bitch.[/say]")

		saynn("And then he just leaves you to be.")

		# (scene ends)
		addButton("Stocks", "See what happens next", "startStocks")


	if(state == "if_won_guard"):
		saynn("The guard drops to his knees and grunts.")

		saynn("[say=maleguard_canine]Lucky bitch..[/say]")

		saynn("Well, he is the lucky one here because you can’t stay here with him any longer, soon more guards will arrive. So you quickly make your escape.")

		# (Task completed, scene ends)
		addButton("Leave", "Time to run", "endthescene")


	if(state == "attack"):
		saynn("You clench your fists and prepare for a fight.")

		saynn("[say=pc]I need to get inside and you’re standing in my way.[/say]")

		saynn("[say=alexrynard]So? Move me then.[/say]")

		saynn("Seems he won’t just give up without a fight.")

		# (OPTIONS ARE FIGHT AND USE STUN BATON)

		addButton("Fight", "Begin the fight", "fight_foxy")
		if(GM.pc.getInventory().hasItemID("StunBaton")):
			addButton("Use stun baton", "Exploit his weakness", "use_stun_baton")
		else:
			addDisabledButton("Use stun baton", "You don't have one")

	if(state == "if_won"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard", npcAction="defeat"})
		
		saynn("Foxy drops to his knees, unable to continue fighting. You shove your leg into his back and overstress the motors in his spine, causing discomfort.")

		saynn("[say=alexrynard]Fuck![/say]")

		saynn("Someone probably heard the fight so you must act swift.")

		saynn("[say=pc]What’s the code? Spill it or I will break your back.[/say]")

		saynn("[say=alexrynard]4125. The fuck are you gonna do with it?[/say]")

		saynn("[say=pc]That’s all I wanted, foxy.[/say]")

		addButton("Leave him be", "He had enough", "leave_him_be")
		addButton("Knock him out", "Just to be safe", "knock_him_out")


	if(state == "knock_him_out"):
		aimCameraAndSetLocName("eng_lobby")
		GM.pc.setLocation("eng_lobby")
		removeCharacter("alexrynard")
		addCharacter("maleguard_canine")
		# (no encounter)

		saynn("You knock the foxy out by shoving him against the wall behind, causing his spine to spark and send out a painful signal to the rest of the body. Ow.")

		saynn("No time to wonder if he is fine though, time to make your escape. You try to run away but it seems someone heard the violence.")

		saynn("[say=maleguard_canine]Where do you think you are going?[/say]")

		saynn("You stumble right into the sight of some guard. Seems like there is no other option but to fight.")

		addButton("Fight", "Fight the guard", "fight_guard")


	if(state == "leave_him_be"):
		aimCameraAndSetLocName("eng_lobby")
		GM.pc.setLocation("eng_lobby")
		removeCharacter("alexrynard")
		addCharacter("maleguard_canine")
		# (guard encounter)

		saynn("You decide not to hit the poor foxy again, instead just leaving. And turns out, that was a great choice because outside of the engineering there is a guard patrolling the area. He sees you and frowns.")

		saynn("[say=maleguard_canine]What are you looking at, inmate? Stocks always have space for more fucktoys.[/say]")

		saynn("Phew, it seems he didn’t hear the foxy. You just politely ignore the guard’s words and walk past him.")

		# (Task completed, scene ends)
		addButton("Leave", "Time to go", "endthescene")


	if(state == "if_lost"):
		# (pretty much the same as surrender?)
		playAnimation(StageScene.Duo, "defeat", {npc="alexrynard"})

		saynn("You lost the fight. Unable to continue, you can only surrender now.")
		addButton("Surrender", "Stop resisting and see what happens", "surrender")


	if(state == "seduce"):
		playAnimation(StageScene.SexStanding, "tease", {
			pc="alexrynard", npc="pc", 
			bodyState={},
			npcBodyState={},
		})
		
		saynn("Instead of doing anything silly, you decide to go the path of less resistance and offer some value. Your hands slip under the guy’s uniform and give his strong torso some love. He doesn’t seem to be against your touches so you continue exploring his body.")

		saynn("You lean into him and purr ever so slightly while rubbing your cheek into his pecs through the shirt. Your hands slip lower and unbuckle the belt before sneaking under his pants and stumbling upon his sheath.")

		saynn("Some digits caress and cup his balls while another gives the tip of his canine cock a rub until the shaft starts leaving the contains. You look up at him with your lusty eyes and see him watching you work, soft playful growling escapes from his manly maw.")

		saynn("[say=alexrynard]Turn around, baby.[/say]")

		saynn("Ohh~ He is so eager. But you don’t mind that. In fact, you welcome it, pulling your hands away from his girth before turning around and slightly bending forward, offering him your {pc.thick} {pc.masc} butt.")

		# (if has clothes)
		if(!GM.pc.isFullyNaked()):
			saynn("Then you pull any clothes that were covering your rear down before spreading your cute buttcheeks for him, offering the guy a great view of your private bits.")

		# (else)
		else:
			saynn("And then you just spread your cute buttcheeks for him, offering the guy a great view of your private bits.")

		saynn("[say=pc]How do you wanna do it~?[/say]")

		addButton("Continue", "See what happens next", "after_seduced")

	if(state == "after_seduced"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		
		saynn("But instead of an answer, you feel him getting a hold of your arms and putting something on them. Zip ties! You gasp as he swiftly restraints you and then pins against the wall.")

		saynn("[say=pc]Uh.. kinky?..[/say]")

		saynn("[say=alexrynard]I’m not here to fuck inmates, no matter how slutty they act. Now tell me what the fuck was this all about. Spill it.[/say]")

		saynn("Seems you won’t be getting your sexy time. Telling him that you and Tavi want to call the Syndicate and destroy the prison won’t probably end well for you both.")

		saynn("[say=pc]I just wanted to look at it. Never seen anything like it.[/say]")

		saynn("He hears your excuses and growls before roughly pushing you against the wall again.")

		saynn("[say=pc]Ugh-h..[/say]")

		saynn("[say=alexrynard]I don’t trust you. I guess I will have to interrogate you.[/say]")

		saynn("Interrogate you? What is he talking about?")

		saynn("[say=pc]You gonna hurt me?[/say]")

		saynn("[say=alexrynard]Something much better.[/say]")

		saynn("He produces a lengthy piece of cable that he then ties to your collar, leashing you. A piece of dirty dark cloth gets wrapped around your eyes, blinding you. Then he just yanks you away from the wall and makes you follow him while your hands are still restrained.")

		# (follow)
		addButton("Follow", "See where he brings you", "follow_foxy")

	if(state == "surrender"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		
		saynn("You raise your hands and assume a submissive pose.")

		saynn("[say=pc]Fine, I give up.[/say]")

		saynn("Foxy immediately pushes you against the wall and wrenches your arms behind your back before restraining them with some zip ties, very secure ones that barely allow you any leeway.")

		saynn("[say=alexrynard]What the fuck was the plan. Spill it.[/say]")

		saynn("Telling him that you and Tavi want to call the Syndicate and destroy the prison won’t probably end well for you both.")

		saynn("[say=pc]I just wanted to look at it. Never seen anything like it.[/say]")

		saynn("He hears your excuses and growls before roughly pushing you against the wall again.")

		saynn("[say=pc]Ugh-h..[/say]")

		saynn("[say=alexrynard]I don’t trust you. I guess I will have to interrogate you.[/say]")

		saynn("Interrogate you? What is he talking about?")

		saynn("[say=pc]You gonna hurt me?[/say]")

		saynn("[say=alexrynard]Something worse.[/say]")

		saynn("He produces a lengthy piece of cable that he then ties to your collar, leashing you. A piece of dirty dark cloth gets wrapped around your eyes, blinding you. Then he just yanks you away from the wall and makes you follow him while your hands are still restrained.")

		addButton("Follow", "See where he brings you", "follow_foxy")

	if(state == "follow_foxy"):
		# (also runs a leashed scene)
		# Sybian scene here?
		aimCameraAndSetLocName("eng_breakroom")
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard",
			bodyState={exposedCrotch=true,},
		})

		saynn("He brings you somewhere.. You’re not quite sure where since the blindfold makes it very hard to orient yourself around.")

		saynn("You hear how Alex picks something up and does something. Then you hear static coming from across the room.")

		saynn("[say=alexrynard]Aw fuck, is the tv busted again.[/say]")

		saynn("TV? That only makes you more confused. Foxy pulls you somewhere and you feel yourself brushing against something soft below your waist, like a sofa.")

		saynn("[say=alexrynard]First I will deal with you, curious inmate. Do you know what happens to curious inmates?[/say]")

		# (if has clothes and pussy)
		if(GM.pc.hasVagina()):
			saynn("He removes enough of your clothes to expose your {pc.pussyStretch} pussy slit. He then slaps your exposed ass, making you blush from feeling so helpless.")

		# (if has clothes and no pussy)
		else:
			saynn("He removes enough of your clothes to expose your {pc.analStretch} tailhole. He then slaps your exposed ass, making you blush from feeling so helpless.")

		saynn("[say=alexrynard]Can’t hear you. And no, I won’t fuck you. Not taking any chances with the scum like you.[/say]")

		addButton("Shake head", "You don’t really know what answer he wants", "shake_head")

	if(state == "shake_head"):
		playAnimation(StageScene.Sybian, "idle", {bodyState={exposedCrotch=true,}})
		
		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("You just shake your head and then feel the leash pulling you down. You have to obey it or the collar will start choking you. As you get onto your knees you feel the foxy guiding you onto something. Some kind of.. seat? A very low seat, you have to spread your legs quite a bit to be able to sit on it. Your clit and some of your pussy are resting on a little ribbed platform and your holes are pressed against some kind of bumps..")

		# (else)
		else:
			saynn("You just shake your head and then feel the leash pulling you down. You have to obey it or the collar will start choking you. As you get onto your knees you feel the foxy guiding you onto something. Some kind of.. seat? A very low seat, you have to spread your legs quite a bit to be able to sit on it. Your taint area is resting on a little ribbed platform and your tailhole is pressed against some kind of bump.")

		saynn("[say=pc]What is this?..[/say]")

		saynn("[say=alexrynard]You can still tell me why you were spying around.[/say]")

		saynn("You stay silent as you can’t tell him anything.")

		saynn("[say=alexrynard]Well. Let’s see how long you can endure riding a sybian then.[/say]")

		saynn("A sybian? Oh no.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("Before you can resist it, the foxy produces more zip ties and starts tying your legs to the kinky seat. After that, he presses some buttons on it and the machine springs to life. The little bumps that are pressing against your holes are actually little dildos. They begin to slowly sink themselves inside you, stretching you out enough in the process.")

		# (else)
		else:
			saynn("Before you can resist it, the foxy produces more zip ties and starts tying your legs to the kinky seat. After that, he presses some buttons on it and the machine springs to life. The little bump that is pressing against your hole is actually a little curved dildo. It begins to slowly sink itself inside you, stretching you out enough in the process and finding your pleasure point.")

		saynn("[say=alexrynard]So? Last chance to save yourself.[/say]")

		saynn("But you can’t tell him the truth, all you can do is desperately wiggle against the zip ties that dig into your skin.")

		addButton("Stay silent", "You got nothing to say", "stay_silent")
		addButton("Taunt him", "Be a brat", "taunt_him")

	if(state == "taunt_him"):
		saynn("[say=pc]Turn it on already~.[/say]")

		saynn("You feel him grabbing your chin.")

		saynn("[say=alexrynard]So cheeky. We will see how quickly your tone will change.[/say]")

	if(state == "stay_silent"):
		saynn("Well, you would rather not tell him anything rather than humiliating yourself.")

		saynn("[say=alexrynard]We will see how quickly you will break.[/say]")

		# (part that’s the same)
	if(state in ["stay_silent", "taunt_him"]):
		playAnimation(StageScene.Sybian, "ride", {bodyState={exposedCrotch=true,}})
		
		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("He flicks some switch that makes the motors inside the sybian engage. You immediately let out a noise of pleasure as the ribbed panel under your clit starts to vibrate together with the dildos shifting inside you.")

		# (else)
		else:
			saynn("He flicks some switch that makes the motors inside the sybian engage. You immediately let out a noise of pleasure as the ribbed panel under your taint starts to vibrate together with the dildo shifting inside you.")

		saynn("[say=alexrynard]Enjoy yourself while you can.[/say]")

		saynn("Your body squirms on its own, each time you press your crotch into the vibrating seat, a spike of pleasure shoots through you, making you moan. But if you try to raise yourself, the zip ties dig into your skin harder which brings pain and discomfort instead of pleasure. You really got yourself into quite a predicament.")

		saynn("And all the while, the foxy seems to be busy fixing the tv. A slap later and the static that you’ve been hearing all this time is replaced by some AlphaCorp propaganda news. You can’t see it obviously but you hear a very enthusiastic voice explaining how many new worlds and planets were freed from enslavement that is The Syndicate. The foxy seems to just drop his butt onto the sofa, relaxing.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("You can’t focus on the surroundings for very long, the two dildos inside you slide in and out at a steady rate before the motors inside them turn on as well, providing extra pleasure. You can’t help but to moan while your clit and the pussy lips get stimulated by the little pad. Very soon after that your first orgasm overwhelms you, making you quiver around the machine hard while it continues to push you further past your peak.")

		# (else)
		else:
			saynn("You can’t focus on the surroundings for very long, the dildo inside you slides in and out at a steady rate before the motors inside it turn on as well, providing extra pleasure. You can’t help but to moan while your taint area gets stimulated by the little pad. Very soon after that your first orgasm overwhelms you, making you quiver around the machine hard while it continues to push you further past your peak.")

		# (if has cock)
		if(GM.pc.hasPenis()):
			saynn("Your {pc.cock} starts throbbing and shooting its load onto the floor before you. It feels so good to have your prostate stimulated from both sides.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("Very soon you find yourself shivering and leaning to the sides, trying to escape the vibrations. Your private bits are very sensitive after your climax but the machine doesn’t care, it just keeps stimulating your clit and the g-spot inside your slit.")

		# (else)
		else:
			saynn("Very soon you find yourself shivering and leaning to the sides, trying to escape the vibrations. Your private bits are very sensitive after your climax but the machine doesn’t care, it just keeps stimulating your pleasure point inside your butt.")

		saynn("[say=alexrynard]Ready to give up yet? [/say]")

		addButton("Moan", "That’s all you can offer him", "moan")
		addButton("Resist", "This is too much!", "resist")

	if(state == "resist"):
		saynn("Instead of answering, you just resist as you can, trying to escape the overstimulation of your bits. It helps, up to a point. Eventually the zip ties dig into your skin so much that it becomes painful. You wiggle your bound arms and legs to try and free them but can’t, they are secured tight so you are forced to endure the discomfort together with your bits being stimulated.")

		saynn("[say=alexrynard]Well, since you don’t wanna talk..[/say]")

		# (same as moan from here)

	if(state == "moan"):
		saynn("Instead of answering, you just part your lips and moan passionately, there is no escaping the overstimulation of your bits so you don’t even try. Your noises are louder than the tv so the foxy is approaching you, probably annoyed.")

		saynn("[say=alexrynard]Well, since you’re so loud. And also don’t wanna tell me anything..[/say]")

		# (same stuff for resist from here)

	if(state in ["moan", "resist"]):
		removeCharacter("alexrynard")
		
		saynn("You feel a red ball being pushed past your lips, forcing your mouth to stay opened. You can’t do anything about it while the foxy secures the ballgag’s harness around your head. Your loud noises suddenly become muffled and quiet, you can’t stop yourself from drooling while the sybian brings you closer to another climax.")

		saynn("[say=alexrynard]Much better. I will return.. hmm.. tomorrow. To see if you got broken yet.[/say]")

		saynn("Oh no. Is he planning to keep you here on the vibrating seat for the whole night? You try to tell him not to but can only make muffled noises while another orgasm overwhelms you.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("Your overstimulated pussy squirts and showers the sybian with your female juices. You arch your back and squirm, causing the pain from the zipties and pleasure from the little dildos combine in a spicy mix of otherworldly sensations.")

		# (else)
		else:
			saynn("Your overstimulated anus clenches around the vibrating rod hard. You arch your back and squirm, causing the pain from the zipties and pleasure from the little dildo combine in a spicy mix of otherworldly sensations.")

		# (if has cock)
		if(GM.pc.hasPenis()):
			saynn("Your balls are resting on the vibrating ribbed panel and are getting milked dry, you waste another load messing up the floor before you. But only the foxy can see how big of a mess you made.")

		saynn("[say=alexrynard]Mhm. Enjoy your stay.[/say]")

		saynn("And just like that, he stands up, turns off the tv and leaves you alone. Alone with the sybian that wants to make you cum and cum again.")

		addButton("Continue", "See what happens next", "startsybian")



	if(state == "startsybian"):
		# (restores some pain maybe so you don’t get softlocked out of struggling)

		saynn("You can’t see anything. And you can’t escape. Your private bits are super sensitive again after you came. You feel like you won’t be able to resist anymore after the next orgasm so you gotta do something now, while you still can!")

		# (Options are Endure, Struggle and Escape if there are no restraints anymore)


	if(state == "sybian"):
		playAnimation(StageScene.Sybian, "ride", {bodyState={exposedCrotch=true,}})
		
		var lustLevel = GM.pc.getLustLevel()
		# (if low lust)
		if(lustLevel < 0.2):
			# (if has pussy)
			if(GM.pc.hasVagina()):
				saynn("You’re still recovering after your last orgasm so you can think straight at least. But the sybian is relentless, the two dildoes buzz inside you while pressing against all your sensitive points.")

			# (else)
			else:
				saynn("You’re still recovering after your last orgasm so you can think straight at least. But the sybian is relentless, its dildo buzzes inside you while pressing against your sensitive points.")

		# (if > 20% lust)

		# (if has pussy)
		elif(lustLevel < 0.4):
			if(GM.pc.hasVagina()):
				saynn("You try to relax and get some strength back. Your pussy and ass are becoming less sensitive so the vibrations are slowly turning you on again. You can’t help but to let out a muffled noise of pleasure.")

			# (else)
			else:
				saynn("You try to relax and get some strength back. Your ass is becoming less sensitive so the vibrations are slowly turning you on again. You can’t help but to let out a muffled noise of pleasure.")

		# (if > 40% lust)

		# (if has pussy)
		elif(lustLevel < 0.6):
			if(GM.pc.hasVagina()):
				saynn("Your pussy gets stimulated more and more, all you hear is that buzz. But it feels so good.. You can’t just sit still on the machine anymore, you shift constantly while your toes curl up sometimes.")

		# (else)
			else:
				saynn("Your ass gets stimulated more and more, all you hear is that buzz. But it feels so good.. You can’t just sit still on the machine anymore, you shift constantly while your toes curl up sometimes.")

		# (if > 60% lust)

		# (if has pussy)
		elif(lustLevel < 0.8):
			if(GM.pc.hasVagina()):
				saynn("You can’t stop moaning, your pussy is dripping juices onto the machine. You can’t stop squirming which makes you tug against the zip ties involuntary. You feel like you don’t have much time, the pleasure slowly fills your mind.. Maybe you shouldn’t resist it?..")

		# (else)
			else:
				saynn("You can’t stop moaning, your tailhole is clenching around the little vibrating dildo. You can’t stop squirming which makes you tug against the zip ties involuntary. You feel like you don’t have much time, the pleasure slowly fills your mind.. Maybe you shouldn’t resist it?..")

		# (if > 80% lust)

		# (if has pussy)
		else:
			if(GM.pc.hasVagina()):
				saynn("Oh no, you feel the next climax creeping on to you. A very powerful one. Your needy slit is squirting a little while it's being edged, your muffled moans are resonating in your head. If you cum now you won’t be able to resist it any longer.")

				# (else)
			else:
				saynn("Oh no, you feel the next climax creeping on to you. A very powerful one. Your needy tailhole is clenching more and more while you’re being edged, your muffled moans are resonating in your head. If you cum now you won’t be able to resist it any longer.")

	if(state in ["startsybian", "sybian"]):
		if(GM.pc.getLustLevel() >= 1.0):
			addDisabledButton("Endure", "You're too horny to endure this..")
		else:
			addButton("Endure", "Try to gather some strength in the process", "endure")
		addButtonWithChecks("Struggle", "Resist against your restraints!", "struggle", [], [ButtonChecks.HasStamina])
		addButton("Give up", "It’s just too much..", "give_up")
		if(GM.pc.hasBlockedHands() || GM.pc.hasBoundArms() || GM.pc.hasBoundLegs()):
			addDisabledButton("Escape", "You can't escape because of the restraints")
		else:
			addButton("Escape", "You’re free!", "escape")


	if(state == "escape"):
		playAnimation(StageScene.Solo, "stand")
		
		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("You swiftly get off the sybian and can finally get a breather. Your legs shake a little, your pussy is tingling. Waves of heat spread out throughout your body. The two orgasms that you got were enough, any more and you think you would lose it.")

		# (else)
		else:
			saynn("You swiftly get off the sybian and can finally get a breather. Your legs shake a little, your butt is tingling. Waves of heat spread out throughout your body. The two orgasms that you got were enough, any more and you think you would lose it.")

		saynn("With no blindfold on, you can now look around the room. It seems to be some kind of staff resting room. A few chairs and sofas, a table with a coffee maker, a few plants dotted around the corners, a tv.")

		saynn("While preparing to leave you notice something quite interesting. There is a huge board on one of the walls. There are many little notes on it.")

		# (scene ends, Board action is done in-world)
		
		addButton("Board", "Go look at it", "board")

	if(state == "board"):
		saynn("You walk up to the board and see something interesting. One of the notes says the following:")

		saynn("[b]ATTENTION! THE NEW CODE IS 4125[/b]")

		saynn("Is that what you think it is? It must be. Tavi should be proud of all the challenges you had to get through to get that code.")

		# (Task completed)

		# (scene ends)
		addButton("Leave", "Time to go", "endthescene")

	if(state == "give_up"):
		playAnimation(StageScene.Sybian, "intense", {pcCum=true, bodyState={exposedCrotch=true,hard=true}})
		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("It’s just too much, you succumb to the constant source of pleasure and quit resisting completely. Very soon after a third orgasm overwhelms you, making your pussy squirt out all the femcum that it had. You moan like a desperate slut and let yourself enjoy this one fully.")

		# (else)
		else:
			saynn("It’s just too much, you succumb to the constant source of pleasure and quit resisting completely. Very soon after a third orgasm overwhelms you, making your anal ring get tight around the vibrating tip. You moan like a desperate slut and let yourself enjoy this one fully.")

		# (if has cock)
		if(GM.pc.hasPenis()):
			saynn("Your balls are dry so all your cock can do is drip {pc.cum} and throb a lot.")

		saynn("You realize that this is only the beginning.. But you don’t care, you’re already spacing out. Your tongue is drooling onto yourself while you begin to ride the sybian yourself.")

		addButton("Time passes", "See what happens next", "time_passes")

	if(state == "time_passes"):
		saynn("Hours pass.. Or were those just minutes? Days? You don’t know, your mind is busy bathing in this sea of pleasure. You don’t even feel satisfied after cumming again and again, you need more!")

		addButton("Time passes again", "See what happens next", "time_passes_again")

	if(state == "time_passes_again"):
		saynn("You feel drowsy, each orgasm drains you. Your mind gets a huge injection of endorphins each time but your body just can’t take it anymore.. But it feels so-o-o good.. More..")

		saynn("The sound of your moans mixed together the sybian vibrating against your private bits has become so normal..")

		saynn("Welcome to day "+str(GM.main.getDays())+" of your sentence")

		addButton("Time?", "Something will happen next?", "time?")

	if(state == "time?"):
		addCharacter("alexrynard")
		
		saynn("Your bits are getting irritated from so much stimulation.. You probably came like a hundred times.. Or not.. You don’t even know anymore. All you feel is constant pleasure..")

		saynn("Suddenly someone takes off your blindfold. It’s Alex! Your eyes squint from the light. Weak moans escape from your dry lips.")

		saynn("[say=alexrynard]Good morning, inmate. You made quite a mess, huh.[/say]")

		saynn("He turns off the machine and you suddenly feel the world flip upside down on you. You don’t feel yourself being fucked anymore. But the phantom vibrations are still there.. So you still moan..")

		saynn("[say=alexrynard]Wow, this really had fucked you up, huh? So? Gonna talk?[/say]")

		saynn("He unlocks the gag and takes off the harness. You can actually close your mouth now. It feels so weird..")

		saynn("[say=pc]A-ah..h..[/say]")

		saynn("[say=alexrynard]Really?[/say]")

		saynn("He grabs you by the collar.")

		saynn("[say=alexrynard]You want another day like this? A week? Tell me what the fuck was your plan?[/say]")

		saynn("You’re ready to melt. A cute smile shows up on your face, you don’t even care anymore.")

		saynn("[say=alexrynard]I see. Maybe you just wanted to end up like this. Stocks it is then, I wanna watch tv without some slut moaning all the time.[/say]")

		saynn("Stocks? Is he serious? Didn’t you have enough?")

		addButton("Continue", "See what happens next", "learn_code_before_stocks")

	if(state == "learn_code_before_stocks"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		
		saynn("He clips a leash to your collar and helps you to get up by undoing the zip ties that were holding you on the sybian before pulling you off of it. Your legs shake but you somehow get up and follow him.")

		saynn("You notice something interesting in the corner of your vision. There is a giant board on one of the walls with many notes on it. One of the notes says the following:")

		saynn("[b]ATTENTION! THE NEW CODE IS 4125[/b]")

		saynn("Is that what you think it is? It must be. Tavi is better be grateful because of all the things you had to go through.")

		saynn("But the foxy doesn’t let you stand around for too long, he yanks you towards the exit.")

		# (TASK COMPLETED)

		addButton("Follow", "See where he brings you", "follow2")

	if(state == "follow2"):
		# (also launches a paraded on a leash scene)

		saynn("Foxy brings you to the stocks area and quickly shoves you into the free set before locking you.")

		saynn("[say=alexrynard]Here we are. Enjoy your stay as a prison’s toy.[/say]")

		saynn("After that he just walks away, leaving you alone with the whole station.")

		# (scene ends)
		addButton("Stocks", "See what happens next", "startStocks")


func _react(_action: String, _args):
	if(_action == "follow_guard"):
		runScene("ParadedOnALeashScene", ["maleguard_canine", GM.pc.getLocation(), "main_punishment_spot", [
			"Walk faster, inmate",
			"I don't have all day",
			"Stocks are waiting for you",
			"I like my job, showing inmates like you their place",
		]])
	
	if(_action == "follow2"):
		runScene("ParadedOnALeashScene", ["alexrynard", GM.pc.getLocation(), "main_punishment_spot", [
		]])
	
	if(_action == "follow_foxy"):
		runScene("ParadedOnALeashScene", ["alexrynard", GM.pc.getLocation(), "eng_breakroom", []])
	
	if(_action == "time_passes_again"):
		GM.main.startNewDay()
		GM.pc.afterSleepingInBed()
	
	if(_action in ["time_passes_again", "time?", "time_passes_again", "time_passes"]):
		processTime(RNG.randi_range(70,120)*60)
		
	
	if(_action == "use_stun_baton"):
		processTime(2*60)
		setFlag("TaviModule.ch2AlexUsedStunbaton", true)
		setFlag("TaviModule.ch2PCLearnedCode", true)
		addMessage("Task completed!")
		addExperienceToPlayer(100)
		GM.pc.getInventory().removeXOfOrDestroy("StunBaton", 1)
		setFlag("PortalPantiesModule.Alex_BusyDays", 1)

	if(_action == "board"):
		setFlag("TaviModule.ch2PCLearnedCode", true)
		setFlag("TaviModule.ch2EscapedSymbian", true)
		addMessage("Task completed!")
		addExperienceToPlayer(150)
	
	if(_action == "learn_code_before_stocks"):
		setFlag("TaviModule.ch2PCLearnedCode", true)
		setFlag("TaviModule.ch2EnduredSymbian", true)
		addMessage("Task completed!")
		addExperienceToPlayer(100)

	if(_action == "fight_guard"):
		runScene("FightScene", ["maleguard_canine"], "guardfight")
		return

	if(_action == "fight_foxy"):
		runScene("FightScene", ["alexrynard"], "alexfight")
		setFlag("TaviModule.ch2AlexAttacked", true)
		return

	if(_action == "startStocks"):
		GM.pc.removeAllRestraints()
		runScene("StocksPunishmentScene")
		endScene()
		return
		
	if(_action in ["surrender", "after_seduced"]):
		processTime(5*60)
		GM.pc.removeAllRestraints()
		var zipties = GlobalRegistry.createItem("ZiptiesWrist")
		zipties.setRestraintLevel(3)
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(zipties)
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("blindfold"))

	if(_action == "shake_head"):
		processTime(5*60)
		var zipties = GlobalRegistry.createItem("ZiptiesAnkle")
		zipties.setRestraintLevel(4)
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(zipties)

	if(_action in ["stay_silent", "taunt_him"]):
		GM.pc.orgasmFrom("alexrynard")
	if(_action in ["moan", "resist"]):
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("ballgag"))
		GM.pc.orgasmFrom("alexrynard")
		
	if(_action == "endure"):
		processTime(5*60)
		GM.pc.addLust(20)
		GM.pc.addStamina(50)
		GM.pc.addPain(-10)
		setState("sybian")
		addMessage("You got some strength back")
		return
	
	if(_action == "struggle"):
		processTime(5*60)
		runScene("StrugglingScene", [true, false], "strugglesybian")
		setState("sybian")
		return
		
	if(_action == "escape"):
		processTime(5*60)
		GM.pc.freeEyesDeleteAll()

	if(_action == "time?"):
		GM.pc.removeAllRestraints()
	
	if(_action == "give_up"):
		GM.pc.orgasmFrom("pc")

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "strugglesybian"):
		addMessage("The sybian makes it very hard to concentrate")
		GM.pc.addLust(20)
		setState("sybian")
	
	if(_tag == "guardfight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		#var wonHow = _result[1]
		
		if(battlestate == "win"):
			setState("if_won_guard")
			addExperienceToPlayer(50)
		else:
			setState("if_lost_guard")
			addExperienceToPlayer(10)
	if(_tag == "alexfight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		#var wonHow = _result[1]
		
		if(battlestate == "win"):
			setState("if_won")
			setFlag("TaviModule.ch2AlexAttackedAndWon", true)
			setFlag("TaviModule.ch2PCLearnedCode", true)
			addMessage("Task completed!")
			addExperienceToPlayer(100)
			setFlag("PortalPantiesModule.Alex_BusyDays", 1)
		else:
			setState("if_lost")
			addExperienceToPlayer(20)
