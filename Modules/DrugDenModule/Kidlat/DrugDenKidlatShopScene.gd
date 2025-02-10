extends SceneBase

func _init():
	sceneID = "DrugDenKidlatShopScene"

func _run():
	if(state == ""):
		addCharacter("kidlat")
		playAnimation(StageScene.Duo, "stand", {npc="kidlat"})
		var customGreet = getModule("DrugDenModule").getKidlatCustomGreeting()
		var drugDenEvent = GM.main.DrugDenRun.getEventInRoom(GM.pc.getLocation())
		var isFirstTimeThisFloor:bool = drugDenEvent.isFirstTimeThisFloor()
		var isFirstTimeThisRun:bool = drugDenEvent.isFirstTimeThisRun()
		var isOutOfItems:bool = drugDenEvent.isOutOfItems()
		saynn("You find Kidlat, standing behind her cardboard box.")

		if (customGreet != ""):
			saynn("[say=kidlat]"+str(customGreet)+"[/say]")

		elif (isOutOfItems):
			saynn("[say=kidlat]You bought everything I have, hun! See you around.[/say]")

		elif (isFirstTimeThisRun || isFirstTimeThisFloor):
			saynn("[say=kidlat]Hey, luv. Wanna trade?[/say]")

		else:
			saynn("[say=kidlat]Welcome back, hun.[/say]")

		saynn("Here is what she is selling:")

		saynn(""+str(drugDenEvent.getItemsListText())+"")

		addButton("Leave", "Time to go", "endthescene")
		drugDenEvent.addBuyButtons(self)

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
