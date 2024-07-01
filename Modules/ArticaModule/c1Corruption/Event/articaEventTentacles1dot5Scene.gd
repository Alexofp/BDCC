extends SceneBase

func _init():
	sceneID = "articaEventTentacles1dot5Scene"

func _reactInit():
	addExperienceToPlayer(30)
	setFlag("ArticaModule.TentaclesArticaHasFlower", true)

func _run():
	if(state == ""):
		addCharacter("artica")
		saynn("You show Artica the strange small plant that she failed to steal back then in the greenhouses. Her eyes instantly go wide when she sees it.")

		saynn("[say=artica]T-that's.. I.. Um.. c-can I.. um-m..[/say]")

		saynn("Without much teasing, you just grab her paw and put the flower in it.")

		saynn("[say=pc]There you go. You don't have to explain anything to me, Artica. It's yours.[/say]")

		saynn("Artica stands high on her toes, her tail swishing wildly behind her back, her cheeks blushing.")

		saynn("[say=artica]T-thank you.. I.. t-thank you..[/say]")

		saynn("You nod. Makes you very curious what she and that doctor are gonna do with it.. All you can do is wait.. and see what happens..")

		addButton("Continue", "See what happens", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
