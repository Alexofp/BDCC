extends SceneBase

func _init():
	sceneID = "ChemistryLabShowerScene"

func _reactInit():
	GM.main.SCI.doPCShower()
	processTime(10*60)

func _run():
	if(state == ""):
		playAnimation(StageScene.Showering, "body", {pc="pc", bodyState={naked=true}})
		saynn("You undress and step into the smart shower. Clean water begins washing your body.")

		saynn("The water here is so much more pleasant than in the cellblock.")

		saynn("Any mess that you had on you gets collected and filtered.")

		addButton("Enough", "Enough showering", "endthescene")
		if (GM.main.SCI.hasUpgrade("shower2")):
			addButton("Douche", "Collect the fluids from inside your holes as well", "collect_inside")
		else:
			addDisabledButton("Douche", "You don't have the required upgrade installed")
	if(state == "collect_inside"):
		playAnimation(StageScene.Showering, "rub", {pc="pc", bodyState={naked=true, hard=true}})
		saynn("You use the special shower douche that allows you to wash inside your holes as well!")

		saynn("All the lewd fluids that you had inside you got collected and processed.")

		addButton("Enough", "Enough showering", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "collect_inside"):
		GM.main.SCI.doPCShowerInside()
		processTime(10*60)

	setState(_action)
