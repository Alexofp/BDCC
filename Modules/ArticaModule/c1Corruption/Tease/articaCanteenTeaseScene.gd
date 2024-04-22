extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false

func _init():
	sceneID = "articaCanteenTeaseScene"

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
		saynn("You invite Artica to go eat in a canteen.")

		if (nakedAndShy):
			saynn("[say=artica]Oh.. umm-m.. but I'm naked.. Everyone is gonna see m-my.. eep![/say]")

			saynn("You decide not to listen to her excuses and just grab her by the collar.")

		elif (isLusty):
			saynn("[say=artica]Oh.. um-m.. we ca-a-an..[/say]")

			if (isNaked):
				saynn("Her hard exposed {artica.penis} tells you that she might be needy for more than just a snack.")

			else:
				saynn("Her bulging out shorts are telling you that she might be needy for more than just a snack.")

		else:
			saynn("[say=artica]Sounds good.. back to my old spot, haha.[/say]")

		addButton("Canteen", "Go eat!", "go_eat")
	if(state == "go_eat"):
		playAnimation(StageScene.PawJobUnderTable, "start", {npc="pc", pc="artica"})
		if (nakedAndShy):
			saynn("You grab 2 trays with the tasteless nutrient paste. Holding that tray forces Artica to keep her {artica.penis} exposed, her cheeks blush deeply as she rushes to the usual table.")

			saynn("[say=artica]Everyone is w-watching..[/say]")

		elif (isNaked && isVerySlut):
			saynn("You grab 2 trays with the tasteless nutrient paste and head to the usual table. Artica is swaying her butt eagerly, enjoying your hungry gaze on her exposed private bits.")

			saynn("[say=artica]Everyone is watching, haha..[/say]")

		elif (isNaked && isSlut):
			saynn("You grab 2 trays with the tasteless nutrient paste and head to the usual table. Artica doesn't seem to be that ashamed of her body anymore, just casually walking past all the other inmates who stare at her private bits.")

			saynn("[say=artica]I'm so.. exposed..[/say]")

		else:
			saynn("You grab 2 trays with the tasteless nutrient paste and sit behind the usual table.")

			saynn("[say=artica]"+str(RNG.pick(["How's you?..", "Looks tasty.. a bit..", "I'm doing okay.. What about you?"]))+"[/say]")

		saynn("Time flies as you chat and eat your meals.")

		addButton("Stealth tease", "Tease her crotch with your leg under the table", "stealth_tease")
	if(state == "stealth_tease"):
		playAnimation(StageScene.PawJobUnderTable, "fast", {npc="pc", pc="artica", bodyState={hard=true}})
		saynn("The canteen is buzzing with activity as normal.. no one would notice you doing something kinky..")

		if (isLusty):
			var theCockDesc = ("hard cock" if !isCaged else "caged up cock")
			saynn("With a subtle smirk, you extend your leg under the table, reaching out to gently "+str("brush Artica's crotch through the bulging shorts" if !isNaked else "stroke her "+theCockDesc)+" with the sole of your foot.")

			saynn("Artica gasps, her eyes widening in surprise as a red blush spreads across her cheeks. She is squirming in her seat, her breath catching in her throat..")

			saynn("[say=artica]H-hey.. um-m.. ah.. eep.. ah.. ah..[/say]")

			if (isNaked):
				saynn("It doesn't take long for her soft whimpers to be replaced by cute moans, Artica's cock is only getting harder"+str(", the knot filling with blood.." if !isCaged else ".. well, trying to. The chastity cage prevents any kind of erection..")+"")

				saynn("[say=artica]W-wai.. I'm g-gonna.. ah-h.. it's too m-m-muuuch.. ah.ah..h-h~..[/say]")

				saynn("The fluff was horny already.. so this teasing was a little too much for her.")

				saynn("With a gasp of pleasure, Artica's hips bucked involuntarily, her entire body trembling as a powerful orgasm starts rushing through her. More moans escape from her lips as her cock erupts, with hot ropes of cum spurting from its tip and splattering all over the underside of the table..")

			else:
				saynn("It doesn't take long for her soft whimpers to be replaced by cute moans, "+str("the cock in her shorts seems to be getting bigger and bigger, its pulsing knot filling with blood.." if !isCaged else "the locked cock in her shorts seems to be twitching quite a bit, desperately trying to fight the chastity cage..")+"")

				saynn("[say=artica]W-wai.. I'm g-gonna.. ah-h.. it's too m-m-muuuch.. ah.ah..h-h~..[/say]")

				saynn("The fluff was horny already.. so this teasing was a little too much for her.")

				saynn("With a gasp of pleasure, Artica's hips bucked involuntarily, her entire body trembling as a powerful orgasm starts rushing through her. More moans escape from her lips as her cock erupts, with hot ropes of cum spurting from its tip and splattering all over her own shorts and fur.. oops.. maybe you should steal her clothes for her to not get messy from this!")

		else:
			var theCockDesc = ("sheath" if !isCaged else "caged up cock")
			saynn("With a subtle smirk, you extend your leg under the table, reaching out to gently "+str("brush Artica's crotch through the bulging shorts" if !isNaked else "stroke her "+theCockDesc)+" with the sole of your foot.")

			saynn("Artica gasps, her eyes widening in surprise as a red blush spreads across her cheeks. She is squirming in her seat, her breath catching in her throat..")

			saynn("[say=artica]H-hey.. um-m.. ah.. eep.. ah.. ah..[/say]")

			if (isCaged):
				saynn("You keep teasing her drippy cock until it's nice and hard.. well.. as hard as it can be inside of its cute small chastity cage. Better stop here or she will cum and lose the desire.")

			else:
				saynn("You keep teasing her drippy cock until it's nice and hard.. Better stop here or she will cum and lose the desire.")

			if (isSlut):
				saynn("[say=artica]Nh-h.. why d-did you s-stop..[/say]")

				saynn("[say=pc]Because~.[/say]")

			else:
				saynn("[say=artica]Nh-h.. now I'm so.. ah..[/say]")

				saynn("[say=pc]Good.[/say]")

		saynn("After that, you return back to Artica's usual spot.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "go_eat"):
		processTime(15*60)
		GM.pc.afterEatingAtCanteen()
		setFlag("Canteen_PlayerAteToday", true)

	if(_action == "stealth_tease"):
		processTime(3*60)
		if(isLusty):
			getModule("ArticaModule").triggerCorruption(0.02)
			getCharacter("artica").cummedOnBy("artica")
		else:
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
