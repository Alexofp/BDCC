extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "PortalPantiesTakeOffScene"

func _run():

	if(state == ""):
		saynn("You try to take off your portal panties but no matter what you do, the magnetic locks prevent you from doing so.")

		saynn("They seem to only allow being temporarily taken off on very rare occasions.")

		addButton("Continue", "Oh well, what can you do", "endthescene")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

