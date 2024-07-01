extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false
var receivedPawjob = false
var usedCondom = false

func _init():
	sceneID = "articaSexPawjobScene"

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
		saynn("Artica seems to be more open to.. lewd stuff. So why not help her explore it?")

		saynn("[say=pc]Enough of under-the-table paws teasing. Let's go have some real fun.[/say]")

		saynn("[say=artica]Oh?.. P-paws?..[/say]")

		saynn("Without explaining much, you grab her hand and pull her towards your cell!")

		addButton("Cell", "Have some fun", "in_cell")
	if(state == "in_cell"):
		playAnimation(StageScene.SexPawjob, "tease", {pc="pc", npc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		aimCameraAndSetLocName(GM.pc.getCellLocation())
		GM.pc.setLocation(GM.pc.getCellLocation())
		addCharacter("artica", ["naked"])
		if (!isNaked):
			saynn("You bring Artica into your cell and invite her to undress. Without much resistance, lilac uniform lands on the chair.. Artica doesn't seem to be shy when alone with you, proudly displaying her"+str(" round" if getCharacter("artica").isVisiblyPregnant() else "")+" forms.")

		else:
			saynn("You bring Artica into your cell and look at her. Artica doesn't seem to be shy when alone with you, proudly displaying her"+str(" round" if getCharacter("artica").isVisiblyPregnant() else "")+" forms.")

		saynn("[say=pc]Show me the goods.[/say]")

		if (isVerySlut):
			saynn("[say=artica]Mmm.. You mean my paws?.. Of course.[/say]")

			saynn("You smile and rub her fluffy thighs.")

			saynn("[say=pc]You're such a pawslut, girl.[/say]")

			saynn("[say=artica]Yes, I am one.. haha..[/say]")

		else:
			saynn("[say=artica]Mmm.. Goods?..[/say]")

			saynn("You smile and rub her fluffy thighs.")

			saynn("[say=pc]Your beans. Show me your paws, girl.[/say]")

			saynn("[say=artica]Oh.. haha..[/say]")

		saynn("Artica sits on your bed, putting a pillow under her back for support while you sit on the opposite side. Then she slowly raises her legs..")

		saynn("All of her.. goods.. are indeed on full display now.. more than you could ever ask for in fact. Her {artica.breasts} with "+str("dark swollen milky nips" if getCharacter("artica").isLactating() else "perky cyan nips")+", her "+str("fluffy" if !getCharacter("artica").isVisiblyPregnant() else "round pregnant")+" belly, her {artica.penis}, both her needy fuckholes.. and of course.. the gorgeous paws. Her cheeks blush from your stare, her clawed toes are curling slightly.")

		saynn("[say=artica]Like that?..[/say]")

		if (GM.pc.hasReachablePenis()):
			saynn("The sight makes your cock go hard in seconds, blood pumping through the bumpy veins..")

		saynn("What do you want to do?")

		addButtonWithChecks("Receive pawjob", "Let Artica work her paws magic on you", "receive_pawjob", [], [[ButtonChecks.HasReachablePenis]])
		if (isCaged):
			addDisabledButton("Offer feet", "Artica is caged.. Can't stroke her cock with your feet if she is caged..")
			addButton("Chastity fun", "Artica is caged.. but you can still let her have fun.. just not directly", "chastity_give")
		else:
			addButton("Offer feet", "Let Artica use your feet for her pleasure", "offer_feet")
			addDisabledButton("Chastity fun", "Can't do this unless Artica is caged")
		addButton("Cancel", "Cancel the scene", "endthescene")
	if(state == "receive_pawjob"):
		playAnimation(StageScene.SexPawjob, "sex", {pc="pc", npc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Seeing Artica hold her hind paws high like that.. seeing her cyan beans bend as she curls her toes.. makes you want more. And Artica sees that, she teasingly moves her paws closer and closer to your hard member.. which makes it twitch..")

		saynn("[say=artica]M-may I?..[/say]")

		saynn("[say=pc]Go ahead.[/say]")

		saynn("Shyly, Artica obeys, her hind paws reaching out and carefully wrapping themselves around your shaft, her rough cyan beans hugging your member.. One paw stays still while the second one starts following the veiny surface, reaching the tip and catching some of the shiny precum onto her beans.. before proceeding to spread it along your cock.")

		saynn("[say=pc]Nh.. not bad.[/say]")

		saynn("You sit still and let Artica do all the work, her both paws are now gently caressing you, sliding up and down along your slick shaft, stroking it at a slow.. but very pleasurable.. pace. Her eyes are fully focussed on your {pc.penis}, Artica bites her lip and fully invests herself into giving you the best possible pawjob..")

		addButton("Continue", "See what happens next", "receive_pawjob_cum")
	if(state == "receive_pawjob_cum"):
		playAnimation(StageScene.SexPawjob, "fast", {pc="pc", npc="artica", pcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("With each stroke, you feel your arousal growing more and more, short pleasure noises escaping your lips as Artica's toes and beans rub your member with more passion, your hips bucking instinctively.."+str(" Her own member is dripping plenty in its little cage, creating a wet spot on your bed sheets together with her needy pussy.." if isCaged else " Her own hard member is dripping plenty, creating a wet spot on your bed sheets together with her needy pussy..")+"")

		saynn("[say=pc]Hah..[/say]")

		saynn("The way her soft beans squeeze your cock.. how her toes are teasing your sensitive glands.. the inviting warmth of her strokes.. it just feels too good.. you arch your back and throw your head back, low growls escaping your lips as you quickly approach your peak..")

		saynn("[say=artica]L-looks like y-you're about to.. eep!..[/say]")

		saynn("Your member starts pulsing between Artica's paws.. before ropes of hot sticky {pc.cum} shoot out from the throbbing tip, landing directly on Artica's belly and sheath, marking the fur and "+str("the chastity cage" if isCaged else "the cyan shaft")+"..")

		addButton("Continue", "See what happens next", "after_pawjob")
	if(state == "after_pawjob"):
		playAnimation(StageScene.SexPawjob, "tease", {pc="pc", npc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Artica pulls her paws away from your spent member.. and just presents herself to you.. her beans have some of your seed as well.")

		saynn("[say=pc]That felt good. Great job there.[/say]")

		saynn("[say=artica]T-thank you..[/say]")

		if (!isCaged):
			saynn("Her own cock is still hard, the fluff didn't get to cum this time.. maybe you can let her? Or you can let her go back to her spot..")

			addButton("Offer feet", "Let Artica use your feet for her pleasure", "offer_feet")
			addButton("Enough", "Enough fun", "endthescene")
		else:
			saynn("Her cock is caged.. so she will have to settle with just watching you. Time to let her go back to her spot..")

			addButton("Enough", "Enough fun", "endthescene")
			addButton("Chastity fun", "Artica is caged.. but you can still let her have fun.. just not directly", "chastity_give")
	if(state == "offer_feet"):
		playAnimation(StageScene.SexPawjob, "tease", {pc="artica", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		if (receivedPawjob):
			saynn("Artica looks up at you with a desperate whimper, her lusty eyes silently pleading for more.")

			saynn("[say=pc]Alright. Let's switch.[/say]")

		else:
			saynn("That sight is great.. but you'd rather let Artica have fun this time.")

			saynn("[say=pc]Let's switch, girl.[/say]")

		saynn("You take her spot and raise your legs, exactly like she did, presenting your {pc.feet} to Artica's eyes.")

		saynn("[say=pc]You may have fun with these. But I'm not gonna move. Prove how big of a paw slut you are.[/say]")

		saynn("[say=artica]Y-yes.. yes.. o-oka..ay..[/say]")

		saynn("The white fluff shifts closer, her maw waters up as she inspects the offered {pc.feet} and {pc.toes}..")

		addButton("Continue", "See what happens next", "feet_thrust")
	if(state == "feet_thrust"):
		playAnimation(StageScene.SexPawjob, "thrust", {pc="artica", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You're not gonna move your legs.. so Artica gently puts her hands on your ankles.. and then carefully presses her hard cyan cock through the empty between your {pc.feet}, thrusting her hips forward.")

		saynn("It's.. clearly humiliating for her.. the fluff's cheeks are hot red while you just smile, watching her use your {pc.feet} for her pleasure, thrusting in and out between them more. Her cyan shaft is so warm, precum leaking from the tip that you catch with your {pc.toes} and spread throughout.")

		saynn("[say=artica]Ah.. ah..[/say]")

		saynn("Cute moans are escaping from her, Artica's cock is sliding between your {pc.feet} with increasing urgency, the knot at the base already inflating with blood..")

		addButton("Continue", "See what happens next", "feet_thrust_cum")
		addButtonWithChecks("Condom!", "Make her wear a condom before she cums and makes a mess on you!", "feet_thrust_condom", [], [[ButtonChecks.HasCondoms]])
	if(state == "feet_thrust_cum"):
		playAnimation(StageScene.SexPawjob, "thrustfast", {pc="artica", npc="pc", pcCum=true, bodyState={naked=true, hard=true, condom=usedCondom}, npcBodyState={naked=true, hard=true}})
		if (usedCondom):
			saynn("Feeling that Artica's cock is already throbbing, desperate for release.. you quickly rip-open one of your condoms and apply it over her cyan shaft.")

			saynn("[say=artica]W-wh.. ah..[/say]")

			saynn("[say=pc]Keep thrusting, girl~.[/say]")

			saynn("You can feel the heat radiating from her cock even through the condom. You try to keep your {pc.feet} as closed as possible around her shaft.. but the fluff still manages to force her knot between them, making you squeeze it.")

		else:
			saynn("Artica's cock is throbbing with desperate need, you can feel the heat radiating from it. You try to keep your {pc.feet} as closed as possible around her shaft.. but the fluff still manages to force her knot between them, making you squeeze it.")

		saynn("The friction sends waves of pleasure through the poor moaning fluff.. until she surrenders to the overwhelming sensations completely..")

		saynn("[say=artica]Ah!.. G-gods!.. Ah-h..ah..ah..[/say]")

		if (!usedCondom):
			saynn("Her hips buck uncontrollably.. before thick strings of cum start erupting from her pulsing member, splattering onto your belly, forming hot, sticky patterns.")

			saynn("Her body is trembling, her breath coming in ragged gasps, her hands are shaking.. as more and more cum gets drained out of her balls by your {pc.feet} squeezing her cock and knot.. creating so much mess..")

		else:
			saynn("Her hips buck uncontrollably.. before thick strings of cum start erupting from her pulsing member, directly into the condom that you have managed to put onto her just in time.")

			saynn("Her body is trembling, her breath coming in ragged gasps, her hands are shaking.. as more and more cum gets drained out of her balls by your {pc.feet} squeezing her cock and knot.. filling that condom and making it sag so much..")

		saynn("[say=artica]N..n-n..nyahh-h..[/say]")

		saynn("By the end of it.. Artica is spent..")

		addButton("Continue", "Time to cuddle", "feet_thrust_cuddle")
	if(state == "feet_thrust_cuddle"):
		playAnimation(StageScene.Cuddling, "idle", {pc="pc", npc="artica", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("After that intense session, you pull the fluff into your hands and proceed to cuddle with her, all the while whispering dirty things into her ear.")

		saynn("[say=pc]Such a good little pawslut~.[/say]")

		saynn("[say=artica]It f-felt.. r-really g-good..ah.. t-thank you-u..[/say]")

		if (usedCondom):
			saynn("Carefully, you pull the filled condom off of her cock and dispose of it appropriately.")

		saynn("After some cuddling, you help the fluff return to her spot.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "chastity_give"):
		playAnimation(StageScene.SexPawjob, "tease", {pc="artica", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		if (receivedPawjob):
			saynn("Artica looks up at you with a desperate whimper, her lusty eyes silently pleading for more. Her cock is caged up.. but you have a great idea..")

			saynn("[say=pc]Alright. Let's try something.[/say]")

		else:
			saynn("That sight is great.. but you'd rather let Artica have fun this time. Her cock is caged up.. but you have a great idea..")

			saynn("[say=pc]Let's try something, girl.[/say]")

		saynn("Artica watches you with her big puppy eyes as you grab a random strapon harness.. and secure it around her waist, the strapon going over her chastity cage.")

		saynn("[say=artica]Um..[/say]")

		saynn("You take her spot and raise your legs, exactly like she did, presenting your {pc.feet} to Artica's eyes.")

		saynn("[say=pc]You may have fun with these. But I'm not gonna move. Prove how big of a paw slut you are.[/say]")

		saynn("[say=artica]B-but.. h-how..[/say]")

		saynn("You boop her new rubber cock with your {pc.toes}.")

		saynn("[say=artica]Y-yes.. yes.. o-oka..ay..[/say]")

		saynn("The white fluff shifts closer, her maw waters up as she inspects the offered {pc.feet} and {pc.toes}..")

		addButton("Continue", "See what happens next", "feet_thrust_chastity")
	if(state == "feet_thrust_chastity"):
		playAnimation(StageScene.SexPawjob, "thrust", {pc="artica", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You're not gonna move your legs.. so Artica gently puts her hands on your ankles.. and then carefully presses her strapon through the empty between your {pc.feet}, thrusting her hips forward.")

		saynn("There is no direct stimulation. So it's clearly.. incredibly humiliating for her.. the fluff's cheeks are hot red while you just smile, watching her use your {pc.feet}, thrusting in and out between them more. The fluff is whimpering quietly..")

		saynn("[say=pc]Aww~.. But look, you're fucking my {pc.feet}. It's so hot isn't it?[/say]")

		saynn("She huffs and nods.. before closing her eyes..")

		saynn("[say=pc]No, open your eyes, slut. And look at my {pc.feet}. Look how well your cock is fucking them.[/say]")

		saynn("The fluff obeys and starts watching her actions.. her mouth is watering again.. her lips produce a quiet moan..")

		saynn("[say=artica]Ah.. y-yes.. f-feels so g-ggood..[/say]")

		saynn("As she focuses on it, more cute moans begin to escape from her, Artica's rubber cock is sliding between your {pc.feet} with increasing urgency, her locked cock is dripping pre eagerly behind the harness, creating a wet spot on the bed sheets..")

		addButton("Continue", "See what happens next", "feet_thrust_cum_chastity")
	if(state == "feet_thrust_cum_chastity"):
		playAnimation(StageScene.SexPawjob, "thrustfast", {pc="artica", npc="pc", bodyState={naked=true, hard=true, condom=usedCondom}, npcBodyState={naked=true, hard=true}})
		saynn("With each thrust, Artica's hips rocked forward, the strapon sliding between your {pc.feet} with rhythmic motions. Despite the obvious barrier between her cock and your legs, she is clearly consumed by the desperate need for release, her moans growing louder..")

		saynn("The limited amount of friction and pressure on Artica's chastity cage sends waves of pleasure through the poor moaning fluff.. until she surrenders to the overwhelming sensations completely..")

		saynn("[say=artica]Ah!.. G-gods!.. Ah-h..ah..ah..[/say]")

		saynn("Her hips buck uncontrollably.. before thick strings of cum start erupting from under the strapon harness, dripping down and splattering onto the bed sheets, forming hot, sticky patterns.")

		saynn("[say=pc]Oh wow.[/say]")

		saynn("Her body is trembling, her breath coming in ragged gasps, her hands are shaking.. as more and more cum dribbles down from her crotch.. creating so much mess..")

		saynn("[say=artica]N..n-n..nyahh-h..[/say]")

		saynn("[say=pc]Impressive, you managed to cum~.[/say]")

		saynn("By the end of it.. Artica is spent..")

		addButton("Continue", "Time to cuddle", "feet_thrust_cuddle")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "in_cell"):
		processTime(3*60)

	if(_action == "receive_pawjob"):
		receivedPawjob = true

	if(_action == "chastity_give"):
		getCharacter("artica").getInventory().equipItem(GlobalRegistry.createItem("StraponCanine"))

	if(_action == "receive_pawjob_cum"):
		processTime(3*60)
		getModule("ArticaModule").addCorruption(0.01)
		getCharacter("artica").cummedOnBy("pc")
		GM.pc.orgasmFrom("artica")

	if(_action == "after_pawjob"):
		processTime(3*60)

	if(_action == "feet_thrust"):
		processTime(5*60)

	if(_action == "feet_thrust_cum"):
		processTime(5*60)
		getModule("ArticaModule").triggerCorruption(0.02)
		GM.pc.cummedOnBy("artica")

	if(_action == "feet_thrust_condom"):
		processTime(5*60)
		usedCondom = true
		GM.pc.useWorstCondom()
		getModule("ArticaModule").triggerCorruption(0.02)
		addFilledCondomToLootIfPerk(getCharacter("artica").createFilledCondom())
		setState("feet_thrust_cum")
		return

	if(_action == "feet_thrust_cuddle"):
		processTime(10*60)
		getCharacter("artica").removeStrapon()

	if(_action == "feet_thrust_chastity"):
		processTime(5*60)

	if(_action == "feet_thrust_cum_chastity"):
		processTime(5*60)
		getModule("ArticaModule").triggerCorruption(0.02)

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
	data["receivedPawjob"] = receivedPawjob
	data["usedCondom"] = usedCondom

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
	receivedPawjob = SAVE.loadVar(data, "receivedPawjob", false)
	usedCondom = SAVE.loadVar(data, "usedCondom", false)
