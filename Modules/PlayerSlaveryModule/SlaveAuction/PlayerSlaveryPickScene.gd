extends SceneBase


func _init():
	sceneID = "PlayerSlaveryPickScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "stand", {pc="pc"})
		
		saynn("There are "+str(GM.main.PSH.getPossibleSlaveriesAmount(false))+" possible player slavery scenarios.")
		
		saynn("You can either let the game choose randomly or pick one yourself.")
		
		saynn("Keep in mind that a randomly-picked scenario might include kinks that you might not like.")
		
		addButton("Random scenario", "Leave it all to random chance", "startRandomSlavery")
		addButton("Pick scenario", "Pick what kind of slavery you want to experience", "pick_menu")

	if(state == "pick_menu"):
		saynn("Which slavery scenario do you want to experience?")
		
		saynn("Unlocked Endings:")
		sayn(GM.main.PSH.getEndingsInfo())
		
		for slaveryID in GlobalRegistry.getPlayerSlaveryDefs():
			var thePlayerSlaveryDef:PlayerSlaveryDef = GlobalRegistry.getPlayerSlaveryDef(slaveryID)
			
			if(thePlayerSlaveryDef.canBeChosen()):
				addButton(thePlayerSlaveryDef.getVisibleName(), thePlayerSlaveryDef.getVisibleDesc(), "doStartSlavery", [slaveryID])
			else:
				var impossibleReasonText:String = thePlayerSlaveryDef.getImpossibleReason()
				if(impossibleReasonText == ""):
					impossibleReasonText = "Impossible in current state"
				
				addDisabledButton(thePlayerSlaveryDef.getVisibleName(), "["+impossibleReasonText+"] "+thePlayerSlaveryDef.getVisibleDesc())

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "startRandomSlavery"):
		var theSlaveryID:String = GM.main.PSH.getRandomPossibleSlaveryID()
		if(theSlaveryID == ""):
			endScene()
			return
		endScene()
		GM.main.startPlayerSlavery(theSlaveryID)
		return

	if(_action == "doStartSlavery"):
		endScene()
		GM.main.startPlayerSlavery(_args[0])
		return

	setState(_action)

func saveData():
	var data = .saveData()

	#data["knowsMirri"] = knowsMirri

	return data

func loadData(data):
	.loadData(data)

	#knowsMirri = SAVE.loadVar(data, "knowsMirri", false)
