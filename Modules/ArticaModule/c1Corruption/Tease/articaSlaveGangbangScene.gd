extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false
var sceneAmount = 1
var pickedSlaves = []
var pickPool = []
var npc1 = ""
var npc2 = ""
var npc3 = ""
var didFirst = false
var lastScene = ""

func _init():
	sceneID = "articaSlaveGangbangScene"

func resolveCustomCharacterName(_charID):
	if(_charID == "npc1"):
		return npc1
	if(_charID == "npc2"):
		return npc2
	if(_charID == "npc3"):
		return npc3

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
		saynn("Who do you want to gangbang Artica? You need at least 2 people to gangbang her.. but the more slaves you choose, the longer the gangbang will last..")

		saynn("Anyone who doesn't have a reachable cock will wear a strapon automatically.")

		if (pickedSlaves.size() > 1):
			addButton("Start", "Do it!", "start_gangbang")
		else:
			addDisabledButton("Start", "Need to pick at least 2 people before starting")
		addButton("CANCEL", "You changed your mind", "endthescene")
		if (!pickedSlaves.has("pc")):
			addButton("+You", "Add yourself into this", "toggle_pc")
		else:
			addButton("-You", "Remove yourself from this", "toggle_pc")
		addSlaveButtons()
		if (false):
			addButton("Error", "You shouldn't see this", "toggle_slave")
	if(state == "start_gangbang"):
		addCharacter("artica", ["naked"])
		playAnimation(StageScene.Solo, "struggle", {pc="artica", bodyState={naked=true}})
		var pcIncluded = (pickedSlaves.has("pc"))
		var howManySlaves = pickedSlaves.size()
		saynn("You tell Artica to wait for a bit.. as you call in some of your slaves to approach you.")

		saynn("[say=pc]Have some fun with her."+str(" I will watch." if !pcIncluded else " I will join too.")+"[/say]")

		saynn("Artica looks around.. confused.. as "+str(howManySlaves)+" people surround her, blocking off the only exit from your cell..")

		saynn("[say=artica]Um.. what is.. t-this..[/say]")

		if (isNaked):
			saynn("One of them suddenly grabs her arms.. while the second slaps her perky"+str(" lactating" if getCharacter("artica").isLactating() else "")+" tits.")

			saynn("[say=artica]Ee-ep.. e-easy.. w-wai-.. ow..[/say]")

			saynn("While the fluff is busy trying to free her arms, someone pulls up on her balls, revealing the pussy that's hiding behind them.. Someone else yanks on the tail, making Artica stick her ass out, her tight tailhole twitching..")

			saynn("[say=artica]P-please.. ah.. d-don't..[/say]")

		else:
			saynn("One of them suddenly grabs her arms.. while the second forcibly takes off the shirt, exposing those perky"+str(" lactating" if getCharacter("artica").isLactating() else "")+" tits.")

			saynn("[say=artica]Ee-ep.. e-easy.. w-wai-.. ow..[/say]")

			saynn("While the fluff is busy trying to free her arms, her shorts get pulled down too, exposing her "+str("caged up cock" if isCaged else "sheath")+".. and the pussy that's hiding behind the balls.. Someone yanks on the tail, making Artica stick her ass out, her tight tailhole twitching..")

			saynn("[say=artica]P-please.. ah.. d-don't..[/say]")

		saynn("Looks like the fun is just about to begin..")

		addButton("Continue", "See what happens next", "start_first_scene")
		if (false):
			addButton("IGNORE", "You shouldn't see this", "start_next_scene")
	if(state == "dp_tease"):
		playAnimation(StageScene.SexDP, "tease", {pc="artica", npc=npc1, npc2=npc2, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true,hard=true}, npc2BodyState={exposedCrotch=true,hard=true}})
		saynn("Double penetration starts with {npc1.name} on the bottom and {npc2.name} behind.")

		addButton("Continue", "See what happens next", "dp_sex")
	if(state == "dp_sex"):
		playAnimation(StageScene.SexDP, "sex", {pc="artica", npc=npc1, npc2=npc2, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true,hard=true}, npc2BodyState={exposedCrotch=true,hard=true}})
		saynn("Double penetration SEX with {npc1.name} on the bottom and {npc2.name} behind.")

		addButton("Continue", "See what happens next", "dp_sexfast")
	if(state == "dp_sexfast"):
		playAnimation(StageScene.SexDP, "fast", {pc="artica", npc=npc1, npc2=npc2, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true,hard=true}, npc2BodyState={exposedCrotch=true,hard=true}})
		saynn("Double penetration SEX FAST with {npc1.name} on the bottom and {npc2.name} behind.")

		addButton("Continue", "See what happens next", "dp_cum")
	if(state == "dp_cum"):
		playAnimation(StageScene.SexDP, "inside", {pc="artica", npc=npc1, npc2=npc2, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true,hard=true}, npc2BodyState={exposedCrotch=true,hard=true}})
		saynn("Double penetration CUM with {npc1.name} on the bottom and {npc2.name} behind.")

		addNextGangButton()
	if(state == "spit_tease"):
		playAnimation(StageScene.SexSpitroast, "tease", {pc="artica", npc=npc1, npc2=npc2, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true,hard=true}, npc2BodyState={exposedCrotch=true,hard=true}})
		saynn("Spitroast starts with {npc1.name} fucking pussy and {npc2.name} fucking throat.")

		addButton("Continue", "See what happens next", "spit_sex")
	if(state == "spit_sex"):
		playAnimation(StageScene.SexSpitroast, "sex", {pc="artica", npc=npc1, npc2=npc2, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true,hard=true}, npc2BodyState={exposedCrotch=true,hard=true}})
		saynn("Spitroast SEX with {npc1.name} fucking pussy and {npc2.name} fucking throat.")

		addButton("Continue", "See what happens next", "spit_sexfast")
	if(state == "spit_sexfast"):
		playAnimation(StageScene.SexSpitroast, "fast", {pc="artica", npc=npc1, npc2=npc2, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true,hard=true}, npc2BodyState={exposedCrotch=true,hard=true}})
		saynn("Spitroast SEX FAST with {npc1.name} fucking pussy and {npc2.name} fucking throat.")

		addButton("Continue", "See what happens next", "spit_cum")
	if(state == "spit_cum"):
		playAnimation(StageScene.SexSpitroast, "inside", {pc="artica", npc=npc1, npc2=npc2, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true,hard=true}, npc2BodyState={exposedCrotch=true,hard=true}})
		saynn("Spitroast CUM with {npc1.name} fucking pussy and {npc2.name} fucking throat.")

		addNextGangButton()
	if(state == "gang_tease"):
		playAnimation(StageScene.SexGangbang, "tease", {pc="artica", npc2=npc1, npc=npc2, npc3=npc3, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true,hard=true}, npc2BodyState={exposedCrotch=true,hard=true}, npc3BodyState={exposedCrotch=true,hard=true}})
		saynn("Gangbang starts with {npc1.name} fucking pussy, {npc2.name} fucking ass and {npc3.name} fucking throat.")

		addButton("Continue", "See what happens next", "gang_sex")
	if(state == "gang_sex"):
		playAnimation(StageScene.SexGangbang, "sex", {pc="artica", npc2=npc1, npc=npc2, npc3=npc3, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true,hard=true}, npc2BodyState={exposedCrotch=true,hard=true}, npc3BodyState={exposedCrotch=true,hard=true}})
		saynn("Gangbang SEX with {npc1.name} fucking pussy, {npc2.name} fucking ass and {npc3.name} fucking throat.")

		addButton("Continue", "See what happens next", "gang_sexfast")
	if(state == "gang_sexfast"):
		playAnimation(StageScene.SexGangbang, "fast", {pc="artica", npc2=npc1, npc=npc2, npc3=npc3, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true,hard=true}, npc2BodyState={exposedCrotch=true,hard=true}, npc3BodyState={exposedCrotch=true,hard=true}})
		saynn("Gangbang FAST with {npc1.name} fucking pussy, {npc2.name} fucking ass and {npc3.name} fucking throat.")

		addButton("Continue", "See what happens next", "gang_cum")
	if(state == "gang_cum"):
		playAnimation(StageScene.SexGangbang, "inside", {pc="artica", npc2=npc1, npc=npc2, npc3=npc3, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true,hard=true}, npc2BodyState={exposedCrotch=true,hard=true}, npc3BodyState={exposedCrotch=true,hard=true}})
		saynn("Gangbang CUM with {npc1.name} fucking pussy, {npc2.name} fucking ass and {npc3.name} fucking throat.")

		addNextGangButton()
	if(state == "after_gangbang"):
		playAnimation(StageScene.SexStart, "start", {npc="artica", npcBodyState={hard=true,naked=true}})
		saynn("The scene ends with everyone taking off their strapons and cumming on the exhausted Artica.")

		addButton("Enough", "This was fun", "endthescene")
