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
		addButton("Sex", "See what kind of kinky things you can do with her", "sex_menu")
		addButton("Wait..", "See what Artica will do if left alone", "trigger_wait")
		addButton("Kidnap", "Steal Artica into your cell to do bad things with her", "do_kidnap")
		addButton("Leave", "Time to go", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
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
