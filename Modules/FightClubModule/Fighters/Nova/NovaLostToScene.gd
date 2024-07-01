extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "NovaLostToScene"

func _run():
	if(state == ""):
		addCharacter("nova")
		playAnimation(StageScene.Duo, "kneel", {npc="nova"})

	if(state == ""):
		saynn("Nova watches you collapse and puts her weapon away. You lost and are unable to fight anymore, you keep panting heavily, trying to fix your breath at least.")

		saynn("[say=nova]Aww, look at you. Why did you think you could win against mommy?[/say]")

		saynn("She steps closer to you and playfully tugs on her skirt. Her face expression is so eager, you’re able to sniff a strong horny scent coming from under her undersuit already.")

		saynn("[say=nova]Gonna play nice and call me mommy? I could always breed you rough instead.[/say]")

		saynn("Mommy? What is she talking about.")

		addButton("Get fucked", "See what happens next", "get_fucked")
		GM.ES.triggerRun("ArenaFighterPCLost", ["nova"])

	if(state == "get_fucked"):
		playAnimation(StageScene.Duo, "kneel", {
			npc="nova", npcAction="stand", 
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={},
		})
		
		saynn("[say=pc]I won’t call you anything, do your worst![/say]")

		saynn("Nova chuckles and pulls out a remote. She presses a button on it that makes your collar beep like it’s about to shock you. You close your eyes and brace but nothing happens. She crouches nearby.")

		saynn("[say=nova]You can’t out-brat a brat, cutie. Fine, let’s have some fun~. If I feel any resistance, the next one will knock you out.[/say]")

		# (if clothed)
		if(!GM.pc.isFullyNaked()):
			saynn("She {pc.undressMessageS}, leaving you completely naked!")

		saynn("She produces quite a few bdsm restraints and lays them out before you. Firstly, she restraints your arms behind your back with some sturdy metal cuffs. You don’t resist and let her do it, holding your arms like she asks you to and waiting for her to be done. Then she does the same but with your ankles, cuffing them together so you can’t even walk or spread your legs.")

		saynn("[say=pc]Using your personal cuffs on me?[/say]")

		saynn("Nova doesn’t react verbally, instead she shoves a red shiny ball into your mouth before locking the whole harness around your head, gagging you.")

		saynn("[say=nova]So much better. You can drool all you want~.[/say]")

		saynn("You turn your head towards Nova and frown, you indeed can’t close your mouth, forced to drool. You let out a muffled gasp when the guard produces a thick long piece of cloth, it’s clearly a blindfold! You like seeing what happens to you so you swiftly begin to struggle and shake your head, voicing your protest any way you can.")

		saynn("[say=nova]Really, cutie? You lost, fair and square. Need another reminder?[/say]")

		saynn("Seeing her reach for her remote makes you stop resisting. You tilt your head down and wait as Nova starts wrapping the cloth around your eyes before tying it up behind your head, stealing your vision. Everything is so dark..")

		saynn("[say=nova]Much better, but that’s not everything.[/say]")

		saynn("What else? All your limbs are restrained, you can’t bite or even see Nova. Suddenly you feel her inserting something into your ears.. earplugs.. very advanced ones.. ones that actively remove any sounds by canceling them with its own noise.")

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		playAnimation(StageScene.Solo, "walk", {
			bodyState={naked=true,},
		})
		
		saynn("Suddenly everything goes completely silent. No Nova, no crowd, no room ambience. You shake your head but no, your blindfold and earplugs sit very tight. Oh no, you’re in complete isolation! All you feel is the floor underneath and your deep breathing.")

		saynn("That’s not right, it feels weird, you try to get up but can’t, your cuffed legs only allow you to get to a kneeling position. And with no support from your arms, all you can do is drop onto the floor again and begin crawling forward, hoping that you will hit the fence. You crawl like a worm, wiggling your whole body and using arms and legs to push yourself forward.")

		saynn("Suddenly you feel your naked {pc.masc} butt smacked firmly! Ow! And again! You let out a noise that you can’t even hear, the plugs block any vibrations of your skull too. You quit wiggling, hoping that it would make Nova stop. But it doesn’t, your butt is spanked again and again until it’s red. Desperate, you begin to crawl faster. Gotta get to the fence!")

		saynn("There is something strange about the feeling of being this helpless. Something so oddly enjoyable. You don’t feel like you are in any danger but being in this precarious situation.. is so hot..")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("Your exposed pussy becomes wet with arousal, your subby inner self is cheering loudly. Suddenly Nova’s hand is thrusted between your legs and rubs your sensitive folds before slipping in a buzzing toy! Fuck, it feels so good, you let out a silent moan and arch your back, begging for it to buzz stronger.")

		# (else if has cock)
		elif(GM.pc.isWearingChastityCage()):
			saynn("Your {pc.cock} is hard as a rock, your subby inner self is cheering loudly. Suddenly Nova’s hand reaches for your balls and gives them a squeeze before rubbing your chastity cage. Then the hand moves down to your tailhole and prods it before slipping in a buzzing toy! Fuck, it feels so good, you let out a silent moan and arch your back, begging for it to buzz stronger.")
		elif(GM.pc.hasPenis()):
			saynn("Your {pc.cock} is hard as a rock, your subby inner self is cheering loudly. Suddenly Nova’s hand reaches for your balls and gives them a squeeze before rubbing your shaft. Then the hand moves down to your tailhole and prods it before slipping in a buzzing toy! Fuck, it feels so good, you let out a silent moan and arch your back, begging for it to buzz stronger.")

		# (else)
		else:
			saynn("Suddenly Nova’s hand lands on your tailhole and prods it a few times before slipping in a buzzing toy! Fuck, it feels so good, you let out a silent moan and arch your back, begging for it to buzz stronger.")

		saynn("Finally, you reach the fence. You wiggle around and catch the chain links with your restrained hands. Then you get onto your knees again and this time you barely manage to get up using the fence as a support. Although, the small victory got quickly stolen from you as Nova attaches something to your collar.. It's a leash! She yanks you away from the fence into more darkness, forcing you to hop around on your restrained feet. Then she lets go of the leash, leaving you.. somewhere.. You can’t be sure..")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("You’re so turned on just imagining how you look from everyone's perspective, your needy pussy is dripping juices down your thighs.")

		# (else if has cock)
		elif(GM.pc.hasPenis()):
			saynn("You’re so turned on just imagining how you look from everyone's perspective, your {pc.cock} is hard and dripping precum onto the floor.")

		saynn("The toy is buzzing inside you, slowly making you go insane..")

		addButton("Continue", "See what happens next..", "getused")

	if(state == "getused"):
		playAnimation(StageScene.SexStanding, "sex", {
			pc="nova", npc="pc", 
			pcCum=true, npcCum=true,
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={naked=true,hard=true,},
		})
		
		saynn("Complete darkness.. Complete isolation.. Heavy pants and soft moans escape into the abyss, your knees are touching together so as to not make the toy fall out.")

		saynn("You swear you can feel Nova standing somewhere near. You turn to face her just to experience your {pc.breasts} being smacked. Ow! You drool profusely and moan desperately into the void.")

		saynn("Seconds pass.. You bend forward and look down while the toy inside you slowly pushes you further to your orgasm. With no other sensory input, focusing on it makes you feel so good..")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("Suddenly you feel your collar grabbed, the hand makes you bend forward lower and stick your butt out. Then another hand lands on your {pc.thick} butt and pulls you back onto a hard cock! Your sensitive pussy folds get spread open by a pointy meaty tip that gets shoved inside a second later, causing you to drop another moan.")

			saynn("Yes! Please! The toy still buzzes inside you while the canine-shaped cock starts fucking your needy pussy. You don’t resist and instead move your hips to meet Nova’s motions as she thrusts inside. The hands hold you in place while Nova’s hips are slapping against your buttcheeks, your soft inner walls welcoming the knotted cock and becoming more slick from precum and your juices.")

			saynn("You feel like you won’t endure this for long, loud silent moans escape from you before your body starts shaking and shivering, your {pc.vaginaStretch} pussy leaking femcum onto the floor. The sudden orgasm is so strong that your restrained legs give up. You fall onto your knees and get caught by Nova as she now holds onto your restrained arms while still pounding your cunt.")

			saynn("The toy is still buzzing inside against your pleasure spot and Nova’s cock. Your mind is blanking from the constant flow of pleasure, even more passionate noises escape from your gagged mouth as the fat orb begins to slap against your pussy, trying to penetrate it. Nova is clearly trying to knot you, in front of everyone.. It’s not for you to decide anyways, you’re very much helpless with all these restraints on..")

			saynn("Nova’s thrusts become more and more powerful, her knot starts to stretch your slit wider before one last thrust that forces it inside! You cum instantly as Nova’s cock breaks through your cervix and suddenly starts stuffing your womb full of dickgirl’s cum. You moan into nothingness while your body squirms and shivers.")

			# (if has cock)
			if(GM.pc.isWearingChastityCage()):
				saynn("All the while your own {pc.cock} shoots waves of cum somewhere forward, creating a mess. Wearing chastity only made this moment more special.")
			elif(GM.pc.hasPenis()):
				saynn("All the while your own {pc.cock} shoots waves of cum somewhere forward, creating a mess.")

			saynn("After Nova is done cumming inside you, she roughly pulls her cock out and lets go of your hands, causing you to fall forward with your stuffed pussy pointed up and leaking. The buzzing toy flows out of your used fuckhole together with the stream of cum. Wow, you’re such a slut.")

		# (if no pussy)
		else:
			saynn("Suddenly you feel your collar grabbed, the hand makes you bend forward lower and stick your butt out. Then another hand lands on your {pc.thick} butt and pulls you back onto a hard cock! Your {pc.analStretch} tailhole gets spread open by a pointy meaty tip that gets shoved inside a second later, causing you to drop another moan.")

			saynn("Yes! Please! The toy still buzzes inside you while the canine-shaped cock starts fucking your needy star. You don’t resist and instead move your hips to meet Nova’s motions as she thrusts inside. The hands hold you in place while Nova’s hips are slapping against your buttcheeks, your soft inner walls welcoming the knotted cock and becoming more slick from her precum.")

			saynn("You feel like you won’t endure this for long, loud silent moans escape from you before your body starts shaking and shivering. The sudden orgasm is so strong that your restrained legs give up. You fall onto your knees and get caught by Nova as she now holds onto your restrained arms while still pounding your fuckhole.")

			saynn("The toy is still buzzing inside against your pleasure spot and Nova’s cock. Your mind is blanking from the constant flow of pleasure, even more passionate noises escape from your gagged mouth as the fat orb begins to slap against your hole, trying to penetrate it. Nova is clearly trying to knot you, in front of everyone.. It’s not for you to decide anyways, you’re very much helpless with all these restraints on..")

			saynn("Nova’s thrusts become more and more powerful, her knot starts to stretch your tailhole wider before one last thrust that forces it inside! You cum instantly as Nova’s cock breaks deep inside and suddenly starts stuffing your butt full of dickgirl’s cum. You moan into nothingness while your body squirms and shivers.")

			# (if has cock)
			if(GM.pc.isWearingChastityCage()):
				saynn("All the while your own {pc.cock} shoots waves of cum somewhere forward, creating a mess. Wearing chastity only made this moment more special.")
			elif(GM.pc.hasPenis()):
				saynn("All the while your own {pc.cock} shoots waves of cum somewhere forward, creating a mess.")

			saynn("After Nova is done cumming inside you, she roughly pulls her cock out and lets go of your hands, causing you to fall forward with your stuffed tailhole pointed up and leaking. The buzzing toy flows out of your used fuckhole together with the stream of cum. Wow, you’re such a slut.")

		# (end)

		saynn("What now.. You still pant heavily. Is Nova gonna leave you like this.. Used.. in front of a whole crowd.. Not saying a single word..")

		saynn("Time to try and leave..")

		# (scene ends)

		addButton("Continue", "Time to leave", "endthescene")


func _react(_action: String, _args):
	
	if(_action == "get_fucked"):
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmateanklecuffs"))
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmatewristcuffs"))
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("ballgag"))
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("blindfold"))
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("bondagemittens"))
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("ropeharness"))
		GM.pc.addLust(50)
	
	if(_action == "getused"):
		if(GM.pc.hasVagina()):
			GM.pc.gotVaginaFuckedBy("nova")
			GM.pc.cummedInVaginaBy("nova")
		else:
			GM.pc.gotAnusFuckedBy("nova")
			GM.pc.cummedInAnusBy("nova")
		GM.pc.cummedOnBy("nova")
		GM.pc.orgasmFrom("nova")
		GM.pc.addSkillExperience(Skill.SexSlave, 40, "nova_bdsmfuck")
		GM.pc.addSkillExperience(Skill.BDSM, 30, "nova_bdsmfuck")

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

