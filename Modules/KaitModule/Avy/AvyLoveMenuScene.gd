extends SceneBase

var avyLove = 0
var avyDebug = false

func _init():
	sceneID = "AvyLoveMenuScene"

func _run():
	if(state == ""):
		addCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		saynn("You ask Avy if she wants to have some fun together.")

		saynn("[say=avy]Perhaps. Just keep in mind, I'm not a bottom.[/say]")

		avyLove = GM.main.MS.getAvyLove()
		if (avyDebug):
			saynn("avyLove = 99")

		saynn("Avy's love: "+str(avyLove)+"")

		addButton("Never mind", "You changed your mind", "never_mind")
		if (avyLove >= 2):
			addButton("Get fucked!", "(Love 2+) Let Avy fuck you raw!", "get_fucked")
			addButton("Suck her off", "(Love 2+) Suck Avy's cock!", "oral_sex")
	if(state == "never_mind"):
		aimCameraAndSetLocName(GM.pc.getLocation())
		saynn("[say=pc]I changed my mind.[/say]")

		saynn("Avy shrugs.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "get_fucked"):
		endScene()
		runScene("AvyLoveSexScene")

	if(_action == "oral_sex"):
		endScene()
		runScene("AvyLoveOralSexScene")

	setState(_action)

func saveData():
	var data = .saveData()

	data["avyLove"] = avyLove
	data["avyDebug"] = avyDebug

	return data

func loadData(data):
	.loadData(data)

	avyLove = SAVE.loadVar(data, "avyLove", 0)
	avyDebug = SAVE.loadVar(data, "avyDebug", false)
