extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false

func _init():
	sceneID = "articaSexRideScene"

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
			saynn("Seeing Artica's "+str("desperate caged up drippy cock" if isCaged else "hard drippy canine cock")+".. makes you want to do things to it!")

		else:
			saynn("Seeing Artica's "+str("desperate caged up cock leaving wet spots on her shorts" if isCaged else "hard canine cock bulging out her shorts")+".. makes you want to do things to it!")

		saynn("You bite your lip while silently staring at the white fluff who is constantly fidgeting because of her body's needs. Your gazes collide..")

		saynn("[say=artica]Y-yes?..[/say]")

		saynn("[say=pc]Let's fuck![/say]")

		saynn("Your hand darts out and grabs the girl's collar before yanking her in the direction of your cell.")

		saynn("[say=artica]Eep!..[/say]")

		addButton("Cell", "Pin the fluff against your bed", "in_cell")
	if(state == "in_cell"):
		addCharacter("artica", ["naked"])
		playAnimation(StageScene.SexCowgirlAlt, "tease", {npc="pc", pc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		aimCameraAndSetLocName(GM.pc.getCellLocation())
		GM.pc.setLocation(GM.pc.getCellLocation())
		saynn("You rush to your cell, pulling the girl by her collar who can barely move her hind paws fast enough to keep up.")

		if (!isNaked):
			saynn("As soon as you burst into your little private cell, your hands forcibly strip the fluff naked before pinning her against your bed.. soon followed by your naked body getting on top of her.")

		else:
			saynn("As soon as you burst into your little private cell, your hands shove and then pin the naked fluff against your bed.. soon followed by your naked body getting on top of her.")

		saynn("[say=artica]E-eep.. t-too ff-fast..[/say]")

		saynn("As you straddle Artica's hips.. you can just feel the heat that's radiating from her"+str(" caged up" if isCaged else "")+" cock.. the scent making your own lust grow bigger with each passing moment.")

		if (GM.pc.hasReachableVagina()):
			saynn("With a sly grin, you tease "+str("her chastity cage by grinding it with your pussy slightly" if isCaged else "her hard cyan shaft by sliding your pussy along it, spreading your juices")+".")

		else:
			saynn("With a sly grin, you tease "+str("her chastity cage by grinding it with your ass slightly" if isCaged else "her hard cyan shaft by lowering yourself onto the tip, making it prod your tailhole")+".")

		if (isCaged):
			saynn("[say=artica]I-I'm.. n-not rr-really.. aah-h.. a.. top.. and m-my d-dick is l-locked a-anyway..[/say]")

			addDisabledButton("Pussy", "Artica is caged!")
			addDisabledButton("Ass", "Artica is caged!")
			addButton("Give strapon", "Make Artica wear one of your strapons!", "pick_strapon")
			addButton("Chastity grind", "Grind her cage", "chastity_ride")
		else:
			saynn("[say=artica]I-I'm.. n-not rr-really.. aah-h.. a.. top..[/say]")

			addButtonWithChecks("Pussy", "Ride that lollypop of a dick with your slit", "ride_pussy", [], [[ButtonChecks.HasReachableVagina]])
			addButton("Ass", "Ride that lollypop of a dick with your butt", "ride_ass")
		addButton("Never mind", "Cancel the scene", "endthescene")
	if(state == "ride_pussy"):
		playAnimation(StageScene.SexCowgirlAlt, "sex", {npc="pc", pc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You lean forward and grab Artica's by the chin, making her look up at you.")

		saynn("[say=pc]Shh~. Just be a good fucktoy and moan as I ride you.[/say]")

		saynn("And with that, your free hand wraps its digits around Artica's canine cock.. before guiding it as you lower yourself onto it, the pointy head kissing your wet folds and then spreading them.. her cock slowly sliding inside you.")

		saynn("[say=pc]Oh yeah..[/say]")

		saynn("[say=artica]Ah-.. y-youre so.. w-warm.. n-not too f-fast, o-oka- eep![/say]")

		saynn("You cut her off by bringing your body down onto that nice fat shaft, letting it pierce your cunt and stretch the inner walls wide. Feels good.. too good.. a little cute moan escapes your lips as your muscles tense up, your slit hugging that cock firmly.")

		saynn("[say=pc]Nice cock, Artica. Do you feel my pussy clenching around it~?[/say]")

		saynn("[say=artica]..y-yea.hhah.. ah..[/say]")

		saynn("Artica's toes curl from pleasure as you begin to ride her, your back arching with each motion. The feeling of being full sends shivers down your spine.. while Artica is squirming below you, your wet pussy sliding up and down her shaft.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Her cock is massaging your pleasure spot so nicely that you feel the pressure behind your chastity cage rising fast..")

		elif (GM.pc.hasReachablePenis()):
			saynn("Her cock is massaging your pleasure spot so nicely that you feel the pressure in your own member rising fast..")

		addButton("Faster", "Ride her faster", "ride_pussy_faster")
	if(state == "ride_pussy_faster"):
		playAnimation(StageScene.SexCowgirlAlt, "fast", {npc="pc", pc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("As your passion grows, so does your pace, Artica's cock hammering against your cervix as you slam yourself against her hips.")

		saynn("[say=artica]T-t-ttoo m-much!.. ahh-h.. I c-can't.. ah..ahh.. P-please.."+str(" m-miss.." if GM.pc.getGender() == Gender.Female else "")+"[/say]")

		saynn("Artica's knot is inflating, making her cock is even more fat at the base.. so much that the orb doesn't fit inside anymore, just slapping against your needy {pc.vaginaStretch} pussy folds.. But you keep trying, stretching yourself out more bit by bit..")

		saynn("[say=artica]I-it w-won't.. ah.. w-won't f-fit.. ah![/say]")

		saynn("Sounds like a challenge.")

		saynn("[say=pc]I will make it.[/say]")

		addButton("Get knotted", "Force it in!", "ride_pussy_cum")
	if(state == "ride_pussy_cum"):
		playAnimation(StageScene.SexCowgirlAlt, "inside", {npc="pc", pc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Artica's big blue orb is struggling to fit inside no matter how hard you ride her..")

		saynn("[say=artica]I'm.. g-ggonnaa-aah.hh-hnyaaa-hh!..[/say]")

		saynn("But.. then.. with a determined thrust of power, you suddenly manage to impale yourself on her pulsating cock almost balls deep, the swollen knot starts slipping inside you, stretching your tight entrance extremely wide to accommodate all that girth.. Then, with one final push, the knot finally gets buried fully, tying you to the squirming shaking girl..")

		saynn("[say=pc]Oh fuck~..[/say]")

		saynn("You let out a passionate moan of ecstasy as Artica's cock throbs inside you, filling your womb to the brim with many spurts of thick, virile cum.. while your pussy is clenching around her knotted shaft, your own orgasm overwhelming your senses and making your legs tremble.")

		saynn("[say=artica]Nnhh-h!.. ahhh-h..hh.. ahh..[/say]")

		saynn("Oh wow, Artica is grabbing onto the bed sheets desperately while her whole body is thrashing wildly, her lusty eyes rolling up, her own pussy releasing a shower of her girly fluids onto her thighs..")

		if (GM.pc.isWearingChastityCage()):
			saynn("That's not all the mess that the fluff is receiving though, there is also your caged up cock that is cumming all over her gray belly, weak strings of your seed are marking her fur.")

		elif (GM.pc.hasReachablePenis()):
			saynn("That's not all the mess that the fluff is receiving though, there is also your own cock that is cumming all over her gray belly, strong strings of your seed are marking her fur.")

		saynn("Both you and her are panting heavily.. the feeling of tightness doesn't ever leave anymore as you two are tied together, her full member stuck inside you..")

		saynn("[say=artica]Ah-h.. hh.. s-stuck..[/say]")

		saynn("[say=pc]Yeah.. Let me be your cock warmer, Artica.[/say]")

		saynn("[say=artica]S-s.. s-sure.. ah..[/say]")

		saynn("It's not like she has a choice.")

		addButton("Rest", "Just spend time together until the knot deflates", "just_rest")
		addButton("Sit on face", "Make Artica clean up her mess", "pussy_sit_on_face")
		addButton("Knot-fucking", "(Roughness) Milk Artica's balls dry", "pussy_knot_fucking")
	if(state == "just_rest"):
		saynn("Since there is nothing better to do, you decide to just rest together. You lean forward and get comfy on Artica's"+str(" round pregnant" if getCharacter("artica").isVisiblyPregnant() else "")+" chest.. while her knot is still faintly pulsing inside you.")

		saynn("[say=artica]Ah..[/say]")

		saynn("[say=pc]Don't squirm, silly. You're making yourself hard again.[/say]")

		saynn("[say=artica]I'm.. mmhh.. t-trying.. ah..[/say]")

		saynn("You giggle and lick her lips.")

		saynn("[say=pc]Poor girl.[/say]")

		saynn("And just like that, you spend some time.. until Artica's knot deflates enough for you to escape it.. Her cum starts gushing out of your used hole instantly..")

		saynn("You clean what you can and let Artica go.")

		saynn("Her legs are still shaky.")

		saynn("[say=artica]T-ttake care..[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "pussy_knot_fucking"):
		playAnimation(StageScene.SexCowgirlChoke, "fast", {npc="pc", pc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Even with her full length inside you.. you're still hungry for more..")

		saynn("[say=pc]Hold on, fucktoy.. It's gonna be a rough ride..[/say]")

		saynn("[say=artica]Wha-.. Ahh!..[/say]")

		saynn("With determination in your eyes, you apply your full strength and pull yourself up.. forcefully yanking the fat knot out of your used pussy, allowing the cum to start gushing out.. Poor fluff's body is tensing under you, the sudden act making her squirm hard.")

		saynn("[say=pc]Ah..[/say]")

		saynn("You weren't finished though.. rather than pulling away completely, you start lowering yourself onto her cock again, trying to force the knot inside.")

		saynn("[say=artica]Wa-ait!.. n-noo-o.. d-don't.. pp-pllease!.. s-stop!.. ahh-h..[/say]")

		saynn("Artica actually starts trying to pull away from you.. her paws pushing you off.. which gives you no choice..")

		saynn("[say=pc]Nghh.. Shut up and knot me, slut.[/say]")

		saynn("You slap her hands away and get a firm grip on her throat, pushing the fluff into the bed as you force her knot inside you, the fat orb slipping past your stretched wide pussy folds yet again!")

		saynn("[say=artica]Kh-h!..[/say]")

		saynn("Your legs are shaking, your used slit clenching hard around the cock that has just came inside you.. but you don't stop, pulling yourself up again before getting yourself knotted.. again and again, each time applying less force as your pussy adapts to the knot-fucking..")

		saynn("Artica's resistance fades quickly, her eyes rolling up. Her lips are producing silent gasps as your hand still squeezes her throat, her body quivering underneath you..")

		saynn("Your cell smells of hot sex.. you keep riding that knot, forcing it in and out yourself.. until Artica's cock starts throbbing inside you yet again! With full force, you bring yourself down, accepting her full length.. followed by Artica's hot virile seed spilling inside your womb yet again, her balls tensing up wildly as you milk them dry with your stretched cunt.")

		saynn("[say=pc]Y-yeah.. pump me full of your pups.. I need all of it..[/say]")

		saynn("Artica is drooling, the pleasure consumed her mind. Your own body is kinda giving up too by this point, all the muscles.. exhausted..")

		saynn("You find strength to yank the knot out for the last time.. before.. just flopping on top of the girl..")

		addButton("Continue", "See what happens next", "after_knotfuck")
	if(state == "after_knotfuck"):
		playAnimation(StageScene.Sleeping, "sleep", {npc="pc", pc="artica", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("Hours later..")

		saynn("Your bed is so soft.. Why isn't it always this soft?")

		saynn("You open your eyes..")

		saynn("[say=artica]H-h-hai.. um..[/say]")

		saynn("Your head hurts a little.. ow.. just like your used gaping fuckhole..")

		saynn("[say=artica]I.. I d-didn't k-know if I should.. w-wake you up..[/say]")

		saynn("So adorable..")

		saynn("[say=artica]Do you n-need something?..[/say]")

		saynn("[say=pc]Y-yeah.. no.. it's okay.[/say]")

		saynn("[say=artica]H-hope I was a good.. f-.. f-fucktoy..[/say]")

		saynn("You smooch her on the lips and get up.")

		saynn("[say=pc]Hah. Yeah.[/say]")

		saynn("You help her to get up too.")

		saynn("[say=artica]I will.. b-be in my spot..[/say]")

		saynn("[say=pc]Uh huh.[/say]")

		if (!isNaked):
			saynn("Artica grabs her uniform and runs off..")

		else:
			saynn("Artica blinks a few times.. and then runs off..")

		saynn("Huh.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "pussy_sit_on_face"):
		playAnimation(StageScene.SexFaceSitting, "sit", {pc="pc", npc="artica", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You wait a bit until Artica's knot deflates enough.. before easing yourself off of it.. plop..")

		saynn("[say=artica]Ah.. t-that was.. i-intense..[/say]")

		saynn("[say=pc]I'm not done yet~.[/say]")

		saynn("Watching Artica lay underneath you, panting and squirming.. gives another.. an even more kinky idea.. With a mischievous glint in your eyes, you straddle Artica's.. face, offering your messy used pussy..")

		saynn("[say=pc]Lick it up, Artica.[/say]")

		saynn("[say=artica]Eep..[/say]")

		saynn("The girl hesitates, her cheeks flushing deep red.. while her own seed starts dripping onto her face. Her head is trapped between your thighs.. there is nowhere she can go.")

		saynn("[say=pc]Lick or I will just grind your face~.[/say]")

		saynn("No matter what, she can't avoid the intoxicating scent.. it makes Artica dart her tongue out and give your pussy a careful little lick, catching some of the.. flavor.")

		saynn("[say=pc]Mmm~..[/say]")

		saynn("Your little moan makes Artica taste more of that cocktail of your juices and her own cum, her body trembling as her tongue delves deeper, spreading the sensitive folds and lapping it all up..")

		saynn("[say=pc]Good.. girl.. mmh-h.. little cum eater..[/say]")

		saynn("Her tongue is working tirelessly, cleaning your pussy up and exploring you from the inside. All the while her own cock is hard again, pre dripping off the tip..")

		saynn("[say=pc]Now swallow.[/say]")

		saynn("Artica shows you her mouth full of her own cum.. then closing it and swallowing.. before showing how empty it is now.")

		saynn("[say=pc]Such a good girl.. Thank you, Artica~.[/say]")

		saynn("[say=artica]N-no.. p-problem..[/say]")

		saynn("You help her to come back to sense and send her off back to her spot. While you stay and clean up a bit.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "in_cell"):
		processTime(2*60)

	if(_action == "ride_pussy_faster"):
		processTime(5*60)

	if(_action == "ride_pussy_cum"):
		processTime(6*60)
		getModule("ArticaModule").triggerCorruption(0.02)
		GM.pc.gotVaginaStretchedBy("artica")
		GM.pc.cummedInVaginaBy("artica")
		if(GM.pc.isWearingChastityCage() || GM.pc.hasReachablePenis()):
			getCharacter("artica").cummedOnBy("pc")
		GM.pc.orgasmFrom("artica")

	if(_action == "just_rest"):
		processTime(20*60)

	if(_action == "pussy_sit_on_face"):
		processTime(10*60)
		getModule("ArticaModule").triggerCorruption(0.01)
		getCharacter("artica").cummedInMouthBy("artica")

	if(_action == "pussy_knot_fucking"):
		processTime(10*60)
		getModule("ArticaModule").triggerCorruption(0.02)
		GM.pc.gotVaginaFuckedBy("artica")
		GM.pc.cummedInVaginaBy("artica")
		GM.pc.doPainfullyStretchHole(BodypartSlot.Vagina, "artica")

	if(_action == "after_knotfuck"):
		processTime(3*60*60)

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
