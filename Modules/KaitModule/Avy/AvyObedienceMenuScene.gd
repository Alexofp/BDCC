extends SceneBase

var avyObedience = 0
var avyDebug = false

func _init():
	sceneID = "AvyObedienceMenuScene"

func _run():
	if(state == ""):
		aimCameraAndSetLocName("hideout_chill")
		addCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		saynn("You ask Avy to follow you because you wanna do something together. She doesn't seem to mind that.")

		saynn("The chill room seems good enough for this.")

		saynn("[say=avy]Yeah?[/say]")

		avyObedience = GM.main.MS.getAvyObedience()
		if (avyDebug):
			saynn("avyObedience = 99")

		saynn("Avy's obedience: "+str(avyObedience)+"")

		addButton("Never mind", "You changed your mind", "never_mind")
		if (avyObedience >= 2):
			addButton("Light domination", "(Obedience 2+) Try to dominate Avy and see what happens", "light_dom")
		if (!getFlag("KaitModule.didAvyDomIntro")):
			addDisabledButton("Oral sex", "You need to dominate Avy first before doing this!")
		else:
			if (avyObedience >= 2):
				addButton("Oral sex", "(Obedience 2+) Dominate Avy further and make her serve as your cock sucker or a pussy licker", "oral_sex")
	if(state == "never_mind"):
		aimCameraAndSetLocName(GM.pc.getLocation())
		saynn("[say=pc]I changed my mind.[/say]")

		saynn("Avy shrugs. And so you return back.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "light_dom"):
		endScene()
		setFlag("KaitModule.didAvyDomIntro", true)
		runScene("AvyObedienceLightDomScene")

	if(_action == "oral_sex"):
		endScene()
		runScene("AvyObedienceOralScene")

	setState(_action)

func saveData():
	var data = .saveData()

	data["avyObedience"] = avyObedience
	data["avyDebug"] = avyDebug

	return data

func loadData(data):
	.loadData(data)

	avyObedience = SAVE.loadVar(data, "avyObedience", 0)
	avyDebug = SAVE.loadVar(data, "avyDebug", false)
