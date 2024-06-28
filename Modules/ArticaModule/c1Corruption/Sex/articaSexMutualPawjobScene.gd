extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false

func _init():
	sceneID = "articaSexMutualPawjobScene"

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
		saynn("Artica is so tense, her paws keep"+str(" sliding under her uniform and boldly rubbing herself in various places, her shorts bulging as she does it" if !isNaked else " sliding along her curves and rubbing herself in various places, her cock twitching slightly as she does it")+". She can surely use a release.. and so do you actually.")

		saynn("[say=pc]Let's go unwind, Artica.[/say]")

		saynn("[say=artica]Unwind?.. You wanna.. use m-me?.. Mmm-m.."+str(" Make me your c-cock s-sleeve?.." if GM.pc.hasReachablePenis() else " Maybe do s-something with my c-cock or p-pussy..")+"[/say]")

		saynn("So casual she is..")

		saynn("[say=pc]I think we should help each other. You will see.[/say]")

		saynn("You grab her hand and pull her towards one of the secluded spots..")

		addButton("Continue", "See what happens next", "near_waterfall")
	if(state == "near_waterfall"):
		playAnimation(StageScene.PawJobMutual, "tease", {pc="pc", npc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		aimCameraAndSetLocName("yard_waterfall")
		GM.pc.setLocation("yard_waterfall")
		addCharacter("artica", ["naked"])
		saynn("Your cell might be a bit small for what you want to do.. so you just bring Artica into the yard area. Lots of greenery and bushes to hide behind here..")

		saynn("[say=artica]Fresh air.. And grass everywhere..[/say]")

		saynn("[say=pc]Why don't you lay down. Let's enjoy it."+str(" Just don't get your uniform dirty, better take it off." if !isNaked else "")+"[/say]")

		saynn("[say=artica]Oh.."+str(" Yeah, you're right.. haha." if !isNaked else "")+"[/say]")

		saynn(""+str("You help Artica strip her clothes off and then place them on the bench nearby.. After that, you and Artica" if !isNaked else "You and Artica find a good spot and")+" lay on the lush grass, opposite of each other.")

		saynn("[say=artica]Why.. so far away..[/say]")

		saynn("Your intent becomes clear to her as you gently land one of your {pc.feet} onto her"+str(" round pregnant" if getCharacter("artica").isVisiblyPregnant() else " slim fluffy")+" belly.. lower part of it.. dangerously close to her sheath that has the cyan member peeking out already..")

		saynn("[say=pc]You see why?[/say]")

		saynn("[say=artica]Y-yeah..[/say]")

		if (GM.pc.isWearingChastityCage()):
			saynn("The gentle breeze from the waterfall is creating a nice soft breeze.. Artica mirrors your action, placing one of her hind paws onto your belly, her toes already gently teasing your chastity cage, playing with the member that is stuck inside..")

		elif (GM.pc.hasReachablePenis()):
			saynn("The gentle breeze from the waterfall is creating a nice soft breeze.. Artica mirrors your action, placing one of her hind paws onto your belly, her toes already gently teasing your member, making you hard..")

		elif (GM.pc.hasReachableVagina()):
			saynn("The gentle breeze from the waterfall is creating a nice soft breeze.. Artica mirrors your action, placing one of her hind paws onto your belly, her toes already gently teasing your little cute slit, making you wet..")

		else:
			saynn("The gentle breeze from the waterfall is creating a nice soft breeze.. Artica mirrors your action, placing one of her hind paws onto your belly, her toes already gently teasing your little crotch, making you needy..")

		saynn("[say=pc]Such a pawslut.. you understood instantly..[/say]")

		saynn("The fluff's cheeks blush while you press her hard member against her belly with your {pc.foot}.. making her bite her lip.")

		addButton("Mutual pawjob", "Have some fun together", "do_mutual_pawjob")
	if(state == "do_mutual_pawjob"):
		if (GM.pc.hasReachablePenis()):
			playAnimation(StageScene.PawJobMutual, "sex", {pc="pc", npc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		else:
			playAnimation(StageScene.PawJobMutual, "rub", {pc="pc", npc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("So kinky.. anyone might walk in on you at any time.. And yet, the desire is pushing you two further.")

		saynn("Carefully, you trap her cyan shaft between your {pc.feet}.. and then proceed to gently stroke it, sliding your {pc.toes} along the veiny sensitive surface. This instantly sparks a reaction, Artica produces a cute moan while her cock starts twitching, heart pumping more and more blood through it, precum leaking from the tip.")

		saynn("[say=artica]Ah.. t-that feels so g-good..[/say]")

		if (GM.pc.isWearingChastityCage()):
			saynn("In return, she increases the pace of her own strokes, her cyan paw pads brushing and sliding along your chastity cage with skillful precision, toes curling and teasing the cock that's inside.. It sure is a unique experience, your breath hitches in your throat, your lips drop a moan or two as well..")

		elif (GM.pc.hasReachablePenis()):
			saynn("In return, she increases the pace of her own strokes, her cyan paw pads brushing and sliding along the length of your {pc.penis} with skillful precision, toes curling and teasing the head.. It sure is a unique experience, your breath hitches in your throat, your lips drop a moan or two as well..")

		elif (GM.pc.hasReachableVagina()):
			saynn("In return, she increases the pace of her own strokes, her cyan paw pads brushing and sliding along your wet pussy folds with skillful precision, toes curling and teasing the clit.. It sure is a unique experience, your breath hitches in your throat, your lips drop a moan or two as well..")

		else:
			saynn("In return, she increases the pace of her own strokes, her cyan paw pads brushing and sliding along your crotch with skillful precision, toes curling and teasing the sensitive area.. It sure is a unique experience, your breath hitches in your throat, your lips drop a moan or two as well..")

		saynn("[say=pc]Nh.. ah.. yeah, keep working your paws..[/say]")

		saynn("As your movements synchronize, a wave of warm pleasure washes over you two, your bodies and legs moving in perfect harmony.. The knot on Artica's dick starts growing.. while you keep squeezing it with your {pc.feet}."+str(" At the same time, the fluff feels your cock growing harder under her paw." if GM.pc.hasReachablePenis() else "")+"")

		addButton("Faster", "Stroke her cock faster", "stroke_cum")
	if(state == "stroke_cum"):
		if (GM.pc.hasReachablePenis()):
			playAnimation(StageScene.PawJobMutual, "fast", {pc="pc", npc="artica", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		else:
			playAnimation(StageScene.PawJobMutual, "rubfast", {pc="pc", npc="artica", npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		if (GM.pc.isWearingChastityCage()):
			saynn("Driven by this strange shared passion, you and Artica quicken the pace, stroking each other's cocks faster while loudly showing your love for this activity..")

			saynn("[say=artica]Ah.. ahh.. I'm such.. slut f-for {pc.feet}.. S-so intense.. ah-h..[/say]")

			saynn("Her knot has grown to its full size, the shaft throbbing between your {pc.feet}.. Artica covers her slutty moans with her hand, her gaze shaking and keeps climbing up. At the same time, your own member is twitching inside of its small cage. Her paw, coated in your precum, is rubbing your locked cock so well..")

			saynn("With two passionate cries, you reach your peaks together, your cocks pulsing at the speed of your heartbeats as they unleash thick ropes of seed onto your feet and bellies.. Artica is squirming particularly hard as her hidden pussy gushing out a fountain of juices onto the grass beneath..")

		elif (GM.pc.hasReachablePenis()):
			saynn("Driven by this strange shared passion, you and Artica quicken the pace, stroking each other's cocks faster while loudly showing your love for this activity..")

			saynn("[say=artica]Ah.. ahh.. I'm such.. slut f-for {pc.feet}.. S-so intense.. ah-h..[/say]")

			saynn("Her knot has grown to its full size, the shaft throbbing between your {pc.feet}.. Artica covers her slutty moans with her hand, her gaze shaking and keeps climbing up. At the same time, your own member is twitching under her stroking, her paw, coated in your precum, is sliding along your length so well..")

			saynn("With two passionate cries, you reach your peaks together, your cocks pulsing at the speed of your heartbeats as they unleash thick ropes of seed onto your feet and bellies.. Artica is squirming particularly hard as her hidden pussy gushing out a fountain of juices onto the grass beneath..")

		elif (GM.pc.hasReachableVagina()):
			saynn("Driven by this strange shared passion, you and Artica quicken the pace, stroking each other's bits faster while loudly showing your love for this activity..")

			saynn("[say=artica]Ah.. ahh.. I'm such.. slut f-for {pc.feet}.. S-so intense.. ah-h..[/say]")

			saynn("Her knot has grown to its full size, the shaft throbbing between your {pc.feet}.. Artica covers her slutty moans with her hand, her gaze shaking and keeps climbing up. At the same time, your pussy is twitching under her strokes. Her paw, coated in your juices, is rubbing your clit so well..")

			saynn("With two passionate cries, you reach your peaks together, her cock is pulsing at the speed of her heartbeats as it unleashes thick ropes of seed onto her belly while your pussy is gushing out a fountain of juices onto your thighs.. Artica is squirming particularly hard as both of her sets of private bits twitch at the same time..")

		else:
			saynn("Driven by this strange shared passion, you and Artica quicken the pace, stroking each other's sensitive zones faster while loudly showing your love for this activity..")

			saynn("[say=artica]Ah.. ahh.. I'm such.. slut f-for {pc.feet}.. S-so intense.. ah-h..[/say]")

			saynn("Her knot has grown to its full size, the shaft throbbing between your {pc.feet}.. Artica covers her slutty moans with her hand, her gaze shaking and keeps climbing up. At the same time, her paw is making you squirm so hard, her touch rubbing your crotch so well..")

			saynn("With two passionate cries, you reach your peaks together, her cock is pulsing at the speed of her heartbeats as it unleashes thick ropes of seed onto her belly while you arch your back and grab onto the dirt tightly.. Artica is squirming particularly hard as both of her sets of private bits twitch at the same time..")

		saynn("[say=artica]Nyaaa-ah..[/say]")

		saynn("[say=pc]H-hah.. Y-yeah.. ke-ep cumming, girl..[/say]")

		saynn("Even while the pleasure is flooding your mind, you keep stroking her cock hard, draining her balls dry..")

		addButton("Rest", "Enjoy the afterglow", "after_cum")
	if(state == "after_cum"):
		playAnimation(StageScene.PawJobMutual, "tease", {pc="pc", npc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You and Artica are left panting after this, just resting on the cold grass, your gazes directed high up, at the fake sky.. cum still dripping off your {pc.feet}..")

		saynn("[say=artica]Ah..[/say]")

		saynn("[say=pc]Feels good, huh?..[/say]")

		saynn("You just lay together like that, enjoying the afterglow..")

		saynn("[say=artica]Y-yeah..[/say]")

		saynn("Her eyes pick up on someone's footsteps.. but she doesn't care much, just continuing to rest naked.. To be fair, you don't do anything about it either. Luckily, whoever it is, they don't seem to care..")

		saynn("After a good rest, you help Artica to get up. She swipes any dirt off of you two.")

		saynn("[say=artica]I w-will be.. in my spot..[/say]")

		saynn("You nod and watch her walk away, while seductively swaying her hips.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "near_waterfall"):
		processTime(5*60)

	if(_action == "do_mutual_pawjob"):
		processTime(15*60)

	if(_action == "stroke_cum"):
		processTime(5*60)
		getModule("ArticaModule").triggerCorruption(0.03)
		if(GM.pc.hasPenis() || GM.pc.hasReachableVagina()):
			GM.pc.cummedOnBy("pc")
		getCharacter("artica").cummedOnBy("artica")

	if(_action == "after_cum"):
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
