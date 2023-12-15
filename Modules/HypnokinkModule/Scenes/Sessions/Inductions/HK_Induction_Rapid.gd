extends HK_SessionInductionBase

func _init():
	sceneID = HK_Sessions.InductionRapid
	
func _initScene(_args = []):
	onInduction(_args)

func _run():
	if(state == ""):
		addCharacter("Vion")
		playAnimation(StageScene.Duo, "sit", {npc="Vion", npcAction="sit"})

		saynn("[say=Vion]I think you've had enough practice by now, {pc.name}. Let's try shortcut this time. Sit down, lean back and close your eyes please.[/say]")

		saynn("{Vion.name} sits opposite you as usual. You close your eyes as instructed.")

		saynn("[say=Vion]Good. Relax, get comfortable. Take a deep breath.[/say]")

		saynn("You breathe in.")

		saynn("[say=Vion]Now slowly breathe out.[/say]")

		saynn("You breathe out.")

		saynn("[say=Vion]Now another deep breath in...[/say]")

		saynn("You breathe in...")

		saynn("[say=Vion]And as you exhale...[/say]")

		saynn("[say=Vion][b]Sleep.[/b][/say]")

		saynn("[say=Vion]That's it. [b]Sleep.[/b] Fall deep into hypnosis. [b]Sleep.[/b] Go deeper for me. [b]Sleep.[/b] Even deeper. Let the calm mindlessness wash over you. [b]Sleep.[/b][/say]")

		saynn("Sleep...")

		saynn("[say=Vion][b]Sleep.[/b][/say]")
		
		addButton("Sleep", "", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		afterInduction()
		return

	setState(_action)
	
