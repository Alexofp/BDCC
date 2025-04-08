extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "NovaTalkScene"

func _reactInit():
	if(GM.ES.triggerReact(Trigger.TalkingToNPC, ["nova"])):
		endScene()
		return

func _run():
	if(state == ""):
		addCharacter("nova")
		playAnimation(StageScene.Duo, "stand", {npc="nova", npcAction="stand"})
	if(state == ""):
		if(!GM.main.getModuleFlag("NovaModule", "Nova_Introduced")):
			GM.main.setModuleFlag("NovaModule", "Nova_Introduced", true)
			saynn("You walk up to some guard that seems to be patrolling the yard area. First thing you notice is her canine features and a feminine body. Gray fur and curly tail help you identify her as a husky. She is armored and her armor seems to be quite advanced, even requiring something that looks like a little nuclear power generator on her back. Under it you spot a fancy stealthy bodysuit and a short black skirt.")

			saynn("She is fidgeting with her stun baton when her eyes spot you. She stops her patrol and directs her full attention at you.")

			# (if seen before)
			if(GM.main.getModuleFlag("NovaModule", "Nova_SawPC")):
				saynn("[say=nova]I remember you, little rascal.[/say]")

				# (if humiliated nova)
				if(GM.main.getModuleFlag("NovaModule", "Nova_GotHumiliatedByPC")):
					saynn("[say=pc]Yeah, and I remember humiliating you.[/say]")

					saynn("[say=nova]Well, you kno-o-ow. You win some, you lose some. Sometimes losing is fun too~[/say]")

			# (else)
			else:
				saynn("[say=nova]Huh, a new face. I hope you’re behaving~.[/say]")

			saynn("The husky flings her weapon at you and then masterfully catches it before you can realize, what a show off. She is only one step away from you now.")

			saynn("[say=nova]I’m Nova in case you didn’t know, the best guard in this prison. And you..[/say]")

			saynn("[say=pc]Inmate number {pc.inmateNumber}.[/say]")

			saynn("[say=nova]Nah, dummy, leave that one to the asshole staff.[/say]")

			saynn("She eyes you out as she walks around you with a playful sway to her hips.")

			saynn("[say=nova]I’m one of the kind ones~.[/say]")

			saynn("She stops in front of you and boops you on the nose. She giggles at your confused reaction.")

		else:
			if(getCharacter("nova").isVisiblyPregnant()):
				saynn("Nova is patrolling the yard area, holding one of her paws on her belly. She notices you and offers you a careful smile.")
				
				saynn("[say=nova]"+RNG.pick([
					"Huff, so strange to be carrying a litter.",
					"I’m gonna be a good mommy..",
					"Do you have treats? I want treats..",
					"I’m gonna be better than my parents.",
					"I’m doing okay, thanks for checking.",
				])+"[/say]")
			else:
				saynn("Nova is patrolling the yard area, like she usually does. She notices you and gives you a careful look.")

				saynn("[say=nova]What’s up.[/say]")

		addButton("Talk", "Ask Nova about things", "talk")
		addButton("Appearance", "Look at Nova", "appearance")
		#ACEPREGEXPAC - Nova can now Dom player while preggers
		addButton("Lewd", "Offer yourself to Nova", "lewd")
#		if(!getCharacter("nova").isVisiblyPregnant()):
#			addButton("Lewd", "Offer yourself to Nova", "lewd")
#		else:
#			addDisabledButton("Lewd", "Can't offer yourself to Nova while she is pregnant")
		addButton("Leave", "Time to go", "endthescene")
		GM.ES.triggerRun(Trigger.TalkingToNPC, ["nova"])


	if(state == "appearance"):
		saynn("Nova is one of the guards, medium height, gray fur, amber eyes. Her hair is somewhat short, not even reaching the shoulders, one of the hair strands has a strong blue tint to it. Long canine muzzle, perky ears, curled up fluffy tail, Nova has all the signs of a husky. She must have pretty strong muscles to be able to wear the power armor that she has. Underneath it is a skin-tight bodysuit and a black short skirt. Her stun baton is attached with a strap to the leg.")

#ACEPREGEXPAC - Comment if Nova is heavily preggers
		if(getCharacter("nova").isHeavilyPregnant()):
			saynn("Nova is quite clearly pregnant with her bodysuit stretched as tight as it is. Her arm rests atop her stomach, covering her enlarged chest.")
		
		# (is pregnant, changed to elif by ace)
		elif(getCharacter("nova").isVisiblyPregnant()):
			saynn("Nova’s belly is visibly inflated, good thing that her bodysuit is stretchy enough. Her breasts gained an extra size and are probably full of milk.")
		
		# (else)
		else:
			saynn("Nova’s breasts are a solid D-cup, encased in a stealthy black material.")

		saynn("Sneaking a glance underneath her skirt you can spot both a bulge and an outline of a pussy, this guard is packing quite some heat.")

		addButton("Back", "Enough watching", "")

	if(state == "talk"):
		saynn("[say=nova]What are you curious about.[/say]")

		saynn("She raises her brow and crosses her arms.")

		addButton("Kind?", "Is she really kind", "kind?")
		addButton("Job", "Ask why she is working here", "job")
		addButton("Body", "Compliment her body", "body")
		addButton("Back", "Enough talking", "")

	if(state == "kind?"):
		saynn("[say=pc]How are you the kind one?[/say]")

		saynn("Nova chuckles and offers you a headpat.")

		saynn("[say=nova]If any inmate is kind to me then I’m kind to them. I know how rough prison life can be.[/say]")

		saynn("Her paw slides down your cheek and then gets a good grasp on your collar.")

		saynn("[say=nova]But if they ever lie to me. Or betray me. I won’t be kind to that, believe me~.[/say]")

		saynn("She scritches you under the chin and behind the ear.")

		saynn("[say=nova]What it’s gonna be with you, sweetie~?[/say]")

		saynn("You decide that a respectful silence is good enough for an answer. Nova smiles and licks her fangs.")

		addButton("Continue", "Ask something else", "talk")

	if(state == "job"):
		saynn("[say=pc]So why work here?[/say]")

		saynn("Nova looks at her wrists, at her armor.")

		saynn("[say=nova]I didn’t exactly have a choice. But you know, it has some perks. I get to play with so many cuties. Some even call me mommy~.[/say]")

		saynn("You look surprised, Nova chuckles at your reaction.")

		addButton("Continue", "Ask something else", "talk")

	if(state == "body"):
		saynn("[say=pc]How did you get into such strong shape, are you working out a lot?[/say]")

		saynn("Nova shrugs.")

		saynn("[say=nova]Sometimes. But nah. It’s a long story, sweetie. I appreciate the compliment~.[/say]")

		addButton("Continue", "Ask something else", "talk")
		
	if(state == "lewd"):
		saynn("You get closer to Nova and put on a cheeky smile while rubbing against her. You sway your {pc.masc} hips and the husky eventually joins you, her expression shows that she likes it.")
		
		saynn("[say=nova]Someone is horny~?[/say]")
		
		if(!GM.pc.hasBlockedHands()):
			saynn("Boldy, you sneak a hand under Nova’s skirt and put it on her crotch. She chuckles softly as you grope the sheath that is hidden under her suit.")
		
		addButton("Petplay", "Offer to be Nova’s pet for a bit", "petplay")
		addButton("Never mind", "You don't want anything", "")
		

func _react(_action: String, _args):

	if(_action == "petplay"):
		runScene("NovaPetplayScene")
		endScene()
		return

	if(_action == "endthescene"):
		endScene()
		return

	
	setState(_action)
