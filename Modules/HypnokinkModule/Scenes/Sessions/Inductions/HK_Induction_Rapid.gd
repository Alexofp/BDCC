extends HK_SessionInductionBase

func _init():
	sceneID = HK_Sessions.InductionRapid
	
func _initScene(_args = []):
	onInduction(_args)

func _run():
	if(state == ""):
		addCharacter("HK_Vion")
		playAnimation(StageScene.Duo, "sit", {npc="HK_Vion", npcAction="sit"})

		saynn("[say=HK_Vion]I think you've had enough practice by now, {pc.name}. Let's try shortcut this time. Sit down, lean back and close your eyes please.[/say]")

		saynn("{HK_Vion.name} sits opposite you as usual. You close your eyes as instructed.")

		saynn("[say=HK_Vion]Good. Relax, get comfortable. Take a deep breath.[/say]")

		saynn("You breathe in.")

		saynn("[say=HK_Vion]Now slowly breathe out.[/say]")

		saynn("You breathe out.")

		saynn("[say=HK_Vion]Now another deep breath in...[/say]")

		saynn("You breathe in...")

		saynn("[say=HK_Vion]And as you exhale...[/say]")

		saynn("[say=HK_Vion][b]Sleep.[/b][/say]")

		saynn("[say=HK_Vion]That's it. [b]Sleep.[/b] Fall deep into hypnosis. [b]Sleep.[/b] Go deeper for me. [b]Sleep.[/b] Even deeper. Let the calm mindlessness wash over you. [b]Sleep.[/b][/say]")

		saynn("Sleep...")

		saynn("[say=HK_Vion][b]Sleep.[/b][/say]")
		
		addButton("Sleep", "", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		afterInduction()
		return

	setState(_action)
	
