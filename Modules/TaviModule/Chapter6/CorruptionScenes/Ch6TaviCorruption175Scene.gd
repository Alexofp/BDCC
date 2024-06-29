extends SceneBase

var stoleVirginity = false
var impregnationSuccess = false

func _init():
	sceneID = "Ch6TaviCorruption175Scene"

func _run():
	if(state == ""):
		addCharacter("tavi", ["naked"])
		playAnimation(StageScene.Solo, "stand")
		saynn("Tavi is turned away from you as you step into her cell. Her feline tail is wagging slightly.")

		saynn("[say=pc]How is my little succubus doing?[/say]")

		saynn("You hear cute giggling from her that resonates against the walls with a slight sinister undertone.")

		saynn("[say=tavi]I think this is it~.[/say]")

		saynn("You slowly approach her, trying to figure out what she is looking at.")

		saynn("[say=tavi]I think my transformation is complete~. Wanna see it?[/say]")

		saynn("Her words make you a little bit concerned. How bad could it be..")

		saynn("[say=pc]Sure, impress me.[/say]")

		addButton("Continue", "See what happens next", "tavi_turns_around")
	if(state == "tavi_turns_around"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcBodyState={naked=true}})
		saynn("Tavi turns around, presenting herself to you. The swaying of her hips draws you to her crotch.. Tavi's pussy is dripping juices profusely, hinting at her heat. But more importantly, there is a.. mark.. on her crotch.. A fancy mark, composed of many intricate curved lines, outlining a womb.")

		saynn("[say=tavi]It just appeared~. Well, not just..[/say]")

		saynn("Tavi slowly approaches you. Her scent.. incredibly arousing.")

		saynn("[say=tavi]It's all thanks to you.. My owner.[/say]")

		saynn("She leans in closer, her paws land on your chest and gently caress it.")

		saynn("[say=tavi]Without you, I would have never become like this.. I wouldn't be able to uncover my true potential..[/say]")

		saynn("Her lips kiss your neck, leaving burning marks on your skin. She continues to cover your exposed features with lots of little smooches until her mouth ends up near your ear.")

		saynn("[say=tavi]What do you say.. Do you want to use me like your little slut.. And finally impregnate me.. Put a huge litter into my belly.[/say]")

		if (GM.pc.hasReachablePenis()):
			pass
		elif (GM.pc.isWearingChastityCage()):
			saynn("You would be hard as rock.. if only you weren't wearing chastity.")

			saynn("[say=pc]But I'm wearing a cage..[/say]")

			saynn("Tavi smiles.")

			saynn("[say=tavi]We can think of something~.[/say]")

		elif (GM.pc.hasReachableVagina()):
			saynn("You would be hard as rock.. But you can't really do that.. All you have is a pussy.")

			saynn("[say=pc]I can't impregnate you even if I wanted to..[/say]")

			saynn("Tavi smiles.")

			saynn("[say=tavi]Trust me, you can~.[/say]")

		else:
			saynn("You would be hard as rock.. But you lack anything capable of impregnating her sadly.")

		addButton("Not today", "Impregnating Tavi isn't on your today's tasklist", "not_today")
		addButtonWithChecks("Breed", "Satisfy Tavi's heat", "do_breed", [], [ButtonChecks.HasReachablePenis])
		addButtonWithChecks("Tribadism", "Rub pussies together with Tavi and see what happens", "do_trib", [], [ButtonChecks.HasReachableVagina])
		addButtonWithChecks("Chastity breed", "Let Tavi find a way to impregnate herself", "do_chastity_breed", [], [ButtonChecks.IsWearingChastityCage])
	if(state == "not_today"):
		playAnimation(StageScene.Hug, "hug", {pc="tavi", npc="pc", bodyState={naked=true}})
		saynn("[say=pc]It's okay, Tavi. I like the mark though.[/say]")

		saynn("Tavi smirks and then suddenly bites into your neck, her sharp fangs penetrating your flesh before she starts feeding on your blood.")

		saynn("[say=pc]Ah.. ah-..[/say]")

		saynn("The more she does, the weaker you get. All your lust seems to be extinguishing hers. After she is done feeding, she licks the little wounds that she left, helping them to heal quickly.")

		saynn("[say=tavi]Excuse me, owner~. I just had to.[/say]")

		saynn("Fair enough. You hug her back.")

		addButton("Continue", "See what happens next", "start_talking")
	if(state == "do_breed"):
		playAnimation(StageScene.SexCowgirl, "sex", {npc="tavi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("The moment you start talking about breeding, Tavi suddenly tackles you and pins you to the floor with her body, straddling you. Her pussy is already grinding against your cock, her eyes glow with a captivating allure, her little smile making you lightheaded.")

		saynn("[say=tavi]Let me try~.[/say]")

		if (stoleVirginity):
			saynn("Even though she is a virgin, Tavi seems to just.. know.. what to do. She raises herself a little and hovers while her paws guide your {pc.penis} directly down her pristine moist tunnel of love that's protected by the last remaining symbol of her purity.")

			saynn("Tavi doesn't deliberate. As soon as the tip of your member is rubbing against her pussy hole, she brings herself down hard, letting your cock rip through her hymen, [b]stealing Tavi's virginity[/b].")

			saynn("[say=tavi]Ah~.. It was gonna happen sooner or later~.[/say]")

			saynn("Some of her toxic-green blood coats your shaft and drips on your crotch. Tavi catches some of it and licks her digits, purring softly. She grinds your crotch while your member is inside her, allowing her to quickly get used to your size.")

		else:
			saynn("She raises herself a little and hovers while her paws guide your {pc.penis} directly down her moist tunnel of love. Tavi doesn't deliberate. As soon as the tip of your member is rubbing against her pussy hole, she brings herself down hard, letting your cock spread her pussy folds and slide deep inside.")

			saynn("[say=tavi]Old Tavi cared about her virginity. So silly~. Fucking is so much better than being a nun.[/say]")

			saynn("She grinds your crotch while your member is inside her, allowing her to quickly get used to your size.")

		saynn("Your hands land on her wide hips as she begins to ride you nice and fast. You can feel the.. undeniable heat.. radiating from Tavi, her mark and her sex. It's like her biological heat has combined with her usual cravings, doubling Tavi's lust.")

		saynn("[say=tavi]Ah~..[/say]")

		saynn("Tavi's moans fill the air while she eagerly bounces on your cock, her own paws massaging her {tavi.breasts}, rubbing her belly and her new womb mark.")

		saynn("[say=tavi]Can't wait for my tits to get bigger with milk.. for my belly to be full of our kids..[/say]")

		saynn("As the intensity builds, Tavi's body begins to tremble with anticipation, the insatiable hunger making her pant heavily. Her inner walls gripping your shaft harder, hinting at the impending climax.")

		saynn("[say=tavi]Breed me, make your slut a mother~.[/say]")

		addButton("Cum inside", "Give Tavi what you both want", "cum_inside")
	if(state == "cum_inside"):
		playAnimation(StageScene.SexCowgirl, "inside", {npc="tavi", pc="pc", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("With a final, deep motion, Tavi brings herself down onto your cock hard, sending both of you over the edge. Your {pc.penis} is throbbing as it releases waves of sticky hot {pc.cum} directly into Tavi's awaiting womb, flooding it to the brim.")

		saynn("Tavi gasps and moans, feeling the warmth of your seed filling her, making her belly slightly bumpy even.")

		saynn("[say=tavi]Yes-s~.. Drain your balls inside me.. Breed Tavi completely..[/say]")

		if (impregnationSuccess):
			saynn("As your seed paints her insides white, something else begins to happen.. Her womb mark, once subtle and dim, now shines brightly, marking the moment when your {pc.cum} has successfully planted the seed of new life within Tavi.")

			saynn("[say=tavi]Impregnation successful~. I will make you so many kittens~.[/say]")

		saynn("After that explosive orgasm, Tavi just rests on you, still with your cock inside her. Your hands jump onto her belly and rub it.")

		saynn("[say=tavi]That really did it..[/say]")

		saynn("Her heat seems to be satisfied. For now..")

		saynn("After some time, she leans in closer to your ear, whispering.")

		saynn("[say=tavi]I look forward to more breeding~..[/say]")

		addButton("Continue", "See what happens next", "start_talking")
	if(state == "do_trib"):
		playAnimation(StageScene.SexTribadism, "sex", {npc="pc", pc="tavi", bodyState={naked=true}, npcBodyState={naked=true,hard=true}})
		if (!GM.pc.hasPenis()):
			saynn("[say=pc]What do you mean? I only have a pussy.. There is no way for me to..[/say]")

		else:
			saynn("[say=pc]What do you mean? I can't breed you with my pussy..[/say]")

		saynn("Tavi cuts you off by suddenly tackling you and pinning into the floor. Her legs get interlocked with yours as she shifts herself closer and closer until your pussies.. touch. Her eyes glow with a captivating allure, her little smile making you lightheaded.")

		saynn("[say=tavi]I'm not your usual cat anymore~. I know that this will work~.[/say]")

		saynn("[say=pc]What will?..[/say]")

		saynn("Tavi doesn't respond. Instead, she just proceeds to grind her pussy against yours, sending shivers down your spine. You can feel the.. undeniable heat.. radiating from Tavi, her mark and her sex. It's like her biological heat has combined with her usual cravings, doubling Tavi's lust.")

		saynn("[say=pc]Ah..[/say]")

		saynn("She grabs your hand and makes you move in unison, the friction sending little waves of pleasure through both of you. Your moans fill the air.")

		saynn("The rhythm between you two quickens as your and Tavi's sensitive folds get more and more wet, sharing their juices. Tavi's other free paw lands on her own breasts and squeezes them tight.")

		saynn("[say=tavi]These are gonna be full of my milk..[/say]")

		saynn("Then it slides down her belly and rubs it.")

		saynn("[say=tavi]And this.. is where our litter is gonna be..[/say]")

		saynn("What is she.. You would question her more but the sensations quickly overwhelm you. You're about to cum..")

		addButton("Cum", "See what happens next", "trib_breed")
	if(state == "trib_breed"):
		playAnimation(StageScene.SexTribadism, "fast", {npc="pc", pc="tavi", pcCum=true, npcCum=true, bodyState={naked=true}, npcBodyState={naked=true,hard=true}})
		saynn("Your hips move with an almost primal urgency. In this moment, you two lose yourself in the pleasure you give and receive. Your breaths become synchronized, your moans blending into a symphony of lust.. And then you both get thrown over the edge..")

		saynn("Your bodies begin to quiver from pleasure, your legs remain interlocked as your pussies pulsate and even squirt, sharing girlcum, a mesmerizing display.")

		if (impregnationSuccess):
			saynn("[say=tavi]Ah~.. I can feel it..[/say]")

			saynn("As your pussy juices reach her womb, something else begins to happen.. Her womb mark, once subtle and dim, now shines brightly, marking the moment when your girlcum has successfully planted the seed of new life within Tavi.")

			saynn("[say=tavi]Impregnation successful~. I will make you so many kittens~.[/say]")

			saynn("[say=pc]That's.. impossible..[/say]")

			saynn("As Tavi giggles, her voice echoes back with a devil-ish undertone.")

			saynn("[say=tavi]Mhm~.[/say]")

		saynn("After that explosive orgasm, Tavi just rests while idly rubbing pussies with you. Your hands jump onto her belly and.. rubs it. Her heat seems to be satisfied. For now..")

		saynn("After some time, she leans in closer to your ear, whispering.")

		saynn("[say=tavi]I look forward to more~.[/say]")

		addButton("Continue", "See what happens next", "start_talking")
	if(state == "do_chastity_breed"):
		playAnimation(StageScene.SexCowgirl, "inside", {npc="tavi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("The moment you start talking about breeding, Tavi suddenly tackles you and pins you to the floor with her body, straddling you. Her pussy is already pressed against your chastity cage, her eyes glow with a captivating allure, her little smile making you lightheaded.")

		saynn("[say=tavi]Let me try~.[/say]")

		saynn("A soft moan escapes her lips as she begins to grind her slick folds against the cage that restraints your arousal. You can feel the.. undeniable heat.. radiating from Tavi, her mark and her sex. It's like her biological heat has combined with her usual cravings, doubling Tavi's lust.")

		saynn("[say=tavi]Ah~..[/say]")

		saynn("Tavi's moans fill the air while she eagerly grinds your cage, her own paws massaging her {tavi.breasts}, rubbing her belly and her new womb mark. You can't feel much through the chastity.. but the imagery is enough to make you moan too, your poor locked away cock throbbing in its cage, desperate for release.")

		saynn("[say=tavi]Can't wait for my tits to get bigger with milk.. for my belly to be full of our kids..[/say]")

		saynn("As the intensity builds, Tavi's body begins to tremble with anticipation, the insatiable hunger making her pant heavily. Pussy juices drip through the holes in your cage, coating your dick and hinting at her impending climax.")

		saynn("[say=tavi]Breed me, make your slut a mother~.[/say]")

		saynn("You really don't know how to do that.. But you really want to do it now..")

		addButton("Cum", "See what happens next", "do_chastity_cum")
	if(state == "do_chastity_cum"):
		playAnimation(StageScene.SexCowgirl, "tease", {npc="tavi", pc="pc", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("Without any direct stimulation, you are pushed past your edge, just from Tavi's crazy amount of teasing. You arch your back as your locked member starts throbbing and shooting weak strings of {pc.cum} onto your own belly. Tavi's orgasm happens at the same time, causing her body to start shivering while the many moans escape her lips.")

		saynn("[say=tavi]Ngh-h~..[/say]")

		saynn("But then, when your orgasm begins to fade, Tavi suddenly scoops up some of your seed onto her digits.. before rubbing them against her"+str(" virgin" if getModule("TaviModule").isVirgin() else "")+" pussy entrance and then pushing your {pc.cum} inside..")

		if (impregnationSuccess):
			saynn("[say=tavi]Let's see~.[/say]")

			saynn("A few seconds later, something else begins to happen.. Her womb mark, once subtle and dim, now shines brightly, marking the moment when your {pc.cum} has successfully planted the seed of new life within Tavi.")

			saynn("[say=tavi]See? Impregnation successful~. I will make you so many kittens~.[/say]")

		saynn("You look at Tavi with your big eyes. Did she really just do that? But.. It was kinda hot though..")

		saynn("After that explosive orgasm, Tavi just rests on you, her pussy still pressed against your cage. Your hands jump onto her belly and rub it.")

		saynn("[say=tavi]That really did it..[/say]")

		saynn("Her heat seems to be satisfied. For now..")

		saynn("After some time, she leans in closer to your ear, whispering.")

		saynn("[say=tavi]I look forward to more breeding~..[/say]")

		addButton("Continue", "See what happens next", "start_talking")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "tavi_turns_around"):
		setFlag("TaviModule.Ch6TaviReceivedWombMark", true)
		getCharacter("tavi").updateBodyparts()
		getCharacter("tavi").forceIntoHeat()

	if(_action == "not_today"):
		processTime(2*60)
		GM.pc.addLust(-200)
		GM.pc.addPain(20)
		addMessage("You feel weak")

	if(_action == "do_breed"):
		processTime(10*60)
		if(getModule("TaviModule").isVirgin()):
			setFlag("TaviModule.TaviIsNotVirgin", true)
			stoleVirginity = true

	if(_action == "do_trib"):
		processTime(10*60)

	if(_action == "do_chastity_breed"):
		processTime(10*60)

	if(_action == "start_talking"):
		runScene("Ch6TaviTalkScene")
		endScene()
		return

	if(_action == "cum_inside"):
		processTime(10*60)
		getCharacter("tavi").cummedInVaginaBy("pc")
		if(getCharacter("tavi").forceImpregnateBy("pc")):
			impregnationSuccess = true
		GM.pc.orgasmFrom("tavi")
		GM.pc.addSkillExperience(Skill.SexSlave, 40)

	if(_action == "trib_breed"):
		processTime(10*60)
		getCharacter("tavi").cummedInVaginaBy("pc", FluidSource.Vagina, 0.5)
		GM.pc.cummedInVaginaBy("tavi", FluidSource.Vagina, 0.5)
		if(getCharacter("tavi").forceImpregnateBy("pc")):
			impregnationSuccess = true
		GM.pc.orgasmFrom("tavi")
		GM.pc.addSkillExperience(Skill.SexSlave, 40)

	if(_action == "do_chastity_cum"):
		processTime(10*60)
		getCharacter("tavi").cummedInVaginaBy("pc", FluidSource.Penis, 0.3)
		if(getCharacter("tavi").forceImpregnateBy("pc")):
			impregnationSuccess = true
		GM.pc.orgasmFrom("tavi")
		GM.pc.addSkillExperience(Skill.SexSlave, 40)

	setState(_action)

func saveData():
	var data = .saveData()

	data["stoleVirginity"] = stoleVirginity
	data["impregnationSuccess"] = impregnationSuccess

	return data

func loadData(data):
	.loadData(data)

	stoleVirginity = SAVE.loadVar(data, "stoleVirginity", false)
	impregnationSuccess = SAVE.loadVar(data, "impregnationSuccess", false)
