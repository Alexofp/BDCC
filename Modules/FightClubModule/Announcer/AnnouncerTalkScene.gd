extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "AnnouncerTalkScene"

func _run():
	if(state == ""):
		addCharacter("announcer")
		GM.main.playAnimation(StageScene.Duo, "stand", {npc="announcer"})

	if(state == ""):
		saynn("You wait until Ans is free and get his attention.")

		saynn("[say=announcer]Hey there, babe[/say]")

		addButton("Talk", "Ask him some questions", "talk")
		addButton("Leave", "Enough talking", "endthescene")

	if(state == "talk"):
		saynn("[say=pc]Just wanted to talk, ask some things.[/say]")

		saynn("The guy leans against his fancy cane.")

		saynn("[say=announcer]Shoot.[/say]")

		addButton("Name", "Why is he called like that", "name")
		addButton("Staff", "Ask what happens if staff finds this place", "staff")
		addButton("Avy", "Ask about Avy", "avy")
		addButton("Back", "Enough questions", "")

	if(state == "name"):
		saynn("[say=pc]Why ‘The Announcer’?[/say]")

		saynn("He chuckles.")

		saynn("[say=announcer]Because of my voice I guess. Others just began calling me like that and I went with the flow.[/say]")

		saynn("[say=pc]Your voice would be perfect for radio.[/say]")

		saynn("He scratches the back of his head and smiles wider.")

		saynn("[say=announcer]Nah, I’m not a radio person, baby. Thanks anyway.[/say]")

		saynn("[say=pc]Who are you then? How did you end up here?[/say]")

		saynn("He looks down at his lilac clothes.")

		saynn("[say=announcer]Thought it was obvious. I’m a pimp, baby. I used to live on the streets, used to look after my girls. On a green ball of dirt called ‘The Earth’. Though right now the more fitting name for it would be ‘The Wasteland’[/say]")

		addButton("Continue", "Ask something else", "talk")

	if(state == "staff"):
		saynn("[say=pc]This place isn’t exactly legal. What will happen if the staff finds it?[/say]")

		saynn("The guy looks around.")

		saynn("[say=announcer]I have very little doubts about them not knowing about my place. I guess they prefer to look the other way? Your guess is as good as mine.[/say]")

		addButton("Continue", "Ask something else", "talk")

	if(state == "avy"):
		saynn("[say=pc]Who is Avy?[/say]")

		saynn("The guy leans on his cane.")

		saynn("[say=announcer]She handles organizing the fights. And she is also the grand champion of the arena. I guess I know how to pick the right person for the job.[/say]")

		saynn("[say=pc]No one has beaten her?[/say]")

		saynn("[say=announcer]Many tried. Some even succeeded. But she always returns, each time stronger than before.[/say]")

		addButton("Continue", "Ask something else", "talk")


func _react(_action: String, _args):
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

