extends "res://Modules/HypnokinkModule/Scenes/Sessions/HK_SessionInductionBase.gd"

func _init():
	sceneID = HK_Sessions.InductionAlreadyHypnotized
	
func _initScene(_args = []):
	onInduction(_args)

func _run():
	if(state == ""):
		addCharacter("vion")
		playAnimation(StageScene.Duo, "sit", {npc="vion", npcAction="sit"})
		
		saynn("[say=Vion]Not much point in an induction if you're going to come to me already hypnotized, is there?[/say]")
		
		saynn("{Vion.He} sighs and guides you over to the sofa.")
		
		saynn("[say=Vion]Sit.[/say]")
		
		saynn("You sit down. {Vion.name} brings the chair over and seats himself directly opposite of you.")
		
		saynn("[say=Vion]And just to make sure... [b]Sleep.[/b][/say]")
		
		addButton("Sleep", "", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		afterInduction()
		return

	setState(_action)
