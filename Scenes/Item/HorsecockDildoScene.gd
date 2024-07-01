extends SceneBase

var hadContents = false
var isPussy = false
var uniqueItemID = ""

func _init():
	sceneID = "HorsecockDildoScene"

func _initScene(_args = []):
	if(_args.size() > 0):
		uniqueItemID = _args[0]

func _run():
	if(state == ""):
		playAnimation(StageScene.HorsecockDildoSex, "tease", {bodyState={naked=true}})
		saynn("You're holding a hefty sex toy, the one that all studs have between their legs. You set it up on the floor carefully and let the suction cup firmly fixate it in place. Impressive size. The way it wobbles slightly makes you eager already..")

		saynn("Which hole do you wanna use..")

		addButtonWithChecks("Pussy", "Ride it with your pussy", "ride_pussy", [], [ButtonChecks.HasReachableVagina])
		addButtonWithChecks("Anus", "Ride it with your butt", "ride_anus", [], [ButtonChecks.HasReachableAnus])
		addButton("Cancel", "You changed your mind", "endthescene")
	#if(state == "Ignore"):
	#	addButton("pussy", "asd", "ride_pussy")
	#	addButton("anus", "asd", "ride_anus")
	if(state == "begin_riding"):
		playAnimation(StageScene.HorsecockDildoSex, "inside", {bodyState={naked=true}})
		saynn("You lean down to the toy and spit on its flat head a few times before using your hands to spread the saliva around. Even just the preparations make you excited. But enough foreplay..")

		saynn("Time to try it, you position your body over the giant rubber horsecock and begin to slowly lower yourself onto it, your hand guiding the flared tip towards your "+str("{pc.pussyStretch} pussy" if isPussy else "{pc.analStretch} tailhole")+". The sheer girth makes it obvious that your body will need some.. convincing.. to let that thing in.")

		saynn("First attempts aren't too successful, your "+str("pussy slit" if isPussy else "anal ring")+" struggles to stretch enough to fit it. But you don't stop trying, gradually applying more pressure onto it with your "+str("crotch" if isPussy else "butt")+". It's not inside yet but you sure feel how much it tries to stretch you, the thoughts going through your head are very arousing..")

		addButton("Continue", "See what happens next", "begin_penetration")
	if(state == "begin_penetration"):
		playAnimation(StageScene.HorsecockDildoSex, "sex", {bodyState={naked=true}})
		saynn("After a few attempts you get more and more bold with your motions, the flared head stretching your needy hole until you finally feel it sliding inside, burying itself in your "+str("slit" if isPussy else "ass")+".")

		saynn("It instantly puts pressure onto your pleasure spot, causing a wave of strong sensations. You don't stop there though, you start bouncing on that rubber dildo, forcing it deeper down your "+str("pussy" if isPussy else "butt")+" each time.")

		if (GM.pc.hasPenis()):
			saynn("Your {pc.penis} got so much harder now that the blood flows to your crotch, the tip is leaking precum a lot.")

		if (!isPussy && GM.pc.hasReachableVagina()):
			saynn("Your neglected pussy is dripping arousal onto the toy's heavy-looking balls. The girth is enough to push onto your g-spot through the soft walls of your butt.")

		saynn("It feels so big inside you, rogue moans escape from your lips as you use the rubber veiny shaft to stretch yourself out. Each time you bring yourself down onto it, a cute bump shows up on your belly, the outline of a cock.")

		saynn("The climax draws near, you focus on your body and your sensations and just let the passionate noises slip from between your lips.")

		addButton("Cum!", "Ride it until you make it", "do_cum")
	if(state == "do_cum"):
		playAnimation(StageScene.HorsecockDildoSex, "fast", {pcCum=true, bodyState={naked=true, hard=true}})
		saynn("You proceed to ride the fuck out of that horsecock, raising your lower part of the body before bringing it down along the fat shaft with full force, letting the flared tip as deep as your body allows and then some.")

		if (!isPussy && GM.pc.hasPenis()):
			saynn("This toy is great, it smashes your prostate so much that your {pc.penis} is leaking pre all over the floor. You feel yourself getting super close, that feeling is rising faster the harder you ride that cock.")

		else:
			saynn("This toy is great, it smashes all the buttons of your body with ease. You feel yourself getting super close, that feeling is rising faster the harder you ride that cock.")

		if (GM.pc.hasPenis()):
			saynn("Your whole body tenses up, you bring yourself down that shaft as deep as you can and arch your back, moaning passionately while your member shoots weak strings of {pc.cum} one after another. The wet orgasm is so strong that your eyes roll up.")

		elif (GM.pc.hasReachableVagina()):
			saynn("Your whole body tenses up, you bring yourself down that shaft as deep as you can and arch your back, moaning passionately while your pussy squirts all over the toy. The orgasm is so strong that your eyes roll up.")

		else:
			saynn("Your whole body tenses up, you bring yourself down that shaft as deep as you can and arch your back, moaning passionately. The orgasm is so strong that your eyes roll up.")

		saynn("Your "+str("pussy" if isPussy else "tailhole")+" starts pulsating around the girthy rubber dick, your stretched fuckhole desperately trying to milk it while you can't stop shaking and shivering.")

		if (hadContents):
			saynn("Your inner walls squeeze the fat horsecock so much that it suddenly starts throbbing inside you before [b]releasing all of its contents inside your "+str("pussy" if isPussy else "ass")+"[/b].")

		addButton("Continue", "See what happens next", "afterglow")
	if(state == "afterglow"):
		playAnimation(StageScene.HorsecockDildoSex, "inside", {bodyState={naked=true}})
		saynn("Bliss. An ocean of pleasure. Your mind struggles to withstand the wild sensations. The toy is almost fully inside you, apart from the balls worthy of a stallion of course. Even when you stop riding it and just try to rest with it inside, the occasional moan escapes from you. The afterglow feeling is so strong, you're drooling while trying to catch your breath.")

		saynn("Eventually the lust fades away, replaced by a hyper sensitivity. Your "+str("slit" if isPussy else "tailhole")+" is desperately trying to close, causing discomfort. That's enough fun for now. You slowly raise your body until the flared tip makes a satisfying plop noise and leaves your gaping fuckhole to shine. "+str("You clench a few times until your tailhole closes up." if !isPussy else "You wait for a bit until your pussy hole closes up.")+"")

		addButton("Continue", "Nice", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "ride_pussy"):
		isPussy = true
		setState("begin_riding")
		GM.pc.addLust(50)
		return

	if(_action == "ride_anus"):
		isPussy = false
		setState("begin_riding")
		GM.pc.addLust(50)
		return

	if(_action == "begin_penetration"):
		processTime(60*5)
		GM.pc.addLust(50)
		if(isPussy):
			GM.pc.gotOrificeStretchedWith(BodypartSlot.Vagina, 50)
		else:
			GM.pc.gotOrificeStretchedWith(BodypartSlot.Anus, 50)

	if(_action == "do_cum"):
		processTime(5*60)
		if(isPussy):
			GM.pc.gotOrificeStretchedWith(BodypartSlot.Vagina, 50)
		else:
			GM.pc.gotOrificeStretchedWith(BodypartSlot.Anus, 50)
		var item = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
		if(item.getFluids() != null && !item.getFluids().isEmpty()):
			hadContents = true
			if(isPussy):
				item.getFluids().transferTo(GM.pc.getBodypart(BodypartSlot.Vagina), 1.0)
			else:
				item.getFluids().transferTo(GM.pc.getBodypart(BodypartSlot.Anus), 1.0)
		GM.pc.orgasmFrom("pc")

	if(_action == "afterglow"):
		processTime(6*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["hadContents"] = hadContents
	data["isPussy"] = isPussy
	data["uniqueItemID"] = uniqueItemID

	return data

func loadData(data):
	.loadData(data)

	hadContents = SAVE.loadVar(data, "hadContents", false)
	isPussy = SAVE.loadVar(data, "isPussy", false)
	uniqueItemID = SAVE.loadVar(data, "uniqueItemID", "")
