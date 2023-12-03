extends SceneBase

func _init():
	sceneID = "AlexCh2s2BackstoryScene"

func _run():
	if(state == ""):
		addCharacter("alexrynard")
		playAnimation(StageScene.Duo, "sit", {npc="alexrynard", npcAction="sit"})
		saynn("[say=pc]I do.[/say]")

		saynn("Alex leans back, a quiet metal clang can be heard when he rests against the stiff bench.")

		saynn("[say=alexrynard]Well.. I was young. Very-very young.[/say]")

		saynn("He starts telling you his story.. and you can't help but to get immersed into it..")

		addButton("Continue", "See what happens to Alex", "start_story")
	if(state == "start_story"):
		removeCharacter("alexrynard")
		addCharacter("captain")
		playAnimation(StageScene.Duo, "stand", {pc="alexrynardy", npc="captain"})
		saynn("[say=alexrynard]Listen, the only reason why I'm here is because it's my break, Mister Wright.[/say]")

		saynn("[say=captain]Of course, I won't take up much of your time. But I think you'd be very interested in my little proposal. Shall we?[/say]")

		saynn("He offers to take seats behind the table.")

		saynn("[say=alexrynard]Sure, make it quick.[/say]")

		addButton("Take a seat", "Talk with him", "sit_behind_table")
	if(state == "sit_behind_table"):
		playAnimation(StageScene.Duo, "sit", {pc="alexrynardy", npcAction="sit", npc="captain"})
		saynn("You and Mr. Wright are sitting opposite each other. A waitress approaches you two.")

		saynn("[sayFemale]Are you guys ready to order?[/sayFemale]")

		saynn("[say=captain]Yeah, I wouldn't mind a cup of coffee.[/say]")

		saynn("The waitress looks at you.")

		saynn("[sayFemale]What about you, Alex? The usual?[/sayFemale]")

		saynn("You place your lunchbox onto the table.")

		saynn("[say=alexrynard]Yeah, I'm good.[/say]")

		saynn("[say=captain]Scratch that, give us 2 coffee cups please.[/say]")

		saynn("[sayFemale]Oh, sure. Two coffees coming right up.[/sayFemale]")

		saynn("Waitress swiftly leaves with the order. You open the lunchbox and grab a sandwich.")

		saynn("[say=alexrynard]Hope you don't mind. I'm hungry as fuck.[/say]")

		saynn("Mister Wright nods.")

		saynn("[say=captain]I'm thinking of starting a little initiative. I was given an opportunity and I don't wanna waste it. I think we share that in common.[/say]")

		saynn("[say=alexrynard]Yeah, sure. What do I have to do with that?[/say]")

		saynn("You take a big bite, your thoughts are focused completely elsewhere at the moment.")

		saynn("[say=captain]I need people. There will be a lot of work. Engineering work especially. We're talking big, space station big.[/say]")

		saynn("[say=alexrynard]Uh huh.[/say]")

		saynn("The waitress returns with 2 coffees and a shiny smile.")

		saynn("[say=captain]Thank you.[/say]")

		saynn("[sayFemale]If you need anything else, let me know~.[/sayFemale]")

		saynn("[say=captain]Of course.[/say]")

		saynn("Mister Wright sips some of the coffee.")

		saynn("[say=captain]I can't share all of the details. AlphaCorp secret. But I think I can offer a better pay then whatever you're earning currently. We can talk numbers if you want.[/say]")

		saynn("You take another good bite and top it off with a gulp of free coffee. At least you got something out of this.")

		saynn("[say=alexrynard]Listen, I'm truly sorry. But I'm so fucking busy currently, you can't even imagine it. Whatever you can offer me is nothing compared to what I might get here.[/say]")

		saynn("He listens carefully and nods, his expression neutral.")

		saynn("[say=captain]You're talking about the AlphaTech Expo?[/say]")

		saynn("[say=alexrynard]Yeah, man. First place will get unlimited funding for their project. Can you imagine it? Can you offer me more than infinity?[/say]")

		saynn("He sighs.")

		saynn("[say=captain]I can't. My offer comes with less risks though. And work that you would enjoy. I know that words won't change your mind. But I suggest you consider it anyway.[/say]")

		saynn("You quickly finish the rest of your sandwich and drink as much coffee as your mouth can endure.")

		saynn("[say=alexrynard]I'm working on my dream already, you won't be able to top that.[/say]")

		saynn("You stand up, preparing to leave.")

		saynn("[say=captain]That's true. Well, if you ever change your mind..[/say]")

		saynn("[say=alexrynard]Yeah, never.[/say]")

		addButton("Continue", "See what happens next", "alex_intro_engine")
	if(state == "alex_intro_engine"):
		removeCharacter("captain")
		playAnimation(StageScene.Duo, "stand", {npc="lin_alex"})
		addCharacter("lin_alex")
		saynn("You swiftly exit the station's canteen and follow the many tight corridors back to your current workplace, an old spaceship hangar that was remodeled into a big workshop.")

		saynn("In the middle of it.. it's heart.. a half-disassembled rocket engine. Around it.. your team. Everyone seems to be working. Good.")

		saynn("[say=alexrynard]Alright, I'm back. How are we doing? Is everything ready for a test-run?[/say]")

		saynn("[say=lin_alex]Yeah, the boys are doing some finishing touches. How did your meeting go?[/say]")

		saynn("Lin tilts her head ever so slightly, her sly foxy eyes staring at you.")

		saynn("[say=alexrynard]The guy wanted me to stop doing what I'm doing and go work for him. He is crazy.[/say]")

		saynn("She chuckles softly.")

		saynn("[say=lin_alex]Maybe we are the crazy ones and just don't see it?[/say]")

		saynn("[say=alexrynard]We got the purest sample. This is a once in a lifetime opportunity.[/say]")

		saynn("She sees your raw passion.. and admires it.")

		saynn("[say=lin_alex]You're right. Just.. don't overwork yourself, Al. Don't forget what really matters. Also..[/say]")

		saynn("She reaches her paw and caresses your cheek, her digit then slides over your lips.")

		saynn("[say=lin_alex]You got something there. Piece of a sandwich, heh.[/say]")

		saynn("[say=alexrynard]Thanks.[/say]")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
