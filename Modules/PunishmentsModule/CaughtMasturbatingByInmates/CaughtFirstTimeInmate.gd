extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "CaughtFirstTimeInmate"

func _reactInit():
	if(RNG.chance(50)):
		var zone = BodyWritingsZone.getRandomZone()
		GM.pc.addBodywriting(zone, BodyWritings.getRandomWritingIDForZone(zone))
		addMessage("Although she did also left a memento on your "+BodyWritingsZone.getZoneVisibleName(zone)+"..")

func _run():
	if(state == ""):
		addCharacter("inmateShemale")
		playAnimation(StageScene.Solo, "defeat")

	if(state == ""):
		saynn("You were doing lewd things with yourself when suddenly somebody pushed you. Ow! You hit the floor and feel somebody pinning you to the floor, some inmate. She keeps her knee shoved into your back while murmuring into your ear.")

		saynn("[say=inmateShemale]Look at you, little horny thing. Didn’t anyone tell you that you are playing a very dangerous game~[/say]")

		saynn("You feel something poking against your butt. Oh, she is a dickgirl, for sure.")

		saynn("[say=inmateShemale]Hah. You feel it? Keep doing what you’re doing and you will become a free use slut in no time~. Hope you heard me.[/say]")

		saynn("You nod slightly, understanding. She decides to be merciful and just leaves.")

		# (scene ends)
		addButton("Continue", "See what happens next", "endthescene")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

