extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "AvyFirstTimeTalkScene"

func _run():
	if(state == ""):
		addCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="avy"})

	if(state == ""):
		saynn("You see the familiar foxy leaning against the metal fence. One of her arms is still bandaged with some rags. You walk up to her and try to get her attention, she seems to be busy looking at her notes.")

		saynn("[say=avy]What do you want?[/say]")

		# (if saw before)
		if(getFlag("RahiModule.Rahi_CanteenSceneHappened")):
			saynn("She raises her gaze and looks at you, suddenly realizing something.")

			saynn("[say=avy]Wait, I remember you. Hah. The fuck do you need.[/say]")
			# (ends)

		saynn("[say=pc]I wanna fight in the arena.[/say]")

		saynn("The foxy suddenly bursts with laughter.")

		saynn("[say=avy]Who? You? Haha-aha. I mean I can let you out but can you even offer a good show?[/say]")

		saynn("You turn your hands into fists and tense your muscles up.")

		saynn("[say=pc]How about we find that out.[/say]")

		saynn("[say=avy]Sure, bitch. Here is the deal. Fights in the arena end when the first person collapses. The winner gets some credits and they can also do whatever they want to the loser. Hear me? Works both ways. So don’t fucking come crying to me when somebody pisses on you or breeds your slutty fuckhole, you agreed to this.[/say]")

		saynn("Oh wow, she seems to be quite serious about it. She shows you her notes, the first page seems to be some kind of ranked list with her name being at the top and yours at the very bottom. Names of the ranks all sound very humiliating except for the top one.")

		saynn("[say=avy]Since you are new, you start at the bottom. Your rank is ‘Fuck meat’. Pretty fitting I feel like. Let me know if you wanna fight, I’m very curious about how fast you will lose.[/say]")

		# (scene ends)

		addButton("Continue", "Okay", "endthescene")


func _react(_action: String, _args):
	
	if(_action == "endthescene"):
		runScene("AvyTalkScene")
		endScene()
		return

	setState(_action)