func addSlaveButtons():
	sayn("Who will gangbang her:")
	if(pickedSlaves.has("pc")):
		sayn("You")

	var notFit = {}
	var pcSlaves = GM.main.getPCSlavesIDs()
	for slaveID in pcSlaves:
		var character = getCharacter(slaveID)
		var npcSlave = character.getNpcSlavery()
		if(npcSlave == null):
			continue
		if(npcSlave.isMindBroken()):
			notFit[slaveID] = "A mindbroken slave can't do this"
			continue
		if(npcSlave.isDoingActivity()):
			notFit[slaveID] = "This slave is busy with something already"
			continue
		if(pickedSlaves.has(slaveID)):
			addButton("-"+character.getName(), "Level "+str(npcSlave.slaveLevel)+" "+npcSlave.getSlaveTypeName()+"\n\n"+character.getSmallDescription(), "toggle_slave", [slaveID])
			sayn(character.getName())
		else:
			addButton("+"+character.getName(), "Level "+str(npcSlave.slaveLevel)+" "+npcSlave.getSlaveTypeName()+"\n\n"+character.getSmallDescription(), "toggle_slave", [slaveID])
	for slaveID in notFit:
		var character = getCharacter(slaveID)
		addDisabledButton(character.getName(), notFit[slaveID])

