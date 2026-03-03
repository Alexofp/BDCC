extends SceneBase

var biggestStat = -1
var nomoretime = false

func _init():
	sceneID = "PSTentaclesEndingChoice"

func _initScene(_args = []):
	nomoretime = _args[0] if _args.size() > 0 else true

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
		biggestStat = _tentacles.getBiggestStat()
		if (!nomoretime):
			saynn("You approach {psTentacles}..")

		else:
			saynn("There is no more time left for you to do anything with the tentacles.. The scientists are about to return.")

			saynn("You approach {psTentacles}.. Time to make your final choice..")

		if (biggestStat == _tentacles.STAT_ANGER):
			saynn("The tentacles look very angry. The tips are glaring at you.")

		elif (biggestStat == _tentacles.STAT_AGILITY):
			saynn("The tentacles look very active, the tendrils all sway eagerly.")

		elif (biggestStat == _tentacles.STAT_MIND):
			saynn("The tentacles look a bit melancholic, the tendrils are all swaying low.")

		else:
			saynn("The tentacles look very horny. The tips are all slick with juices.")

		saynn("The injector is still with you. What do you wanna do?")

		if (!nomoretime):
			addButton("Never mind", "You don't wanna do anything just yet", "endthescene")
		else:
			addDisabledButton("Never mind", "This isn't an option.. not anymore")
		addButton("Inject tentacles", "Inject the tentacles with the injector that will make them into a mindless plant", "do_inject")
		if (_tentacles.getStat(_tentacles.STAT_ANGER) >= 10 && _tentacles.getStat(_tentacles.STAT_AGILITY) >= 10):
			addButton("Murder spree", "Your tentacles are angry and strong enough for you to order them to murder everyone!", "ending_angeragility")
		else:
			addDisabledButton("Murder spree", "Your tentacles are either not angry enough (Anger "+str(_tentacles.anger)+"/10) or not strong enough (Agility "+str(_tentacles.agility)+"/10)")
		if (_tentacles.getStat(_tentacles.STAT_ANGER) >= 10 && _tentacles.getStat(_tentacles.STAT_MIND) >= 10):
			addButton("Puppet master", "Your tentacles are angry and smart enough for you to order them to murder everyone!", "ending_angermind")
		else:
			addDisabledButton("Puppet master", "Your tentacles are either not angry enough (Anger "+str(_tentacles.anger)+"/10) or not smart enough (Mind "+str(_tentacles.mind)+"/10)")
		if (_tentacles.getStat(_tentacles.STAT_ANGER) >= 10 && _tentacles.getStat(_tentacles.STAT_LUST) >= 10):
			addButton("Breeding grounds", "Your tentacles are angry and lusty enough for you to order them to fuck everyone!", "ending_angerlust")
		else:
			addDisabledButton("Breeding grounds", "Your tentacles are either not angry enough (Anger "+str(_tentacles.anger)+"/10) or not lusty enough (Lust "+str(_tentacles.lust)+"/10)")
		if (_tentacles.getStat(_tentacles.STAT_AGILITY) >= 10 && _tentacles.getStat(_tentacles.STAT_MIND) >= 10):
			addButton("Silent escape", "Your tentacles are strong and smart enough for you to try to escape this biolab silently..", "ending_agilitymind")
		else:
			addDisabledButton("Silent escape", "Your tentacles are either not strong enough (Agility "+str(_tentacles.agility)+"/10) or not smart enough (Mind "+str(_tentacles.mind)+"/10)")
		if (_tentacles.getStat(_tentacles.STAT_AGILITY) >= 10 && _tentacles.getStat(_tentacles.STAT_LUST) >= 10):
			addButton("Hunt and snare", "Your tentacles are strong and lusty enough for you to make them escape by fucking everyone!", "ending_agilitylust")
		else:
			addDisabledButton("Hunt and snare", "Your tentacles are either not strong enough (Agility "+str(_tentacles.agility)+"/10) or not lusty enough (Lust "+str(_tentacles.lust)+"/10)")
		if (_tentacles.getStat(_tentacles.STAT_MIND) >= 10 && _tentacles.getStat(_tentacles.STAT_LUST) >= 10):
			addButton("Pleasure slaves", "Your tentacles are smart and lusty enough to mindcontrol everyone into sex slaves!", "ending_mindlust")
		else:
			addDisabledButton("Pleasure slaves", "Your tentacles are either not smart enough (Mind "+str(_tentacles.mind)+"/10) or not lusty enough (Lust "+str(_tentacles.lust)+"/10)")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_inject"):
		endScene()
		runScene("PSTentaclesInjectEnding")
		return

	if(_action == "ending_angeragility"):
		endScene()
		runScene("PSTentaclesEndingAngerAgility")
		return

	if(_action == "ending_angermind"):
		endScene()
		runScene("PSTentaclesEndingAngerMind")
		return

	if(_action == "ending_angerlust"):
		endScene()
		runScene("PSTentaclesEndingAngerLust")
		return

	if(_action == "ending_agilitymind"):
		endScene()
		runScene("PSTentaclesEndingAgilityMind")
		return

	if(_action == "ending_agilitylust"):
		endScene()
		runScene("PSTentaclesEndingAgilityLust")
		return

	if(_action == "ending_mindlust"):
		endScene()
		runScene("PSTentaclesEndingMindLust")
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["biggestStat"] = biggestStat
	data["nomoretime"] = nomoretime

	return data

func loadData(data):
	.loadData(data)

	biggestStat = SAVE.loadVar(data, "biggestStat", -1)
	nomoretime = SAVE.loadVar(data, "nomoretime", false)
