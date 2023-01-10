extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "AlexRynardStartPantiesQuestScene"

func _run():
	if(state == ""):
		addCharacter("alexrynard")
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})

	if(state == ""):
		# (You say that the mining stuff is boring and if you can somehow help and earn credits other ways)

		# (Foxy hmms and comes up with a thing while looking at the prototype)

		# (Foxy asks you to bring female panties, normal ones)

		saynn("You let out an audible sigh and try to get Foxy’s attention. He seems to be very busy with his current project.")

		saynn("[say=pc]Hey. Just wanted to ask if there is some other way to earn credits.[/say]")

		saynn("Foxy nods a few times, pretending to pay attention but his eyes are busy reading some manual. You try to pose a little bit, maybe he just needs a little seduction?")

		saynn("[say=pc]You know, working in mines all day kinda sucks.[/say]")

		saynn("Now it's his turn to sigh. He looks at you and your body then barks out a sentence with a sarcastic tone.")

		saynn("[say=alexrynard]You wanna fuck with me in exchange for credits?[/say]")

		saynn("You gasp.")

		saynn("[say=pc]No, no, what are you even saying? Of course not.. Unless?[/say]")

		saynn("He rolls his eyes and shakes his head.")

		saynn("[say=alexrynard]Can’t you see I’m busy? I need to test this latest prototype.[/say]")

		saynn("[say=pc]Well.. Can I help?[/say]")

		saynn("[say=alexrynard]How some slutty inmate can even possibly help me test this bluespace matter transfer device.. wait.. hmm..[/say]")

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		saynn("The foxy holds one of the devices in his hands, it looks like a flat ring with some kind of aperture in the middle and a slot for some crystal.")

		saynn("[say=alexrynard]I have an idea. Bring me some panties. Female ones.[/say]")

		saynn("You raise your brow at that sudden strange request. Is this foxy secretly a panty sniffer?")

		saynn("[say=pc]Uh. Like, used ones?[/say]")

		saynn("[say=alexrynard]I need some for the tests, weirdo. New ones, old ones, I don’t care. Just get me some generic panties. Check the laundry.[/say]")

		saynn("You shrug.")

		saynn("[say=pc]Fine. I will find some.[/say]")

		addButton("Continue", "That was easy", "endthescene")


func _react(_action: String, _args):
	if(_action == "continue"):
		addMessage("New task has been added")
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