func getNextNPC():
	var result = RNG.grab(pickPool)
	if(pickPool.size() <= 0):
		pickPool = pickedSlaves.duplicate()
		pickPool.erase(result)
	return result

func nextGang():
	var possible = ["dp", "spit"]
	if(pickedSlaves.size() > 2):
		possible.append("gang")
	if(possible.has(lastScene)):
		possible.erase(lastScene)
	var nextSceneType = RNG.pick(possible)
	lastScene = nextSceneType
	
	if(!didFirst):
		setState(nextSceneType+"_tease")
	else:
		setState(nextSceneType+"_sex")
	npc1 = getNextNPC()
	if(nextSceneType in ["dp", "spit", "gang"]):
		npc2 = getNextNPC()
	if(nextSceneType in ["gang"]):
		npc3 = getNextNPC()

func after_gangbang():
	for slaveID in pickedSlaves:
		GM.main.updateCharacterUntilNow(slaveID)
		getCharacter(slaveID).removeStrapon()
		
		getCharacter("artica").cummedOnBy(slaveID)

func addNextGangButton():
	if(sceneAmount <= 1):
		saynn("This was the last one..")
	elif(sceneAmount == 2):
		saynn("The slaves can use Artica one more time..")
	else:
		saynn(str(sceneAmount-1)+" uses left!")

	addButton("Continue", "See what happens next", "start_next_scene")

func afterEachGang():
	getModule("ArticaModule").addCorruption(0.01)


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "start_gangbang"):
		pickPool = pickedSlaves.duplicate()
		sceneAmount = pickedSlaves.size()
		for slaveID in pickedSlaves:
			var character = getCharacter(slaveID)
			if(!character.hasReachablePenis()):
				var strapon = GlobalRegistry.createItem(RNG.pick(GlobalRegistry.getItemIDsByTag(ItemTag.Strapon)))
				var fluids = strapon.getFluids()
				fluids.addFluid("CumLube", RNG.randi_range(2, 5)*RNG.randf_range(80.0, 100.0))
				character.getInventory().forceEquipStoreOtherUnlessRestraint(strapon)

	if(_action == "toggle_pc"):
		if(pickedSlaves.has("pc")):
			pickedSlaves.erase("pc")
		else:
			pickedSlaves.append("pc")
			playAnimation(StageScene.Duo, "stand", {npc="artica"})
		return

	if(_action == "toggle_slave"):
		var slaveID = _args[0]
		if(pickedSlaves.has(slaveID)):
			playAnimation(StageScene.Duo, "stand", {npc="artica"})
			pickedSlaves.erase(slaveID)
			removeCharacter(slaveID)
		else:
			playAnimation(StageScene.Duo, "stand", {npc=slaveID})
			pickedSlaves.append(slaveID)
			addCharacter(slaveID)
		return

	if(_action == "start_first_scene"):
		nextGang()
		return

	if(_action == "start_next_scene"):
		processTime(5*60)
		sceneAmount -= 1
		if(sceneAmount <= 0):
			processTime(3*60)
			setState("after_gangbang")
			after_gangbang()
			return
		didFirst = true
		nextGang()
		return

	if(_action == "dp_sex"):
		processTime(5*60)

	if(_action == "dp_sexfast"):
		processTime(5*60)

	if(_action == "dp_cum"):
		processTime(5*60)
		getCharacter("artica").cummedInVaginaBy(npc1)
		getCharacter("artica").cummedInAnusBy(npc2)
		afterEachGang()

	if(_action == "spit_sex"):
		processTime(5*60)

	if(_action == "spit_sexfast"):
		processTime(5*60)

	if(_action == "spit_cum"):
		processTime(5*60)
		getCharacter("artica").cummedInVaginaBy(npc1)
		getCharacter("artica").cummedInMouthBy(npc2)
		afterEachGang()

	if(_action == "gang_sex"):
		processTime(5*60)

	if(_action == "gang_sexfast"):
		processTime(5*60)

	if(_action == "gang_cum"):
		processTime(5*60)
		getCharacter("artica").cummedInVaginaBy(npc1)
		getCharacter("artica").cummedInAnusBy(npc2)
		getCharacter("artica").cummedInMouthBy(npc3)
		afterEachGang()

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
	data["sceneAmount"] = sceneAmount
	data["pickedSlaves"] = pickedSlaves
	data["pickPool"] = pickPool
	data["npc1"] = npc1
	data["npc2"] = npc2
	data["npc3"] = npc3
	data["didFirst"] = didFirst
	data["lastScene"] = lastScene

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
	sceneAmount = SAVE.loadVar(data, "sceneAmount", 1)
	pickedSlaves = SAVE.loadVar(data, "pickedSlaves", [])
	pickPool = SAVE.loadVar(data, "pickPool", [])
	npc1 = SAVE.loadVar(data, "npc1", "")
	npc2 = SAVE.loadVar(data, "npc2", "")
	npc3 = SAVE.loadVar(data, "npc3", "")
	didFirst = SAVE.loadVar(data, "didFirst", false)
	lastScene = SAVE.loadVar(data, "lastScene", "")
