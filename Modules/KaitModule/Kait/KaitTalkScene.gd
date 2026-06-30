extends SceneBase

var kaitLove = 0
var kaitObedience = 0

func _init():
	sceneID = "KaitTalkScene"

func _run():
	if(state == ""):
		addCharacter("kait")
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		saynn("You approach Kait, the snow leopard.")

		var theUniqieLine:String = getFlag("KaitModule.kaitApproach", "")
		if (theUniqieLine.empty()):
			saynn("[say=kait]Hey there.[/say]")

		else:
			saynn("[say=kait]"+str(theUniqieLine)+"[/say]")

			setFlag("KaitModule.kaitApproach", "")
		kaitLove = GM.main.MS.getKaitLove()
		kaitObedience = GM.main.MS.getKaitObedience()
		saynn("Kait's love: "+str(kaitLove)+"\nKait's obedience: "+str(kaitObedience)+"")

		if (kaitLove >= 2):
			addButton("Sex", "See what lewd stuff you can do with Kait", "sex_menu")
		else:
			addDisabledButton("Sex", "Kait's love towards you must be above 2")
		if (kaitObedience >= 2):
			addButton("Dominate", "See what you can order Kait to do", "dom_menu")
		else:
			addDisabledButton("Dominate", "Kait's obedience must be above 2")
		addButton("Leave", "Enough chatting", "endthescene")
	if(state == "sex_menu"):
		saynn("What kind of sexual activity do you want to do with Kait?")

		addButton("Back", "You changed your mind", "")
		addButton("69", "(Love 2+) Lick or suck each other off!", "sex_69")
		addButton("Finger her", "(Love 2+) Make that snep cum just from your fingers!", "sex_fingerher")
	if(state == "dom_menu"):
		saynn("How do you wanna dominate Kait?")

		addButton("Back", "You changed your mind", "")
		addButton("Light domination", "(Obedience 2+) Try to dominate Kait and see what happens", "dom_light")
		if (!getFlag("KaitModule.didKaitDomIntro")):
			addDisabledButton("Oral sex", "You need to dominate Kait first before doing this!")
		else:
			addButton("Oral sex", "(Obedience 2+) Dominate Kait further and make her serve as your cock sucker or a pussy licker", "oral_sex")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "sex_69"):
		endScene()
		runScene("KaitLove69Scene")
		return

	if(_action == "sex_fingerher"):
		endScene()
		runScene("KaitLoveFingerHerScene")
		return

	if(_action == "dom_light"):
		endScene()
		setFlag("KaitModule.didKaitDomIntro", true)
		runScene("KaitObedienceLightDomScene")

	if(_action == "oral_sex"):
		endScene()
		runScene("KaitObedienceOralSexScene")

	setState(_action)

func saveData():
	var data = .saveData()

	data["kaitLove"] = kaitLove
	data["kaitObedience"] = kaitObedience

	return data

func loadData(data):
	.loadData(data)

	kaitLove = SAVE.loadVar(data, "kaitLove", 0)
	kaitObedience = SAVE.loadVar(data, "kaitObedience", 0)
