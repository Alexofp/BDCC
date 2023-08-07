extends SceneBase

func _init():
	sceneID = "Ch6TaviCorruption150Scene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "stand")
		saynn("You step into Tavi's cell.. it seems to be empty. Strange.")

		saynn("[say=pc]Tavi? Are you here?[/say]")

		saynn("You step into it further and then hear a voice..")

		saynn("[say=tavi]Behind you~.[/say]")

		addButton("Turn around", "See what's there", "look_at_tavi")
	if(state == "look_at_tavi"):
		addCharacter("tavi")
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcBodyState={naked=true}})
		saynn("As you turn around, you see.. Tavi.. with two firm demonic horns sticking out of her head.")

		saynn("She is completely naked, proudly presenting her sexy naked body. Her legs are spread a bit, allowing you to see her wet pussy dripping juices onto the floor. Tavi's lips are parted slightly as she is panting.")

		saynn("[say=pc]You.. changed.[/say]")

		saynn("She smiles kindly as she approaches you, swaying her hips wide and letting her breasts bounce. Her scent.. is intoxicating.")

		saynn("[say=pc]And I like it..[/say]")

		saynn("Tavi drags her clawed paw over your face features. Her claws seem to be much longer and sharper now too.. as is her tongue.")

		saynn("[say=tavi]Thank you.. owner.. I crave for so much more though..[/say]")

		saynn("Insatiable lust shines in her eyes. Tavi bites her lip while rubbing herself against you.")

		saynn("[say=tavi]Don't make me beg~.[/say]")

		saynn("It seems.. you gotta satisfy your new little succubus.")

		addButton("Let her bite", "Let Tavi bite you and satisfy her need", "let_bite")
		addButtonWithChecks("Blowjob", "Let Tavi suck the energy out of you", "let_suck", [], [ButtonChecks.HasReachablePenis])
		addButtonWithChecks("Pussy licking", "Let Tavi lick the energy out of you", "let_lick", [], [ButtonChecks.HasReachableVagina])
		addButtonWithChecks("Prostate milking", "Let Tavi milk the energy out of you", "let_prostate_milk", [], [ButtonChecks.HasPenis])
	if(state == "let_bite"):
		playAnimation(StageScene.Hug, "hug", {pc="tavi", npc="pc", bodyState={naked=true}})
		saynn("You don't know if this will work for her.. but you try anyway. You tilt your head to the side slightly, exposing more of your neck to Tavi. She instantly focuses on that spot and purrs softly.")

		saynn("[say=tavi]Don't mind me~.[/say]")

		saynn("Suddenly, Tavi pierces your throat with her sharp fangs. You grunt and feel.. paralyzed.. while Tavi starts sucking your blood.. your lifeforce.")

		saynn("Her eyes roll up, she is moaning passionately while feeding on your energy. All the while any signs of your lust.. fade away.")

		saynn("Tavi stops exactly when your head begins to spin. After retracting her fangs, she licks the two little wounds on your neck.. until they don't hurt anymore.")

		saynn("[say=tavi]Thank you, owner.. I belong to you.. Forever and ever~.[/say]")

		saynn("Who would have known that corrupting Tavi would have such an effect.")

		addButton("Continue", "That was fun", "start_talking")
	if(state == "let_suck"):
		playAnimation(StageScene.SexOral, "fast", {npc="tavi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("As soon as you expose your {pc.penis} and present it to Tavi.. she eagerly gets on her knees before you.")

		saynn("With a tantalizing flick of her tongue, Tavi starts wrapping it around your member, the length allows her to do it a few times, drawing out a few little moans from you in the process.")

		saynn("Her lips wrap around the tip as her rough tongue is working its magic that only a succubus could possess. Your hands find their way to Tavi's hair as she willingly accepts your length past her sharp teeth, even letting it bend and go down her tight throat.")

		saynn("[say=pc]Ngh-h..[/say]")

		saynn("Your fingers sift through her colorful hair strands as Tavi starts sucking your cock, sliding her head along its length while masterfully handling her gag reflex, even letting her throat purposefully clench around you.")

		saynn("[say=pc]Fuck..[/say]")

		saynn("The corners of her mouth are raised while she looks at you. A low purring begins escaping from her, resonating in your cock, bringing you extra pleasure. You feel like you won't be able to endure this for long..")

		saynn("Your hands find her new demon horns and grab onto them while you start face-fucking Tavi, shoving your cock deep down her throat, again and again.. The feline obediently lets you do that, her lusty eyes constantly focused on you while her throat is making all sorts of wet noises.")

		saynn("It doesn't take long for you to reach your peak. You grunt and shove your dick deep down that throat and grunt while an explosive orgasm overwhelms you. Tavi is still masterfully sliding her tongue over your throbbing length as your balls begin to tense up and your shaft begins to shoot thick spurts of your {pc.cum}, filling that needy belly.")

		saynn("[say=pc]Swallow it all..[/say]")

		saynn("The more she drains you.. the weaker you feel. Tavi is still purring while you hold onto her horns and keep grunting and squirming.")

		saynn("After the climax begins to fade.. you take a step back.. and see Tavi presenting you her mouth.. full of your seed. The feline swallows it all and smiles.")

		saynn("[say=tavi]Thank you so much, owner~.[/say]")

		saynn("Who would have known that corrupting Tavi would have such an effect.")

		addButton("Continue", "That was fun", "start_talking")
	if(state == "let_lick"):
		playAnimation(StageScene.SexOral, "grind", {npc="tavi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("As soon as you present your {pc.pussyStretch} pussy to Tavi, she eagerly gets on her knees before you and already brings her lips close to it. The warm breath makes your folds tingle..")

		saynn("A few seconds later, Tavi flicks her long tongue out and starts dragging over your sensitive bits, causing them to get wet. Your hand lands on her hair and gently strokes it while Tavi is teasing your pussy slit so well.")

		saynn("[say=pc]Ngh-h..[/say]")

		saynn("She finds the entrance itself and starts prodding at it.. until the pointy tip of her tongue slides inside, uncovering your moist depths. The feline starts lapping at your inner walls while her nose is pressed into your crotch, rubbing against your little clit.")

		saynn("[say=pc]Fuck..[/say]")

		saynn("You can't help but to grab those 2 new horns of hers and start dragging her face over your folds while also grinding back. All the while Tavi abuses the huge length of her tongue, fucking your pussy with it.")

		saynn("Passionate moans escape from you while you spread your juices all over Tavi's fur. At some point she starts purring, causing vibrations that make your mind all hazy from too much pleasure.")

		saynn("[say=pc]Ngh!.. Ah!..[/say]")

		saynn("Very quickly, you reach your peak. Your body starts shivering while Tavi eagerly opens her mouth and overstimulates you to the point of you squirting. She makes sure to swallow every drop of your girlcum.. while you are busy riding your orgasmic waves.. each one making you weaker and weaker.. At some point you have to use her horns just to support yourself.")

		saynn("After that explosive climax, you pull your pussy away from her.. and watch her satisfied eyes and a cute smile.")

		saynn("[say=tavi]Thank you so much, owner~.[/say]")

		saynn("Who would have known that corrupting Tavi would have such an effect.")

		addButton("Continue", "That was fun", "start_talking")
	if(state == "let_prostate_milk"):
		playAnimation(StageScene.SexOral, "tease", {npc="tavi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("As soon as you present your {pc.penis} and your {pc.analStretch} tailhole to Tavi, she eagerly gets on her knees before you.")

		if (GM.pc.isWearingChastityCage()):
			saynn("One of her paws lands on your chastity cage and gentle tugs on it while the second sneaks between your legs and finds your cute tailhole, one of the digits already prodding it.")

			saynn("She smiles and breathes warmly onto your locked member until it starts leaking precum. Tavi catches it onto her tongue and swallows it. So hot..")

			saynn("While she is distracting you, her digits gently work their way into your ass, stretching your hole enough to slide inside and find the little pleasure spot. Massaging it quickly makes you squirm and moan softly.")

			saynn("[say=pc]Ngh-h..[/say]")

			saynn("Tavi starts sucking on the tip of your metal chastity cage while putting more and more pressure on your prostate, kneading and hammering away at it. Your poor locked away member desperately tries to get hard, twitching in Tavi's mouth.. but no matter what, it's forced to be limp and just leak precum.")

			saynn("[say=tavi]Adorable.. Would you cum for me like a good {pc.boy}~?..[/say]")

			saynn("You grunt and grab onto her horns while she continues to finger your prostate, milking it for all of its transparent fluids. At some point a different feeling starts arising.. A feeling that you're about to..")

			saynn("[say=pc]F-fuck!..[/say]")

			saynn("Suddenly, your caged up cock starts throbbing and shooting weak spurts of {pc.cum} directly into Tavi's mouth. She doesn't stop milking you until your balls are completely empty. More moans escape from you while you feel weaker.. and weaker.. now having to use those horns for support.")

			saynn("Tavi waits for you to shoot your load.. Before showing it off to you and audibly swallowing.")

			saynn("[say=tavi]Thank you so much, owner~.[/say]")

			saynn("Who would have known that corrupting Tavi would have such an effect.")
		else:
			saynn("One of her paws lands on your shaft and has a grasp on it while the second sneaks between your legs and finds your cute tailhole, one of the digits already prodding it.")

			saynn("She smiles and breathes warmly onto your hard member until it starts leaking precum. Tavi catches the drop onto her tongue and swallows it. So hot..")

			saynn("While she is distracting you, her digits gently work their way into your ass, stretching your hole enough to slide inside and find the little pleasure spot. Massaging it quickly makes you squirm and moan softly.")

			saynn("[say=pc]Ngh-h..[/say]")

			saynn("Tavi flicks her tongue out and teases the tip of your cock while putting more and more pressure on your prostate, kneading and hammering away at it. Your member receives almost zero direct stimulation.. and yet, you're hard as a rock and leaking non-stop.")

			saynn("[say=tavi]Adorable.. Would you cum for me like a good {pc.boy}~?..[/say]")

			saynn("You grunt and grab onto her horns while she continues to finger your prostate, milking it for all of its transparent fluids. At some point a different feeling starts arising.. A feeling that you're about to..")

			saynn("[say=pc]F-fuck!..[/say]")

			saynn("Suddenly, your cock starts throbbing and shooting weak spurts of {pc.cum} directly into Tavi's mouth. She doesn't stop milking you until your balls are completely empty. More moans escape from you while you feel weaker.. and weaker.. now having to use those horns for support.")

			saynn("Tavi waits for you to shoot your load.. Before showing it off to you and audibly swallowing.")

			saynn("[say=tavi]Thank you so much, owner~.[/say]")

			saynn("Who would have known that corrupting Tavi would have such an effect.")

		addButton("Continue", "That was fun", "start_talking")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "look_at_tavi"):
		setFlag("TaviModule.Ch6TaviReceivedHorns", true)
		getCharacter("tavi").updateBodyparts()

	if(_action == "let_bite"):
		processTime(5*60)
		GM.pc.addPain(20)
		GM.pc.addLust(-200)
		GM.pc.addStamina(-50)
		addMessage("You feel weak..")

	if(_action == "let_suck"):
		processTime(5*60)
		GM.pc.addLust(-200)
		GM.pc.addStamina(-50)
		getCharacter("tavi").cummedInMouthBy("pc")
		GM.pc.orgasmFrom("tavi")
		addMessage("You feel weak..")

	if(_action == "let_lick"):
		processTime(5*60)
		GM.pc.addLust(-200)
		GM.pc.addStamina(-50)
		getCharacter("tavi").cummedInMouthBy("pc", FluidSource.Vagina)
		GM.pc.orgasmFrom("tavi")
		addMessage("You feel weak..")

	if(_action == "let_prostate_milk"):
		processTime(5*60)
		GM.pc.addLust(-200)
		GM.pc.addStamina(-50)
		getCharacter("tavi").cummedInMouthBy("pc")
		GM.pc.orgasmFrom("tavi")
		addMessage("You feel weak..")

	if(_action == "start_talking"):
		runScene("Ch6TaviTalkScene")
		endScene()
		return

	setState(_action)

func getDevCommentary():
	return "I had to add support of adding/removing bodyparts dynamically just for Tavi x3. You might think that its a simple problem, just store their bodyparts in a save. But what I decide to change Tavi's hair for example? Your old saves wouldn't update her hair then. Yeah, there is a way to hack it by writing functions that upgrade your saves. But.. I really don't like that solution.\n\nWhat I did is basically just adding certain bodyparts if a flag is set. It's simple, requires no hacks (almost x3) and gives me power to do anything while making it future-proof.\n\nWhy did I make it so Tavi grew horns? Her fur color is purple. I rest my case. x3"

func hasDevCommentary():
	return true
