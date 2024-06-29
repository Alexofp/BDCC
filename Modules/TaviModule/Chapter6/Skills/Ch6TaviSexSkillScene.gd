extends SceneBase

var isCorrupt = false
var isPure = false
var isNormal = false
var isVirgin = false
var sexSkill = 0
var usedStrapon = false

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
		sexSkill = getModule("TaviModule").getSkillScore("taviSkillSex")
		if (isVirgin):
			if (GM.pc.hasReachablePenis()):
				addButton("Take Tavi's virginity", "You'd need to do that before any other kind of vaginal sex", "take_virginity_penis")
			else:
				addButtonWithChecks("Take Tavi's virginity", "You'd need to do that before any other kind of vaginal sex", "take_virginity_pickstrapon", [], [ButtonChecks.HasStraponAndCanWear])
		addButton("Teasing", "Teach Tavi how to tease you", "teasing")
		if (sexSkill > 0):
			addButton("First Blowjob", "Teach Tavi to suck you off", "firstbj_pick")
			addButtonWithChecks("Pussy licking", "Teach Tavi to lick you", "pussylick", [], [ButtonChecks.HasReachableVagina])
		if (sexSkill > 1):
			if (!isVirgin):
				addButton("Cowgirl", "Teach Tavi how to ride you", "cowgirl_pick")
			else:
				addDisabledButton("Cowgirl", "Tavi can't be a virgin for this")
		if (sexSkill > 3):
			addButton("First Anal", "Have anal sex with Tavi", "anal_pick")
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
		playAnimation(StageScene.SexStanding, "inside", {npc="tavi", pc="pc", pcCum=true, npcCum=true, npcBodyState={naked=true}, bodyState={naked=true,hard=true}})
		saynn("That eager pussy quickly pushes you to your peak just by kneading your cock.. until it's too late to pull out. You grunt as you hold onto Tavi's body tightly and cum inside her, your throbbing cock stuffing her toxic-colored pussy full of your thick virile {pc.cum}.")

		saynn("[say=tavi]"+str(taviSpeak("Yes-s.. Very good..", "Stuff me with your cum, yes-yes-yes~..", "So.. much.."))+"[/say]")

		saynn("As Tavi rides the rest of her orgasmic waves out, her stuffed pussy already begins to leak out some of your seed mixed with that fancy glowing blood.")

		saynn("[say=tavi]"+str(taviSpeak("T-thank you.. for using me..", "Thank you for using me~!", "T-thank you.."))+"[/say]")

		saynn("[say=pc]You're welcome.[/say]")

		saynn("After breeding your pet thoroughly, you pull your cock out and get a good view. Tavi is still sticking her ass out, allowing you to see in great detail how her pussy twitches and drips.")

		saynn("So much more.. potential.. was just uncovered. And Tavi seems to enjoy it too.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_fuck_pullout"):
		playAnimation(StageScene.SexStanding, "tease", {npc="tavi", pc="pc", pcCum=true, npcCum=true, npcBodyState={naked=true}, bodyState={naked=true,hard=true}})
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
	if(state == "firstbj"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="kneel"})
		saynn("You lean against one of the walls of Tavi's dimly lit cell and point at the floor before you.")

		saynn("[say=pc]Come here, Tavi. Time for some training.[/say]")

		saynn("A mix of curiosity and desire shines in the feline's eyes. She slowly moves close to you before gracefully lowering herself to her knees before you. Tavi learned that gesture quite quickly.")

		if (GM.pc.isFullyNaked()):
			saynn("With a gentle touch, you guide Tavi's paws to your waist, indicating what you want her to do.")

		else:
			saynn("With a gentle touch, you guide Tavi's paws to your waist, helping them undress you, until your {pc.penis} gets exposed.")

		saynn("[say=pc]I wanna teach you the art of giving pleasure. Can't exactly show you because.. you know. But I will tell you what feels good.[/say]")

		saynn("Tavi admires the sight, her paws sliding over your thighs.")

		saynn("[say=tavi]I trust you..[/say]")

		saynn("Feeling her curious gaze on your crotch makes you slightly aroused already..")

		addButton("Continue", "Let her start", "firstbj_start")
	if(state == "firstbj_start"):
		playAnimation(StageScene.SexOral, "tease", {npc="tavi", bodyState={exposedCrotch=true, hard=true}})
		saynn("Tavi hesitates for a moment. With some delicate touches, she starts caressing your member, feeling its hardness beneath her digits. After that, she leans in closer, her warm breath teasing your sensitive skin as she places a little playful kiss at the tip.")

		saynn("You move Tavi's short hair out of the way and get a grip on it, an instinctual response to the pleasure she is giving you.")

		saynn("[say=pc]That's it, good girl. Take your time..[/say]")

		saynn("Tavi's cheeks blush from the compliments, she is certainly not used to them. But your encouragement does make her more confident, the tall kitty lets her tongue out before proceeding to explore the sensitive tip of your member with little flicks.")

		saynn("Your breath becomes a little deeper as your shaft gradually assumes its fully erected state. A drop of precum lands on Tavi's tongue before she savors it.")

		saynn("[say=pc]Ready to go further?[/say]")

		saynn("Tavi nods and wraps her lips around your shaft as she takes some of it into her mouth, past her sharp fangs. A little soft noise escapes you as the tip of your member already hits the back of her mouth. At the same time, her paws land on your balls and gently caress them.")

		addButton("Continue", "See what happens next", "firstbj_action")
	if(state == "firstbj_action"):
		playAnimation(StageScene.SexOral, "sex", {npc="tavi", bodyState={exposedCrotch=true, hard=true}})
		saynn("Tavi starts sucking you off, slowly moving her head along the surface of your member, her tongue doing more little licks that provide some extra stimulation. She doesn't let it get too deep, her throat is not ready yet.")

		saynn("[say=pc]Very nice, Tavi. You are learning so quickly..[/say]")

		saynn("Tavi finds a rhythm that she is comfortable with. And it feels.. quite nice. Your hand strokes her hair and scratches her behind the ears, causing her to start purring.")

		saynn("Your breath is quite deep now, Tavi looks up at you, her eyes sparkling with satisfaction and confidence.")

		saynn("How do you wanna end this lesson?")

		addButton("Facial", "Cum on Tavi's face", "firstbj_facial")
		if (sexSkill > 2):
			addButton("Mouth", "Cum in Tavi's mouth", "firstbj_mouth")
		else:
			addDisabledButton("Mouth", "Tavi is not skilled enough yet")
		if (sexSkill > 5):
			addButton("Throatpie", "Cum deep inside Tavi's mouth", "firstbj_throatpie")
		else:
			addDisabledButton("Throatpie", "Tavi is not skilled enough yet")
	if(state == "firstbj_facial"):
		playAnimation(StageScene.SexHandjob, "sex", {npc="tavi", bodyState={exposedCrotch=true, hard=true}})
		saynn("It feels good but Tavi's lips and tongue are not enough to shoot you over the edge. So you decide to help the feline by pulling your member out and proceeding to stroke it in Tavi's clear view.")

		saynn("[say=pc]Let me.. Stay still, Tavi.[/say]")

		saynn("She sees your hand motions and blushes more. But one of her paws decides to jump from your balls to your shaft, replacing your hand.")

		saynn("[say=tavi]You're gonna.. do it.. on my face?[/say]")

		saynn("[say=pc]Yes.[/say]")

		saynn("Tavi moves her face to the prime position, her head static as she awaits something. Her gaze is jumping between your eyes and the tip of your cock that is twitching and throbbing in her paw.. until the orgasm overwhelms you.")

		saynn("Tavi squints as soon as powerful strings of seed start flying towards her and landing on her upturned face. The hot thick {pc.cum} creates a nice contrast against her flushed green cheeks, even causing her to close one of her eyes completely.")

		saynn("[say=pc]Ngh.. Really good, Tavi. You did good.[/say]")

		saynn("As your orgasm starts to fade, Tavi's face is left looking quite lewd and messy. She nods subtly, her tongue sneakily tastes your seed.")

		saynn("[say=tavi]T-thank you..[/say]")

		saynn("That was a nice lesson.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "firstbj_mouth"):
		playAnimation(StageScene.SexOral, "tease", {npc="tavi", bodyState={exposedCrotch=true, hard=true}})
		saynn("Tavi has certainly gotten better at this after receiving some training. She knows exactly how to combine the licks of her tongue and the work of her lips to give you all of the pleasure. Your breath quickens, your body tensing ever so slightly already, anticipating building within you.")

		saynn("[say=pc]Tavi.. I'm gonna..[/say]")

		saynn("Hearing that, Tavi receives a boost of confidence that pushes her to increase the onslaught. Her paws knead your balls while her head is rocking back and forth at a rapid pace.. until the moment of no return comes..")

		saynn("Ecstasy washes over your body as you grunt and increase the grip on Tavi's hair. Your {pc.penis} is throbbing in her mouth as it starts shooting many strings of {pc.cum}, filling it. Tavi's eyes are locked onto yours, she obediently waits for you to finish orgasming.")

		saynn("[say=pc]Very.. good..[/say]")

		saynn("Tavi smiles. She waits a bit longer before letting go of your cock and presenting you her mouth, full of your seed. After that, she closes it and swallows, her throat visible contracting with each gulp. She presents her mouth yet again, empty this time..")

		saynn("[say=tavi]Strange taste..[/say]")

		saynn("Tavi licks her lips.")

		saynn("[say=tavi]But I can get used to it~.[/say]")

		saynn("You, still catching your breath, smile back. Tavi uses her tongue to quickly clean your cock, removing the most obvious messy spots.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "firstbj_throatpie"):
		playAnimation(StageScene.SexOral, "fast", {npc="tavi", bodyState={exposedCrotch=true, hard=true}})
		saynn("Tavi looks up at you with those 'I want more' eyes. Well, if she really wants to be tested..")

		saynn("You get a tight grip on her hair, pretty much forcing Tavi's head to be in one position while you begin to do the motions with your hips, thrusting your cock into Tavi's mouth.. trying to go deeper than before.")

		saynn("Tavi's eyes open wide as she realizes that the tip of your cock is stretching her throat. She tries her best to endure the weird sensations that arise from that.")

		saynn("[say=pc]Ngh.. Feel free to gag and choke. Hit my legs if you want me to stop.[/say]")

		saynn("Tavi nods subtly, her cheeks glowing while her eyes look obedient.")

		saynn("You become even more rough, pretty much just face-fucking Tavi, your cock stretching her throat. At some point she just can't ignore the gag reflex. The wet and sloppy noises of Tavi's eager mouth are filling the cell while you thrust harder and faster, forcing your way through her clenching throat walls.")

		saynn("Tavi is clearly choking on your shaft, lonely tears streaming down her tears.. while her throat brings you so much pleasure.. No matter how bad it gets, Tavi doesn't tap your legs.")

		saynn("[say=pc]Get ready..[/say]")

		saynn("You are unable to endure this for very long. When your climax catches up with you, a low growl of pleasure leaves your lungs as you shove your dick as deep as that throat allows before letting it throb and release its seed.. deep inside..")

		saynn("Tavi is squirming actively while you hold her still, she clearly can't breathe while this is happening, forced to be your cock sleeve instead.. Her eyes begin to show her getting weaker, her shaky paw deliberates, hovering near your leg.")

		saynn("[say=pc]Good girl..[/say]")

		saynn("It's only when she is about to give up, you finally pull your cock out of her mouth, causing Tavi to start coughing and gasping for air, there are a few visible lines of saliva hanging between her lips and your wet shaft.")

		saynn("[say=tavi]T-that was.. w-wow..[/say]")

		saynn("Her breathing is ragged for quite a while. But then she drags her tongue over your messy cock for the last time, thoroughly cleaning it.")

		saynn("[say=pc]Proud of you, Tavi.[/say]")

		saynn("Tavi smiles softly, keeping her chin low.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "firstbj_strapon"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="kneel", bodyState={exposedCrotch=true}})
		saynn("You lean against one of the walls of Tavi's dimly lit cell and point at the floor before you.")

		saynn("[say=pc]Come here, Tavi. Time for some training.[/say]")

		saynn("A mix of curiosity and desire shines in the feline's eyes. She slowly moves close to you before gracefully lowering herself to her knees before you. Tavi learned that gesture quite quickly.")

		if (GM.pc.isFullyNaked()):
			saynn("With a gentle touch, you guide Tavi's paws to your waist, indicating what you want her to do.")

		else:
			saynn("With a gentle touch, you guide Tavi's paws to your waist, helping them undress you, until your crotch gets exposed.")

		saynn("[say=pc]I wanna teach you the art of giving pleasure. I don't really have a"+str(" free" if GM.pc.isWearingChastityCage() else "")+" dick for you to practice on. But we can use this instead.[/say]")

		saynn("You produce one of the strapons that Tavi had and begin securing it around your waist. Tavi admires the sight, her paws sliding over your thighs.")

		saynn("[say=tavi]I trust you..[/say]")

		saynn("Feeling her curious gaze on your crotch makes you slightly aroused already.. Too bad you won't really get a chance to cum.")

		addButton("Continue", "Let her start", "firstbj_start_strapon")
	if(state == "firstbj_start_strapon"):
		playAnimation(StageScene.SexOral, "tease", {npc="tavi", bodyState={exposedCrotch=true, hard=true}})
		saynn("Tavi hesitates for a moment. With some delicate touches, she starts caressing the strapon, feeling how firm and yet bendy it is beneath her digits. After that, she leans in closer, her warm breath causing some condensation as she places a little playful kiss at the tip.")

		saynn("You move Tavi's short hair out of the way and get a grip on it, just to help her get into the mindset more.")

		saynn("[say=pc]That's it, good girl. Take your time.. Pretend it's a real cock..[/say]")

		saynn("Tavi's cheeks blush from the compliments, she is certainly not used to them. But your encouragement does make her more confident, the tall kitty lets her tongue out before proceeding to explore the rubber tip of the strapon with little flicks.")

		saynn("Your breath becomes a little deeper as you watch her, the display is quite arousing.. even if you don't receive any direct stimulation..")

		saynn("[say=pc]Ready to go further?[/say]")

		saynn("Tavi nods and wraps her lips around the strapon as she takes some of it into her mouth, past her sharp fangs. You smile as the tip of your fake member already hits the back of her mouth. At the same time, her paws land on your thighs and gently caress them.")

		addButton("Continue", "See what happens next", "firstbj_action_strapon")
	if(state == "firstbj_action_strapon"):
		playAnimation(StageScene.SexOral, "sex", {npc="tavi", bodyState={exposedCrotch=true, hard=true}})
		saynn("Tavi starts sucking you off, slowly moving her head along the surface of that rubber cock, her tongue doing more little licks that would provide some extra stimulation. She doesn't let it get too deep, her throat is not ready yet.")

		saynn("[say=pc]Very nice, Tavi. You are learning so quickly..[/say]")

		saynn("Tavi finds a rhythm that she is comfortable with. She seems to be slowly getting used to sucking a rubber toy. Your hand strokes her hair and scratches her behind the ears, causing her to start purring.")

		saynn("Your breath is quite deep now, Tavi looks up at you, her eyes sparkling with satisfaction and confidence.")

		saynn("How do you wanna end this lesson?")

		addButton("Simple", "Just pull out", "firstbj_strapon_pull_out")
		if (sexSkill > 2):
			addButton("Deepthroat", "Make Tavi deepthroat the toy for as long as she can", "firstbj_strapon_deepthroat")
		else:
			addDisabledButton("Deepthroat", "Tavi is not skilled enough yet")
		if (sexSkill > 5):
			addButton("Face-fucking", "Fuck that throat rough", "firstbj_strapon_facefuck")
		else:
			addDisabledButton("Face-fucking", "Tavi is not skilled enough yet")
	if(state == "firstbj_strapon_pull_out"):
		playAnimation(StageScene.SexHandjob, "sex", {npc="tavi", bodyState={exposedCrotch=true, hard=true}})
		saynn("She did pretty good overall. You decide to stop the lesson right there and pull the strapon out. But Tavi seems to be enjoying playing with it too much, her paws land on it and keep stroking it.. until something starts to happen with the toy.")

		saynn("[say=pc]You did good, Tavi. You can stop.[/say]")

		saynn("But she doesn't. Suddenly something triggers the toy, causing it to.. release the cumlube that was stored in it. Tavi gasps as her face gets covered in ropes of thick white stuff.")

		saynn("[say=tavi]Oh..[/say]")

		saynn("[say=pc]Wow.[/say]")

		saynn("The hot thick cum-like substance creates a nice contrast against her flushed green cheeks, even causing her to close one of her eyes completely.")

		saynn("[say=pc]Really good, Tavi. You did good.[/say]")

		saynn("She nods subtly, her tongue sneakily tastes the stuff.")

		saynn("[say=tavi]T-thank you..[/say]")

		saynn("That was a nice lesson.")

		addButton("Continue", "See what happens next", "endthescene_removestrapon")
	if(state == "firstbj_strapon_deepthroat"):
		playAnimation(StageScene.SexOral, "sex", {npc="tavi", bodyState={exposedCrotch=true, hard=true}})
		saynn("Tavi has certainly gotten better at this after receiving some training. She knows exactly how to combine the licks of her tongue and the work of her lips to make it look nice and hot. You wonder if she can do more..")

		saynn("[say=pc]You're doing great, Tavi. Wanna try going even deeper?[/say]")

		saynn("Hearing that, Tavi receives a boost of confidence that pushes her to try new things. Her paws are resting on your legs while her head is rocking back and forth, trying to let the rubber cock slightly deeper each time..")

		saynn("Her throat resists quite a lot. Tavi looks quite stressed while trying to suppress the weird sensations in her throat.")

		saynn("[say=pc]You should know that they love when sluts choke and gag on their cocks. Don't be afraid~.[/say]")

		saynn("Tavi listens carefully and just.. gathers all of her willpower.. before forcing herself onto the rubber cock.. until her snout bumps your crotch.")

		saynn("Tears begin streaming down her blushing cheeks. Wet sloppy noises begin to escape from Tavi's mouth as her throat is clenching the toy tightly.")

		saynn("After a few seconds she realizes that she can't breathe and so the panic settles in her, causing her to finally pull away.")

		saynn("[say=pc]Good try, Tavi. Very good.[/say]")

		saynn("Tavi smiles while trying to get her breathing stable. There are a few lines of saliva between her mouth and the toy.")

		saynn("[say=tavi]Thank you.[/say]")

		saynn("You smile back as Tavi uses her tongue to quickly clean the strapon, removing the most obvious messy spots.")

		addButton("Continue", "See what happens next", "endthescene_removestrapon")
	if(state == "firstbj_strapon_facefuck"):
		playAnimation(StageScene.SexOral, "fast", {npc="tavi", bodyState={exposedCrotch=true, hard=true}})
		saynn("Tavi looks up at you with those 'I want more' eyes. Well, if she really wants to be tested..")

		saynn("You get a tight grip on her hair, pretty much forcing Tavi's head to be in one position while you begin to do the motions with your hips, thrusting the strapon into Tavi's mouth.. trying to go deeper than before.")

		saynn("Tavi's eyes open wide as she realizes that the tip of your toy is stretching her throat. She tries her best to endure the weird sensations that arise from that.")

		saynn("[say=pc]Ngh.. Feel free to gag and choke. Hit my legs if you want me to stop.[/say]")

		saynn("Tavi nods subtly, her cheeks glowing while her eyes look obedient.")

		saynn("You become even more rough, pretty much just face-fucking Tavi, your rubber cock stretching her throat. At some point she just can't ignore the gag reflex. The wet and sloppy noises of Tavi's eager mouth are filling the cell while you thrust harder and faster, forcing your way through her clenching throat walls.")

		saynn("Tavi is clearly choking on the rubber shaft, lonely tears streaming down her tears.. while her throat grips you so much.. No matter how bad it gets, Tavi doesn't tap your legs.")

		saynn("[say=pc]Doing great~..[/say]")

		saynn("You try to keep this pace but it's quite exhausting. Tavi seems to be having the time of her life though, her lusty eyes rolling up as her tongue pleases that toy, curling around it even.")

		saynn("Tavi is squirming actively while you hold her still, she clearly can't breathe while this is happening, forced to be your cock sleeve instead.. Her eyes begin to show her getting weaker, her shaky paw deliberates, hovering near your leg.")

		saynn("[say=pc]Good girl..[/say]")

		saynn("It's only when she is about to give up, you finally pull your rubber cock out of her mouth, causing Tavi to start coughing and gasping for air, there are a few visible lines of saliva hanging between her lips and the wet shaft.")

		saynn("[say=tavi]T-that was.. w-wow..[/say]")

		saynn("Her breathing is ragged for quite a while. But then she drags her tongue over your messy strapon for the last time, thoroughly cleaning it.")

		saynn("[say=pc]Proud of you, Tavi.[/say]")

		saynn("Tavi smiles softly, keeping her chin low.")

		addButton("Continue", "See what happens next", "endthescene_removestrapon")
	if(state == "cowgirl"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcBodyState={naked=true}})
		saynn("Tension rises as you invite Tavi to follow you to her inmate bed.")

		saynn("[say=pc]You're gonna practice riding me today. Got it?[/say]")

		saynn("Tavi, still new to this whole sex thing, offers you a shy smile. Her eyes seem to be showing a mix of curiosity and nervousness.")

		saynn("[say=tavi]I can try.[/say]")

		saynn("[say=pc]I will guide you.[/say]")

		saynn("She nods and lets you strip her uniform, exposing her beautiful chest and tight neat pussy. You prepare yourself as well..")

		addButton("Lie down", "Position yourself on the bed", "cowgirl_lie")
	if(state == "cowgirl_lie"):
		playAnimation(StageScene.SexCowgirl, "tease", {npc="tavi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("You lie down on her bed before taking Tavi's paw and helping her to settle above you. Her cheeks blush slightly when she straddles your hips, her crotch is hovering above your exposed {pc.penis}.")

		saynn("[say=pc]Help me get hard, Tavi.[/say]")

		saynn("She nods and teases you with her digits until blood starts flowing to your member. That's when she gets a better grasp and starts stroking it slightly. Feels nice.. but..")

		saynn("[say=pc]You can use your body too, kitty.[/say]")

		saynn("Tavi bites her lip, hearing that offer. She lowers her frame just a bit, enough for the tip of your member to brush against her sensitive folds. Tavi's pussy is radiating so much warmness.. She starts grinding your shaft ever so slightly, spreading her juices along the veiny surface of your cock.")

		saynn("[say=tavi]Like that~?..[/say]")

		saynn("You nod and let Tavi do everything at her own pace. Eventually she stops.. and raises herself again, aligning her wet slit better..")

		addButton("Continue", "See what happens next", "cowgirl_ride")
	if(state == "cowgirl_ride"):
		playAnimation(StageScene.SexCowgirl, "sex", {npc="tavi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("You hold your hands on Tavi's waist, offering her some support while she begins lowering herself directly onto your {pc.penis}, its tip spreading her awaiting folds wide before disappearing inside her. Oh wow, she is even more warm inside.")

		saynn("Tavi continues to bring herself down onto your member.. until it hits the natural barricade that is her cervix. A little cute moan escapes her. Tavi's inner walls hug you so well..")

		saynn("[say=pc]You're doing great.[/say]")

		saynn("As Tavi begins to find her rhythm, you help her find the right motion by guiding her hips. Her breath quickens as she starts feeling your length sliding in and out of her, sensations making her eager to continue.")

		saynn("[say=tavi]Feels nice.. And I'm on top..[/say]")

		saynn("[say=pc]Let the pleasure guide your motions.[/say]")

		saynn("Her pace is still teasingly slow. But your words and touches provide Tavi with confidence to start riding you faster, causing her {tavi.breasts} to bounce. Her movements become more fluid and instinctual, her pussy stretching to accommodate your size.")

		saynn("[say=pc]You're a natural..[/say]")

		saynn("Tavi takes the lead, finding her own pace. But your hands are still there on her hips, gripping them tightly. She smiles, proudly presenting you her jiggling chest as she rides you.")

		saynn("[say=tavi]I can get used to this~. Ah~..[/say]")

		saynn("As Tavi's arousal rises, you begin to feel her pussy tightening around your member, her inner walls pulsing with every descend. The friction brings both of you to the edge quite fast..")

		addButton("Inside", "Let Tavi receive your seed", "cowgirl_inside")
		addButton("Outside", "Let Tavi's body receive your seed", "cowgirl_outside")
	if(state == "cowgirl_inside"):
		playAnimation(StageScene.SexCowgirl, "inside", {npc="tavi", pc="pc", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("As your shared pleasure reaches its peak, a powerful orgasm overwhelms you and Tavi. Her body arches with ecstasy as your throbbing cock starts flooding her womb full of your seed. The choice to creampie your pet during the training might be a strange one.. but it feels right.")

		saynn("[say=tavi]So much.. inside..[/say]")

		saynn("You can feel her inner walls clenching around your shaft, little moans escaping from her as she stops riding you and just.. lets the pleasure waves wash over her.")

		saynn("[say=pc]You are amazing.[/say]")

		saynn("Tavi tries to cover her blush with her paws, still with your cock inside her.")

		saynn("[say=tavi]I have a good teacher, okay?..[/say]")

		saynn("[say=pc]Sure~.[/say]")

		saynn("You rest together like that. At some point the sensitivity returns to Tavi's pussy, causing her to raise herself off of your dick and showcasing her drippy stuffed sex.")

		saynn("[say=tavi]How am I gonna clean that..[/say]")

		saynn("Maybe she just shouldn't.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "cowgirl_outside"):
		playAnimation(StageScene.SexCowgirl, "tease", {npc="tavi", pc="pc", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("As your shared pleasure reaches its peak, a powerful orgasm overwhelms you and Tavi.")

		saynn("[say=pc]Not inside.[/say]")

		saynn("Tavi listens to you, quickly raising herself and just sitting on your legs, moments before your throbbing starts shooting powerful lines of seed onto her belly and crotch. Messy. But at least you didn't creampie your pet. At the same time, Tavi is shaking as the pleasure waves cause her muscles to tense up, even her pussy is contracting visibly.")

		saynn("[say=tavi]Ngh-h.. Hot cum.. all over me..[/say]")

		saynn("Both of you are left to pant heavily.")

		saynn("[say=pc]You are amazing.[/say]")

		saynn("Tavi tries to cover her blush with her paws.")

		saynn("[say=tavi]I have a good teacher, okay?..[/say]")

		saynn("[say=pc]Sure~.[/say]")

		saynn("You proceed to rest like that for a bit. Your {pc.cum} slowly drips down her belly.")

		saynn("[say=tavi]How am I gonna clean that..[/say]")

		saynn("Maybe she just shouldn't.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "cowgirl_strapon"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcBodyState={naked=true}, bodyState={naked=true}})
		saynn("Tension rises as you invite Tavi to follow you to her inmate bed.")

		saynn("[say=pc]You're gonna practice riding me today. Got it?[/say]")

		saynn("Tavi, still new to this whole sex thing, offers you a shy smile. Her eyes seem to be showing a mix of curiosity and nervousness.")

		saynn("[say=tavi]I can try.[/say]")

		saynn("[say=pc]I will guide you.[/say]")

		saynn("She nods and lets you strip her uniform, exposing her beautiful chest and tight neat pussy. You prepare yourself as well, undressing and securing a strapon around your waist, one that Tavi graciously provided..")

		addButton("Lie down", "Position yourself on the bed", "cowgirl_lie_strapon")
	if(state == "cowgirl_lie_strapon"):
		playAnimation(StageScene.SexCowgirl, "tease", {npc="tavi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("You lie down on her bed before taking Tavi's paw and helping her to settle above you. Her cheeks blush slightly when she straddles your hips, her crotch is hovering above your new rubber member.")

		saynn("[say=pc]Help lube it up, Tavi.[/say]")

		saynn("She nods and licks her digits before wrapping them around the shaft. She starts stroking it slightly. You don't feel much since it's just a toy. But still, the sight is arousing..")

		saynn("[say=pc]There are better fluids than saliva that you can use, kitty.[/say]")

		saynn("Tavi bites her lip, hearing that tip. She lowers her frame just a bit, enough for the tip of the strapon to brush against her sensitive folds. Tavi's pussy is radiating so much warmness.. She starts grinding the rubber shaft ever so slightly, spreading her juices along the shiny surface.")

		saynn("[say=tavi]Like that~?..[/say]")

		saynn("You nod and let Tavi do everything at her own pace. Eventually she stops.. and raises herself again, aligning her wet slit better..")

		addButton("Continue", "See what happens next", "cowgirl_ride_strapon")
	if(state == "cowgirl_ride_strapon"):
		playAnimation(StageScene.SexCowgirl, "sex", {npc="tavi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("You hold your hands on Tavi's waist, offering her some support while she begins lowering herself directly onto your rubber member, its tip spreading her awaiting folds wide before disappearing inside her. It goes pretty smoothly, thanks to Tavi's juices.")

		saynn("Tavi continues to bring herself down onto the toy.. until it hits the natural barricade that is her cervix. A little cute moan escapes her. Tavi's inner walls hug you so well..")

		saynn("[say=pc]You're doing great.[/say]")

		saynn("As Tavi begins to find her rhythm, you help her find the right motion by guiding her hips. Her breath quickens as she starts feeling your length sliding in and out of her, sensations making her eager to continue.")

		saynn("[say=tavi]Feels nice.. And I'm on top..[/say]")

		saynn("[say=pc]Let the pleasure guide your motions.[/say]")

		saynn("Her pace is still teasingly slow. But your words and touches provide Tavi with confidence to start riding you faster, causing her {tavi.breasts} to bounce. Her movements become more fluid and instinctual, her pussy stretching to accommodate the size of that dildo.")

		saynn("[say=pc]You're a natural..[/say]")

		saynn("Tavi takes the lead, finding her own pace. But your hands are still there on her hips, gripping them tightly. She smiles, proudly presenting you her jiggling chest as she rides you.")

		saynn("[say=tavi]I can get used to this~. Ah~..[/say]")

		saynn("As Tavi's arousal rises, you begin to feel her pussy tightening around your strapon, her inner walls pulsing with every descend. The friction brings her to the edge quite fast..")

		addButton("Knot", "Pull Tavi harder onto the strapon", "cowgirl_strapon_knot")
		addButton("No knot", "Let Tavi's enjoy it", "cowgirl_strapon_noknot")
	if(state == "cowgirl_strapon_knot"):
		playAnimation(StageScene.SexCowgirl, "inside", {npc="tavi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("As Tavi's pleasure reaches its peak, you decide to test her a little more. The moment her body arches with ecstasy, you pull her lower unto your strapon.. until the rubber knot slips inside too.")

		saynn("[say=tavi]H-he.. AH!..[/say]")

		saynn("Her body has begun shaking, her pussy clenching the toy that's stretching her extremely wide. Tavi's tight pussy puts enough pressure on that orb to suddenly cause the strapon to force its stored cumlube directly into her womb.")

		saynn("Knotting your pet during training might be a strange idea. But.. why not?")

		saynn("[say=tavi]W-wha.. So much.. inside..[/say]")

		saynn("You smile watching Tavi struggle to contain all the sensations. Little moans escaping from her as she is forced to be tied with you and just.. lets the pleasure waves wash over her.")

		saynn("[say=pc]You are amazing.[/say]")

		saynn("Tavi tries to cover her blush with her paws, still with the full length inside her.")

		saynn("[say=tavi]Ngh-h..[/say]")

		saynn("You rest together like that for about a minute. At some point the sensitivity returns to Tavi's pussy, causing pain to her. So you help her to escape the knot by pulling her up until the strapon gets yanked out with a satisfying plop noise. Cumlube starts streaming down Tavi's thighs.")

		saynn("[say=tavi]How am I gonna clean that..[/say]")

		saynn("Maybe she just shouldn't.")

		addButton("Continue", "See what happens next", "endthescene_removestrapon")
	if(state == "cowgirl_strapon_noknot"):
		playAnimation(StageScene.SexCowgirl, "inside", {npc="tavi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("As Tavi's pleasure reaches its peak, a powerful orgasm overwhelms her. You support Tavi while her body arches from sheer ecstasy.")

		saynn("[say=tavi]So good..[/say]")

		saynn("You can feel her inner walls clenching around the toy, making any motions harder. Little moans escaping from her as she stops riding you and just.. lets the pleasure waves wash over her.")

		saynn("[say=pc]You are amazing.[/say]")

		saynn("Tavi tries to cover her blush with her paws, still with your strapon inside her.")

		saynn("[say=tavi]I have a good teacher, okay?..[/say]")

		saynn("[say=pc]Sure~.[/say]")

		saynn("You rest together like that. At some point the sensitivity returns to Tavi's pussy, causing her to raise herself off of your toy and showcasing her wet sex.")

		addButton("Continue", "See what happens next", "endthescene_removestrapon")
	if(state == "pussylick"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="kneel"})
		saynn("Time to train Tavi's tongue game a little.. You grab her hand and lean your back against the wall while guiding her to kneel before you.")

		saynn("[say=pc]On your knees, Tavi.[/say]")

		saynn("She nods and obeys your touch, slowly lowering herself until her head is roughly at your belt level.")

		if (GM.pc.isFullyNaked()):
			saynn("Your exposed {pc.pussyStretch} pussy is already in her view, making her cheeks glow.")

			saynn("[say=pc]Closer~.[/say]")

		else:
			saynn("[say=pc]Undress me. And then get closer~.[/say]")

			saynn("Your orders make Tavi's cheeks glow. She can probably already feel the scent coming from your sex..")

		addButton("Watch", "See what Tavi will do", "pussylick_watch")
	if(state == "pussylick_watch"):
		playAnimation(StageScene.SexOral, "tease", {npc="tavi", bodyState={exposedCrotch=true, hard=true}})
		if (GM.pc.isFullyNaked()):
			saynn("Tavi bites her lips and slowly brings herself closer. You spread your legs open, offering the feline a great view of your pussy"+str(" and your {pc.penis}" if GM.pc.hasPenis() else "")+".")

		else:
			saynn("Tavi bites her lips and slowly brings herself closer. Her paws tug on your clothing, exposing your private bits to her eyes. You spread your legs open, offering the feline a great view of your {pc.pussyStretch} pussy"+str(" and your {pc.penis}" if GM.pc.hasPenis() else "")+".")

		saynn("[say=pc]You're gonna eat me out, Tavi. Don't worry, I will guide you.[/say]")

		saynn("Her gaze meets with yours for a second. The air in the cell is charged with anticipation as she leans in even closer and lets her breath brush against your sex. Your hand lands on her hair, digits sifting between the strands, helping her focus on the task.")

		saynn("[say=tavi]Of course..[/say]")

		saynn("Feels strange to have your roles reversed.. Tavi probably feels it too. But she doesn't mind, she flicks her tongue out and begins to carefully use it, cautiously tracing little wet lines around your sensitive folds, to the best of her ability.")

		addButton("Continue", "See what happens next", "pussylick_lick")
	if(state == "pussylick_lick"):
		playAnimation(StageScene.SexOral, "lick", {npc="tavi", bodyState={exposedCrotch=true, hard=true}})
		saynn("It feels nice.. even if it's just teasing for now. You can feel your pussy becoming wet while Tavi's tongue is doing a little dance around the outer border. Your breathing gets slightly deeper.")

		saynn("[say=pc]Be more brave, Tavi.[/say]")

		saynn("She nods and tries to drag her tongue over the pussy, tasting your arousal in the process. Her brows get raised as she savors the strange taste. But you use your grasp on her hair to make her return to licking.")

		saynn("[say=pc]Be a good girl and don't slack.[/say]")

		saynn("Tavi obeys, dragging her tongue over the folds again and again, causing you to produce some soft moans. Her feline ears pick up on those and make her focus on the areas that make you moan the most. With each gasp and sigh, Tavi slowly gains confidence, licking your pussy pretty actively. Her tongue has a rough texture that provides extra stimulation.")

		saynn("With a subtle tilt of your hips, you guide Tavi to focus on the specific little bump just above the folds. When Tavi's tongue finds your clit, your body starts to shiver a bit.")

		saynn("[say=pc]Ah..[/say]")

		saynn("Tavi blinks a few times and proceeds to rub your little bean more, flicking it left and right with her feline tongue. All the while her lips are pressed against your folds, gently sucking on them.")

		saynn("As Tavi becomes bolder, your grip on her hair tightens, pulling her closer, urging to explore deeper. The intensity builds, the feline can probably feel your body tensing with impending release already..")

		addButton("Cum", "Just ride those pleasure waves", "pussylick_cum")
		if (sexSkill > 2):
			addButton("Squirt", "Let Tavi taste your juices more", "pussylick_squirt")
		else:
			addDisabledButton("Squirt", "Tavi needs to be more skilled for this")
		if (sexSkill > 5):
			addButton("Grind", "Spread your juices all over Tavi's face", "pussylick_grind")
		else:
			addDisabledButton("Grind", "Tavi needs to be more skilled for this")
	if(state == "pussylick_cum"):
		playAnimation(StageScene.SexOral, "start", {npc="tavi", pcCum=true, bodyState={exposedCrotch=true, hard=true}})
		saynn("Finally, you reach your climax, your body shivering and arching from ecstasy. Tavi smiles while watching you and your pussy, knowing that she caused that.")

		saynn("Your breathing is quick and ragged. Your hands pats the feline that did a pretty good job.")

		saynn("[say=pc]Good girl.[/say]")

		saynn("Tavi blushes and instantly avoids eye contact. You can see her licking her lips though.")

		saynn("That was a pretty good lesson.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "pussylick_squirt"):
		playAnimation(StageScene.SexOral, "tease", {npc="tavi", pcCum=true, bodyState={exposedCrotch=true, hard=true}})
		saynn("Finally, you reach your climax, your body shivering and arching from ecstasy. Tavi tries to pull away but you use your hand to keep her maw pressed firmly against your pulsing slit.")

		saynn("Tavi feels the firm touch which makes her return to licking and redouble her efforts, eating you out more thoroughly.")

		saynn("[say=pc]Mouth, now..[/say]")

		saynn("She parts her lips more just in time for your overstimulated pussy to suddenly release a fountain of transparent juices, most of them landing on Tavi's tongue, allowing her to swallow it all.")

		saynn("After that orgasm, your breathing is quick and ragged. Your hands pats the feline that did a pretty good job eating you out.")

		saynn("[say=pc]Good girl.[/say]")

		saynn("Tavi blushes and instantly avoids eye contact. You can see her licking her lips though.")

		saynn("That was a pretty good lesson.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "pussylick_grind"):
		playAnimation(StageScene.SexOral, "grind", {npc="tavi", bodyState={exposedCrotch=true, hard=true}})
		saynn("A devious thought comes to your mind. You get a better grasp on her hair and keep her head stable as you begin to grind your pussy against her face. She gets lost at first but then returns to licking, dragging her tongue over your folds while you go back and forth across her face.")

		saynn("[say=pc]Ngh-h..[/say]")

		saynn("Passionate moans leave your lips as your pussy squirts, coating Tavi's fur with your juices and forcing your scent into it. The feline doesn't stop licking you, causing your body to start shaking, your muscles tensing, pushing her into your pussy harder.")

		saynn("After that explosive release, you finally let Tavi pull away and start breathing again.")

		saynn("[say=pc]Good pussy licker.. maybe the best one even.[/say]")

		saynn("You can hear purring from her as she is licking her lips.")

		saynn("[say=tavi]Thank you~.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "anal"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcBodyState={naked=true}})
		if (isVirgin):
			saynn("Tavi still has her virginity so having any vaginal sex with her will cause her to lose it. But there is always another way..")

		saynn("You call Tavi to get closer to you. She obeys and looks at you with her curious eyes.")

		saynn("[say=pc]We're gonna try anal sex today.[/say]")

		saynn("That is certainly a surprise for her. Tavi's eyes go wide.")

		saynn("[say=tavi]Are you.. sure? I never really did anything like that..[/say]")

		saynn("Your hands land on her butt and gently knead it while your voice tries to be reassuring.")

		saynn("[say=pc]I will be very gentle. It will feel good, Tavi.[/say]")

		saynn("Tavi deliberates for some time and then nods, clearly trusting you enough to do this.")

		saynn("Your hands begin to undress her, slowly undoing all of the buttons of her shirt before pulling down her shorts.")

		saynn("[say=pc]Get on the bed.[/say]")

		saynn("Naked Tavi climbs onto her inmate bed, waiting for you to do the next move.")

		addButton("Behind her", "Sit behind Tavi and prepare her", "anal_prepare")
	if(state == "anal_prepare"):
		playAnimation(StageScene.SexAllFours, "tease", {npc="tavi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("You take your spot behind Tavi, your hands landing on her butt and giving it some attention. Eventually, she moves her tail out of the way, exposing the little tight tailhole that was hiding behind. It's flesh-colored, which means that it's also green.")

		saynn("[say=pc]Take deep breaths.[/say]")

		saynn("She does that but her body is still quite tense. Gently, you spread her buttcheeks and begin tracing gentle circles around the star, coaxing Tavi to relax.")

		saynn("You lick one of your fingers and begin prodding the entrance. Saliva is a bad lube so it doesn't go too well, Tavi's virgin-tight anal ring clenching hard around you.")

		saynn("[say=tavi]Harder, maybe?..[/say]")

		saynn("Nah, that's not the right approach. You decide to land your free hand on Tavi's neglected pussy and start giving it a few sensual rubs and strokes. Quite quickly, that begins to have an effect on her, causing her folds to get moist. You coat your digits in your juices and return to prodding her back entrance.. until one of the digits slides inside, causing Tavi to make a soft noise.")

		saynn("[say=pc]There we go.[/say]")

		saynn("You give her time to adjust before continuing, gently thrusting your fingers in and out.. until Tavi's body begins to yield.. her clenched muscles relaxing.")

		saynn("[say=tavi]Feels nice..[/say]")

		saynn("You introduce a second finger, stretching her anus gently and allowing her to accommodate the sensations. Little moans begin to fill the air, her body responding eagerly to her butt being fingered.")

		saynn("[say=tavi]Please don't stop..[/say]")

		saynn("[say=pc]I have a better idea.[/say]")

		saynn("Your {pc.penis} has gotten quite hard while you were watching Tavi enjoying herself so much. You pull your digits away from her butt and grab some more of her arousal before coating your shaft with it. After that.. you slowly press the tip of your cock against Tavi's tight entrance.")

		saynn("[say=tavi]Are you sure?..[/say]")

		saynn("Your free hand returns to rubbing Tavi's butt, calming her down as you begin to try and penetrate her, the head of your member putting more and more pressure on that tailhole.. until her inner walls begin to stretch and accept it..")

		addButton("Push", "Penetrate Tavi's ass", "anal_push")
	if(state == "anal_push"):
		playAnimation(StageScene.SexAllFours, "inside", {npc="tavi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("With every inch that disappears inside Tavi, little gasps escape her. But no matter what, she trusts you enough to stay still on all fours. Her body is clenching around you.. but that also feels incredibly good.")

		saynn("[say=tavi]Ah..[/say]")

		saynn("Eventually, Tavi takes most of your length, her tail wagging a little, her cheeks blushing. You give her plenty more time to get used to her ass being full.")

		saynn("You lean forward and whisper some sweet words into Tavi's ear.")

		saynn("[say=pc]Good girl. Wasn't so hard, see?[/say]")

		saynn("She nods subtly, clearly still feeling some discomfort but trying to hide it.")

		addButton("Move", "Start to move your hips", "anal_move")
	if(state == "anal_move"):
		playAnimation(StageScene.SexAllFours, "sex", {npc="tavi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("Slowly, you start to move your hips, sliding your cock inside her anus, leaving empty space just to stuff it again a few seconds later before the inner walls have the time to close. Your thrusts are measured and slow.")

		saynn("[say=tavi]I'm doing anal..[/say]")

		saynn("Tavi's breath becomes more uneven as her body starts to meet your motions with the opposite ones, inviting you to pick up the pace. Her pussy is dripping juices onto the bedsheets while more of those little moans escape her.")

		saynn("[say=tavi]And it's not that bad.. ah..[/say]")

		saynn("It feels nice for both of you. Your member is twitching while the inner walls put so much pressure onto it, which transfers to direct stimulation during your thrusts. You feel like you could cum from this very soon.. But Tavi obviously won't..")

		addButton("Stop for now", "Stop before the orgasm", "anal_stop")
		if (sexSkill >= 6):
			addButton("Harder", "Try to make Tavi cum", "anal_harder")
		else:
			addDisabledButton("Harder", "Tavi needs to be more skilled at sex")
	if(state == "anal_stop"):
		playAnimation(StageScene.SexAllFours, "tease", {npc="tavi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("The sensations are new and intense for Tavi. So, the more you continue, the more her discomfort begins to rise. But that's fine because it's just a training session. You decide to stop for now.")

		saynn("[say=pc]You're okay, Tavi?[/say]")

		saynn("[say=tavi]Y-yeah.. It's just a lot to take in.[/say]")

		saynn("[say=pc]You still did great.[/say]")

		saynn("As you pull out, Tavi's backdoor closes almost immediately back into a neat little star, wet from her juices. There is a somewhat visible glow to it though so it's a right call.")

		addButton("Continue", "That was nice", "endthescene")
	if(state == "anal_harder"):
		playAnimation(StageScene.SexAllFours, "fast", {npc="tavi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("You decide to cool down and stop your motions for a little bit, until that urge to orgasm fades away mostly. Tavi is squirming ever so slightly, trying to move her ass and enjoy your cock.")

		saynn("[say=tavi]I want more..[/say]")

		saynn("You feel the lust coming through her words. Good.")

		saynn("Your hand reaches for her short hair and gets a good grasp on it as you shove your {pc.penis} deep inside her ass! Even that seems to be acceptable for her, a passionate noise escapes her lips while her tailhole clenches around you so nicely..")

		saynn("You start thrusting inside her at a faster rhythm than before, pushing her limits.. gently but persistently. The anus has a lot of nerve endings which lets Tavi.. enjoy it. But cumming from that.. would require some extra effort.")

		saynn("And so you do that, angling yourself a little so your cock would massage her g-spot through the thin barrier between her anus and pussy. A gasp escapes from her as waves of pleasure begin rippling through her body, making her more eager.")

		saynn("[say=tavi]Yes-s!..[/say]")

		saynn("She sounds like a real buttslut, her asscheeks bouncing as your hips slap against them during each thrust. Your hand still holds her hair, making it so she can't escape your onslaught.")

		saynn("Your orgasm quickly approaches.. but Tavi is also experiencing something building up inside her.. some kind of pressure. Very soon after that, her pussy suddenly squirts out a fountain of juices, followed by her tailhole clenching hard around you!")

		saynn("[say=tavi]Ff-fu-uck!.. y-yeah..[/say]")

		saynn("You're gonna cum too, no way around that..")

		addButton("Cum", "Stuff Tavi's ass", "anal_cuminside")
	if(state == "anal_cuminside"):
		playAnimation(StageScene.SexAllFours, "inside", {npc="tavi", pc="pc", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("Tavi's body trembles with ecstasy as her tailhole tightens around your cock, pulling you deeper into her. Feeling that sudden burst of pleasure, you can no longer hold back.")

		saynn("Intoxicating orgasmic waves wash over you as your {pc.penis} starts throbbing and stuffing Tavi's tight asshole, your seed flooding her nethers full to the brim.")

		saynn("[say=tavi]Ngh-h..[/say]")

		saynn("She is shaking, her head hitting the pillow while her inner walls are milking you for every last drop of {pc.cum}.")

		saynn("[say=pc]What a good girl.[/say]")

		saynn("Moans escape from her, you notice her toes curling as Tavi tries to endure this crazy mix of feelings.")

		saynn("As you both begin to come down from the euphoric high, you pull your cock out, allowing Tavi's used hole to pulsate and start leaking.")

		saynn("[say=tavi]That felt great..[/say]")

		saynn("This lesson went a little too far. But.. at least it was fun.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "anal_strapon"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcBodyState={naked=true}, bodyState={naked=true}})
		if (isVirgin):
			saynn("Tavi still has her virginity so having any vaginal sex with her will cause her to lose it. But there is always another way..")

		saynn("You call Tavi to get closer to you. She obeys and looks at you with her curious eyes.")

		saynn("[say=pc]We're gonna try anal sex today.[/say]")

		saynn("That is certainly a surprise for her. Tavi's eyes go wide.")

		saynn("[say=tavi]Are you.. sure? I never really did anything like that..[/say]")

		saynn("Your hands land on her butt and gently knead it while your voice tries to be reassuring.")

		saynn("[say=pc]I will be very gentle. It will feel good, Tavi.[/say]")

		saynn("Tavi deliberates for some time and then nods, clearly trusting you enough to do this.")

		saynn("Your hands begin to undress her, slowly undoing all of the buttons of her shirt before pulling down her shorts.")

		saynn("[say=pc]Get on the bed.[/say]")

		saynn("You secure a strapon harness around your waist while naked Tavi climbs onto her inmate bed, waiting for you to do the next move.")

		addButton("Behind her", "Sit behind Tavi and prepare her", "anal_prepare_strapon")
	if(state == "anal_prepare_strapon"):
		playAnimation(StageScene.SexAllFours, "tease", {npc="tavi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("You take your spot behind Tavi, your hands landing on her butt and giving it some attention. Eventually, she moves her tail out of the way, exposing the little tight tailhole that was hiding behind. It's flesh-colored, which means that it's also green.")

		saynn("[say=pc]Take deep breaths.[/say]")

		saynn("She does that but her body is still quite tense. Gently, you spread her buttcheeks and begin tracing gentle circles around the star, coaxing Tavi to relax.")

		saynn("You lick one of your fingers and begin prodding the entrance. Saliva is a bad lube so it doesn't go too well, Tavi's virgin-tight anal ring clenching hard around you.")

		saynn("[say=tavi]Harder, maybe?..[/say]")

		saynn("Nah, that's not the right approach. You decide to land your free hand on Tavi's neglected pussy and start giving it a few sensual rubs and strokes. Quite quickly, that begins to have an effect on her, causing her folds to get moist. You coat your digits in your juices and return to prodding her back entrance.. until one of the digits slides inside, causing Tavi to make a soft noise.")

		saynn("[say=pc]There we go.[/say]")

		saynn("You give her time to adjust before continuing, gently thrusting your fingers in and out.. until Tavi's body begins to yield.. her clenched muscles relaxing.")

		saynn("[say=tavi]Feels nice..[/say]")

		saynn("You introduce a second finger, stretching her anus gently and allowing her to accommodate the sensations. Little moans begin to fill the air, her body responding eagerly to her butt being fingered.")

		saynn("[say=tavi]Please don't stop..[/say]")

		saynn("[say=pc]I have a better idea.[/say]")

		saynn("You pull your digits away from her butt and grab some more of her arousal before coating the strapon's shaft with it. After that.. you slowly press its tip against Tavi's tight entrance.")

		saynn("[say=tavi]Are you sure?..[/say]")

		saynn("Your free hand returns to rubbing Tavi's butt, calming her down as you begin to try and penetrate her, the head of your rubber member putting more and more pressure on that tailhole.. until her inner walls begin to stretch and accept it..")

		addButton("Push", "Penetrate Tavi's ass", "anal_push_strapon")
	if(state == "anal_push_strapon"):
		playAnimation(StageScene.SexAllFours, "inside", {npc="tavi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("With every inch that disappears inside Tavi, little gasps escape her. But no matter what, she trusts you enough to stay still on all fours. Her body is clenching around the strapon.. but you keep fighting the friction.")

		saynn("[say=tavi]Ah..[/say]")

		saynn("Eventually, Tavi takes most of your length, her tail wagging a little, her cheeks blushing. You give her plenty more time to get used to her ass being full.")

		saynn("You lean forward and whisper some sweet words into Tavi's ear.")

		saynn("[say=pc]Good girl. Wasn't so hard, see?[/say]")

		saynn("She nods subtly, clearly still feeling some discomfort but trying to hide it.")

		addButton("Move", "Start to move your hips", "anal_move_strapon")
	if(state == "anal_move_strapon"):
		playAnimation(StageScene.SexAllFours, "sex", {npc="tavi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("Slowly, you start to move your hips, sliding the rubber strapon inside her anus, leaving empty space just to stuff it again a few seconds later before the inner walls have the time to close. Your thrusts are measured and slow.")

		saynn("[say=tavi]I'm doing anal..[/say]")

		saynn("Tavi's breath becomes more uneven as her body starts to meet your motions with the opposite ones, inviting you to pick up the pace. Her pussy is dripping juices onto the bedsheets while more of those little moans escape her.")

		saynn("[say=tavi]And it's not that bad.. ah..[/say]")

		saynn("You don't feel much apart from being aroused mentally but it probably feels good for her. It's quite exhausting though..")

		addButton("Stop for now", "Stop before the orgasm", "anal_stop_strapon")
		if (sexSkill >= 6):
			addButton("Harder", "Try to make Tavi cum", "anal_harder_strapon")
		else:
			addDisabledButton("Harder", "Tavi needs to be more skilled at sex")
	if(state == "anal_stop_strapon"):
		playAnimation(StageScene.SexAllFours, "tease", {npc="tavi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("The sensations are new and intense for Tavi. So, the more you continue, the more her discomfort begins to rise. But that's fine because it's just a training session. You decide to stop for now.")

		saynn("[say=pc]You're okay, Tavi?[/say]")

		saynn("[say=tavi]Y-yeah.. It's just a lot to take in.[/say]")

		saynn("[say=pc]You still did great.[/say]")

		saynn("As you pull out, Tavi's backdoor closes almost immediately back into a neat little star, wet from her juices. There is a somewhat visible glow to it though so it's a right call.")

		addButton("Continue", "That was nice", "endthescene_removestrapon")
	if(state == "anal_harder_strapon"):
		playAnimation(StageScene.SexAllFours, "fast", {npc="tavi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("You decide to cool down and stop your motions for a little bit, recovering your breath. Tavi is squirming ever so slightly, trying to move her ass and enjoy that rubber cock.")

		saynn("[say=tavi]I want more..[/say]")

		saynn("You feel the lust coming through her words. Good.")

		saynn("Your hand reaches for her short hair and gets a good grasp on it as you shove your strapon deep inside her ass! Even that seems to be acceptable for her, a passionate noise escapes her lips while her tailhole clenches around you so nicely..")

		saynn("You start thrusting inside her at a faster rhythm than before, pushing her limits.. gently but persistently. The anus has a lot of nerve endings which lets Tavi.. enjoy it. But cumming from that.. would require some extra effort.")

		saynn("And so you do that, angling yourself a little so the toy would massage her g-spot through the thin barrier between her anus and pussy. A gasp escapes from her as waves of pleasure begin rippling through her body, making her more eager.")

		saynn("[say=tavi]Yes-s!..[/say]")

		saynn("She sounds like a real buttslut, her asscheeks bouncing as your hips slap against them during each thrust. Your hand still holds her hair, making it so she can't escape your onslaught.")

		saynn("Tavi is also experiencing something building up inside her.. some kind of pressure. Very soon after that, her pussy suddenly squirts out a fountain of juices, followed by her tailhole clenching hard around you!")

		saynn("[say=tavi]Ff-fu-uck!.. y-yeah..[/say]")

		saynn("Tavi's body trembles with ecstasy as her tailhole tightens around your strapon, pulling you deeper into her. She is shaking, her head hitting the pillow while her inner walls are trying to milk that strapon.. until it suddenly releases the stored cumlube deep into her nethers.")

		saynn("[say=pc]What a good girl.[/say]")

		saynn("Moans escape from her, you notice her toes curling as Tavi tries to endure this crazy mix of feelings.")

		saynn("As she begins to come down from the euphoric high, you pull your strapon out, allowing Tavi's used hole to pulsate and start leaking.")

		saynn("[say=tavi]That felt great..[/say]")

		saynn("This lesson went a little too far. But.. at least it was fun.")

		addButton("Continue", "See what happens next", "endthescene_removestrapon")
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

	if(_action == "firstbj_pick"):
		getModule("TaviModule").advanceSkill("taviSkillSex")
		if(GM.pc.hasReachablePenis()):
			usedStrapon = false
			setState("firstbj")
		else:
			usedStrapon = true
			setState("firstbj_strapon")
			var strapon = GlobalRegistry.createItem("StraponCanine")
			var fluids = strapon.getFluids()
			fluids.addFluid("CumLube", RNG.randi_range(3, 5)*100.0)
			GM.pc.getInventory().equipItem(strapon)
		return

	if(_action == "pussylick"):
		getModule("TaviModule").advanceSkill("taviSkillSex")

	if(_action == "cowgirl_pick"):
		getModule("TaviModule").advanceSkill("taviSkillSex")
		if(GM.pc.hasReachablePenis()):
			usedStrapon = false
			setState("cowgirl")
		else:
			usedStrapon = true
			setState("cowgirl_strapon")
			var strapon = GlobalRegistry.createItem("StraponCanine")
			var fluids = strapon.getFluids()
			fluids.addFluid("CumLube", RNG.randi_range(3, 5)*100.0)
			GM.pc.getInventory().equipItem(strapon)
		return

	if(_action == "anal_pick"):
		getModule("TaviModule").advanceSkill("taviSkillSex")
		if(GM.pc.hasReachablePenis()):
			usedStrapon = false
			setState("anal")
		else:
			usedStrapon = true
			setState("anal_strapon")
			var strapon = GlobalRegistry.createItem("StraponCanine")
			var fluids = strapon.getFluids()
			fluids.addFluid("CumLube", RNG.randi_range(3, 5)*100.0)
			GM.pc.getInventory().equipItem(strapon)
		return

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

	if(_action == "firstbj_start"):
		processTime(2*60)

	if(_action == "firstbj_action"):
		processTime(5*60)

	if(_action == "firstbj_facial"):
		processTime(2*60)
		getCharacter("tavi").cummedOnBy("pc")
		GM.pc.orgasmFrom("tavi")

	if(_action == "firstbj_mouth"):
		processTime(2*60)
		getCharacter("tavi").cummedInMouthBy("pc")
		GM.pc.orgasmFrom("tavi")

	if(_action == "firstbj_throatpie"):
		processTime(2*60)
		getCharacter("tavi").cummedInMouthBy("pc")
		GM.pc.orgasmFrom("tavi")

	if(_action == "firstbj_start_strapon"):
		processTime(2*60)

	if(_action == "firstbj_action_strapon"):
		processTime(5*60)

	if(_action == "firstbj_strapon_pull_out"):
		processTime(2*60)
		getCharacter("tavi").cummedOnBy("pc", FluidSource.Strapon)
		GM.pc.orgasmFrom("tavi")

	if(_action == "firstbj_strapon_deepthroat"):
		processTime(2*60)

	if(_action == "firstbj_strapon_facefuck"):
		processTime(2*60)
		getCharacter("tavi").cummedInMouthBy("pc")
		GM.pc.orgasmFrom("tavi")

	if(_action == "endthescene_removestrapon"):
		GM.pc.removeStrapon()
		endScene()
		return

	if(_action == "cowgirl_lie"):
		processTime(3*60)

	if(_action == "cowgirl_ride"):
		processTime(3*60)

	if(_action == "cowgirl_inside"):
		processTime(5*60)
		getCharacter("tavi").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("tavi")

	if(_action == "cowgirl_outside"):
		processTime(5*60)
		getCharacter("tavi").cummedOnBy("pc")
		GM.pc.orgasmFrom("tavi")

	if(_action == "cowgirl_lie_strapon"):
		processTime(3*60)

	if(_action == "cowgirl_ride_strapon"):
		processTime(3*60)

	if(_action == "cowgirl_strapon_knot"):
		processTime(5*60)
		getCharacter("tavi").cummedInVaginaBy("pc", FluidSource.Strapon)

	if(_action == "cowgirl_strapon_noknot"):
		processTime(5*60)
		#getCharacter("tavi").cummedOnBy("pc")

	if(_action == "pussylick_watch"):
		processTime(3*60)

	if(_action == "pussylick_lick"):
		processTime(3*60)

	if(_action == "pussylick_cum"):
		processTime(2*60)
		GM.pc.orgasmFrom("tavi")

	if(_action == "pussylick_squirt"):
		processTime(2*60)
		getCharacter("tavi").cummedInMouthBy("pc", FluidSource.Vagina)
		GM.pc.orgasmFrom("tavi")

	if(_action == "pussylick_grind"):
		processTime(2*60)
		getCharacter("tavi").cummedOnBy("pc", FluidSource.Vagina)
		GM.pc.orgasmFrom("tavi")

	if(_action == "anal_prepare"):
		processTime(8*60)

	if(_action == "anal_push"):
		processTime(4*60)

	if(_action == "anal_move"):
		processTime(3*60)

	if(_action == "anal_stop"):
		processTime(3*60)

	if(_action == "anal_harder"):
		processTime(3*60)

	if(_action == "anal_cuminside"):
		processTime(3*60)
		getCharacter("tavi").cummedInAnusBy("pc")
		GM.pc.orgasmFrom("tavi")

	if(_action == "anal_prepare_strapon"):
		processTime(8*60)

	if(_action == "anal_push_strapon"):
		processTime(4*60)

	if(_action == "anal_move_strapon"):
		processTime(3*60)

	if(_action == "anal_stop_strapon"):
		processTime(3*60)

	if(_action == "anal_harder_strapon"):
		processTime(3*60)
		getCharacter("tavi").cummedInAnusBy("pc", FluidSource.Strapon)

	setState(_action)

func saveData():
	var data = .saveData()

	data["isCorrupt"] = isCorrupt
	data["isPure"] = isPure
	data["isNormal"] = isNormal
	data["isVirgin"] = isVirgin
	data["sexSkill"] = sexSkill
	data["usedStrapon"] = usedStrapon

	return data

func loadData(data):
	.loadData(data)

	isCorrupt = SAVE.loadVar(data, "isCorrupt", false)
	isPure = SAVE.loadVar(data, "isPure", false)
	isNormal = SAVE.loadVar(data, "isNormal", false)
	isVirgin = SAVE.loadVar(data, "isVirgin", false)
	sexSkill = SAVE.loadVar(data, "sexSkill", 0)
	usedStrapon = SAVE.loadVar(data, "usedStrapon", false)
