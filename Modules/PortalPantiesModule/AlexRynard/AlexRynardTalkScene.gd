extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "AlexRynardTalkScene"

func _reactInit():
	if(GM.ES.triggerReact(Trigger.TalkingToNPC, ["alexrynard"])):
		endScene()
		return

func _run():
	if(state == ""):
		addCharacter("alexrynard")
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})

	if(state == ""):
		saynn("You approach the engineer foxy. His working place includes a chair but Alex is standing, he seems to be working on something. You sit on the corner of the work table and get his attention.")
		
		if(getFlag("AlexRynardModule.ch2CanEnterEngineering")):
			saynn("[say=alexrynard]Oh, hey there.[/say]")
		else:
			saynn("[say=alexrynard]What now?[/say]")

		addButton("Talk", "Talk about stuff", "talk")
		addButton("Appearance", "Look at the foxy", "appearance")
		if(GlobalRegistry.getItemIDsByTagSlow(ItemTag.SoldByAlexRynard).size() > 0):
			addButton("Buy", "See what you can buy from Alex", "buyscene")
		addButton("Leave", "That was enough talking", "endthescene")
		GM.ES.triggerRun(Trigger.TalkingToNPC, ["alexrynard"])
		

	if(state == "talk"):
		# (if before portal stuff)
		if(!getFlag("PortalPantiesModule.Panties_AskedAlex")):
			saynn("[say=pc]Just wanted to ask something.[/say]")

			saynn("[say=alexrynard]Gonna waste my time?[/say]")

			saynn("Seems like the foxy isn’t in his best mood. Or maybe he is just busy, there is still that prototype on his table.")

			addButton("Continue", "Oh well", "")
		# (if portal stuff happened)
		else:
			saynn("[say=pc]Just wanted to ask something.[/say]")

			saynn("[say=alexrynard]Shoot.[/say]")

			addButton("Engineer", "Ask about his role", "engineer")
			addButton("Bluespace", "What is bluespace", "bluespace")
			addButton("Him", "Why is he here", "him")
#ACEPREGEXPAC - New Talk scene about preg
			if(getFlag("AlexRynardModule.ch2FinalSceneHappened") && GM.pc.isVisiblyPregnant() || (getCharacter("alexrynard").isVisiblyPregnant())):
				addButton("Pregnancy", "All things related to pregnancy", "pregnancytalk")
			else:
				addDisabledButton("Pregnancy", "Alex should trust you enough.. and you should be pregnant, obviously")
			addButton("Back", "Enough talking", "")
			
	if(state == "engineer"):
		saynn("[say=pc]What do engineers do here?[/say]")

		saynn("Foxy relaxes in his chair.")

		saynn("[say=alexrynard]Many things. Obviously we repair anything that’s broken. By inmates or otherwise. We also power the main reactor of the station. Inmates mine enough uranium for the station to be fully self-sustainable.[/say]")

		saynn("Uranium, huh.")

		saynn("[say=pc]What if they don’t?[/say]")

		saynn("Foxy offers you a cold smile and then taps at your collar.")

		saynn("[say=alexrynard]These are our work too. Pretty nice, huh? Default versions of these are pathetic, they can barely keep themselves locked. Ours can track the wearer from the other side of the galaxy and also shock you to death.[/say]")

		saynn("You tug on your collar a little, all the extra functionality didn’t make them any more comfy for sure.")

		saynn("[say=pc]How are they doing that?[/say]")

		saynn("[say=alexrynard]Bluespace.[/say]")
		
		addButton("Continue", "Ask something else", "talk")

	if(state == "bluespace"):
		saynn("[say=pc]Uh, what exactly is Bluespace?[/say]")

		saynn("The foxy shows you some kind of dark blue crystal.")

		saynn("[say=alexrynard]It’s another dimension, linked to ours. We can theoretically transfer energy, electromagnetic waves and even matter through it using these crystals.[/say]")

		saynn("Huh. He is talking about teleportation. Can that be your way out?")

		saynn("[say=pc]It’s that easy?[/say]")

		saynn("[say=alexrynard]No, it’s not ‘that’ easy. Two crystals need to be configured to use the same frequency. And if you fuck up you will spawn a singularity instead.[/say]")

		saynn("Fascinating. And Terrifying.")
		
		addButton("Continue", "Ask something else", "talk")

	if(state == "him"):
		saynn("[say=pc]You seem smart. How did you end up here, in a space prison?[/say]")

		saynn("Foxy glances away for a second, you notice his neutral face expression.")

		saynn("[say=alexrynard]AlphaCorp sent me here, you don’t exactly get a choice.[/say]")

		saynn("[say=pc]You don’t seem to be happy about it.[/say]")

		saynn("He frowns.")

		saynn("[say=alexrynard]I’m fine.[/say]")

		saynn("He gives you a cold look. Asking the guy about it more will surely only anger him.")

		addButton("Continue", "Ask something else", "talk")

	if(state == "appearance"):
		saynn("The first thing that stands out when you look at the face of Alex Rynard are the two black squares under each of his eyes, a fancy little pattern that is quite unnatural. But otherwise, there is nothing special about him, medium height, strong build, emerald eyes, pointy and long canine muzzle with a black mark on it that all the foxes usually have. His fur is not very unique, white for the belly, cheeks, palms, digi feet and orange for the rest. Near his paws and toes the fur is visibly darker, pretty much losing all of its saturation. His long black hair is made into a careful ponytail.")

		saynn("Alex is wearing his engineer uniform, dark shirt and pants that are made out of some thick material and have a yellow trim to them. His only armor are the shoulder pads that give his outfit a slightly more assertive look. He is wearing a belt with many pouches but not a lot of tools.")

		saynn("Hard to tell but you do notice his pants bulging out slightly near the crotch, meaning there is probably a sheath with a canine cock hiding behind, all good on that front.")

		saynn("As he moves around you notice a quiet mechanical hum coming from him.")

		# (scene ends)
		addButton("Continue", "Enough staring", "")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		
	if(_action == "buyscene"):
		endScene()
		runScene("AlexBuySellScene", ["buymenu"])
		return
	if(_action == "pregnancytalk"):
		endScene()
		runScene("AlexPregTalkSceneAPE")
	setState(_action)

