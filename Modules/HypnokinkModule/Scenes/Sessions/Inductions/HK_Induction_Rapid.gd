extends "res://Modules/HypnokinkModule/Scenes/Sessions/HK_SessionInductionBase.gd"

func _init():
	sceneID = HK_Sessions.InductionRapid
	
func _initScene(_args = []):
	onInduction(_args)

func _run():
	if(state == ""):
		addCharacter("vion")
		playAnimation(StageScene.Duo, "sit", {npc="vion", npcAction="sit"})

		saynn("[say=vion]I think you've had enough practice by now, {pc.name}. Let's try shortcut this time. Sit down, lean back and close your eyes please.[/say]")

		saynn("{vion.name} sits opposite you as usual. You close your eyes as instructed.")

		saynn("[say=vion]Good. Relax, get comfortable. Take a deep breath.[/say]")

		saynn("You breathe in.")

		saynn("[say=vion]Now slowly breathe out.[/say]")

		saynn("You breathe out.")

		saynn("[say=vion]Now another deep breath in...[/say]")

		saynn("You breathe in...")

		saynn("[say=vion]And as you exhale...[/say]")

		saynn("[say=vion][b]Sleep.[/b][/say]")

		saynn("[say=vion]That's it. [b]Sleep.[/b] Fall deep into hypnosis. [b]Sleep.[/b] Go deeper for me. [b]Sleep.[/b] Even deeper. Let the calm mindlessness wash over you. [b]Sleep.[/b][/say]")

		saynn("Sleep...")

		saynn("[say=vion][b]Sleep.[/b][/say]")
		
		addButton("Sleep", "", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		afterInduction()
		return

	setState(_action)
	
