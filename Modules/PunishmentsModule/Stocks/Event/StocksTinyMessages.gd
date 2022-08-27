extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "StocksTinyMessages"

func _reactInit():
	setState(RNG.pick(["1", "2", "3", "4"]))
	
func _run():
	if(state == "1"):
		saynn("A guard is walking past. His attention was definitely stolen by you for a second. Though he quickly continues his patrol.")
	if(state == "2"):
		saynn("A guard stops and rubs his chin while watching you. Your restraints keep you completely still.")
	if(state == "3"):
		saynn("Some staff member with a yellow uniform walks past. Behind him are a few inmates carrying crates. They seem to be going towards the canteen.")
	if(state == "4"):
		saynn("A lilac walks past and smirks at you.")
		
	addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

