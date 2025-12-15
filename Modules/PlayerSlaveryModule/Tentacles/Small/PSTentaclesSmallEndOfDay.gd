extends SceneBase

func _init():
	sceneID = "PSTentaclesSmallEndOfDay"

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
		saynn("IT'S GETTING LATE.. THE TENTACLE MONSTER IS LOOKING QUITE TIRED TOO.")

		saynn("WHY DON'T YOU GO BACK TO YOUR NEST THEN.. UHH..")

		saynn("YOU REALIZE THAT YOU HAVE NEVER GIVEN IT A NAME.")

		saynn("HOW SHOULD I CALL YOU.. HM..")

		_tentacles.addMonsterNameButtons(self)
		if (false):
			addButton("PICKNAME", "YOU SHOULDNT SEE THIS", "pickName")
	if(state == "pickName"):
		aimCameraAndSetLocName(_tentacles.LOC_MIDDLE)
		GM.pc.setLocation(_tentacles.LOC_MIDDLE)
		saynn("XXX.. THE TENTACLES REACT TO IT. SOUNDS LIKE A GOOD NAME THEN.")

		saynn("YOU INVITE IT TO GO BACK TO THE NEST AND SO IT DOES.")

		saynn("YOU HEAR THE KNOCKING ON THE GLASS.")

		addButton("Window", "Go approach it", "window")
	if(state == "window"):
		aimCameraAndSetLocName(_tentacles.LOC_IMPORTANT)
		GM.pc.setLocation(_tentacles.LOC_IMPORTANT)
		saynn("YOU TALK WITH SCIENTISTS.")

		saynn("THE BAD END IS FORSHADOWED SUBTLY.")

		saynn("TIME TO GO SLEEP.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "pickName"):
		_tentacles.setMonsterName(_args[0])
		_tentacles.setStage(_tentacles.STAGE_SMALL_ENDDAY)

	setState(_action)
