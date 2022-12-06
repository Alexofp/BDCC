extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "CaughtFirstTimeStaff"

func _run():
	if(state == ""):
		addCharacter("maleguard_canine")
		playAnimation(StageScene.Duo, "defeat", {npc="maleguard_canine"})

	if(state == ""):
		saynn("You were doing lewd things with yourself when suddenly you felt your collar buzzing and shocking you. Ow! You drop to your knees and grab onto it, desperately trying to take it off but that only makes things worse. When the shock finally ends, you’re left panting and whining.")

		saynn("A guard approaches you, a guy. He crouches nearby and looks at you.")

		saynn("[say=maleguard_canine]You must be new here, inmate. Public indecency is illegal. I know you don’t care, you’re here because you are the scum that goes against rules.[/say]")

		saynn("The guard scritches you under the chin for some reason.")

		saynn("[say=maleguard_canine]And if you keep this up, don’t come to us crying when somebody decides to have fun with you against your will. We like fun too. Mhm?[/say]")

		saynn("Yeah, that was pretty clear. You nod slightly and watch him leave you.")

		# (scene ends)
		addButton("Continue", "See what happens next", "endthescene")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

