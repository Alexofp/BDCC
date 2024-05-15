extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false

func _init():
	sceneID = "articaEventTentacles1Scene"

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
		playAnimation(StageScene.Solo, "walk", {pc="artica"})
		aimCameraAndSetLocName("yard_vaulthere")
		saynn("Looks like Artica wants to just have a nice walk through the yard area.")

		saynn("She follows the stone pathways while breathing in all the air."+str(" Her paws are covering her private bits from any random onlookers.. trying to." if nakedAndShy else "")+"")

		saynn("You just follow the fluff while staying a fair distance away, being curious about her sudden eagerness for adventures. She didn't want to leave the canteen for quite a while after all..")

		saynn("Artica peeks her head into the gym.. and sees a bunch of dudes and gals working out.. something that she doesn't seem to have much interest in.")

		saynn("That second floor though.. Artica keeps looking towards the staff-only area of this yard.. the greenhouses are making her quite curious for some reason. Is she hungry?")

		saynn("She walks into the dead-end that is the closest to them. The greenhouses themselves are on a raised platform.. one that she is clearly unable to climb. She is trying though, jumping as high as she can and trying to at least see what's out there.")

		saynn("After some fruitless attempts, Artica stops.. and sighs. She seems to be ready to give up and return to her spot.")

		addButton("Follow", "See what will happen next", "artica_near_stairs")
	if(state == "artica_near_stairs"):
		aimCameraAndSetLocName("yard_nearstairs")
		playAnimation(StageScene.Solo, "walk", {pc="artica"})
		saynn("While walking back to her spot, Artica notices a.. secret passage of sorts. Hidden behind some tall green bushes, they are.. stairs.. heading directly to where Artica wanted to get to! They seem to be clearly marked as off-limits for inmates though.")

		saynn("Artica stops.. and starts thinking. She is probably deliberating if it is worth it to break the rules.. just to satisfy her curiosity.")

		addButton("Continue", "See what happens next", "sudden_nova")
	if(state == "sudden_nova"):
		addCharacter("nova")
		playAnimation(StageScene.Duo, "stand", {pc="artica", npc="nova"})
		saynn("[say=nova]Thinking about stealing something~?[/say]")

		if (isNaked):
			saynn("Artica jumps when a guard approaches from behind."+str(" Her paws momentarily spot covering her private bits, exposing her hard cyan cock to their gaze.." if nakedAndShy else " Her exposed hard cock is bouncing up and down as she does it..")+"")

		else:
			saynn("Artica jumps when a guard approaches from behind. The guard's eyes quickly take note of Artica's bulging shorts..")

		saynn("[say=artica]Eek!..[/say]")

		saynn("[say=nova]Ohh~. Is someone really that horny for apples?[/say]")

		saynn("[say=artica].. ..[/say]")

		saynn("When not startled, Artica is talking so quietly.. You can't hear a word that she is saying to the husky.")

		saynn("[say=nova]Not just apples, yeah. But, you know, the other plants that they grow in there are quite.. let's say.. exotic. Why are you so curious?[/say]")

		saynn("Artica blinks many times, her cheeks flush.")

		saynn("[say=artica].. .. .. ..[/say]")

		saynn("[say=nova]No idea, I'm just guarding this place. Your best bet would be asking someone in medbay, they make medicine out of some of them.[/say]")

		saynn("Artica nods subtly.")

		saynn("[say=artica].. ..[/say]")

		saynn("[say=nova]Maybe you want a tour? I will have to strip-search you after though, to make sure you didn't steal anything~.[/say]")

		saynn("The girl's cheek blush deeply. The guard closes the distance and smiles kindly.")

		saynn("[say=nova]C'mon.. I don't bite~. Only if you will beg me to mark you~.[/say]")

		saynn("Artica lowers her gaze.")

		saynn("[say=artica].. ..[/say]")

		saynn("[say=nova]Aww~. Well, go ahead then, cutie, I'm not holding you. But if you ever want me to help satisfy that need of yours..[/say]")

		saynn("The guard winks.")

		saynn("[say=artica]..[/say]")

		saynn("[say=nova]Hehe~.[/say]")

		saynn("Artica nods and starts heading away, towards the main elevator it seems. She really is exploring.")

		addButton("Follow", "See what happens next", "in_medical")
	if(state == "in_medical"):
		removeCharacter("nova")
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {pc="artica", npc="eliza"})
		aimCameraAndSetLocName("med_lobby_start")
		saynn("You obviously can't ride the same elevator as Artica.. so you just wait and take the next one..")

		saynn("As you sneakily enter the medical lobby and sit on one of the benches, you see Artica in the middle of chatting with a feline doctor. Whatever her desire is, it seems to be enough to push the fluff out of her comfort zone and start talking with people."+str(" Even while naked.." if isNaked else "")+"")

		saynn("[say=artica].. ..[/say]")

		saynn("But she is still talking quietly..")

		saynn("[say=eliza]I'd love to help you, really. I just don't think I can, my hands are tied on this one. Damn bureaucracy.[/say]")

		saynn("Artica looks sad, she lowers her gaze and starts stroking her tail.")

		saynn("[say=eliza]Actually.. I think there is something that we can do.[/say]")

		saynn("The doctor grabs her datapad and pulls Artica to the side, away from everyone, before showing her something. You're sitting too far to see it..")

		saynn("[say=eliza]See this plant? They're not letting me anywhere close to it. And I think I know why! Its molecular structure can be a base for a very potent artificial fertilizer.. among some other things.. Think you can bring it to me?[/say]")

		saynn("[say=artica .. .. ..?][/say]")

		saynn("Doctor shrugs and scratches behind her ear.")

		saynn("[say=eliza]I mean.. if you put it like, of course it sounds bad. But it's for science![/say]")

		saynn("The feline smiles.")

		saynn("[say=eliza]Bring it to me.. and I think I can help you~.[/say]")

		saynn("Artica nods.. reluctantly.. and heads back into the elevator.")

		saynn("Interesting.. Looks like Artica is on a mission now.")

		addButton("Follow", "See what she will do", "artica_near_stairs_again")
	if(state == "artica_near_stairs_again"):
		removeCharacter("eliza")
		playAnimation(StageScene.Solo, "walk", {pc="artica"})
		aimCameraAndSetLocName("yard_nearstairs")
		saynn("You follow the girl as she heads back to the yard area.. to that half-secret passage to the higher floor.")

		saynn("At first, she just looks around to make sure no one sees her. Not very successfully as you manage to avoid her gaze just fine. But oh well.")

		saynn("After that, she starts sneaking up those stairs, careful to avoid any obvious danger..")

		saynn("With nothing better to do, you decide to crouch and follow the fluff's steps.. As a guardian of sorts.")

		addButton("Follow", "See what happens next", "artica_sneaks")
	if(state == "artica_sneaks"):
		playAnimation(StageScene.Solo, "crawl", {pc="artica"})
		aimCameraAndSetLocName("green_chokepoint")
		saynn("Despite how shy and nervous the girl can sometimes be, she is not silly. Artica is avoiding any patrols with ease, preemptively peeking only her head out and choosing the route that is the least guarded.")

		saynn("You follow her, but stay a few obstacles behind to not spook her. The route she is taking is quite smart..")

		saynn("Soon enough, she reaches the greenhouses! But, first, she has to pass through a choke point of sorts.. a corridor that has no way around it.. and there is a guard, of course..")

		saynn("Artica hides some metal crates.. and awaits patiently.")

		saynn("She is out of luck though, nothing seems to be changing, the guard is still blocking the only path.")

		saynn("For some reason Artica looks straight up at a ceiling.. and then suddenly produces a high-pitched chirp.. that sounds a lot like birds chirping..")

		saynn("[sayMale]Huh? Is someone here?[/sayMale]")

		saynn("Artica chirps again, the loud noise echoes around the whole yard.")

		saynn("[sayMale]Who is doing that.. The heck..[/sayMale]")

		saynn("The confused guard turns towards the lower level.. and starts looking closely. While he is busy with that, Artica gets on all fours and quickly crawls past him into one of the greenhouses!")

		saynn("You are fast to follow..")

		addButton("Greenhouses", "See what she will do", "artica_takes_plant")
	if(state == "artica_takes_plant"):
		aimCameraAndSetLocName("main_greenhouses")
		playAnimation(StageScene.Solo, "stand", {pc="artica"})
		saynn("You look inside and notice Artica searching for something. There are many trays with various plants here and the girl is going through all of them, searching for the one she needs..")

		saynn("Artica's gaze stops on a particular small one. She quickly grabs and stores it.")

		saynn("But just before she can leave..")

		saynn("[say=nova]Ohh, look who's back already~.[/say]")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "artica_near_stairs"):
		processTime(5*60)

	if(_action == "sudden_nova"):
		processTime(5*60)

	if(_action == "in_medical"):
		processTime(5*60)

	if(_action == "artica_near_stairs_again"):
		processTime(5*60)

	if(_action == "artica_sneaks"):
		processTime(5*60)

	if(_action == "artica_takes_plant"):
		processTime(3*60)

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
