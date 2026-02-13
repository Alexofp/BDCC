extends SceneBase

func _init():
	sceneID = "PSTentaclesFirstSex"

func _reactInit():
	addCharacter(GM.main.PS.getTentaclesCharID())

func resolveCustomCharacterName(_charID):
	if(_charID == "ten"):
		return GM.main.PS.getTentaclesCharID()
	if(_charID == "sci1"):
		return GM.main.PS.getScientist1CharID()
	if(_charID == "sci2"):
		return GM.main.PS.getScientist2CharID()

func _run():
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(state == ""):
		playAnimation(StageScene.TentaclesStroke, "tease", {plant=true})
		#playAnimation(StageScene.TentaclesGrope, "tease", {plant=true})
		saynn("TENTACLES WANT SEX.")

		addButton("Allow!", "(Sex) Let the tentacles fuck you..", "start_sex")
		addButton("Wiggle free", "Try to just wiggle free", "do_wiggle_free")
		addButton("Slap them off!", "Get the tentacles off by attacking them", "do_slap_them")
	if(state == "8_after"):
		saynn("You had fun with the tentacles..")

		saynn("They've certainly only gotten more lusty after this.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "8_afterEgged"):
		playAnimation(StageScene.TFLook, "start")
		saynn("You had fun with the tentacles..")

		saynn("And now, when you look down, you can't help but to notice your belly being quite round.")

		saynn("It looks like you got stuffed with eggs! You can feel them shifting inside you slightly as you move..")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "start_sex"):
		_tentacles.prepareForSex()
		runScene("GenericSexScene", [_tentacles.getTentaclesCharID(), "pc", SexType.TentaclesSex, {}], "tentaclesSex")
		return

	if(_action == "do_wiggle_free"):
		_tentacles.train(_tentacles.STAT_AGILITY)

	if(_action == "do_slap_them"):
		_tentacles.trainUntilFive(_tentacles.STAT_ANGER)

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "tentaclesSex"):
		var _tentacles:PlayerSlaveryTentacles = GM.main.PS
		_tentacles.trainUntilFive(_tentacles.STAT_LUST)
		_tentacles.didFirstSexEvent = true
		if(!_tentacles.noticedEgged && GM.pc.isEggStuffedBy(_tentacles.getTentaclesCharID())):
			setState("8_afterEgged")
			_tentacles.noticedEgged = true
		else:
			setState("8_after")
