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

		elif (isSlut):
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
		addButton("Stop covering up!", "Order Artica to present everything without covering up", "order_showeverything")
		if (GM.pc.hasReachablePenis() || GM.pc.hasReachableVagina()):
			addDisabledButton("Oral", "Artica is not corrupted enough to agree to this yet")

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

	if(_action == "order_showeverything"):
		getModule("ArticaModule").addCorruption(0.02)

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
