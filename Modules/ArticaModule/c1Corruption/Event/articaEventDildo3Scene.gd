extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false
var dildoID = ""
var dildoHasArticaCum = false
var dildoHasCum = false
var dildoHasSomething = false

func _init():
	sceneID = "articaEventDildo3Scene"

func _run():
	if(state == ""):
		setFlag("ArticaModule.nextReaction", "d3hap")
		addCharacter("artica")
		isNaked = getFlag("ArticaModule.NoClothes", false)
		isCaged = getCharacter("artica").isWearingChastityCage()
		corruption = getModule("ArticaModule").getCorruption()
		isSlut = getModule("ArticaModule").isSlut()
		isVerySlut = getModule("ArticaModule").isVerySlut()
		isLusty = getModule("ArticaModule").isLusty()
		nakedAndShy = (isNaked && !isSlut)
		playAnimation(StageScene.Solo, "walk", {pc="artica"})
		aimCameraAndSetLocName("cellblock_nearcells")
		saynn("Artica is handing towards the lilac cellblock, clearly she is gonna try that new dildo that she has.")

		saynn("She is not in a huge rush"+str(", spending a lot of time covering herself up" if nakedAndShy else "")+".. so you can easily get to her cell first and.. load up the internal reservoir of her toy with something.. something like cum.. if you want that is..")

		addButton("Just watch", "You'd rather not mess with Artica's dildo", "watch_artica")
		addButton("Dildo!", "Run to Artica's cell and fill her dildo with something before she arrives..", "go_fill_dildo")
	if(state == "go_fill_dildo"):
		playAnimation(StageScene.CanineDildoSex, "tease", {pc="pc"})
		aimCameraAndSetLocName("cellblock_lilac_nearcell")
		saynn("You rush to Artica's cell and look for the toy.")

		saynn("The dildo of that size is hard to hide.. so you quickly find it under her bed.")

		saynn("Let's see what you can fuel it with..")

		addButton("Continue", "See what happens next", "start_fuel")
	if(state == "after_fuel"):
		if (dildoHasSomething):
			saynn("You decide against loading it with cum and use something else instead.. Still, it's gonna be a great surprise for her.")

		elif (dildoHasArticaCum):
			saynn("You load that dildo up with cum.. but now just any cum.. it's Artica's cum. It's gonna be a great surprise for her.")

		elif (dildoHasCum):
			saynn("You load that dildo up with cum.. It's gonna be a great surprise for her.")

		else:
			saynn("You decide against loading the toy with anything. Aw.")

		saynn("After doing your thing, you quickly put the dildo where it was and run out of Artica's cell.")

		saynn("Here she is, right on time..")

		addButton("Watch", "See what will happen next", "watch_artica")
	if(state == "watch_artica"):
		aimCameraAndSetLocName("cellblock_lilac_nearcell")
		GM.pc.setLocation("cellblock_lilac_nearcell")
		addCharacter("artica", ["naked"])
		playAnimation(StageScene.CanineDildoSex, "tease", {pc="artica", bodyState={naked=true,hard=true}})
		saynn("Artica sneaks into her cell and instantly reaches for her toy that she hid under her bed. Not the best spot.. but where else can she store such a huge ass dildo?")

		saynn(""+str("Undressing quickly, she" if !isNaked else "She")+" places the perfect scaled-up copy of her canine cock in the middle of the cell, on the cold floor. Seeing its impressive size is making Artica shiver with excitement already..")

		saynn("It was a whole journey to get it.. so obviously Artica is gonna make good use of it.")

		addButton("Continue", "See what happens next", "artica_lubes_toy")
	if(state == "artica_lubes_toy"):
		playAnimation(StageScene.CanineDildoSex, "hover", {pc="artica", bodyState={naked=true,hard=true}})
		saynn("Despite how.. horny.. she might look.. she does take some precautions. Artica grabs a tube of lube and coats the toy with a good thick layer of that slick stuff.. As for herself.. she is already wet as fuck, her sex dripping with need.."+str(" her real cock putting pressure on the chastity cage.." if isCaged else " her real cock fully hard, veins pulsing from the strong heartbeat..")+"")

		saynn("The fluff positions herself above the toy, her sensitive folds rest on the familiar tip of that silicon toy.. Without much effort, she takes the tip, feeling her pussy spread open..")

		saynn("[say=artica]Nhh.. mm..[/say]")

		addButton("Continue", "See what happens next", "artica_starts_riding")
	if(state == "artica_starts_riding"):
		playAnimation(StageScene.CanineDildoSex, "sex", {pc="artica", bodyState={naked=true,hard=true}})
		saynn("A soft gasp leaves her lips as she lowers herself onto the dildo, feeling it stretch her wide open. The initial sensation makes her legs shaky, her toes sprawling wide as her inner walls hug every ridge and bump of that toy..")

		saynn("[say=artica]So big..[/say]")

		saynn("Start starts slow, moving her hips in gentle circles following the shaft. Her eagerness is making her go deeper and deeper though, her dripping sex quickly meets with the knot.. her knot..")

		saynn("[say=artica]Mmm..[/say]")

		saynn("She already knows what she wants to do with it..")

		addButton("Continue", "See what happens next", "artica_rides_faster")
	if(state == "artica_rides_faster"):
		playAnimation(StageScene.CanineDildoSex, "fast", {pc="artica", bodyState={naked=true,hard=true}})
		saynn("Her pace increases, her breaths coming in faster, moans escaping her lips as she starts riding the dildo harder, slamming herself onto the knot, her pussy squeezing it tight..")

		saynn("[say=artica]Ah.. please.. I w-want it inside..[/say]")

		if (dildoHasArticaCum || dildoHasCum):
			saynn("She will surely get something pumped inside her if she keeps it up like this..")

		if (isCaged):
			saynn("Her caged cock bobs up and down, constantly trying to get hard and leave the sheath.. but that's the pressure that the fluff is gonna have to endure. She basically has her cock inside her, why would she need access to a real one?")

		else:
			saynn("Her canine cock bobs up and down, throbbing already as the toy is massaging all her pleasure buttons so well, the pressure is building up in it.")

		addButton("Continue", "See what happens next", "artica_knots_herself")
	if(state == "artica_knots_herself"):
		playAnimation(StageScene.CanineDildoSex, "knotinside", {pc="artica", pcCum=true, cum=dildoHasSomething, bodyState={naked=true,hard=true}})
		saynn("After a few hard pushes.. she felt the knot popping inside her, stretching her pussy to the limit.")

		saynn("[say=artica]AH![/say]")

		saynn("Artica screamed so loudly that everyone in the cellblock turned their heads. Her body is convulsing as she cums hard, her pussy clenching around the thick base and the fat knot, the full length of that toy.. Her real cock erupted, shooting ropes of cum that splatter on the floor, her balls tensing up.")

		if (dildoHasSomething):
			saynn("That's not all that happens though. Artica's pussy squeezes the knot so much that it triggers the toy to start pumping the fluff's womb full of its contents!")

			saynn("[say=artica]Ah.. w-wai.. what..[/say]")

			saynn("She quickly feels herself being filled with something.. her belly getting bumpier.. but it was too late to do anything about it anyway..")

			saynn("[say=artica]Ahh..[/say]")

		elif (dildoHasArticaCum):
			saynn("That's not all that happens though. Artica's pussy squeezes the knot so much that it triggers the toy to start pumping the fluff's womb full of something very thick and sticky.. She doesn't even realize that she is being stuffed full of her own cum..")

			saynn("[say=artica]Ah.. w-wai.. what.. is that..[/say]")

			saynn("She quickly feels herself being filled with spunk.. her belly getting bumpier.. but it was too late to do anything about it anyway..")

			saynn("[say=artica]Ahh..[/say]")

		elif (dildoHasCum):
			saynn("That's not all that happens though. Artica's pussy squeezes the knot so much that it triggers the toy to start pumping the fluff's womb full of something very thick and sticky.. She doesn't even realize that she is being stuffed full of cum..")

			saynn("[say=artica]Ah.. w-wai.. what.. is that..[/say]")

			saynn("She quickly feels herself being filled with spunk.. her belly getting bumpier.. but it was too late to do anything about it anyway..")

			saynn("[say=artica]Ahh..[/say]")

		saynn("The girl is panting heavily, looking high up, supporting herself with her paws while her whole body is shaking, the stimulation causes every muscle in her body to tense up uncontrollably with little electrifying impulses..")

		addButton("Continue", "See what happens next", "artica_knotfucks_toy")
	if(state == "artica_knotfucks_toy"):
		playAnimation(StageScene.CanineDildoSex, "knot", {pc="artica", bodyState={naked=true,hard=true}})
		saynn("..but she doesn't stop. Seemingly driven by her insatiable need, she keeps riding, the knot slipping in and out of her gaping pussy as apply her full strength to yank herself free.. just to slam her pussy down on that fat orb soon after.."+str(" Cum is leaking out of her stuffed stretched cunt when it is not plugged.. providing extra lube.." if dildoHasCum else "")+"")

		saynn("[say=artica]Y-yes.. m-more.. p-please.. ah..[/say]")

		saynn("Each time the knot slips back in, Artica's pussy is squirting, the overstimulation causes her to just.. let go..")

		saynn("[say=artica]I'm such a.. k-knot slut.. ah..[/say]")

		saynn("Her body was still shaking, her mind foggy from so much pleasure..")

		addButton("Continue", "See what happens next", "artica_rides_even_faster_knot")
	if(state == "artica_rides_even_faster_knot"):
		playAnimation(StageScene.CanineDildoSex, "knotfast", {pc="artica", pcCum=true, bodyState={naked=true,hard=true}})
		saynn("Artica is panting heavily, the strength required to overcome her own tightness is tiring her down.. but at the same time, her pussy is gradually getting used to being stuffed full.. again and again.. loosing up and allowing the fluff to keep going.")

		saynn("Her movements become more frantic, her moans turning into desperate cries of pleasure. Soon, another orgasm hits her, making her body convulse hard, her sex clenching around the knot, her cock wasting the rest of her stored cum..")

		saynn("[say=artica]I'm a.. s-slut for my own cock..[/say]")

		saynn("You had suspicions about that.. but it's nice for her to clarify it.")

		addButton("Continue", "See what happens next", "artica_after_knotknot")
	if(state == "artica_after_knotknot"):
		playAnimation(StageScene.CanineDildoSex, "knotinside", {pc="artica", pcCum=true, cum=dildoHasSomething, bodyState={naked=true,hard=true}})
		saynn("Eventually, Artica does become too exhausted to continue.. With one final, powerful thrust, she forces the knot inside her.. and lets it stay there.")

		saynn("[say=artica]Yes-s-s.. ah..[/say]")

		saynn("She closes her eyes.. and just enjoys the feeling of being extremely stretched.. Her cock keeps throbbing and dripping cum onto the floor, her balls are fully drained by now..")

		saynn("Oh well. You let the girl enjoy herself. She will surely be able to free herself.")

		saynn("But for you, it was time to go..")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "start_fuel"):
		var newDildo = GlobalRegistry.createItem("CanineDildo")
		dildoID = newDildo.uniqueID
		GM.pc.getInventory().addItem(newDildo)
		runScene("FluidTransferScene", [dildoID], "fueling_articas_dildo")
		setState("after_fuel")
		return

	if(_action == "artica_lubes_toy"):
		processTime(2*60)

	if(_action == "artica_starts_riding"):
		processTime(3*60)

	if(_action == "artica_rides_faster"):
		processTime(3*60)

	if(_action == "artica_knots_herself"):
		processTime(3*60)
		
		if(dildoID != ""):
			var theDildo = GM.pc.getInventory().getItemByUniqueID(dildoID)
			if(theDildo != null):
				var theFluids = theDildo.getFluids()
				theFluids.transferTo(getCharacter("artica").getBodypart(BodypartSlot.Vagina), 1.0)
		
		getModule("ArticaModule").triggerCorruption(0.05)

	if(_action == "artica_knotfucks_toy"):
		processTime(3*60)

	if(_action == "artica_rides_even_faster_knot"):
		processTime(3*60)
		getModule("ArticaModule").triggerCorruption(0.05)

	if(_action == "artica_after_knotknot"):
		processTime(3*60)
		if(dildoID != ""):
			var theDildo = GM.pc.getInventory().getItemByUniqueID(dildoID)
			if(theDildo != null):
				GM.pc.getInventory().removeItem(theDildo)

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "fueling_articas_dildo"):
		processTime(1 * 60)
		
		var theDildo = GM.pc.getInventory().getItemByUniqueID(dildoID)
		if(theDildo != null):
			var theFluids = theDildo.getFluids()
			if(theFluids.hasFluidTypeWithCharID("Cum", "artica")):
				dildoHasArticaCum = true
				dildoHasCum = true
			elif(theFluids.hasFluidType("Cum")):
				dildoHasCum = true
			elif(!theFluids.isEmpty()):
				dildoHasSomething = true
		setState("after_fuel")

func saveData():
	var data = .saveData()

	data["isNaked"] = isNaked
	data["isCaged"] = isCaged
	data["corruption"] = corruption
	data["isSlut"] = isSlut
	data["isVerySlut"] = isVerySlut
	data["isLusty"] = isLusty
	data["nakedAndShy"] = nakedAndShy
	data["dildoID"] = dildoID
	data["dildoHasArticaCum"] = dildoHasArticaCum
	data["dildoHasCum"] = dildoHasCum
	data["dildoHasSomething"] = dildoHasSomething

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
	dildoID = SAVE.loadVar(data, "dildoID", "")
	dildoHasArticaCum = SAVE.loadVar(data, "dildoHasArticaCum", false)
	dildoHasCum = SAVE.loadVar(data, "dildoHasCum", false)
	dildoHasSomething = SAVE.loadVar(data, "dildoHasSomething", false)
