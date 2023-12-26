extends SceneBase

func _init():
	sceneID = "VionGlance"

func _run():
	if(state == ""):
		addCharacter("vion")
		playAnimation(StageScene.Duo, "stand", {npc="vion", npcAction="walk", flipNPC= true, further=true})
		saynn("Out the corner of your eye, a glint of light catches your attention. You look around for its source, and spot a lilac inmate wearing a pair of old-fashioned glasses that must have reflected the ceiling lights. Who wears glasses anymore? He's talking to another inmate about something.")

		saynn("[say=vion]...and if you want a refresher, do not hesitate to visit. I spend as much time as possible in my cell these days anyway, and I won't mind the company.[/say]")
		
		saynn("True to his word, now that his business is concluded he makes haste in the direction of the cellblocks.")

		saynn("[say=pc]I wonder what that was all about?[/say]")
		
		saynn("Well, you can always find out later. By the sounds of it, you can find this dragon in the lilac cellblock.")
		
		addButton("Leave", "No need to rush", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		setFlag("HypnokinkModule.DidVionGlance", true)
		endScene()
		return

	setState(_action)
