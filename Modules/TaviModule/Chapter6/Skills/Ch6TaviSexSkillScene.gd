extends SceneBase

var isCorrupt = false
var isPure = false
var isNormal = false
var isVirgin = false

func _init():
	sceneID = "Ch6TaviSexSkillScene"

func _run():
	if(state == ""):
		addCharacter("tavi")
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("You tell Tavi that you want to train her sex skills because.. sex feels good. And it would also allow for more ways to satisfy Tavi's.. desires.")

		saynn("Tavi nods and listens to you.")

		isCorrupt = getModule("TaviModule").isCorrupt()
		isPure = getModule("TaviModule").isPure()
		isNormal = (!isCorrupt && !isPure)
		isVirgin = getModule("TaviModule").isVirgin()
		#var sexSkill = getModule("TaviModule").getSkillScore("taviSkillSex")
		if (isVirgin):
			if (GM.pc.hasReachablePenis()):
				addButton("Take Tavi's virginity", "You'd need to do that before any other kind of vaginal sex", "take_virginity_penis")
			else:
				addButtonWithChecks("Take Tavi's virginity", "You'd need to do that before any other kind of vaginal sex", "take_virginity_pickstrapon", [], [ButtonChecks.HasStraponAndCanWear])
		addButton("Teasing", "Teach Tavi how to tease you", "teasing")
		addButton("Cancel", "You changed your mind", "cancel_lesson")
	if(state == "take_virginity_pickstrapon"):
		saynn("Pick which strapon you wanna use?")

		addButton("Back", "Never mind", "")
		addStraponButtons()
		if (false):
			addButton("Nope", "You shouldn't see this", "take_virginity_strapon")
	if(state == "take_virginity_penis"):
		setFlag("TaviModule.TaviIsNotVirgin", true)
		playAnimation(StageScene.SexStanding, "tease", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true,hard=true}})
		saynn("You think about it a little bit. Tavi will lose her virginity sooner or later. It might as well happen with you..")

		saynn("[say=pc]We're gonna have some fun, Tavi. Stand against the wall.[/say]")

		saynn("The air inside her simple cell is charged with anticipation. She stands where you want her to stand and puts her paws against the wall. You stand behind and begin to slowly unbutton her shirt and pull down her shorts, exposing her cute perky breasts and a perfect untouched shiny pussy.")

		saynn("Tavi bites her lip when she looks over her shoulder and sees your {pc.penis}. As much as you might want to just take her now.. Might as well make her first time somewhat pleasant. Your hand gently pushes on her back, inviting her to bend forward more.")

		saynn("[say=tavi]"+str(taviSpeak("I've never done this before.. But I wanna try..", "Oh yes, finally~.", "I've.. never done this before.."))+"[/say]")

		saynn("She is lacking the heat that she has during mornings.. But she still seems to be quite.. horny.")

		saynn("[say=pc]We will take it slow.[/say]")

		saynn("Tavi trusts your touches and leans forward, putting her paws on the cold surface while also sticking her cute round ass out for you. Her feline tail moves out of the way, giving you full access to her little green flower..")

		saynn("It feels like her body is on fire as your hands explore her, caressing that soft fur and tracing a path down her girly curves. You rest your chin on her shoulder and give her neck a little kiss as you start aligning your hard member against her slick folds. The tip spreads her petals aside.. but then quickly encounters a barricade which causes Tavi to jerk away and whine softly.")

		saynn("[say=tavi]"+str(taviSpeak("It hurts.. Just a bit..", "Ow.. that's my virginity right there~.", "It hurts.."))+"[/say]")

		saynn("[say=pc]Should I stop?[/say]")

		saynn("[say=tavi]"+str(taviSpeak("..No. Do it. Take my virginity and make me your slut, please", "No! Tear through it! Make me your slutty whore~.", "..No. Do it. I'm just afraid of the pain a bit.."))+"[/say]")

		saynn("Huh. That gives you an idea. Instead of giving her neck kisses, you get a grasp on her short hair and get a firm grasp on it, distracting Tavi from what is about to happen.")

		saynn("Now is the time..")

		addButton("Push", "Steal Tavi's virginity", "do_fuck_inside")
	if(state == "do_fuck_inside"):
		playAnimation(StageScene.SexStanding, "inside", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true,hard=true}})
		saynn("While Tavi is busy with her hair being tugged, you suddenly push your hips forward, your {pc.penis} putting pressure on her hymen.. until it gets torn. As her virginity is taken, she grips onto the wall tightly and gasps, her claws digging into the concrete, her body shivering.. her pussy clenching around the intruding cock.. so tight..")

		saynn("[say=tavi]"+str(taviSpeak("Ah-h.. Yes-s.. Good-d..", "Ah~! Yes!.. A cock is inside me! Feels great~.", "Ah.h.. h.h-h.."))+"[/say]")

		saynn("You let go of her hair to let her rest a little and get used to your length. Green blood trickles down Tavi's thighs, evidence of her lost innocence. She is not a girl anymore.. but a woman.")

		saynn("[say=pc]You're okay, Tavi?[/say]")

		saynn("She is still shivering, her tail wagging sporadically as she tries to.. endure it.")

		saynn("[say=tavi]"+str(taviSpeak("Please.. Don't stop..", "Yes-s~. Don't stop. Fuck me raw~", "Yes.. You can continue.."))+"[/say]")

		saynn("Her breathing is deep, her voice is laced with.. desire.")

		addButton("Continue", "Start fucking Tavi", "do_fuck_fuck")
	if(state == "do_fuck_fuck"):
		playAnimation(StageScene.SexStanding, "sex", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true,hard=true}})
		saynn("Slowly, you begin thrusting inside her slit, your shaft exploring her slick tight tunnel that massages you so well.. You can't help but to grunt softly.. You're finally fucking Tavi.. and it feels better than any other pussy.")

		saynn("[say=pc]Good..[/say]")

		saynn("Your actions become a little more forceful, one of your hands slides up to her {tavi.breasts} and gives them a good squeeze while the second one just holds onto her hips. Tavi's initial discomfort starts to transform into a raw.. electrifying pleasure.. making her crave for more.")

		saynn("[say=tavi]"+str(taviSpeak("You took your pet's virginity.. Now fuck her.. Fuck her raw.. Ah..", "You took your pet's virginity.. Now fuck her.. Fuck her rough~.. Ah..", "You took my virginity.. Feels so good.."))+"[/say]")

		saynn("Moans escape from her as she arches her back and spreads her long legs for you more, allowing you to ram your cock deeper down her sex and even reach the organic wall that is her cervix.")

		saynn("[say=tavi]"+str(taviSpeak("It feels g-good.. Why did I deny myself this pleasure..", "You're gonna breed me.. again and again~..", "So nice.. I think I'm gonna.. ah.."))+"[/say]")

		saynn("You reach a pretty good pace, pounding that incredible pussy raw as it only gets tighter around your cock. Very soon Tavi's walls begin clenching around you, her body quivering with overwhelming pleasure as passionate noises leave her lips. You support her through her first vaginal sex orgasm, holding your hands on her body and shaky legs. You quickly realize that you're not that far too..")

		saynn("[say=tavi]"+str(taviSpeak("Ah!.. Cum inside me!.. P-please! I can't get pregnant anyway, I'm too damaged.", "Ah!.. Cum inside me!.. P-please! I can't get pregnant, I'm too damaged. But that makes me a perfect cum whore.. No need to worry ever, just turn me into your plaything!..", "Ah.. I can't get pregnant, just so you know.. At least you don't need to worry.."))+"[/say]")

		addButton("Cum inside", "Attempt to breed Tavi anyway", "do_fuck_cum_inside")
		addButton("Pull out", "Deny Tavi her request", "do_fuck_pullout")
	if(state == "do_fuck_cum_inside"):
		playAnimation(StageScene.SexStanding, "inside", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true,hard=true}})
		saynn("That eager pussy quickly pushes you to your peak just by kneading your cock.. until it's too late to pull out. You grunt as you hold onto Tavi's body tightly and cum inside her, your throbbing cock stuffing her toxic-colored pussy full of your thick virile {pc.cum}.")

		saynn("[say=tavi]"+str(taviSpeak("Yes-s.. Very good..", "Stuff me with your cum, yes-yes-yes~..", "So.. much.."))+"[/say]")

		saynn("As Tavi rides the rest of her orgasmic waves out, her stuffed pussy already begins to leak out some of your seed mixed with that fancy glowing blood.")

		saynn("[say=tavi]"+str(taviSpeak("T-thank you.. for using me..", "Thank you for using me~!", "T-thank you.."))+"[/say]")

		saynn("[say=pc]You're welcome.[/say]")

		saynn("After breeding your pet thoroughly, you pull your cock out and get a good view. Tavi is still sticking her ass out, allowing you to see in great detail how her pussy twitches and drips.")

		saynn("So much more.. potential.. was just uncovered. And Tavi seems to enjoy it too.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_fuck_pullout"):
		playAnimation(StageScene.SexStanding, "tease", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true,hard=true}})
		saynn("That eager pussy quickly pushes you to your peak just by kneading your cock.. But you decide against cumming inside your pet during her first sex and pull out. Your {pc.penis} throbs and twitches before strings of your thick warm {pc.cum} begin landing on Tavi's bare ass and lower back, adding a new color to her unique color palette.")

		saynn("[say=tavi]"+str(taviSpeak("T-thank you.. for being careful..", "Thank you for using me~! Next time just cum inside~", "T-thank you.. for being careful.."))+"[/say]")

		saynn("As Tavi rides the rest of her orgasmic waves out, her pussy is already back to looking tight and neat, only the glow and little twitches show that she got fucked recently.")

		saynn("[say=pc]You're welcome.[/say]")

		saynn("So much more.. potential.. was just uncovered. And Tavi seems to enjoy it too.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "take_virginity_strapon"):
		setFlag("TaviModule.TaviIsNotVirgin", true)
		playAnimation(StageScene.SexStanding, "tease", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true,hard=true}})
		saynn("You think about it a little bit. Tavi will lose her virginity sooner or later. It might as well happen with you..")

		saynn("[say=pc]We're gonna have some fun, Tavi. Stand against the wall.[/say]")

		saynn("The air inside her simple cell is charged with anticipation. She stands where you want her to stand and puts her paws against the wall. You stand behind and begin to slowly unbutton her shirt and pull down her shorts, exposing her cute perky breasts and a perfect untouched shiny pussy.")

		saynn("Tavi bites her lip when she looks over her shoulder and sees you securing a strapon harness around your waist. As much as you might want to just take her now.. Might as well make her first time somewhat pleasant. Your hand gently pushes on her back, inviting her to bend forward more.")

		saynn("[say=tavi]"+str(taviSpeak("I've never done this before.. But I wanna try..", "Oh yes, finally~.", "I've.. never done this before.."))+"[/say]")

		saynn("She is lacking the heat that she has during mornings.. But she still seems to be quite.. horny.")

		saynn("[say=pc]We will take it slow.[/say]")

		saynn("Tavi trusts your touches and leans forward, putting her paws on the cold surface while also sticking her cute round ass out for you. Her feline tail moves out of the way, giving you full access to her little green flower..")

		saynn("It feels like her body is on fire as your hands explore her, caressing that soft fur and tracing a path down her girly curves. You rest your chin on her shoulder and give her neck a little kiss as you start aligning the strapon against her slick folds. The rubber tip spreads her petals aside.. but then quickly encounters a barricade which causes Tavi to jerk away and whine softly.")

		saynn("[say=tavi]"+str(taviSpeak("It hurts.. Just a bit..", "Ow.. that's my virginity right there~.", "It hurts.."))+"[/say]")

		saynn("[say=pc]Should I stop?[/say]")

		saynn("[say=tavi]"+str(taviSpeak("..No. Do it. Take my virginity and make me your slut, please", "No! Tear through it! Make me your slutty whore~.", "..No. Do it. I'm just afraid of the pain a bit.."))+"[/say]")

		saynn("Huh. That gives you an idea. Instead of giving her neck kisses, you get a grasp on her short hair and get a firm grasp on it, distracting Tavi from what is about to happen.")

		saynn("Now is the time..")

		addButton("Push", "Steal Tavi's virginity", "do_fuck_inside_strapon")
	if(state == "do_fuck_inside_strapon"):
		playAnimation(StageScene.SexStanding, "inside", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true,hard=true}})
		saynn("While Tavi is busy with her hair being tugged, you suddenly push your hips forward, your strapon putting pressure on her hymen.. until it gets torn. As her virginity is taken, she grips onto the wall tightly and gasps, her claws digging into the concrete, her body shivering.. her pussy clenching around the intruding cock.. so tight..")

		saynn("[say=tavi]"+str(taviSpeak("Ah-h.. Yes-s.. Good-d..", "Ah~! Yes!.. A cock is inside me! Feels great~.", "Ah.h.. h.h-h.."))+"[/say]")

		saynn("You let go of her hair to let her rest a little and get used to the length of the toy. Green blood trickles down Tavi's thighs, evidence of her lost innocence. She is not a girl anymore.. but a woman.")

		saynn("[say=pc]You're okay, Tavi?[/say]")

		saynn("She is still shivering, her tail wagging sporadically as she tries to.. endure it.")

		saynn("[say=tavi]"+str(taviSpeak("Please.. Don't stop..", "Yes-s~. Don't stop. Fuck me raw~", "Yes.. You can continue.."))+"[/say]")

		saynn("Her breathing is deep, her voice is laced with.. desire.")

		addButton("Continue", "Start fucking Tavi", "do_fuck_fuck_strapon")
	if(state == "do_fuck_fuck_strapon"):
		playAnimation(StageScene.SexStanding, "sex", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true,hard=true}})
		saynn("Slowly, you begin thrusting inside her slit, the rubber shaft stretching and exploring her slick tight tunnel.. You can't help but to grunt softly from the friction.. You're finally fucking Tavi.. and it feels great.")

		saynn("[say=pc]Good..[/say]")

		saynn("Your actions become a little more forceful, one of your hands slides up to her {tavi.breasts} and gives them a good squeeze while the second one just holds onto her hips. Tavi's initial discomfort starts to transform into a raw.. electrifying pleasure.. making her crave for more.")

		saynn("[say=tavi]"+str(taviSpeak("You took your pet's virginity.. Now fuck her.. Fuck her raw.. Ah..", "You took your pet's virginity.. Now fuck her.. Fuck her rough~.. Ah..", "You took my virginity.. Feels so good.."))+"[/say]")

		saynn("Moans escape from her as she arches her back and spreads her long legs for you more, allowing you to ram your rubber toy deeper down her sex and even reach the organic wall that is her cervix.")

		saynn("[say=tavi]"+str(taviSpeak("It feels g-good.. Why did I deny myself this pleasure..", "You're gonna fuck me.. again and again~..", "So nice.. I think I'm gonna.. ah.."))+"[/say]")

		saynn("You reach a pretty good pace, pounding that incredible pussy raw as it only gets tighter around the strapon. Very soon Tavi's walls begin clenching around it, her body quivering with overwhelming pleasure as passionate noises leave her lips. You support her through her first vaginal sex orgasm, holding your hands on her body and shaky legs.")

		saynn("[say=tavi]"+str(taviSpeak("Ah!.. Cum inside me!.. P-please! I can't get pregnant anyway, I'm too damaged.", "Ah!.. Cum inside me!.. P-please! I can't get pregnant, I'm too damaged. But that makes me a perfect cum whore.. No need to worry ever, just turn me into your plaything!..", "Ah.. I can't get pregnant, just so you know.. At least you don't need to worry.."))+"[/say]")

		saynn("It seems Tavi got too carried away and forgot that you're just using a rubber dildo to fuck her. Still, her words are quite hot.. They almost make you wish to be able to breed her for real.")

		addButton("Ram it deeper", "Ram the strapon deeper", "do_fuck_cum_inside_strapon")
	if(state == "do_fuck_cum_inside_strapon"):
		playAnimation(StageScene.SexStanding, "tease", {npc="tavi", pc="pc", npcBodyState={naked=true}, bodyState={naked=true,hard=true}})
		saynn("Your hands grip Tavi as tight as they can while you ram your strapon deep inside her, the toy stretching her sensitive folds wide..")

		saynn("Tavi arches her back even harder, a loud slutty moan escapes her as she starts shaking and shivering under you. Her pussy is pulsating and then suddenly squirts from sheer amount of overstimulation.")

		saynn("[say=tavi]"+str(taviSpeak("AHHh-h-h.. F-fuu-uck!..", "Ah-h~!.. Fuck that's good!..", "T-too much! Ah-h!.."))+"[/say]")

		saynn("You don't feel much since it's just a toy. But Tavi sure seems to be enjoying herself.")

		saynn("[say=pc]You're welcome.[/say]")

		saynn("After fucking your new pet thoroughly, you pull your strapon out and get a good view. Tavi is still sticking her ass out, allowing you to see in great detail how her pussy twitches and drips.. Lewd.")

		saynn("So much more.. potential.. was just uncovered. And Tavi seems to enjoy it too.")

		addButton("Continue", "See what happens next", "endthescene_unequipstrapon")
	if(state == "teasing"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="kneel"})
		saynn("You decide to start the lessons.. with something simple.. Like teasing. Your tone is commanding and yet gentle.")

		saynn("[say=pc]Come here, Tavi. I want you to kneel.[/say]")

		saynn("Tavi complies without much hesitation, lowering herself to her knees before you. Well, that was easy.. You can tell that her heart is racing with a mix of excitement and nervousness.")

		saynn("[say=tavi]What are you gonna teach me~?[/say]")

		saynn("She seems to be eager to learn. That's good.")

		if (GM.pc.isFullyNaked()):
			saynn("[say=pc]I want you to.. tease me. Make it mildly sexual but don't go too far. Mhm? I will guide you.[/say]")

		else:
			saynn("[say=pc]I want you to.. undress and then tease me. Make it mildly sexual but don't go too far. Mhm? I will guide you.[/say]")

		saynn("Tavi bites her lip, eager to start.")

		addButton("Watch", "Watch Tavi work", "teasing_watch")
	if(state == "teasing_watch"):
		playAnimation(StageScene.SexOral, "tease", {npc="tavi", bodyState={exposedCrotch=true, hard=true}})
		var foundAnything = false
		if (!GM.pc.isFullyNaked()):
			saynn("Slowly and deliberately, Tavi starts undressing you. She {pc.undressMessageS} until you are mostly naked. Then she shifts herself closer to you and begins to wonder where to start..")

		else:
			saynn("Tavi shifts herself closer to you and begins to wonder where to start..")

		if (GM.pc.isWearingChastityCage()):
			foundAnything = true
			saynn("After exposing your {pc.penis}, Tavi takes a moment to appreciate the sight before her. Your chastity cage is certainly making her curious. She looks at you and then leans in closer, nuzzling it, making you become aroused even without direct stimulation.")

			saynn("With a mixture of curiosity and eagerness, Tavi takes your cage into her mouth, her lips wrapping around the tip of the metal object.")

			saynn("[say=pc]Careful with the teeth..[/say]")

			saynn("Tavi smiles and shows off her fangs to you anyway, what a brat.. She doesn't try to suck you off, just idly holding your caged up cock in her mouth while her tongue tries to slip through the holes in the metal to tease you. She gets a little surprised when a drop of precum lands on her tongue.")

			saynn("[say=pc]Pretty good.[/say]")

			saynn("Her attention shifts to your balls. She nuzzles the area just above them and then licks each of your orbs a few times. Her tongue feels nice, it has a sandpaper-like texture to it.")

		elif (GM.pc.hasReachablePenis()):
			foundAnything = true
			saynn("After exposing your {pc.penis}, Tavi takes a moment to appreciate the sight before her. She looks at you and then leans in closer, nuzzling and even nipping at the sensitive skin, making you become aroused.")

			saynn("With a mixture of curiosity and eagerness, Tavi takes your cock into her mouth, her lips wrapping around the tip.")

			saynn("[say=pc]Careful with the teeth..[/say]")

			saynn("Tavi smiles and lets you feel her sharp fangs brushing against your member, what a brat.. She doesn't suck you off, just idly holding your cock in her mouth while her tongue teases the tip. She gets a little surprised when a drop of precum lands on it.")

			saynn("[say=pc]Pretty good.[/say]")

			saynn("Her attention shifts to your balls. She nuzzles the area just above them and then licks each of your orbs a few times. Her tongue feels nice, it has a sandpaper-like texture to it.")

		if (GM.pc.hasReachableVagina()):
			saynn(""+str("Next, Tavi moves her head lower, reaching your {pc.pussyStretch} pussy." if foundAnything else "After exposing your {pc.pussyStretch} pussy, Tavi takes a moment to appreciate the sight before her.")+" She brings her maw closer and lets you feel her warm breath on your sensitive flesh.")

			foundAnything = true
			saynn("[say=pc]Don't be afraid, Tavi.[/say]")

			saynn("Tavi smiles and presses her lips against your folds, gently nuzzling and even using her tongue to lick them a few times, causing you to moan softly from the pleasure. Quite quickly, you become wet down there. Tavi's nose picks up on that as she rubs her face against your petals a little more.")

			saynn("[say=pc]Feels nice..[/say]")

			saynn("She finds your little clit and focuses on it, using her tongue to trace circles around until more moans escape you.")

		if (!foundAnything):
			saynn("Tavi looks at your crotch.. and doesn't find anything that she can tease. So she just rubs her face against the inner side of your thighs. It feels nice..")

		saynn("While Tavi is working, you pat on the head, causing her to start purring.")

		saynn("[say=pc]Not bad. I think we can do something more complicated now. If you want.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
func taviSpeak(normalSpeak, corruptSpeak, pureSpeak):
	if(isCorrupt):
		return corruptSpeak
	if(isPure):
		return pureSpeak
	return normalSpeak

func addStraponButtons():
	var strapons = GM.pc.getStrapons()
	for strapon in strapons:
		addButton(strapon.getVisibleName(), strapon.getVisibleDescription(), "take_virginity_strapon", [strapon])


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "take_virginity_penis"):
		processTime(10*60)
		getModule("TaviModule").advanceSkill("taviSkillSex")

	if(_action == "teasing"):
		getModule("TaviModule").advanceSkill("taviSkillSex")

	if(_action == "cancel_lesson"):
		increaseFlag("TaviModule.Ch6Tiredness", -1)
		endScene()
		return

	if(_action == "take_virginity_strapon"):
		processTime(10*60)
		var strapon = _args[0]
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(strapon)
		getModule("TaviModule").advanceSkill("taviSkillSex")

	if(_action == "do_fuck_inside"):
		processTime(5*60)

	if(_action == "do_fuck_fuck"):
		processTime(3*60)

	if(_action == "do_fuck_cum_inside"):
		processTime(3*60)
		getCharacter("tavi").cummedInVaginaBy("pc")
		#getModule("TaviModule").addCorruption(1)

	if(_action == "do_fuck_pullout"):
		processTime(3*60)
		getCharacter("tavi").cummedOnBy("pc")
		#getModule("TaviModule").addCorruption(-1)

	if(_action == "do_fuck_inside_strapon"):
		processTime(5*60)

	if(_action == "do_fuck_fuck_strapon"):
		processTime(3*60)

	if(_action == "do_fuck_cum_inside_strapon"):
		processTime(3*60)
		getCharacter("tavi").cummedInVaginaBy("pc", FluidSource.Strapon)

	if(_action == "endthescene_unequipstrapon"):
		GM.pc.unequipStrapon()
		endScene()
		return

	if(_action == "teasing_watch"):
		processTime(5*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["isCorrupt"] = isCorrupt
	data["isPure"] = isPure
	data["isNormal"] = isNormal
	data["isVirgin"] = isVirgin

	return data

func loadData(data):
	.loadData(data)

	isCorrupt = SAVE.loadVar(data, "isCorrupt", false)
	isPure = SAVE.loadVar(data, "isPure", false)
	isNormal = SAVE.loadVar(data, "isNormal", false)
	isVirgin = SAVE.loadVar(data, "isVirgin", false)
