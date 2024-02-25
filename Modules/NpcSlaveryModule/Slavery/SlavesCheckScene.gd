extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "SlavesCheckScene"

	
func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "stand")
		
		addButtonAt(14, "CLOSE", "Enough interactions", "endthescene")
		
		saynn("Who do you want to check on?")
		
		var slaves = GM.main.getDynamicCharacterIDsFromPool(CharacterPool.Slaves)
		
		for charID in slaves:
			var character:DynamicCharacter = getCharacter(charID)
			
			addButton(character.getName(), "Check on this "+character.getSpeciesFullName(), "do_check", [character])

		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "do_check"):
		runScene("SlaveTalkScene", [_args[0].getID()])
		endScene()
		return

	setState(_action)
