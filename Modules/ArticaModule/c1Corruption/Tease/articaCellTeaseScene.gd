extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false

func _init():
	sceneID = "articaCellTeaseScene"

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
		saynn("You invite Artica to hang around in your cell together.")

		if (nakedAndShy):
			saynn("[say=artica]Oh.. um.. s-sure.. at least others wouldn't be seeing me so.. exposed..[/say]")

		elif (isSlut):
			saynn("[say=artica]Of course.. I like hanging around in your cell, haha..[/say]")

		else:
			saynn("[say=artica]Oh.. um.. okay, might as well..[/say]")

		addButton("Cell", "Bring her to your cell", "in_cell")
	if(state == "in_cell"):
		aimCameraAndSetLocName(GM.pc.getCellLocation())
		saynn("You bring"+str(" pregnant" if getCharacter("artica").isVisiblyPregnant() else "")+" Artica to your cell."+str(" She seems to be quite horny.." if isLusty else "")+" What do you wanna do?")

		if (isNaked):
			saynn("Artica's uniform is stashed here. You can give it back to her if you want.")

		addButton("Cuddle", "Just cuddle together with Artica", "do_cuddle")
		if (GM.pc.getInventory().hasItemsWithTag(ItemTag.RopeHarness)):
			addButton("Ropes!", "Use ropes to suspend Artica above the floor in your cell.. to make her hang around in your cell a little longer", "pick_ropes_menu")
		else:
			addDisabledButton("Ropes!", "You don't have any rope harnesses in your inventory")
		if (isNaked):
			addButton("Give clothes", "Give Artica back her uniform", "give_uniform")
	if(state == "do_cuddle"):
		if (isLusty):
			playAnimation(StageScene.Cuddling, "squirm", {pc="pc", npc="artica", npcBodyState={hard=true}})
		else:
			playAnimation(StageScene.Cuddling, "idle", {pc="pc", npc="artica", npcBodyState={hard=true}})
		var isPreg = getCharacter("artica").isVisiblyPregnant()
		saynn("[say=pc]Let's cuddle.[/say]")

		if (!isPreg):
			saynn("You gently pull Artica towards your bed, guiding her to sit between your legs.")

			saynn("With a tender smile, you wrap your arms around the white fluff, pulling her close against your {pc.masc} chest. Her body feels a little tense at first.. but it slowly relaxes under your touch, the fluff nestling into your embrace.")

		else:
			saynn("You gently pull visibly pregnant Artica towards your bed, guiding her to sit between your legs.")

			saynn("With a tender smile, you wrap your arms around the white fluff and put your hands on her big round belly, gently caressing it. Her body feels a little tense at first.. but it slowly relaxes under your touch, the fluff nestling into your embrace.")

			saynn("You feel.. life.. inside her.. it reacts to your careful touches by occasionally kicking back..")

			saynn("[say=artica]Ah.. I'm.. gonna be a mom..[/say]")

		saynn("Learning in close, you whisper sweet things into her ear, your voice is soft and reassuring.")

		if (!isPreg):
			if (isSlut):
				saynn("[say=pc]"+str(RNG.pick(["Can't stop thinking about how good you would look on your knees..", "The way you squirm when desperate and needy is so nice..", "Such a soft body.. such firm breasts.. such tight holes.. such a cute cock."]))+"[/say]")

			else:
				saynn("[say=pc]"+str(RNG.pick(["Such a nice fluffer..", "Your fur is so nice and fluffy..", "Just relax, soft fluff..", "Don't have to be shy with me, precious fluff.."]))+"[/say]")

		else:
			if (isSlut):
				saynn("[say=pc]"+str(RNG.pick(["I love how your body has changed, Artica. Your tits are fuller, your hips wider. You look like you were made to breed..", "You're so fucking hot when you're pregnant, Artica. I love how your body craves cock even more than usual..", "You're going to be such a good mommy, Artica. Taking care of all our little pups while I use your body for my own pleasure..", "Imagine all those little pups squirming inside you, craving their mommy's milk. You're going to be such a hot, slutty mommy.."]))+"[/say]")

			else:
				saynn("[say=pc]"+str(RNG.pick(["You're going to be the best mommy, Artica.. I can see the love in your eyes.", "You're so sexy when you're pregnant, Artica. I love seeing you like this..", "I love how your body has changed with your pregnancy, Artica.. You're even more beautiful when carrying a litter.."]))+"[/say]")

		saynn("Her cheeks blush red, her"+str(" clothed" if !isNaked else " exposed")+" pussy getting needy, her cock growing bigger between her legs.."+str(" as much as the chastity cage allows.. which is not a lot.." if isCaged else "")+" Lost in the moment, Artica surrenders herself to your embrace, her body quivering with desire..")

		saynn("A close personal touch made Artica needy for more.. But it's time to return back to the main hall.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "in_cell"):
		processTime(3*60)

	if(_action == "do_cuddle"):
		processTime(10*60)
		getModule("ArticaModule").makeLusty()

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
