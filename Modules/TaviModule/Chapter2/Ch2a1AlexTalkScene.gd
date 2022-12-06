extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "Ch2a1AlexTalkScene"


func _run():
	if(state == ""):
		addCharacter("alexrynard")
		
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		
		saynn("[say=pc]Can I ask a question?[/say]")

		saynn("Foxy rolls his eyes and just continues working on his current project, not really paying much attention to you.")

		saynn("[say=alexrynard]I need to get this done, be quick.[/say]")

		saynn("[say=pc]My bad, just wanted to ask something about bluespace. I’m very fascinated by it. But if you’re not knowledgeable I can ask someone else.[/say]")

		saynn("He cuts you off before you can even finish the sentence.")

		saynn("[say=alexrynard]Actually, I am The Guy if you need to know something about bluespace.[/say]")

		addButton("Bluespace transmitter", "It’s worth a shot", "bluespace_transmitter")

	if(state == "bluespace_transmitter"):
		saynn("[say=pc]I heard there were problems with the bluespace transmitter? It probably wasn’t easy to repair. Good job.[/say]")

		saynn("He stays quiet and emotionless for a few seconds. You really hope he doesn’t start asking questions back. But he doesn’t even look at you, just talking while tinkering with some electronic board.")

		saynn("[say=alexrynard]Transmitter? It wasn’t broken. Its core, the bluespace crystal, is fine. It just lost power. The battery was busted so I had to connect it to the main grid. And that was a pain.[/say]")

		saynn("Interesting. Maybe you can get more out of him by playing dumb.")

		saynn("[say=pc]Pain? I like pain.[/say]")

		saynn("You put on a cheeky smile too. He looks at you and shakes his head.")

		saynn("[say=alexrynard]Not that kind of pain you masochist. It was just annoying. Too little power means the bluespace crystal doesn’t respond. Too much power sends out an EMP impulse.[/say]")

		addButton("EMP?", "Ask more about it", "emp?")

	if(state == "emp?"):
		saynn("[say=pc]EMP? Doesn’t that.. break electronics?[/say]")

		saynn("[say=alexrynard]It does, I felt every mistake. Well, my spine did.[/say]")

		saynn("Huh. Indeed. If you listen closely, the foxy’s back is making mechanical noises as he leans to grab a multitool.")

		saynn("[say=alexrynard]That’s why the transmitter is kept in a cave, away from any tech. Great thing about bluespace, it doesn’t care if you’re in open space or under a huge ass rock, the signal is always perfect.[/say]")

		saynn("Cave huh.")

		saynn("[say=pc]A cave sounds dangerous. What if inmates stumble upon it when mining?[/say]")

		saynn("[say=alexrynard]They can’t, there is only one corridor that leads to it. Inmates can’t get to it cause we control it.[/say]")

		saynn("That was almost too easy. You nod and leave the foxy alone, he probably won’t tell you the exact location anyway.")

		# (task updated)

		# (Scene ends)
		addButton("Leave", "Time to go", "endthescene")


func _react(_action: String, _args):
	if(_action == "emp?"):
		addMessage("Task updated")
		addExperienceToPlayer(10)
	
	if(_action == "endthescene"):
		endScene()
		processTime(60*5)
		return

	setState(_action)

