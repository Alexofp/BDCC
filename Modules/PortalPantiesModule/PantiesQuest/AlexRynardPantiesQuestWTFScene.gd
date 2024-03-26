extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "AlexRynardPantiesQuestWTFScene"

func _run():
	if(state == ""):
		addCharacter("alexrynard")
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})

	if(state == ""):
		# (You yell angery at the foxy asking why are people using you through the panties)

		# (He shrugs and says someone must have stolen the fleshlighs. And that the inmates have them)

		# (Return them and you will get more coins and the ability to take off panties?)

		saynn("You suddenly lash out at the engineer and yell.")

		saynn("[say=pc]What the fuck?[/say]")

		saynn("Foxy looks you in the eyes and squints.")

		saynn("[say=alexrynard]What the fuck what?[/say]")

		saynn("You expose your portal panties and show them to him.")

		saynn("[say=pc]You said they will only do tests but now I’m getting fucked through them! Is that your idea?![/say]")

		saynn("Foxy opens his mouth and looks very-very surprised.")

		saynn("[say=alexrynard]Oh yeah. Forgot to tell you. Someone stole the prototypes.[/say]")

		addButton("WHAT", "The fuck", "what")

	if(state == "what"):
		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("[say=pc]What do you mean, where is my fucking pussy?![/say]")

		# (else)
		else:
			saynn("[say=pc]What do you mean, where is my fucking butthole?![/say]")

		saynn("Foxy smirks but then catches himself and just shrugs a few times.")

		saynn("[say=alexrynard]Don’t know, probably some inmates found it.[/say]")

		saynn("That makes you even more angry, you’re like a bomb that’s about to explode. Foxy sees that and adds.")

		saynn("[say=alexrynard]Tell you what. If you find the prototypes and return them to me I will give you credits, how about that.[/say]")

		saynn("You don’t know how to feel about that sudden offer.")

		saynn("[say=pc]Can’t you.. just turn the panties off?[/say]")

		saynn("Foxy shrugs again and offers you an innocent smile.")

		saynn("[say=alexrynard]Can’t, the magnetic locks can be disabled only on the other side. And you really don’t want me to create a singularity by tinkering with them now.[/say]")

		saynn("[say=pc]Great engineering..[/say]")

		saynn("He grabs you by the collar and pulls your head closer. He frowns.")

		saynn("[say=alexrynard]Hey. You're wearing a piece of technological art, bleeding edge stuff. Have some respect for the craft. A camera just reported a few inmates holding something that looks like a fleshlight in the cellblock, go and get it.[/say]")

		addButton("Fine", "Like you have any other choice", "fine")

	if(state == "fine"):
		saynn("You agree to his offer and leave. He mentioned something about the cellblock. Might be a good place to start searching.")

		# (scene ends)

		addButton("Continue", "What can you do", "endthescene")


func _react(_action: String, _args):
	if(_action == "fine"):
		addMessage("Task was updated")
		addExperienceToPlayer(30)
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

