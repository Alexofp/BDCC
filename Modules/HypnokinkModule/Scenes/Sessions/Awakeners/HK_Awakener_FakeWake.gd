extends "res://Modules/HypnokinkModule/Scenes/Sessions/HK_SessionAwakenerBase.gd"

func _init():
	sceneID = HK_Sessions.AwakenerFakeWake

func _initScene(_args = []):
	onAwakener()
	
func _run():
	if(state == ""):
		addCharacter("vion")
		playAnimation(StageScene.Duo, "stand", {npc="vion", npcAction="stand"})

		saynn("[say=vion]Now that that's taken care of...[/say]")

		saynn("Vion hooks a claw under your collar.")

		saynn("[say=vion]Stand up. Nice and slow. On your feet.[/say]")

		saynn("You rise, Vion guiding you up by dragging your collar.")

		saynn("[say=vion]I should probably wake you up, but...[/say]")

		saynn("[say=pc]Mmh?[/say]")

		saynn("You stand there, gently swaying side to side as he contemplates.")

		saynn("[say=vion]I think it'd be more fun for you if I were to not bother, hmm? Open your eyes, but stay in trance as you do so~[/say]")

		saynn("Your eyelids flutter open, and you stare in Vion's commanding eyes.")

		saynn("[say=vion]That's right. From the outside, you will just look tired, maybe like you've been having too much [i]fun[/i]. But on the inside... your mind will remain the comfortable, thoughtless mush it is right now. Feels nice, doesn't it? Nod for me.[/say]")

		saynn("You nod...")
		
		addButton("Continue", "", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		afterAwakener()
		return

	setState(_action)
