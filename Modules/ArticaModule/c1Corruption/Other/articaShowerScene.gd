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
			playAnimation(StageScene.Grope, "watchrub", {pc="artica", npc="pc", bodyState={naked=true, hard=true}})
		else:
			playAnimation(StageScene.Grope, "watchstroke", {pc="artica", npc="pc", bodyState={naked=true, hard=true}})
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
			addButton("Ride her", "Pin Artica against the wall and ride her cock", "ride_artica")
		else:
			addDisabledButton("Ride her", "Artica can not be caged for this")
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
		getCharacter("artica").resetEquipment(true,true,true)

	if(_action == "make_convince"):
		processTime(3*60)
		getModule("ArticaModule").addCorruption(0.01)

	if(_action == "give_clothes_back"):
		processTime(3*60)

	if(_action == "do_shower_together"):
		processTime(5*60)
		getCharacter("artica").afterTakingAShower()
		GM.pc.afterTakingAShower()

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
