extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false

func _init():
	sceneID = "articaShowerScene"

func _run():
	if(state == ""):
		addCharacter("artica")
		isNaked = getFlag("ArticaModule.NoClothes", false)
		isCaged = getCharacter("artica").isWearingChastityCage()
		corruption = getModule("ArticaModule").getCorruption()
		isSlut = getModule("ArticaModule").isSlut()
		isVerySlut = getModule("ArticaModule").isVerySlut()
		isLusty = getModule("ArticaModule").isLusty()
		nakedAndShy = (isNaked && !isSlut)
		playAnimation(StageScene.Solo, "stand", {pc="artica"})
		saynn("You find a quiet spot and just chill, watching"+str(" naked" if isNaked else "")+" messy Artica blush as she gets looks from other inmates"+str(", her paws cover her exposed bits" if nakedAndShy else "")+".")

		saynn("Eventually, she decides to head towards the showers..")

		addButton("Follow", "See what she will do", "artica_in_showers")
	if(state == "artica_in_showers"):
		addCharacter("artica", ["naked"])
		aimCameraAndSetLocName("main_shower1")
		playAnimation(StageScene.Solo, "struggle", {pc="artica", bodyState={naked=true,hard=(isLusty || getCharacter("artica").isInHeat())}})
		if (nakedAndShy):
			saynn("Artica peeks her head into the bathroom.. and then quickly sneaks by before doing the same with the dressing room. She doesn't have any clothes to store.. so she just rushes into the showers area and jumps under one of the free shower heads.")

		elif (isNaked):
			saynn("Artica steps into the dressing room, not really caring much if anyone sees her exposed private bits.. She doesn't have any clothes to store.. so she just steps further into the showers area and jumps under one of the free shower heads.")

		elif (!isNaked && !isSlut):
			saynn("Artica steps into the dressing room.. and nervously looks around to make sure that there aren't any sneaky gazes directed towards her.. like yours.")

			saynn("After that, she stops near the locker and gathers enough strength.. before quickly undressing, shoving all her clothes into the locker and rushing to the showers area, jumping under one of the free shower heads.")

		else:
			saynn("Artica steps into the dressing room and quickly takes off all her clothes, seemingly not minding if any random pair of eyes sees her. After that, she steps into the showers area and picks one of the free shower heads.")

		if (isLusty):
			saynn("Artica seems to be particularly lusty today.. Her hands are already reaching for her"+str(" caged member" if isCaged else " hard member")+"..")

		elif (!isLusty && getCharacter("artica").isInHeat()):
			saynn("Artica doesn't seem to be particularly lusty.. but her heat is making her so. Her hands are already reaching for her"+str(" caged member" if isCaged else " hard member")+"..")

		else:
			saynn("Artica is not lusty today.. She will probably just take a shower and leave.")

		if (isLusty || getCharacter("artica").isInHeat()):
			addButton("Watch", "See how Artica will satisfy herself", "artica_masturbation")
		else:
			addButton("Watch", "Watch Artica wash herself", "artica_wash")
		if (!isNaked):
			addButton("Steal uniform", "Yoink Artica's clothes while she is showering", "yoink_clothes")
		else:
			addDisabledButton("Steal uniform", "You already have her clothes. Putting them back is pointless as she wouldn't know to look for them in the locker")
		if (corruption >= 0.4):
			addButton("Join", "Step in and take a shower with Artica..", "join_shower")
		else:
			addDisabledButton("Join", "Artica's corruption needs to be above 40% for you to join her..")
	if(state == "artica_wash"):
		playAnimation(StageScene.Solo, "stand", {pc="artica", bodyState={naked=true}})
		saynn("Under the running water, Artica lets out a soft sigh of contentment as she begins to wash away the signs of her past sexual encounters off of her white fur. She starts with her short hair, sinking her delicate digits between the strands and gently scratching her scalp.")

		saynn("Next, she moves to her face and muzzle, the cold water soothing her skin as she carefully washes away any traces of kinky fluids. Even though the water that inmates get is uncomfortably cold, the girl doesn't seem to mind it, just casually standing in it..")

		saynn("With slow, sensual movements, her paws trail down to her shoulders, gently kneading them, trying to make any tension go away. Then they drift lower, cupping her "+str("swollen milky breasts" if getCharacter("artica").isLactating() else "{artica.breasts}")+" and teasing her pierced nips with a soft touch, making them go stiff. A shiver of pleasure runs through her body, the running water adding to the sensations..")

		if (getCharacter("artica").isVisiblyPregnant()):
			saynn("Moving down her body, Artica pays careful attention to her fluffy belly that seems to be protruding out quite far because of the litter that's inside it.. The fluff is slowly running her fingers through the soft fur, smiling as feels her belly reacting.. She lingered there for a moment, relishing the sensation.. before continuing on to her butt and fluffy tail, washing them with gentle strokes.")

		else:
			saynn("Moving down her body, Artica pays careful attention to her fluffy belly, running her digits through the soft fur, washing it all. She lingers there for a moment, her digits drawing a round line in the air from where her breasts end to where her crotch begins for some reason.. before continuing on, washing her butt and fluffy tail with gentle strokes.")

		saynn("As she reaches her legs, Artica's breath hitches slightly. She spreads her legs, allowing the water to flow over her"+str(" locked" if isCaged else "")+" sheath and along the curves of her cute"+str(" creamed" if getCharacter("artica").hasEffect(StatusEffect.HasCumInsideVagina) else "")+" pussy and tight asshole. With slow, deliberate movement, she rubs her digits over her sensitive flesh, the sensations making her bite her lip..")

		saynn("You let Artica finish washing her body while you just leave the bathroom and head towards her usual spot. Soon, she joins you, clean and refreshed.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "artica_masturbation"):
		if (isCaged):
			playAnimation(StageScene.Grope, "watchrub", {pc="artica", npc="pc", pcCum=true, bodyState={naked=true, hard=true}})
		else:
			playAnimation(StageScene.Grope, "watchstroke", {pc="artica", npc="pc", pcCum=true, bodyState={naked=true, hard=true}})
		saynn("Even the cold water cascading over her is unable to extinguish Artica's desire. She stares at her aroused body for some time, her ears lowering themselves..")

		if (!isCaged):
			saynn("At some point she gives up and leans against the metal separators, her hand sliding down her body to find her cyan throbbing canine cock.")

			saynn("With slow, deliberate strokes, she begins to stroke it, her digits gliding over the sensitive flesh. Her breath becomes ragged, her body squirming and reaching high to stand on her toes.")

		else:
			saynn("At some point she gives up and leans against the metal separators, her hand sliding down her body to find her cyan throbbing canine cock, locked in its tiny metal cage.")

			saynn("Desperate, she tries to reach under it with her clawed digits.. but only gets herself more horny instead. Her breath becomes ragged, her body squirming and reaching high to stand on her toes.")

		saynn("Hard to say what's going through her head right now. Maybe she is dreaming of fucking someone.. Ohh, Artica is now spreading her legs more, her free hand sliding under her balls and teasing her needy pussy as she lets out a cute moan of pleasure. She rubs and circles her clit with eagerness, her hips rocking against her hand.. No denying it, the girl is definitely imagining all the ways that she could be fucked and bred..")

		saynn("[say=artica]..ah.. ah-h..ah..[/say]")

		saynn("As the pleasure pushes her to an unbearable peak, the girl just can't hold back any longer. With a muffled cry of ecstasy, she lets herself go, her body convulsing with pleasure as she cums hard, her cum splattering against the wall in front of her, her cock throbbing"+str(" in its cage" if isCaged else "")+" in time with her racing heartbeat, her pussy clenching and squirting all over her fluffy thighs.. but luckily the cold water is quick to wash away any new mess.")

		saynn("After that impulse of passion, Artica brings her paws to her face and eagerly licks them, enjoying the scent and the taste of her own juices..")

		saynn("You let Artica finish washing herself  while you just leave the bathroom and head towards her usual spot. Soon, she joins you, clean, refreshed.. and satisfied.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "yoink_clothes"):
		playAnimation(StageScene.Duo, "stand", {pc="artica", npc="pc", bodyState={naked=true}})
		saynn("You think that Artica looks great naked and doesn't need any clothes.. you open the locker that she forgot to close and grab her lilac uniform.")

		if (!isSlut):
			saynn("But as you step away from it..")

			saynn("[say=artica]Eep.. h-hey..[/say]")

			saynn("Artica is peeking out into the dressing room, her eyes see the empty locker.")

			saynn("[say=artica]Where are.. my c-clothes..[/say]")

			saynn("[say=pc]Well, show yourself first.[/say]")

			saynn("Artica peeks her head out more.. avoiding showing the rest of her naked body.")

			saynn("[say=artica]Um..[/say]")

			saynn("[say=pc]Fully. I might know where your clothes are.[/say]")

			saynn("The fluff blinks many times.. but then decides to come out, stepping into the dressing room, her paws covering up everything that they can..")

			saynn("[say=artica]Can I.. g-get them back?.. I can't walk around n-naked..[/say]")

		elif (isSlut && !isVerySlut):
			saynn("But as you step away from it..")

			saynn("[say=artica]Oh.. uh.. my clothes are missing..[/say]")

			saynn("Artica is standing out in the open, blushing slightly as you stare at her naked body.")

			saynn("[say=pc]Do you really need them?[/say]")

			saynn("She shrugs and lowers her gaze.")

			saynn("[say=artica]Maybe.. I d-don't know.. Everyone is usually wearing a uniform.. I will g-get lots of strange looks..[/say]")

		elif (isVerySlut):
			saynn("But as you step away from it..")

			saynn("[say=artica]Ohh.. someone took my clothes.. haha.[/say]")

			saynn("Artica is standing out in the open, not even blushing as you turn around and stare at her naked body.")

			saynn("[say=pc]You seem to be doing fine without them.[/say]")

			saynn("[say=artica]I do get a lot of eyes looking at me when I'm.. mm.. not wearing anything..[/say]")

		addButton("Keep clothes", "Force Artica to stay naked", "steal_clothes_fully")
		addButton("Convince me!", "Make Artica convince you to give her the clothes back", "make_convince")
	if(state == "steal_clothes_fully"):
		if (!isSlut):
			saynn("[say=pc]I'm keeping the clothes. You can stay naked for now.[/say]")

			saynn("Your voice is strict. You assume a powerful stance, crossing your arms and waiting for what Artica is gonna do.")

			saynn("[say=artica]But.. e-eep.. I'm g-gonna look like a s-slut..[/say]")

			saynn("[say=pc]So?[/say]")

			saynn("Artica lowers her gaze and whines.")

			saynn("[say=pc]No one cares, trust me. This prison has more sluts than a brothel.[/say]")

			saynn("[say=artica]O-okay..[/say]")

			saynn("[say=pc]Act like a good girl and I might give them back.[/say]")

			saynn("Artica nods subtly.. and then heads to her usual spot, naked. She uses her paws to cover her private bits up.. but she just has too many of them.")

		elif (isSlut && !isVerySlut):
			saynn("[say=pc]You can stay naked for now. I like seeing your tits.."+str(" and your big pregnant belly" if getCharacter("artica").isVisiblyPregnant() else "")+"[/say]")

			saynn("Artica blinks many times, her cheeks blushing more.")

			saynn("[say=artica]Well.. o-okay.. I d-don't mind being naked..[/say]")

			saynn("Artica nods subtly.. and then heads to her usual spot, naked. She doesn't seem to be covering up.")

		elif (isVerySlut):
			saynn("[say=pc]Sluts like you need to be forced to always stay naked. Saves time because I don't have to undress you before sex.[/say]")

			saynn("Artica smiles and rubs her snout, standing high on her toes.")

			saynn("[say=artica]True, haha..[/say]")

			saynn("She walks past you, heading to her usual spot while swaying her hips seductively. Her chest is puffed out, she is proudly displaying her bits.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "make_convince"):
		playAnimation(StageScene.Yoga, "dog", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("[say=pc]Convince me. And I might give you the uniform back. Depends on how well you do.[/say]")

		if (!isSlut):
			saynn("Artica trembles with nervousness, clearly feeling quite vulnerable.")

			saynn("[say=artica]Um.. okay..[/say]")

			saynn("She pulls her paws away from her private bits, giving you a look at her {artica.breasts}, "+str("flat fluffy belly" if !getCharacter("artica").isVisiblyPregnant() else "big round belly")+" and her"+str(" locked" if isCaged else "")+" sheath that houses her canine member.")

			saynn("The girl is blushing deeply.")

			saynn("[say=pc]That won't cut it. I guess you don't want your..[/say]")

			saynn("[say=artica]W-wai-.. o-okay..[/say]")

		elif (isSlut && !isVerySlut):
			saynn("[say=artica]Oh.. I.. can try..[/say]")

		elif (isVerySlut):
			saynn("[say=artica]S-sure.. Stare all you want..[/say]")

		saynn("Artica cups her breasts with her paws before giving them a gentle squeeze, "+str("feeling her perky, pierced nipples harder under her touch" if !getCharacter("artica").canBeMilked() else "feeling milk squirting from her swollen, pierced nipples")+"."+str(" Your gaze is making her squirm in such a cute way.." if !isSlut else "")+"")

		if (!isCaged):
			saynn("After showing you her tits, the girl turns slightly and puts her paws over her sheath, digits tracing the outline and sliding inside, teasing the hidden cyan shaft.")

		else:
			saynn("After showing you her tits, the girl turns slightly and puts her paws over her chastity cage, digits tracing its metal outline and tugging on it a bit.. before sliding lower and cupping her balls.")

		saynn("Leaning against the lockers, Artica spreads her legs wide and pulls her fluffy balls up to reveal her wet folds."+str(" With a soft whimper" if !isSlut else " With a soft moan")+", she uses her digits to spread her pussy wide, giving you an unobstructed view of her cyan, inviting entrance. As you crouch before her, you can even see her cervix, an entrance into her womb, "+str("making Artica feel quite embarrassed.. and yet, she forced herself to hold the pose for as long as you were curious in her slit." if !isSlut else "making Artica bite her lip. She holds the pose for as long as you are curious in her slit.")+"")

		saynn("As you get up, Artica turns around and slowly bends forward, one of her hands grabs a bench while the second one reaches behind her to pull on her buttcheeks, spreading them apart, exposing her tight little asshole to your hungry gaze.")

		saynn("She also raises one of her hind paws, giving you a great view of her textured paw pads and clawed toes that she makes sure to wiggle slightly.")

		if (!isSlut):
			saynn("[say=artica]Is t-this.. e-enough?..[/say]")

			saynn("She is shivering, such a shy fluff.")

		elif (isSlut && !isVerySlut):
			saynn("[say=artica]There we go.. I think t-that's everything..[/say]")

		elif (isVerySlut):
			saynn("[say=artica]I don't even need those clothes honestly.. haha..[/say]")

		addButton("Keep clothes", "Force Artica to stay naked", "steal_clothes_fully")
		addButton("Give clothes back", "Return Artica her clothes", "give_clothes_back")
	if(state == "give_clothes_back"):
		addCharacter("artica")
		playAnimation(StageScene.Duo, "stand", {npc="artica"})
		saynn("You hand Artica her clothes back.")

		if (!isSlut):
			saynn("She quickly grabs her shirt and shorts and puts them on.")

			saynn("[say=artica]T-Thank you..[/say]")

			saynn("[say=pc]You're very welcome.[/say]")

		elif (isSlut && !isVerySlut):
			saynn("She grabs her shirt and shorts and lazily puts them on.")

			saynn("[say=artica]Thankies..[/say]")

			saynn("Maybe she doesn't need her clothes after all..")

		elif (isVerySlut):
			saynn("She tilts her head while looking at her shirt and shorts.")

			saynn("[say=artica]Do I.. h-have to?..[/say]")

			saynn("You nod.")

			saynn("[say=artica]Aw.. Okay..[/say]")

			saynn("She grabs her inmate uniform and lazily puts it on.")

		saynn("After that, you just return to her usual spot.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "join_shower"):
		saynn("You strip naked and decide to join her.")

		if (isLusty):
			if (isCaged):
				playAnimation(StageScene.Grope, "watchrub", {pc="artica", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
				saynn("As you step inside and join Artica, you catch her rubbing her pussy, her cock twitching in its chastity cage.")

				saynn("[say=artica]Ee-eep..[/say]")

				saynn("You chuckle, admiring the sight from up close.")

			else:
				playAnimation(StageScene.Grope, "watchstroke", {pc="artica", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
				saynn("As you step inside and join Artica, you catch her stroking her cock and playing with her pussy.")

				saynn("[say=artica]Ee-eep..[/say]")

				saynn("You chuckle, admiring the sight from up close.")

		else:
			playAnimation(StageScene.Grope, "tease", {pc="artica", npc="pc", bodyState={naked=true}, npcBodyState={naked=true}})
			saynn("As you step inside and join Artica, she gasps softly.")

			saynn("[say=artica]Ee-eep..[/say]")

			saynn("You chuckle, admiring the sight from up close.")

		saynn("What do you want to do?")

		addButton("Wash together", "Just have a nice shower together", "do_shower_together")
		addButtonWithChecks("Rail her", "Pin Artica against the wall and rail her", "rail_artica", [], [[ButtonChecks.HasReachablePenis]])
		if (!isCaged):
			addButtonWithChecks("Ride her", "Pin Artica against the wall and ride her cock with your pussy", "ride_artica", [], [[ButtonChecks.HasReachableVagina]])
		else:
			addDisabledButton("Ride her", "Artica can not be caged for this")
		if (getCharacter("artica").hasEffect(StatusEffect.HasCumInsideVagina) || getCharacter("artica").hasEffect(StatusEffect.HasCumInsideAnus)):
			addButton("'Clean inside'", "Eat Artica's pussy out!", "do_eat_pussy")
		else:
			addDisabledButton("'Clean inside'", "Artica doesn't have any cum in her pussy or asshole")
	if(state == "do_eat_pussy"):
		playAnimation(StageScene.SexPinnedBehind, "lick", {pc="pc", npc="artica", npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You lick your lips while watching Artica's dripping holes..")

		saynn("[say=artica]What do you.. eep![/say]")

		saynn("Overcome with desire, you pin Artica against the concrete and drop to your knees, revealing both her holes to you. You use your hands to spread her buttcheeks wide, making her start dripping old fluids actively.")

		saynn("That's not it though.. With a wild hunger, you bury your face in there, your tongue delving deep into her pussy as you begin to lap up at her inner walls, trying to catch any mess that you are quick to swallow!")

		saynn("[say=artica]Ah!.. ah.. w-wai..[/say]")

		saynn("Each stroke of your tongue sends waves of pleasure through Artica's body, her hips swaying back and forth, "+str("her chastity cage leaking pre profusely" if isCaged else "her hard cock producing pre and brushing against the concrete")+".")

		saynn("[say=artica]Ah.. I.. I'm.. I c-can't.. ah..[/say]")

		saynn("As your tongue explores every inch of Artica's dripping slit, you push her further and further.. until the girl can't take it anymore. Her slick inner walls clench around you as she cums, releasing a shower of girlcum directly into your face, marking it with her scent.. but luckily that quickly gets washed away by the running water.")

		saynn("[say=pc]There we go. All clean, inside and outside~.[/say]")

		saynn("She is still panting, her body shivering.")

		saynn("[say=artica]Nh-h.. t-tha.. ah.. ahnks..[/say]")

		saynn("You giggle and help her to get back to her spot after this.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_shower_together"):
		playAnimation(StageScene.Grope, "grope", {pc="artica", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("[say=pc]Let me help you.[/say]")

		saynn("Your hands reach out to gently caress her shoulders. With a soft whimper, Artica leans into your touch, her eyes closing as she surrenders to your embrace.")

		saynn("Slowly, you begin to run your digits through her fur, your hands moving in gentle, circular motions as you work your way down her body, the cold water washing off any dirt.. and old bodily fluids.. from you both.")

		saynn("[say=pc]Hah, you don't freeze at all in this water.[/say]")

		saynn("[say=artica]..almost like I was meant to be h-here..[/say]")

		saynn("Your hands reach her breasts and cup them gently, kneading with just the right amount of pleasure to "+str("make her swollen dark nips produce a few drops of milk, creating little streams that follow her curves" if getCharacter("artica").canBeMilked() else "elicit soft noises of love from Artica")+".")

		if (getCharacter("artica").isVisiblyPregnant()):
			saynn("Moving lower, you trail your hands along her round pregnant belly.")

			saynn("[say=pc]Your belly is so beautiful. You look precious, Artica.[/say]")

			saynn("Artica's cheeks blush from your words.")

			saynn("[say=artica]T-thank you..[/say]")

			saynn("Your digits are tracing her curves with utmost tenderness. Artica's breath gets all deep and needy, a shiver of pleasure coursing through her spine.")

			saynn("You can feel the little hearts beating in there..")

			saynn("[say=pc]You're carrying so many pups. Can't wait for you to give birth.[/say]")

			saynn("Her blush deepens, her heart swelling with emotion, her paws coming to rest on top of yours as you both gazed down at her swollen belly. While the water is still washing over you both.")

			saynn("[say=artica]I-I c-can't wait either..[/say]")

		else:
			saynn("Moving lower, you trail your digits along her belly, your teasing touch exploring every inch of her soft gray fur.")

		saynn("Your hands reach between her legs as you begin to help wash her thighs, moving closer and closer to her most intimate areas.")

		if (isCaged):
			saynn("You can't reach her sheath because of the cage.. so you just tug on it a little, making sure the water can reach inside and wash her member.")

		else:
			saynn("It's time for her to do some washing too. You grab her paw and place it over her sheath, making her slide a few digits inside and circle them around her hiding cock, making it peek out more.")

			saynn("[say=artica]Eek..[/say]")

			saynn("As the cold water hits her cyan shaft, she couldn't help but to moan softly, her hips bucking instinctively against her own paw.")

		if (getCharacter("artica").hasEffect(StatusEffect.HasCumInsideVagina) || getCharacter("artica").hasEffect(StatusEffect.HasCumInsideAnus)):
			saynn("Her butt next. Your hands land on her buttcheeks.. and spread them wide, making her holes look stretched.. And soon, they start dripping with the old loads that Artica has taken inside her.")

			saynn("[say=artica]Is t-this.. r-required..[/say]")

			saynn("[say=pc]Yes.[/say]")

		else:
			saynn("Her butt next. Your hands land on her buttcheeks.. and spread them wide, making her holes look stretched.. There are little strings of juices hanging between her pussy folds.. but other than that.. she is clean inside.")

			saynn("[say=artica]Is t-this.. r-required..[/say]")

			saynn("[say=pc]Yes.[/say]")

		saynn("After giving Artica a proper wash, it was time to wrap it up. You give her fluffy tail some gentle strokes and then turn off the water.")

		saynn("[say=artica]T-thank you..[/say]")

		saynn("You smile.")

		saynn("[say=pc]You're welcome.[/say]")

		saynn("You stand together like this for a little longer.. before it comes time to return out into the main hall..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "ride_artica"):
		playAnimation(StageScene.SexStandRide, "tease", {pc="artica", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		if (isLusty):
			saynn("The sight of her stroking her cock.. is making you eager to feel it inside you. Artica gets visibly more nervous as you bite your lip, your gaze occasionally slipping down to her sheath.. She freezes, her paws are not doing anything anymore.")

		else:
			saynn("Artica gets visibly more nervous as you bite your lip, your gaze occasionally slipping down to her sheath.. She freezes, her paws are not rubbing her wet fur anymore.")

		saynn("[say=pc]Are you done showering~?[/say]")

		saynn("[say=artica]Y-yeah.. I t-think s-so..[/say]")

		saynn("Unable to think of anything better to do, she turns off the cold water and tries to head for the exit..")

		saynn("With a swift motion, you raise your leg high and pin Artica against the wall with it, doing a casual vertical split.")

		saynn("[say=pc]I'm not~.[/say]")

		saynn("You turn the cold water back on, letting it wash over both of your bodies. Things are sure to get heated anyway..")

		saynn("[say=artica]Eep..[/say]")

		if (!isLusty):
			saynn("Artica is not hard.. but that's easy to fix. Your hand lands on her sheath and gently kneads, one of your fingers finds the hidden tip and rubs it.. until her cyan shaft starts poking out more and more.. the tip is now brushing against your crotch..")

		else:
			saynn("You admire her hard cock with your hungry eyes. Your hand lands on her.. fluffy balls.. and cups them, feeling how full they are with virile seed..")

			saynn("[say=pc]And you wanted to waste all of that high-quality spunk?.. Tsk.. tsk..[/say]")

		saynn("Her eyes open wider as you position yourself closer, your pussy hovering just above Artica's cyan cock. She whimpers quietly.. such a silly fluff..")

		saynn("You grab her chin and make her look at you.")

		saynn("[say=pc]I know that you're a slut that likes her holes getting pounded. Just imagine yourself in my place~.[/say]")

		addButton("Ride", "Start riding the girl", "ride_sex")
	if(state == "ride_sex"):
		playAnimation(StageScene.SexStandRide, "sex", {pc="artica", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("With a wicked grin, you lower yourself onto Artica's cock, your pussy enveloping that juicy cyan member inch by inch. Artica gasps as she feels her shaft spreading your folds and getting buried within your eager cunt.")

		saynn("[say=artica]Nhh-h.. ah..[/say]")

		saynn("She just grips the concrete wall behind her while you ride her, each thrust driving her cock deeper into you until the pointy tip starts kissing your cervix. Feels great for you as well, you bite your lip again and whisper dirty things to her while your free hand is idly playing with your clit..")

		if (isLusty):
			saynn("[say=pc]Your cock feels so good inside me, Artica~. Is that what you were dreaming about while stroking~?[/say]")

		else:
			saynn("[say=pc]Your cock feels so good inside me, Artica~.[/say]")

		saynn("[say=artica]S-so.. i-intense..[/say]")

		saynn("Intense? You can show her what intense means.")

		addButton("Faster", "Ride her cock faster", "ride_fast")
	if(state == "ride_fast"):
		playAnimation(StageScene.SexStandRide, "fast", {pc="artica", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Even though Artica's cock is already twitching inside your slit, you increase the pace, impaling yourself onto that great canine dick with more passion, your slick inner walls welcoming it by coating it with your pussy juices.")

		saynn("[say=artica]Ah.. ahh.ah.. p-please.. ah.. t-too m-much..[/say]")

		saynn("With each thrust, Artica's knot is swelling more and more..")

		saynn("[say=pc]Should I stop~? Say stop and I will. Do it, slut..[/say]")

		saynn("She just moans back, shaking her head subtly, her shy cyan eyes refuse to ever meet with yours.")

		if (!GM.pc.isVisiblyPregnant()):
			saynn("[say=pc]I want you to knot me~. I want you to drain your balls inside me. Give me your pups, Artica, I want you to breed me.[/say]")

		else:
			saynn("[say=pc]I want you to knot me~. I want you to drain your balls inside me. Give me your cum, Artica, I want you to cum inside me.[/say]")

		saynn("Your words are making the poor fluff squirm harder under you, her member throbbing inside you more and more, her moans sounds more like desperate whimpers.")

		addButton("Knot yourself", "Force her full length inside you", "ride_cum")
	if(state == "ride_cum"):
		playAnimation(StageScene.SexStandRide, "inside", {pc="artica", npc="pc", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("With one last trust of your hips, you suddenly feel her big, fat orb stretching your pussy enough to slide in!")

		saynn("[say=pc]Ah-h~!..[/say]")

		saynn("Your whole body is shivering as you take Artica's whole length inside. You throw your head back and moan into the air as your walls are clenching tightly around the throbbing shaft.. until you feel hot sticky cum flowing inside you.")

		saynn("[say=artica]I'm c.cumm-ming.. ah-hh.. ah..[/say]")

		saynn("She is pumping her seed directly inside your womb as you cling onto her shoulders, her body shuddering with pleasure as you milk her balls dry.")

		saynn("[say=pc]Good.. g-good.. girl..[/say]")

		if (GM.pc.isWearingChastityCage() || GM.pc.hasReachablePenis()):
			saynn("Your own member is shooting {pc.cum} onto Artica's belly.. but all the mess is quickly washed away by the running water..")

		saynn("After your orgasms begin to fade.. you are both left panting.. still tied by Artica's knot.. in a pretty awkward pose.")

		saynn("[say=pc]Hah.. I guess we're staying here like this.[/say]")

		saynn("[say=artica]Y-yeah.. ah..[/say]")

		saynn("Since you're stuck anyway, you start washing her and your body, your hands traveling along both.")

		saynn("[say=artica]It f-felt g-great..[/say]")

		saynn("You chuckle and lean in to leave a kiss on her lips.")

		addButton("Wait", "All you can do now is wait", "ride_after_knot")
	if(state == "ride_after_knot"):
		playAnimation(StageScene.Duo, "stand", {npc="artica", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("You turn off the cold water and just spend some time together until her knot starts to deflate. That's when you manage to free your stuffed pussy, making the girl moan and stand high on her toes.")

		saynn("[say=artica]Ah..[/say]")

		saynn("[say=pc]Mmm.. You like my creamed pussy?[/say]")

		saynn("[say=artica]Y-yeah..[/say]")

		saynn("You catch some of her seed and bring your hand to her lips.")

		saynn("[say=artica]Ee..[/say]")

		saynn("[say=pc]Lick~.[/say]")

		saynn("Artica nods subtly and starts sucking on your digits, tasting your juices and her own seed..")

		saynn("[say=pc]Good girl. Let's go back now~.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "rail_artica"):
		if (isCaged):
			playAnimation(StageScene.SexPinnedBehind, "tease", {pc="pc", npc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		else:
			playAnimation(StageScene.SexPinnedBehind, "stroke", {pc="pc", npc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Artica gets visibly more nervous as you stare at her intently.. She freezes, her paws are not rubbing her wet fur anymore.")

		saynn("[say=pc]Are you done showering?[/say]")

		saynn("[say=artica]Y-yeah.. I t-think s-so..[/say]")

		saynn("Unable to think of anything better to do, she turns off the cold water and tries to head for the exit..")

		saynn("With a swift motion, you grab her and pin against the concrete wall, your hands gripping her hips with possessive force. She gasps as you press your body against hers, your member already pressing against her fluffy thigh.")

		saynn("[say=pc]But I'm not done with you.[/say]")

		saynn("[say=artica]Eep..[/say]")

		if (isCaged):
			saynn("She is swaying so much that you have to grab her hind paw and yank it high, forcing the girl to stay on one leg.")

			saynn("[say=pc]Couldn't stroke your useless cock so you resorted to playing with your pussy? Let me help you.[/say]")

		else:
			saynn("She is swaying so much that you have to grab her hind paw and yank it high, forcing the girl to stay on one leg. At the same time, your other hand lands on her sheath and gives her hard member some strokes.")

			saynn("[say=pc]Maybe I should just lock this so you won't be able to do this..[/say]")

		addButton("Sex", "Rail her pussy", "rail_fuck_sex")
	if(state == "rail_fuck_sex"):
		playAnimation(StageScene.SexPinnedBehind, "sex", {pc="pc", npc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Without waiting for a response, you plunge deep into her slick, welcoming pussy. Artica gasps as your {pc.penis} fills her completely, her body trembling, her toes curling and poking your hand.")

		saynn("[say=artica]Ah!.. W-wai.. T-too f-fast!.. ah..[/say]")

		saynn("[say=pc]Should I stop?[/say]")

		saynn("No response, the girl is just moaning while her "+str("chastity cage" if isCaged else "canine cock")+" is brushing against the concrete, dripping pre.")

		saynn("[say=pc]Your moans are so slutty. Tell me who you are.[/say]")

		saynn("[say=artica]Ah.. s-slut.. I'm.. a s-slut..[/say]")

		saynn("She doesn't need much persuasion, huh, your cock seems to be doing most of the work, spreading her folds wide, hammering away at her tight womb entrance.. making her squirm.")

		addButton("Faster", "Rail her pussy faster", "rail_fuck_sex_fast")
	if(state == "rail_fuck_sex_fast"):
		playAnimation(StageScene.SexPinnedBehind, "fast", {pc="pc", npc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Your pace quickens, your movement becoming more raw and passionate as you try to make the girl feel helpless.. but needed. And you seem to be succeeding, her stretched wide pussy is getting tight around you, her slick inner walls kneading your member nicely.")

		saynn("[say=pc]Are you, huh?[/say]")

		saynn("[say=artica]Y-yes.. I l-love g-getting fucked.. b-bred.. l-like a mindless w-whore that I am.. ah..[/say]")

		saynn("Her own dirty tongue seems to be driving her closer and closer to the edge, her cries of pleasure echoing around the shower room. You can feel her muscles tensing up..")

		saynn("Before a wave hits her.. Artica throws her head back and lets out a passionate noise, her"+str(" locked cock throbbing and dripping seed onto the concrete wall" if isCaged else " canine member shooting lines of seed that land on the concrete wall")+", her pussy gripping your dick hard, increasing the friction..")

		saynn("[say=artica]Ah..ahh.ah.. g-gods.. t-too m-much..[/say]")

		var pcHasKnot = GM.pc.bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisKnot)
		saynn("Her tongue is out and drooling, her hind paw shaking in your hand.. while you just keep pushing through, pounding her orgasming cunt.. until your own orgasm creeps by"+str(", the knot on your cock inflating fast" if pcHasKnot else "")+"..")

		addButton("Cum inside", "Breed the fluff", "rail_fuck_sex_cum")
	if(state == "rail_fuck_sex_cum"):
		playAnimation(StageScene.SexPinnedBehind, "inside", {pc="pc", npc="artica", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		var pcHasKnot = GM.pc.bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisKnot)
		if (pcHasKnot):
			saynn("With one final trust, you bury your {pc.penis} deep inside Artica's quivering pussy.. until the knot slips inside, stretching her folds to their limits. It makes the fluff shake again, her inner walls squeezing your cock.. until she feels a hot rush of your {pc.cum} filling her womb, her orgasm crashing over yours..")

		else:
			saynn("With one final trust, you bury your {pc.penis} deep inside Artica's quivering pussy, breaking into her womb. It makes the fluff shake again, her inner walls squeezing your cock.. until she feels a hot rush of your {pc.cum} filling her up, her orgasm crashing over yours..")

		saynn("[say=artica]Nya-a-ah.. ah.!..[/say]")

		saynn("Poor fluff is squirming desperately, her tongue licking the cold concrete in front of her, her eyes pulled high up, her mind high on pleasure.")

		saynn("[say=pc]Is this what you dream about, Artica?[/say]")

		saynn("[say=artica]Y-yes-sh..h.. hah..[/say]")

		saynn("Both lovers are panting. You turn the cold water on to help the girl to cool down a bit.. and wash away any sweat.. the room smells of raw sex..")

		if (pcHasKnot):
			saynn("You're stuck together because of your knot.. so might as well just have a shower together. Your hands land on her back and rub her fur.")

		else:
			saynn("Might as well just have a shower together.. a kinky kind. Your hands land on her back and rub her fur.. while you are using her as your cock warmer.")

		saynn("[say=artica]Nh-h..[/say]")

		addButton("Rest", "Just shower together", "rail_after_sex")
	if(state == "rail_after_sex"):
		playAnimation(StageScene.Duo, "stand", {npc="artica", bodyState={naked=true}, npcBodyState={naked=true}})
		var pcHasKnot = GM.pc.bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisKnot)
		if (pcHasKnot):
			saynn("After your knot deflates, you finally pull out, causing Artica's stretched, used pussy to start gushing your seed.")

		else:
			saynn("After some time, you finally pull out, causing Artica's stretched, used pussy to start gushing your seed.")

		saynn("[say=artica]Ah.. So much..[/say]")

		saynn("You shower together, washing off any sweat.. or other bodily fluids.. off of each other. Artica is still moaning occasionally, the afterglow making her act so cute.")

		saynn("But now it was time to return to her spot.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "artica_in_showers"):
		processTime(6*60)

	if(_action == "artica_masturbation"):
		processTime(5*60)
		getCharacter("artica").afterTakingAShower()
		getModule("ArticaModule").triggerCorruption(0.01)

	if(_action == "artica_wash"):
		processTime(5*60)
		getCharacter("artica").afterTakingAShower()

	if(_action == "yoink_clothes"):
		processTime(5*60)
		getCharacter("artica").afterTakingAShower()

	if(_action == "steal_clothes_fully"):
		setFlag("ArticaModule.NoClothes", true)
		getCharacter("artica").getInventory().clearSlot(InventorySlot.Body)

	if(_action == "make_convince"):
		processTime(3*60)
		getModule("ArticaModule").addCorruption(0.01)

	if(_action == "give_clothes_back"):
		processTime(3*60)

	if(_action == "do_shower_together"):
		processTime(5*60)
		getCharacter("artica").afterTakingAShower()
		GM.pc.afterTakingAShower()

	if(_action == "do_eat_pussy"):
		processTime(5*60)
		getCharacter("artica").bodypartTransferFluidsTo(BodypartSlot.Vagina, "pc", BodypartSlot.Head, 1.0)
		getCharacter("artica").bodypartTransferFluidsTo(BodypartSlot.Anus, "pc", BodypartSlot.Head, 1.0)
		getModule("ArticaModule").triggerCorruption(0.01)

	if(_action == "ride_sex"):
		processTime(5*60)

	if(_action == "ride_fast"):
		processTime(5*60)

	if(_action == "ride_cum"):
		processTime(3*60)
		getModule("ArticaModule").triggerCorruption(0.01)
		GM.pc.gotVaginaFuckedBy("artica")
		GM.pc.cummedInVaginaByAdvanced("artica", {knotted=true})
		GM.pc.orgasmFrom("artica")

	if(_action == "ride_after_knot"):
		processTime(10*60)

	if(_action == "rail_fuck_sex"):
		processTime(5*60)

	if(_action == "rail_fuck_sex_fast"):
		processTime(5*60)

	if(_action == "rail_fuck_sex_cum"):
		processTime(3*60)
		getModule("ArticaModule").triggerCorruption(0.01)
		getCharacter("artica").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("artica")

	if(_action == "rail_after_sex"):
		processTime(5*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["isNaked"] = isNaked
	data["isCaged"] = isCaged
	data["corruption"] = corruption
	data["isSlut"] = isSlut
	data["isVerySlut"] = isVerySlut
	data["isLusty"] = isLusty
	data["nakedAndShy"] = nakedAndShy

	return data

func loadData(data):
	.loadData(data)

	isNaked = SAVE.loadVar(data, "isNaked", false)
	isCaged = SAVE.loadVar(data, "isCaged", false)
	corruption = SAVE.loadVar(data, "corruption", 0.0)
	isSlut = SAVE.loadVar(data, "isSlut", false)
	isVerySlut = SAVE.loadVar(data, "isVerySlut", false)
	isLusty = SAVE.loadVar(data, "isLusty", false)
	nakedAndShy = SAVE.loadVar(data, "nakedAndShy", false)
