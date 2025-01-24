extends SceneBase

var npcID = ""

func _init():
	sceneID = "ElizaGenericNPCTestDrugScene"

func _initScene(_args = []):
	npcID = _args[0]
	addCharacter(npcID)
	if(GM.pc.getLocation() == "med_lobbymain"):
		setState("bring_to_eliza")

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc=npcID, npcBodyState={leashedBy="pc"}})
		saynn("You notice that {npc.name}'s transformations can be scanned.. So you whip out a leash and swiftly clip it to {npc.his} collar.")

		saynn("[say=pc]You and I are going to the medical.[/say]")

		addButton("Medical", "Go see Eliza", "bring_to_eliza")
	if(state == "bring_to_eliza"):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		aimCameraAndSetLocName("med_lobbymain")
		saynn("You find doctor Quinn behind the counter of the medbay lobby.")

		saynn("[say=pc]Hey, I have a test subject here. I think you can scan {npc.him}.[/say]")

		saynn("Doctor's eyes light up. The person on your leash feels uneasy, to say the least.")

		saynn("[say=eliza]Great![/say]")

		saynn("She presses a button and the doors to your side open, inviting you in.")

		saynn("[say=eliza]Let's go to the lab.[/say]")

		addButton("Lab", "Bring the test subject there", "to_lab")
	if(state == "to_lab"):
		playAnimation(StageScene.Duo, "stand", {pc="eliza", npc=npcID, npcBodyState={leashedBy="eliza"}})
		aimCameraAndSetLocName("med_researchlab")
		GM.pc.setLocation("med_researchlab")
		saynn("You tug on the leash and bring your test subject into the research lab.")

		saynn("Eliza fetches a little hand-held scanner and begins to slowly move it over {npc.his} body.. {npc.name} squirms a bit in the process. Eventually, the feline gets enough data.")

		saynn("[say=eliza]There we go! The database has been updated! We also got some science points for that, great job![/say]")

		saynn("She puts the scanner away.. and then produces two pills.")

		saynn("[say=eliza]Now.. I have an offer for you.[/say]")

		saynn("She looks at you, with two pills on her palms. A blue one in her left hand.. and a red one in her right..")

		saynn("[say=eliza]I will give you the choice since you're my assistant~. Blue one will undo any transformations and return everything to how it was. Boring, if you ask me![/say]")

		saynn("Boring, huh..")

		saynn("[say=eliza]Or! There is also the red one.. in case you like how {npc.he} {npc.verb('look')}! It will erase the backup DNA of {npc.his} body.. making all the current changes permanent.[/say]")

		saynn("The choice is clear..")

		addButton("Blue", "Make them eat a blue pill that will undo all the transformations", "eat_blue")
		addButton("Red", "Make them eat a red pill that will make all their transformations permanent", "eat_red")
	if(state == "eat_blue"):
		saynn("You choose the blue one.")

		saynn("[say=eliza]Aww~.[/say]")

		saynn("Eliza carefully feeds {npc.name} your chosen pill. And soon, {npc.his} body reverts to its normal state.")

		saynn("[say=eliza]Well, come back when you get someone else I can scan![/say]")

		saynn("You nod.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "eat_red"):
		saynn("You choose the red one.")

		saynn("[say=eliza]Wise choice~.[/say]")

		saynn("Eliza carefully feeds {npc.name} your chosen pill. And, just as expected, nothing changes. But all of the transformations are now permanent!")

		saynn("[say=eliza]Enjoy! Come back when you get someone else I can scan![/say]")

		saynn("You nod.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "bring_to_eliza"):
		processTime(5*60)

	if(_action == "to_lab"):
		GM.main.SCI.doTestTFsOf(getCharacter(npcID))

	if(_action == "eat_blue"):
		getCharacter(npcID).getTFHolder().undoAllTransformations()

	if(_action == "eat_red"):
		getCharacter(npcID).getTFHolder().makeAllTransformationsPermanent()

	setState(_action)

func saveData():
	var data = .saveData()

	data["npcID"] = npcID

	return data

func loadData(data):
	.loadData(data)

	npcID = SAVE.loadVar(data, "npcID", "")
