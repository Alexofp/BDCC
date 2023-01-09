extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "StocksMeetEliza"

func _reactInit():
	pass
	
func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.StocksSexOral, "tease", {npc="eliza"})
		# (if can see)
		if(!GM.pc.isBlindfolded()):
			saynn("You see a familiar doctor walking past you. She notices you and walks up to you.")

		# (if can’t see)
		else:
			saynn("You can hear some heels walking past you. Through, whoever that is, it seems they noticed you and stopped.")

		saynn("[say=eliza]"+RNG.pick([
			"Oh hey there. Nice to see you again.",
			"Should I free and grab you for some experiments? Hmmm..",
			"Don’t mind me, I just wanted to look at you~.",
			"Looking cute there. How many already used you? I guess I should look behind.",
			"Hey there, inmate.",
		])+"[/say]")

		# (if gagged)
		if(GM.pc.isGagged()):
			saynn("You try to say something but can only make muffled noises with your gag. Eliza chuckles and pets your head before leaving.")

		# (if not gagged)
		else:
			saynn("You feel slightly humiliated so you don’t say anything. Eliza chuckles and pets you on the head before leaving.")
		
		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

