extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "TaviPunishment1Scene"

func _initScene(_args = []):
	GM.pc.addPain(10)
	addMessage("Ow, that gave you 10 pain")

func _run():
	if(state == ""):
		addCharacter("tavi")
	if(state == ""):
		saynn("Tavi sits on some machine and then forcibly pulls you to lay on her laps, belly down so she has full access to your rear.")

		if(!GM.pc.isFullyNaked()):
			saynn("Tavi then tugs off all the layers of your clothing, exposing the butt. Each time you would try to stop her she slaps your arms away.")

		saynn("[say=tavi]Hands behind your back, no covering anything, slut[/say]")

		if(GM.pc.hasTail()):
			saynn("You hear her strict tone and do as she says, saying no would probably only make it worse. You lay still and await for your faith. Tavi also grabs your wagging tail and pulls it out of the way to make sure you won’t use it to protect yourself.")
		else:
			saynn("You hear her strict tone and do as she says, saying no would probably only make it worse. You lay still and await for your faith.")

		saynn("She puts one hand on your back so you don’t fidget much and then rubs your butt for a bit before suddenly delivering a strong smack to it, so strong that it sends a wave of shivering through your body. It hurts, you yelp and try to escape from her grasp but she pulls you back and quickly gives you another spank, you barely manage to keep your arms crossed behind your back.")

		saynn("[say=tavi]Bad pet, very. Learn to take a punishment[/say]")

		saynn("You brace for the next strike, closing your eyes and tilting your head down. But Tavi teases you, gently groping your ass and letting her palm slide along its surface back and forth in a circle before suddenly giving you a spank, then another, and another. Tavi holds you tight as she gives you a series of firm slaps on the ass, each one causing your butt cheeks to become redder and the feline doesn’t seem to want to stop anytime soon. You cry from pain and try to kick and struggle, the stings are so strong that you start to disobey and cover your butt with your hands but Tavi keeps delivering strikes and slapping your palms away. You stick your tongue out and moan from pain that quickly reaches its peak.")

		saynn("[say=tavi]Hurts, huh? That's the thing about the punishments, they aren’t supposed to be fun.[/say]")

		saynn("Eventually, after about 30 spanks, Tavi stops and switches back to caressing your, now fully red, butt.")

		saynn("[say=tavi]Wanna misbehave again?[/say]")

		saynn("You shake your head a lot, Tavi chuckles and gives your rear a squeeze, her other paw switches to stroking your back. It’s calming but your ass is still itchy from how strongly it was spanked.")

		saynn("[say=tavi]Good.[/say]")

		if(GM.pc.hasReachableVagina()):
			saynn("Tavi’s digits switch position and gently land on your pussy, they begin carefully rubbing you there. It’s a nice change, you stick your butt up for her and begin to moan softly, such a contrasting sensation feels so much better. You keep your arms behind like a good pet and focus on receiving the pleasure. But Tavi quickly pulls her digits away soon after.")

			saynn("[say=tavi]Now go.[/say]")

		# (scene ends)

		addButton("Continue", "Ow..", "endthescene")


		

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		processTime(60*5)
		return


	setState(_action)

