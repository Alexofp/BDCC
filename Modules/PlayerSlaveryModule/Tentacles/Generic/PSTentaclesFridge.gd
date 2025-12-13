extends SceneBase

func _init():
	sceneID = "PSTentaclesFridge"

func _reactInit():
	#addCharacter(GM.main.PS.getTentaclesCharID())
	pass

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
		saynn("You open the fridge and see that it's stuffed full. Meat, veggies, fruits, snacks.. it all makes your mouth drool.")

		saynn("All the food is fresh as it can be.. looks like they're restocking it every day.")

		addButton("Snack", "Eat a snack!", "doEatSnack")
		addButton("Leave", "Never mind", "endthescene")
	if(state == "doEatSnack"):
		saynn("You grab a bag of chips and open it. Smells nice.")

		saynn("After you've finished snacking, you throw the empty bag into the trash bin that's nearby.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "doEatSnack"):
		_tentacles.doTurn()
		GM.pc.addPain(-50)
		GM.pc.addStamina(50)

	setState(_action)
