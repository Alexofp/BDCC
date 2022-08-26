extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "TaviQuest2Start"


func _run():
	if(state == ""):
		addCharacter("tavi")
		
	if(state == ""):
		saynn("You get Tavi’s attention by getting on your knees and poking her leg.")

		saynn("[say=pc]What now, Miss?[/say]")

		saynn("[say=tavi]We can do some recon.[/say]")

		saynn("[say=pc]Recon?[/say]")

		saynn("[say=tavi]Yeah, have you met the captain? What a prick.[/say]")

		saynn("You nod.")

		saynn("[say=tavi]We get to his office, figure out where the communication console is and call my friends.[/say]")

		saynn("[say=pc]You have friends?[/say]")

		saynn("You are met with silence. Tavi just softly chuckles after a few seconds.")

		saynn("[say=tavi]Meet me tomorrow near the checkpoint. Be prepared, cutie.[/say]")

		# (new quest added)
		addButton("Leave", "She got what she deserved anyways", "endthescene")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		processTime(60*3)
		
		setModuleFlag("TaviModule", "Tavi_Quest2Started", true)
		setModuleFlag("TaviModule", "Tavi_Quest2Day", GM.main.getDays())
		endScene()
		return


	setState(_action)

