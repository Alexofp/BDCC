extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false
var articaCondom = false
var condomUsed = false
var condomBroke = false
var condomBreakChance = 0.0
var straponHasCum = false
var straponHasArticaCum = false
var isStroking = false
var isLicking = false

func _init():
	sceneID = "articaSexBreedScene"

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
		if (isNaked):
			saynn("Your eyes lock onto the white fluff, your gaze purposefully lingering on her"+str(" milky" if getCharacter("artica").isLactating() else "")+" {artica.breasts}.. fluffy"+str(" cute" if !getCharacter("artica").isVisiblyPregnant() else " round")+" belly.. her closed legs that house a"+str(" caged up" if isCaged else "n aroused")+" sheath.. but also a needy pussy hidden behind her balls.")

		else:
			saynn("Your eyes lock onto the white fluff, your gaze purposefully lingering on her shirt that hides her {artica.breasts} and fluffy"+str(" cute" if !getCharacter("artica").isVisiblyPregnant() else " round")+" belly.. her shorts that cover up her a"+str(" caged up" if isCaged else "n aroused")+" sheath.. but also a needy pussy behind her balls.")

		saynn("She notices your greedy stare, the attention making the fluff wiggle her body. You can just.. feel.. her scent getting stronger with each second of you watching her.")

		if (isVerySlut):
			saynn("[say=artica]D-do I l-look s-slutty?..[/say]")

		elif (isSlut):
			saynn("[say=artica]A-are you..[/say]")

		else:
			saynn("[say=artica]What a-are you..[/say]")

		saynn("With a predatory grin, you suddenly grab her by the collar and pull her in the direction of your cell.")

		saynn("[say=artica]..eeep!..[/say]")

		addButton("Cell", "Pull the fluff into your cell", "in_cell")
	if(state == "in_cell"):
		addCharacter("artica", ["naked"])
		aimCameraAndSetLocName(GM.pc.getCellLocation())
		GM.pc.setLocation(GM.pc.getCellLocation())
		playAnimation(StageScene.SexPawLick, "tease", {pc="pc", npc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("As soon as you enter your little place, Artica gets pushed onto the bed"+str(", your hands remove her clothes in seconds and are already exploring her forms, spreading her legs" if !isNaked else ", your hands already start exploring her forms and spreading her legs")+".")

		saynn("[say=artica]Ah..[/say]")

		saynn("What a great view.. shy blushing face that is already panting softly.. "+str("swollen milky tits with dark cyan perky nips that have purple piercings in them" if getCharacter("artica").isLactating() else "modest round tits with cyan perky nips that have purple piercings in them")+".. her tight cyan slit that is hiding under her fluffy balls..")

		saynn("The fluff bites her lip, her eyes avoid any contact with yours..")

		var isPreg = getCharacter("artica").isPregnant()
		if (GM.pc.hasReachablePenis()):
			if (isVerySlut):
				if (isPreg):
					saynn("[say=artica]I h-have a big litter inside me a-already.. b-but we could always try for m-more.. P-please.. Make m-my mind blank..[/say]")

				else:
					saynn("[say=artica]P-Please.. I need y-your cock inside me.. stretching me wide.. filling me up full until I can't think.. a-anymore..[/say]")

					saynn("So mouth-y she is..")

			elif (isSlut):
				if (isPreg):
					saynn("[say=artica]I h-have a big litter inside me a-already.. b-but we could always try for m-more..[/say]")

				else:
					saynn("[say=artica]P-Please.. your c-cock.. inside m-me..[/say]")

			else:
				if (isPreg):
					saynn("[say=artica]I h-have a big litter inside me a-already..[/say]")

				else:
					saynn("[say=artica]P-Please.. your c-cock.. ah..[/say]")

		addButton("Continue", "See what happens next", "what_do")
	if(state == "wear_condom_pick"):
		saynn("Which condom do you want to put on your cock?")

		addButton("Best condom", "Wear your best condom", "wear_condom_best")
		addButton("Worst condom", "Wear your worst condom", "wear_condom_worst")
	if(state == "after_wear_condom"):
		playAnimation(StageScene.SexPawLick, "tease", {pc="pc", npc="artica", bodyState={naked=true, hard=true, condom=condomUsed}, npcBodyState={naked=true, hard=true, condom=articaCondom}})
		saynn("You put a condom onto your cock.")

		addButton("Continue", "See what happens next", "what_do")
	if(state == "add_condom_on_artica"):
		playAnimation(StageScene.SexPawLick, "tease", {pc="pc", npc="artica", bodyState={naked=true, hard=true, condom=condomUsed}, npcBodyState={naked=true, hard=true, condom=articaCondom}})
		saynn("You make Artica wear a condom!")

		addButton("Continue", "See what happens next", "what_do")
	if(state == "picked_strapon"):
		playAnimation(StageScene.SexPawLick, "tease", {pc="pc", npc="artica", bodyState={naked=true, hard=true, condom=condomUsed}, npcBodyState={naked=true, hard=true, condom=articaCondom}})
		saynn("You secure a strapon around your waist!"+str(" One that is loaded.." if straponHasCum else "")+""+str(" One that is loaded with Artica's cum.." if straponHasArticaCum else "")+"")

		addButton("Continue", "See what happens next", "what_do")
	if(state == "start_stroke_cock"):
		playAnimation(StageScene.SexPawLick, "stroketease", {pc="pc", npc="artica", bodyState={naked=true, hard=true, condom=condomUsed}, npcBodyState={naked=true, hard=true, condom=articaCondom}})
		saynn("You start stroking her cock!")

		addButton("Continue", "See what happens next", "what_do")
	if(state == "what_do"):
		playAnimation(StageScene.SexPawLick, "tease", {pc="pc", npc="artica", bodyState={naked=true, hard=true, condom=condomUsed}, npcBodyState={naked=true, hard=true, condom=articaCondom}})
		saynn("What do you want to do?")

		if (GM.pc.hasReachablePenis()):
			if (condomUsed):
				addButton("Fuck her!", "Time for some safe protected fun", "start_fuck")
			else:
				addButton("Breed her!", "Time for fun", "start_fuck")
				addButtonWithChecks("Wear condom", "Put on a condom", "wear_condom_pick", [], [[ButtonChecks.HasCondoms]])
		else:
			if (GM.pc.isWearingStrapon()):
				addButton("Fuck her", "Make that fluff squiiiirm", "start_strapon_fuck")
			else:
				addDisabledButton("Breed her!", "You don't have a reachable penis..")
				addButtonWithChecks("Wear strapon", "Select which strapon you want to put on", "select_strapon_menu", [], [[ButtonChecks.HasStraponAndCanWear]])
		if (!articaCondom):
			addButtonWithChecks("Condom on her", "Make Artica wear a condom to prevent any future mess..", "add_condom_on_artica", [], [[ButtonChecks.HasCondoms]])
		if (!isStroking && !isCaged):
			addButton("Stroke her", "Stroke her cock at the same time", "start_stroke_cock")
		addButton("Cancel", "You changed, your mind", "endthescene")
	if(state == "start_fuck"):
		playAnimation(StageScene.SexPawLick, ("stroke" if isStroking else "")+"sex", {pc="pc", npc="artica", bodyState={naked=true, hard=true, condom=condomUsed}, npcBodyState={naked=true, hard=true, condom=articaCondom}})
		saynn("Artica gasps as you plunge your hard cock into her dripping lusty pussy, her slick walls forcibly spreading to accommodate your girth and length.. One thrust is quickly followed by another, your cock sinking eagerly into that.. tight.. clenching.. pussy.")

		saynn("[say=artica]Ah!.. N-not s-so f-faa.. ah..ah.ah..[/say]")

		saynn("[say=pc]Why would I go slow? Your slutty pussy is begging to be fucked.[/say]")

		saynn("Her moans are filling the cell as you find your rhythm, her own cock quickly getting fully hard and swaying back and forth, precum leaking from the tip. Fluff is squirming on the bed, her toes curling, legs spreading more, her wet folds drawing you deeper into her velvety warmth..")

		saynn("As the rough thrusts continue, Artica's hind paw finds your face.. its claws are gently teasing your cheek.. cyan paw pads are massaging it..")

		addButton("Lick paw", "Lick the paw that is in front of you", "sex_fast_lick")
		addButton("No lick", "Just rail her harder", "sex_fast")
	if(state == "sex_fast"):
		playAnimation(StageScene.SexPawLick, ("stroke" if isStroking else "")+"fast", {pc="pc", npc="artica", bodyState={naked=true, hard=true, condom=condomUsed}, npcBodyState={naked=true, hard=true, condom=articaCondom}})
		if (isLicking):
			saynn("How can you say no to her soft hind paw.. You continue fucking the girl while nuzzling her cyan pawpads, your tongue is out and occasionally giving them little licks, feeling how rough the texture of them are..")

		else:
			pass
		saynn("Her cunt keeps clenching around your cock.. but you keep pounding her, fighting through her resistance with raw force. A little bump appears above her crotch during each thrust, your member smashing against her natural wall, trying to break through into her womb.")

		saynn("[say=artica]Ah-h.. s-so in-ntense.. g-gods.. ah.. I'mm..m.. g-gonna.. ah..[/say]")

		saynn("The knot on the base of cyan shaft is inflating with blood, her pussy twitching and shooting weak spurts of juices, the intense rough fucking making the fluff grab onto the bed sheets and throw her head back.")

		saynn("You feel like you're gonna cum too..")

		addButton("Cum inside", "Breed the fluff", "sex_cum")
	if(state == "sex_cum"):
		playAnimation(StageScene.SexPawLick, ("stroke" if isStroking else "")+"inside", {pc="pc", npc="artica", bodyState={naked=true, hard=true, condom=condomUsed}, npcBodyState={naked=true, hard=true, condom=articaCondom}})
		saynn("Artica's pussy is not just clenching around your shaft.. it spasms, the slick walls milking you hard. So, of course, with a primal growl, you ram your cock into that slutty fuckhole and let it throb, releasing your hot seed deep inside her, pumping her womb full..")

		saynn("[say=artica]Oh.. ee-ep.. nyaaaa..-ahh..[/say]")

		saynn("[say=pc]Get pregnant, needy slut.[/say]")

		saynn("Her body is convulsing in pleasure as orgasmic waves, her own cock twitching and shooting powerful lines of thick seed.. that land onto her tits and face..")

		addButton("Cuddle", "Some aftercare is nice", "do_cuddle")
	if(state == "do_cuddle"):
		playAnimation(StageScene.Cuddling, "idle", {pc="pc", npc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("After such a rough fuck, it's nice to just touch the fluff sometimes. You pull Artica into your embrace and cuddle with her. Her stuffed cyan cunt is dripping your seed onto your bed..")

		saynn("[say=artica]N-nya.. I'm s-such a.. messy.. cock w-whore..[/say]")

		saynn("[say=pc]A soft and breedable messy cock whore.[/say]")

		saynn("[say=artica]..h.. haha..[/say]")

		saynn("You spend some time like that.. before you send her off to her usual spot.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "in_cell"):
		processTime(3*60)

	if(_action == "wear_condom_best"):
		condomUsed = true
		condomBreakChance = GM.pc.useBestCondom()
		setState("after_wear_condom")
		return

	if(_action == "wear_condom_worst"):
		condomUsed = true
		condomBreakChance = GM.pc.useWorstCondom()
		setState("after_wear_condom")
		return

	if(_action == "add_condom_on_artica"):
		articaCondom = true
		GM.pc.useWorstCondom()

	if(_action == "start_stroke_cock"):
		isStroking = true

	if(_action == "sex_fast_lick"):
		processTime(5*60)
		isLicking = true
		setState("sex_fast")
		return

	if(_action == "sex_fast"):
		processTime(5*60)

	if(_action == "sex_cum"):
		processTime(6*60)
		getModule("ArticaModule").triggerCorruption(0.02)
		getCharacter("artica").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("artica")

	if(_action == "do_cuddle"):
		processTime(20*60)

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
	data["articaCondom"] = articaCondom
	data["condomUsed"] = condomUsed
	data["condomBroke"] = condomBroke
	data["condomBreakChance"] = condomBreakChance
	data["straponHasCum"] = straponHasCum
	data["straponHasArticaCum"] = straponHasArticaCum
	data["isStroking"] = isStroking
	data["isLicking"] = isLicking

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
	articaCondom = SAVE.loadVar(data, "articaCondom", false)
	condomUsed = SAVE.loadVar(data, "condomUsed", false)
	condomBroke = SAVE.loadVar(data, "condomBroke", false)
	condomBreakChance = SAVE.loadVar(data, "condomBreakChance", 0.0)
	straponHasCum = SAVE.loadVar(data, "straponHasCum", false)
	straponHasArticaCum = SAVE.loadVar(data, "straponHasArticaCum", false)
	isStroking = SAVE.loadVar(data, "isStroking", false)
	isLicking = SAVE.loadVar(data, "isLicking", false)
