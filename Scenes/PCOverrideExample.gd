extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "PCOverrideExample"

func _reactInit():
	GM.main.overridePC()
	GM.pc.setName("Tavi")
	GM.pc.setGender(BaseCharacter.Gender.Female)
	
	GM.pc.updateAppearance()
	GM.pc.updateNonBattleEffects()

func _onSceneEnd():
	GM.main.clearOverridePC()
	GM.pc.updateAppearance()
	GM.pc.updateNonBattleEffects()

func _run():
	if(state == ""):
		saynn("Hello. Your name is {pc.name}")
		
		saynn("[say=pc]Yes, my name is {pc.name}[/say]")

		addButton("Quit", "Stop the scene", "endthescene")


func _react(_action: String, _args):

	if(_action == "endthescene"):
		endScene()
		return

	
	setState(_action)
