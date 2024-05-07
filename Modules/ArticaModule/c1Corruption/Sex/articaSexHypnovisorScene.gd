extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false
var visorID = ""

func _init():
	sceneID = "articaSexHypnovisorScene"

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
		saynn("Which hypnovisor do you want to put on Artica?")

		addPumpButtons("do_pick_visor")
		addButton("Cancel", "You changed your mind", "endthescene")
		if (false):
			addButton("Nope", "You shouldn't see this", "do_pick_visor")
	if(state == "do_pick_visor"):
		saynn("You show Artica some fancy hi-tech goggles. Curiosity flashes in her eyes.")

		saynn("[say=artica]Mmm.. What is that?..[/say]")

		saynn("[say=pc]Wanna try it? It's more of a toy than anything.[/say]")

		saynn("[say=artica]I.. I d-don't know..[/say]")

		saynn("Despite her hesitation, you just put the thing on her.")

		saynn("[say=artica]Eep..[/say]")

		saynn("What program do you want to run?")

		addButton("Obedient pet", "Make Artica act like a good obedient puppy", "obedient_pet")
		addButton("Public use slut", "(Sharing!) Turn Artica into a mindless whore that will be fucked by everyone..", "public_use")
	if(state == "obedient_pet"):
		addCharacter("artica", ["hypno"])
		saynn("You turn on the visor and choose a program..")

		saynn("[sayOther]Running pet.exe.. please stand by..[/sayOther]")

		saynn("[say=artica]W-wha.. W-what is it g-gonna do?[/say]")

		saynn("[say=pc]It will make you feel good, don't worry.[/say]")

		saynn("She is clearly still nervous, her cornered eyes looking through the glass of the visor.. until a warm yellow glow begins to spread throughout it.")

		saynn("[sayOther]Subject detected.. Artica.. Checking and suppressing resistance..[/sayOther]")

		saynn("The fluff is blinking rapidly, her gaze struggles to focus now..")

		saynn("[say=artica]Um.. c-can w-we.. w-wha.. what is.. ohh-h..[/say]")

		saynn("[sayOther]No resistance detected.. Creating a personality backup.. done.. Initiating a mind reprogramming procedure..[/sayOther]")

		saynn("[say=artica]Wait.. What was t-tha.. ah..[/say]")

		saynn("Artica forgets to close her mouth after her last sentence, her tongue rolls out, drooling, while various hypnotic lights dance before her eyes.. creating patterns.. gradients and spirals.. which for some reason.. reflect in her own eyes..")

		saynn("The fluff is swaying in place, her tail curling around her leg.. her hind paws stand high on her toes.. her arms spread slightly..")

		saynn("[sayOther]High levels of psycho-neutral hyperplasticity detected.. Subject's mind is highly receptive to suggestion.. Brainwashing.. 0%.. 20%.. 40%..[/sayOther]")

		saynn("Wow, that is going fast indeed. Artica is standing completely still, just watching the glowing colors and drooling, all her fidgeting seems to be gone..")

		saynn("[sayOther]60%.. 80%.. 90%.. 99%.. Done. Uploading a new personality.. Done.. Obedience levels set to 100%, willpower set to 0%.. Pet.exe returned status 0.[/sayOther]")

		saynn("The visor continues to idly shine a warm yellow glow into Artica's hypnotized eyes..")

		saynn("[say=pc]Artica?[/say]")

		saynn("She notices you..")

		addButton("Continue", "See what happens next", "artica_brainwashed")
	if(state == "artica_brainwashed"):
		addCharacter("artica", ["naked", "hypno"])
		playAnimation(StageScene.Duo, "stand", {npc="artica", npcAction="kneel", npcBodyState={hard=true,naked=true}})
		saynn("Slowly, almost involuntarily, Artica begins to strip off her uniform. Her hands unbutton her shirt, revealing her {artica.breasts} to you.. followed by her pulling her shorts down and then wiggling out of them, exposing her"+str(" hard" if !isCaged else "")+" {artica.penis} and a wet pussy slit.")

		saynn("After fully exposing herself to you, Artica lowers herself to her knees before you, her gaze directed up at you.. obedient gaze..")

func addPumpButtons(go_id):
	var pumps = GM.pc.getInventory().getItemsWithTag(ItemTag.Hypnovisor)
	for pump in pumps:
		addButton(pump.getVisibleName(), pump.getVisibleDescription(), go_id, [pump])


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_pick_visor"):
		var pump = _args[0]
		visorID = pump.getUniqueID()
		GM.pc.getInventory().removeItem(pump)
		getCharacter("artica").getInventory().forceEquipRemoveOther(pump)

	if(_action == "obedient_pet"):
		processTime(5*60)

	if(_action == "artica_brainwashed"):
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
	data["visorID"] = visorID

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
	visorID = SAVE.loadVar(data, "visorID", "")
