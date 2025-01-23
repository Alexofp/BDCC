extends SceneBase

var drugUniqueID = ""
var tfID = ""

func _init():
	sceneID = "ElizaGenericUnlockDrugScene"

func _reactInit():
	var allStrangePills:Array = GM.main.SCI.getPCUnknownStrangePills()
	
	if(allStrangePills.empty()):
		setState("no_drugs_found")
		return
	drugUniqueID = allStrangePills[0].uniqueID
	tfID = allStrangePills[0].getTFID()

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		aimCameraAndSetLocName("med_researchlab")
		if (GM.pc.getLocation() != "med_researchlab"):
			GM.pc.setLocation("med_researchlab")
			saynn("[say=pc]I think I got something you can scan.[/say]")

			saynn("[say=eliza]Great~. Let's go to the lab.[/say]")

			saynn("Without wasting much time, you and Eliza leave the lobby and head to the research lab.")

		else:
			saynn("You find Eliza and bring her into the lab.")

		saynn("A strange-looking pill in your hand peaks her interest. She puts on her latex gloves and grabs it.")

		saynn("[say=eliza]Alright, let's see what it does![/say]")

		addButton("Continue", "See what happens next", "do_unlock_tf")
	if(state == "no_drugs_found"):
		saynn("DRUG NOT FOUND. SORRY.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "do_unlock_tf"):
		var theTF = getTF()
		var tfUnlockData = theTF.getUnlockData()
		saynn("Eliza carefully places the pill inside the huge molecular scanner and starts the process. The machine begins doing its job, blinking lights and spinning its internal components. As it hums to life, you hear a faint hiss of escaping steam and the high-pitched whir of scanning lasers.")

		saynn("Soon, the results flash up on a nearby monitor.")

		saynn("[say=eliza]Huh.. interesting. This is very interesting.[/say]")

		saynn("She gestures for you to join her, her tail flicking with excitement. The screen displays a complex molecular structure, highlighted in red and black. It doesn't mean much to you.")

		saynn("[say=eliza]"+str(tfUnlockData["eliza"])+"[/say]")

		saynn("After destroying the pill by scanning it, Eliza moves on to a different set of machines and turns them on. Soon, she shows you a perfect molecular copy of that "+str(theTF.getPillName())+" pill.")

		saynn("[say=eliza]Wanna try it~?[/say]")

		addButton("No", "You'd rather not be a test subject", "no_test_subject")
		addButton("Eat it", "Eat the pill since it's free!", "yes_eat_pill")
		addUnlockTFButtons(tfUnlockData)
		if (false):
			addButton("Bad", "You shouldn't see this", "doRunUnlockScene")
	if(state == "no_test_subject"):
		saynn("[say=pc]I will pass, thanks.[/say]")

		saynn("The feline smiles.")

		saynn("[say=eliza]Alright, I will find a willing test subject myself then~.[/say]")

		saynn("Her clawed paw puts the pill away.")

		saynn("[say=eliza]But if you find one first, test this pill on them and bring them here. You will have to wait until the transformation reaches its final stage of course. There is not much point otherwise.[/say]")

		saynn("Looks like you will have to make that pill yourself though..")

		saynn("[say=eliza]Keep it up, assistant. I'm gonna go back to working my shift now.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "eat_no_effect"):
		saynn("What could go wrong.. You grab the pill from Eliza's paw.. and throw it into your mouth.")

		saynn("[say=eliza]"+str(RNG.pick(["So eager~.", "Love the enthusiasm~.", "That's it~.", "I didn't even had to convince you~.", "If only all test subjects were like you~."]))+"[/say]")

		saynn("You steady your breathing and try to focus on yourself.. Time passes.. but you don't feel any different. Looks like it didn't work..")

		saynn("[say=eliza]Aw. Not every pill is gonna work on everyone, our body is smart enough to refuse the DNA changes that it can't support.[/say]")

		saynn("[say=pc]What do I do then?[/say]")

		saynn("Eliza hums.")

		saynn("[say=eliza]You will have to.. find someone else to test it. A test subject, yes. Bring them to me after the transformation reaches its final stage and I will be able to scan them to get more information about the pill.[/say]")

		saynn("A test subject.. right..")

		saynn("[say=eliza]Or you can always try to change yourself first instead.. With some other pills.[/say]")

		saynn("Sounds like that can get out of control quickly..")

		saynn("[say=eliza]Either way, keep it up, assistant~. I'm gonna go back to working my shift now.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "eat_has_effect"):
		saynn("What could go wrong.. You grab the pill from Eliza's paw.. and throw it into your mouth.")

		saynn("[say=eliza]"+str(RNG.pick(["So eager~.", "Love the enthusiasm~.", "That's it~.", "I didn't even had to convince you~.", "If only all test subjects were like you~."]))+"[/say]")

		saynn("You steady your breathing and try to focus on yourself.. And soon, you begin to feel.. something.. changing inside you. It's hard to pinpoint what exactly.. but it's happening for sure.")

		saynn("[say=pc]I feel it..[/say]")

		saynn("Eliza smiles.")

		saynn("[say=eliza]Great! Come back to me when that transformation reaches its final stage and I will be able to scan it! That will give us lots of information about this transformation.[/say]")

		saynn("You feel like.. a test subject. Because that's who you are.")

		saynn("[say=eliza]Keep it up, assistant~. It's not an instant process, it will take time. You can try to get some more pills in the meantime. I'm gonna go back to working my shift now.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
func getPill():
	return GM.pc.getInventory().getItemByUniqueID(drugUniqueID)

func getTF():
	return GlobalRegistry.getTransformationRef(tfID)

func addUnlockTFButtons(tfUnlockData):
	if(!tfUnlockData.has("tryOptions")):
		return
	for optionEntry in tfUnlockData["tryOptions"]:
		addButton(optionEntry["name"], optionEntry["desc"], "doRunUnlockScene", [optionEntry])


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_unlock_tf"):
		processTime(25*60)
		GM.main.SCI.doUnlockTF(tfID)
		var thePill = getPill()
		if(thePill != null):
			thePill.removeXOrDestroy(1)

	if(_action == "no_test_subject"):
		processTime(3*60)

	if(_action == "yes_eat_pill"):
		processTime(10*60)
		if(!GM.pc.getTFHolder().canStartTransformation(tfID)):
			setState("eat_no_effect")
		else:
			GM.pc.getTFHolder().startTransformation(tfID)
			setState("eat_has_effect")
		return

	if(_action == "doRunUnlockScene"):
		var optionEntry = _args[0]
		
		runScene(optionEntry["sceneID"])
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["drugUniqueID"] = drugUniqueID
	data["tfID"] = tfID

	return data

func loadData(data):
	.loadData(data)

	drugUniqueID = SAVE.loadVar(data, "drugUniqueID", "")
	tfID = SAVE.loadVar(data, "tfID", "")
