extends SceneBase

func _init():
	sceneID = "DomM1OptionalSkar"

func _run():
	if(state == ""):
		addCharacter("skar")
		playAnimation(StageScene.Solo, "stand", {pc="skar"})
		saynn("You stick your head behind the corner and see a door that probably leads into some big office! This one looks different from the others.. a lot more fancier and protected. It's probably the captain's office. Going in there now is a sure way to get yourself spaced.")

		saynn("The door looks locked anyway.. and it's also guarded by a mean-looking guy. He didn't spot you yet.")

		saynn("You probably don't wanna approach him.. unless you wanna fight the dude.")

		saynn("(( Approaching him again will trigger an optional hard encounter. ))")

		addButton("Leave", "Take a step back", "endgoback")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "endgoback"):
		endScene()
		GM.pc.setLocation("cd_last_intersection")
		return

	setState(_action)
