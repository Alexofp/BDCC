extends HK_SessionAwakenerBase

func _init():
	sceneID = HK_Sessions.AwakenerSimple
	
func _initScene(_args = []):
	onAwakener()
	
func _run():
	if(state == ""):
		addCharacter("HK_Vion")
		playAnimation(StageScene.Duo, "sit", {npc="HK_Vion", npcAction="sit"})

		saynn("[say=HK_Vion]Alright, let's bring you back up. Take a deep breath.[/say]")

		saynn("You breathe in.")

		saynn("[say=HK_Vion]Focus on my voice. Bring your thoughts back to the surface.[/say]")

		saynn("Your mind shudders awake, rising from its comfortable, foggy numbness.")

		saynn("[say=HK_Vion]With every breath you become more aware of the world that surrounds you. With every word, you become more awake. Now, slowly open your eyes...[/say]")

		saynn("You open your your eyes and wince at the harsh light coming in from outside.")

		saynn("[say=HK_Vion]There you go. Waking up. Fully aware.[/say]")

		saynn("The trance broken, you take a moment to stretch your legs. Then you stand up.")
		
		addButton("Continue", "", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		afterAwakener()
		return

	setState(_action)
