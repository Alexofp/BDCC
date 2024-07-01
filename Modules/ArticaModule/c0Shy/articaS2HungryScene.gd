extends SceneBase

func _init():
	sceneID = "articaS2HungryScene"

func _run():
	if(state == ""):
		saynn("You decide to idle for some time in the lilac block, wondering if that white fluffy ball will decide to come out of her cell today. Busting in on them would be kinda mean.. so you keep that option as a last resort.")

		saynn("So far.. It's kinda quiet. You only see other lilacs wandering around, flashing their bodies to anyone even remotely curious.")

		saynn("Maybe it's time to give up on waiting..")

		addButton("Continue", "See what happens next", "artica_hungry")
	if(state == "artica_hungry"):
		addCharacter("artica")
		playAnimation(StageScene.Solo, "stand", {pc="artica"})
		saynn("You were about to return to your cell.. when you suddenly see a cute snow-white muzzle curiously sticking out from one of the cells. She looks around cautiously, scanning the cellblock for any obvious threats. You pretend to tie your shoes.. invisible ones.")

		saynn("After seeing that the other inmates don't pay much attention to her, the white-cyan fluff sticks more of her body out. Your careful gaze picks up on her holding her paw on her grumbling belly.. Looks like she is forced to start exploring the station.")

		saynn("The girl walks past you at a faster-than-normal pace, keeping her gaze low and her fluffy tail curled around her leg.")

		saynn("Following her feels creepy.. but it's probably obvious where to find her.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "artica_hungry"):
		processTime(20*60)

	setState(_action)
