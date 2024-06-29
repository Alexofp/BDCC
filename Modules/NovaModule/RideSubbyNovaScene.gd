extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "RideSubbyNovaScene"

func _run():
	if(state == ""):
		addCharacter("nova", ["naked"])
		playAnimation(StageScene.SexCowgirl, "sex", {
			npc="pc", pc="nova",
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={exposedCrotch=true,hard=true},
		})
		
	if(state == ""):
		saynn("[say=pc]Gonna have my fun with you~[/say]")

		saynn("You push Nova’s stun baton out of the way and begin stripping her out of her armor, all the pieces are connected with belts and electromagnetic locks but the generator that powers it all is out of charge so you can freely just yank them off, leaving the guard in her black skin-tight suit. You notice a bulge where her crotch is and bite your lip.")

		saynn("[say=nova]If you wanted my cock you could have just asked, sweetie[/say]")

		saynn("[say=pc]But that’s no fun~ I like being in control.[/say]")

		saynn("You begin unzipping her suit, exposing her d-cup breasts, a half-hard canine cock of a medium size, a pair of fluffy balls and a slit that hides behind them. The herm doesn’t seem to resist much. You give her breasts a firm smack and force a moan out of her.")

		saynn("[say=pc]What a slut~[/say]")

		# (if has clothing)
		if(!GM.pc.isFullyNaked()):
			saynn("You stand up and quickly strip out of your clothing, exposing your private bits for the guard to see, you feel excited already to ride that lollipop.")

		# (else)
		else:
			saynn("You’re naked already so you don’t have to strip, you flash your private parts to the herm and catch her hungry glance.")

		saynn("[say=nova]..can I touch?[/say]")

		saynn("You quickly realize how to make it more hot, you straddle the herm, squeezing her cock between your thighs and then go through her things, finding a pair of handcuffs and a ball gag. She protests but you catch her wrists and cuff them together before shoving a ball into her mouth, gagging and restraining her. She tries to say something but it comes out very muffled.")

		saynn("[say=pc]You can mumble and drool instead[/say]")

		saynn("A bright blush appears on her cheeks, her eyes look horny and subby. You begin teasing her cock, slowly grinding your cunt against its length and pressing it into her belly, Nova immediately reacts by breathing deeply, her cock quickly gets hard, it’s pointy tip leaking a bit of salty precum. But it also turns you on as well, your pussy spreading female juices across the herm’s shaft as you go back and forth in a slow loop, your paws land on Nova’s big breasts and grope them.")

		saynn("[say=pc]Oh yeah, you like that, dirty whore~?[/say]")

		saynn("Nova drools through her gag and nods subtly at you, she even shifts her hips opposite to you, increasing the pleasurable friction, you can feel the base of her cock slowly inflating into a knot. You raise your body a bit and get a hold of that shaft, your digits grab some precum from the tip and spread it along the whole length. Subby Nova quickly watches you guide her cock towards your wet pussy as you begin to descend onto it, the pointy tip spreads your petals apparts and stretches the hole enough to finally slide inside, forcing a moan out of you. Such a good feeling, her canine shaft goes deeper inside as you sit back down, you can feel it almost reaching your cervix already and it’s leaking so much pre already. Your hands squeeze the herm’s breasts harder, you wiggle your hips around the cock, Nova reacts by rolling her eyes up and warmly exhaling.")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("You begin to feel your chastity cage putting a lot of pressure onto your member due to how aroused you are. Nova seems to drool slightly more each time she catches its glimpse.")
		elif(GM.pc.hasPenis()):
			saynn("And your {pc.cock} is hard as a rock too due to how aroused you are, Nova seems to drool slightly more each time she catches its glimpse.")

		saynn("[say=pc]You’re pretty big~, happy to have your cock inside my cunt?[/say]")

		saynn("She nods eagerly as you begin to slowly rock your hips up and down, causing her length to rub against your soft lubed inner walls. You moan warmly and slide your hands along your own body, teasing your nips as you ride the herm. And she seems to enjoy it immensely, breathing heavily and making muffled noises of pleasure.")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("Your chastity cage is bobbing up and down, you’re dripping precum onto the guard’s belly and breasts.")
		elif(GM.pc.hasPenis()):
			saynn("Your cock is bobbing up and down in the air, dripping precum onto the guard’s belly and breasts.")

		saynn("You slowly pick up the pace, trying to get more of that husky dick inside you each time, your pussy petals meeting with that fat knot each time and stretching around it, though getting that whole thing in would require some extra effort, the tip pounding at the blockade, causing you to moan from pleasure.")

		saynn("You lean forward and start bouncing on her cock, your hands resting on the herm’s milkers as you force yourself onto that canine dick with high power. You pant heavily and feel that you’re not that far from the climax already. And the husky seems to be too, her knot has inflated to its max size and her cock is throbbing and twitching inside you with her balls heavy from so much stored cum.")

		saynn("[say=pc]Bet you would love to cum inside, huh? Get a chance to breed my little cunt? What if I steal your orgasm instead, deny it~?[/say]")

		saynn("Nova hears that and starts shaking her head and whining, she is so horny and needy that she rocks her hips too, trying to force herself over the peak.")

		addButton("Inside", "Let her cum inside your womb, ride the herm to the end", "inside")
		addButton("Outside", "Quit riding her before she cums", "outside")
		addButton("Get knotted", "Go the extra mile and try to take that knot in too", "get_knotted")
		addButton("Random", "Fifty fifty between cumming inside and outside in case you’re feeling risky but not too risky", "do_random")

	if(state == "inside"):
		playAnimation(StageScene.SexCowgirl, "fast", {
			npc="pc", pc="nova",
			pcCum=true, npcCum=true,
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={exposedCrotch=true,hard=true},
		})
		
		saynn("You don’t stop riding the herm, you feel your orgasm closing in, your body shivering, your hearts racing. Nova thrusts her hips and she is met with your own motions, you bounce hard on that cock while it’s canine shaft is wrecking your cervix each time, your stretched cunt squeezing around it.")

		saynn("Only a few more seconds pass before you reach your peak and then smash it, letting out a loud passionate moan as you arch your back and impale yourself onto that cock with the last huge thrust. And as you do that, Nova mumbles a muffled moan and cums too, her cock throbbing as it stuffs your womb with waves of sticky cum, her potent semen.")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("Some {pc.cum} suddenly escapes from your cage and lands on the husky, leaving a huge mess on her breasts and face in the process while she can’t even argue about it with that ball gag stuffed into her mouth.")
		elif(GM.pc.hasPenis()):
			saynn("Your own cock explodes with cum too, showering the husky with it, leaving a huge mess on her breasts and face in the process while she can’t even argue about it with that ball gag stuffed into her mouth.")

		saynn("[say=pc]Yes-s! Cum inside me, stuff my pussy full to the brim, use me as a cum bucket~[/say]")

		saynn("Your orgasms are strong, Nova doesn’t stop cumming inside until you fully empty her balls, you look down and see a slight bulge on your belly, it outlines your stuffed womb and the shape of the canine cock. Eventually you both ride your climaxes to the end, leaving you with a heavy breath. You carefully wiggle your hips, causing some of that trapped cum to start escaping and messing up Nova’s crotch.")

		saynn("[say=pc]Happy~?[/say]")

		saynn("You look Nova in the eyes and see a satisfied nodding husky that can’t seem to be able to stop drooling. You begin slowly raising up, your gaping used cunt leaking cum mixed with your girly juices. You grin and slowly catch your breath back.")

		saynn("[say=pc]Well, time for me to leave before someone spots me. Although I’m very curious how their faces will look when they find you like this~[/say]")

		saynn("Nova’s eyes open wide as she hears you, she tries to bite down on the gag harder and break the chain of the handcuffs but can’t, she is helpless.")

		# (if not naked)
		if(!GM.pc.isFullyNaked()):
			saynn("You grab your clothes and make your escape while you can.")

		# (else)
		else:
			saynn("You cover your stuffed cunt and make your escape while you can.")

		# (end of the scene)

		
		addButton("Continue", "Time to run", "endthescene")

	if(state == "outside"):
		playAnimation(StageScene.SexCowgirl, "tease", {
			npc="pc", pc="nova",
			pcCum=true, npcCum=true,
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={exposedCrotch=true,hard=true},
		})
		
		saynn("You feel how close Nova is to the peak and decide not to try your luck, you raise yourself and pull her shaft out before pushing it into her belly again and switching to grinding your slit against it. Nova protests but she is too close to do anything, it only takes a second before she suddenly cums. The husky lets out a muffled moan as her cock starts spewing out spurt after spurt of hot jizz back at the owner, Nova is covering herself in her own cum, her breasts, her face, even the hair. All the while you push yourself to your own climax, grinding that cock until your pussy squirts all over the guard’s crotch. You moan and push through the orgasm, draining that husky’s balls without a single drop landing inside your womb, such a clean job.")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("Though you can’t say that about Nova, during your orgasm your caged up cock cums as well and shoots more waves of cum that cover the poor herm with a second layer of sticky substance.")
		elif(GM.pc.hasPenis()):
			saynn("Though you can’t say that about Nova, during your orgasm your own cock cums as well and explodes with more waves of cum that cover the poor herm with a second layer of sticky substance.")

		saynn("Eventually you both ride your climaxes to the end, you pant heavily and look at what you did with the cheeky guard. Nova’s cheeks are burning from embarrassment but her eyes show satisfaction, she breathes heavily too, under all that cum.")

		saynn("[say=pc]Wow, look at yourself, such a cum slut~[/say]")

		saynn("You stand up and take a good last look at the herm, it was her fault, she was too cocky. You grin and slowly catch your breath back. You notice that Nova’s dick isn’t going down, it seems she is as horny as she was.")

		saynn("[say=pc]Well, time for me to leave before someone spots me. Although I’m very curious how their faces will look when they find you like this~[/say]")

		saynn("Nova’s eyes open wide as she hears you, she tries to bite down on the gag harder and break the chain of the handcuffs but can’t, she is helpless. Helpless and covered with cum.")

		# (if not naked)
		if(!GM.pc.isFullyNaked()):
			saynn("You grab your clothes and make your escape while you can.")

		# (else)
		else:
			saynn("You cover your cunt and make your escape while you can.")

		
		addButton("Continue", "Time to run", "endthescene")
	if(state == "get_knotted"):
		playAnimation(StageScene.SexCowgirl, "fast", {
			npc="pc", pc="nova",
			pcCum=true, npcCum=true,
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={exposedCrotch=true,hard=true},
		})
		
		saynn("You don’t stop riding the herm, you feel your orgasm closing in, your body shivering, your hearts racing. Nova thrusts her hips and she is met with your own motions, very strong motions. You bounce on that husky cock hard, the herm’s knot slaps against your pussy lips, trying to stretch them even more while the tip pounds at the cervix and tries to break in. You two are close.")

		saynn("You decide that it’s the time for the main event and do a series of very big thrusts, putting huge power into each one, your wet cunt slowly gives way and stretches beyond its stretched size, that knot begins to enter you at each apex of your motion and, on the last thrust, it suddenly manages to slip inside completely sealing your pussy hole. You both cum that very moment, your slit squirting with female juices while the husky cock breaks into your womb and starts stuffing it with her potent cum, such a risky move. You keep moaning, loudly and passionately, your belly looks inflated, the bump on it becomes bigger as the husky cums more and more, all of it going inside with the knot preventing any leaks. Fuck that feels good, you arch your back, stick your tongue out and pant heavily, your pussy keeps squirting even now from that huge amount of stimulation that the knot provides as it shifts inside you and stretches you out more.")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("Some {pc.cum} suddenly escapes from your cage and lands on the husky, leaving a huge mess on her breasts and face in the process while she can’t even argue about it with that ball gag stuffed into her mouth. Not that she would anyway, she looks spaced out after what happened.")
		elif(GM.pc.hasPenis()):
			saynn("Your own cock explodes with cum too, showering the husky with it, leaving a huge mess on her breasts and face in the process while she can’t even argue about it with that ball gag stuffed into her mouth. Not that she would anyway, she looks spaced out after what happened.")

		saynn("You slowly calm down from the incredibly intense orgasm. You can’t stop breathing heavily and husky too.")

		saynn("[say=pc]I’m such a slut for knots~[/say]")

		saynn("You try to stand up but you realize that you’re stuck, that knot isn’t gonna deflate any time soon. Nova’s eyes look beyond satisfied, though you do notice a cunning smirk too, looks like you managed to milk her out of all her cum. You rub your slightly inflated belly and try to relax, that knot was designed to keep you stuffed anyways so no point in trying to get it out.")

		saynn("About 30 minutes pass before the knot finally slips out, spawning a huge gush of cum from of your gaping cunt in the process, though most of it is still trapped inside your womb.")

		saynn("[say=pc]Well, about time. Gotta run, thanks for knotting me~[/say]")

		saynn("Nova’s eyes open wide as she realizes you won’t help her, she tries to bite down on the gag harder and break the chain of the handcuffs but can’t, she is helpless. Very satisfied and helpless.")

		# (if not naked)
		if(!GM.pc.isFullyNaked()):
			saynn("You grab your clothes and make your escape while you can.")

		# (else)
		else:
			saynn("You cover your gaping used cunt and make your escape while you can.")

		addButton("Continue", "Time to run", "endthescene")
		




		

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_random"):
		_action = RNG.pick(["inside", "outside"])
	
	if(_action == "outside"):
		GM.pc.orgasmFrom("nova")
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "nova_ridecock")
		GM.pc.gotVaginaFuckedBy("nova")

	if(_action == "inside" || _action == "get_knotted"):
		GM.pc.cummedInVaginaBy("nova")
		GM.pc.orgasmFrom("nova")
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "nova_ridecock")
		GM.pc.gotVaginaFuckedBy("nova")
		
	if(_action in ["outside", "inside", "get_knotted"]):
		GM.main.addRoomMemoryCurrentLoc("You notice some cum stains, a sign that somebody had sex here", 1)
	
	setState(_action)

