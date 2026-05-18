extends SceneBase

func _init():
	sceneID = "KaitMissionSelectorScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "stand")
		
		saynn("What mission do you wanna start?")

		addButton("CANCEL", "You changed your mind", "endthescene")
		
		var theMissions:Array = GM.main.MS.getAllPossibleMissions()
		var _i:int = 1
		for theMission in theMissions:
			sayn(str(_i)+") "+theMission.getName())
			saynn(theMission.getDescription())
			addButton(theMission.getName(), "Start this mission!", "startMission", [theMission.id])
			_i += 1

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	if(_action == "startMission"):
		endScene()
		GM.main.MS.startMission(_args[0])
		return

	setState(_action)
