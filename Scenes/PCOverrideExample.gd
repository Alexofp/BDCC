extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "PCOverrideExample"

func _reactInit():
	if(!GM.pc.isOverriddenPlayer()):
		GM.main.overridePC()
		GM.pc.setName("Tavi")
		GM.pc.setGender(Gender.Female)
		GM.pc.setSpecies([Species.Feline])
		GM.pc.resetBodypartsToDefault()
		GM.pc.giveBodypart(GlobalRegistry.createBodypart("tavihair"))
		
		GM.pc.updateAppearance()
		GM.pc.updateNonBattleEffects()
		playAnimationForceReset(StageScene.Solo, "stand")

func _onSceneEnd():
	pass
	#GM.main.clearOverridePC()
	#GM.pc.updateAppearance()
	#GM.pc.updateNonBattleEffects()

func _run():
	if(state == ""):
		saynn("Hello. Your name is {pc.name}")
		
		saynn("[say=pc]Yes, my name is {pc.name}[/say]")

		addButton("Quit", "Stop the scene", "endthescene")
		addButton("Clear override", "Nya", "clear_override")

func _react(_action: String, _args):

	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "clear_override"):
		GM.main.clearOverridePC()
		GM.pc.updateAppearance()
		GM.pc.updateNonBattleEffects()
		playAnimationForceReset(StageScene.Solo, "stand")
		endScene()
		return

	
	setState(_action)
