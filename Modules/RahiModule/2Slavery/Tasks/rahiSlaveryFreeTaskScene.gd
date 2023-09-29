extends SceneBase

func _init():
	sceneID = "rahiSlaveryFreeTaskScene"

func _run():
	if(state == ""):
		addCharacter("rahi")
		saynn("The more you think about it.. the more you realize that you don't wanna give Rahi any tasks today.")

		saynn("[say=pc]You are doing well lately, kitty. Consider this a free day.[/say]")

		var randomResponce = RNG.pick(["Nya.. Thank you, {rahiMaster}..", "Oh.. I like being lazy sometimes..", "Thank you.. We can still do something if you want..", "You are the best, {rahiMaster}.."])
		saynn("[say=rahi]"+str(randomResponce)+"[/say]")

		addButton("Continue", "See what happens next", "stop_task")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "stop_task"):
		#getCharacter("rahi").resetEquipment()
		endScene(["free"])
		return

	setState(_action)
