extends "res://Modules/HypnokinkModule/Scenes/Sessions/HK_SessionInductionBase.gd"

func _init():
	sceneID = HK_Sessions.InductionAlreadyHypnotized
	
func _initScene(_args = []):
	onInduction(_args)

func _run():
	if(state == ""):
		addCharacter("HK_Vion")
		playAnimation(StageScene.Duo, "sit", {npc="HK_Vion", npcAction="sit"})
		
		saynn("[say=HK_Vion]Not much point in an induction if you're going to come to me already hypnotized, is there?[/say]")
		
		saynn("{HK_Vion.He} sighs and guides you over to the sofa.")
		
		saynn("[say=HK_Vion]Sit.[/say]")
		
		saynn("You sit down. {HK_Vion.name} brings the chair over and seats himself directly opposite of you.")
		
		saynn("[say=HK_Vion]And just to make sure... [b]Sleep.[/b][/say]")
		
		addButton("Sleep", "", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		afterInduction()
		return

	setState(_action)
