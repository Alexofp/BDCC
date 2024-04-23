extends SceneBase

var corruption = 0.0
var pawslut = 0.0
var chastity = 0.0

func _init():
	sceneID = "articaTalkScene"

func _run():
	if(state == ""):
		addCharacter("artica")
		playAnimation(StageScene.Duo, "stand", {npc="artica"})
		pawslut = getModule("ArticaModule").getPawSlut()
		corruption = getModule("ArticaModule").getCorruption()
		chastity = getModule("ArticaModule").getChastity()
		if (getModule("ArticaModule").isLusty()):
			saynn("Artica is swaying a lot, her cheeks blushing slightly.")

		else:
			saynn("Artica is standing still.")

		saynn("Corruption: "+str(Util.roundF(corruption*100.0, 1))+"%")

		saynn("Pawslut: "+str(Util.roundF(pawslut*100.0, 1))+"%")

		saynn("Chastity: "+str(Util.roundF(chastity*100.0, 1))+"%")

		addButton("Tease", "Do something half-lewd with her", "tease_menu")
		if (getModule("ArticaModule").isLusty()):
			addButton("Sex", "See what kind of kinky things you can do with her", "sex_menu")
		else:
			addDisabledButton("Sex", "Artica is not horny enough")
		if (getModule("ArticaModule").canTriggerWaitScene()):
			saynn("Artica is gonna do something if you wait for her to do so..")

			addButton("Wait..", "See what Artica will do if left alone", "trigger_wait")
		else:
			addDisabledButton("Wait..", "Nothing will happen if you do this. Can try to make Artica horny to encourage her to explore the station")
		addButton("Leave", "Time to go", "endthescene")
	if(state == "tease_menu"):
		saynn("What do you want to do?")

		addButton("Canteen", "Invite Artica to go eat", "do_tease_canteen")
		addButton("Your cell", "Invite Artica to your cell", "do_tease_cell")
		addButton("Back", "Go back to the previous menu", "")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_tease_canteen"):
		runScene("articaCanteenTeaseScene")
		endScene()
		return

	if(_action == "do_tease_cell"):
		runScene("articaCellTeaseScene")
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["corruption"] = corruption
	data["pawslut"] = pawslut
	data["chastity"] = chastity

	return data

func loadData(data):
	.loadData(data)

	corruption = SAVE.loadVar(data, "corruption", 0.0)
	pawslut = SAVE.loadVar(data, "pawslut", 0.0)
	chastity = SAVE.loadVar(data, "chastity", 0.0)


func getDebugActions():
	return [
		{
			"id": "setCorruption",
			"name": "Set Corruption",
			"args": [
				{
					"id": "corruption",
					"name": "How much (0-100)",
					"type": "number",
					"value": 100,
				},
			],
		},
	]

func doDebugAction(_id, _args = {}):
	if(_id == "setCorruption"):
		setFlag("ArticaModule.corruption", clamp(_args["corruption"]/100.0, 0.0, 1.0))
		corruption = getModule("ArticaModule").getCorruption()
