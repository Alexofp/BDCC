extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "JackiFirstEncounterScene"


func _run():
	if(state == ""):
		addCharacter("jacki")
		
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="jacki", npcAction="defeat"})
		
		# (Happens randomly when walking through the yard area. Level must be 5 or above)

		saynn("As you traverse the yard area an unknown inmate runs into you. A female wolfy from a general block. She was jogging around following the stone tiles path when she accidentally clips your shoulder and trips as a result.")

		saynn("[say=jacki]Oh shit.[/say]")

		saynn("She doesn’t exactly look threatening, just a fit-looking wolfy. She winces and rubs her head.")

		addButton("Help her up", "Be friendly about it", "help_her_up")
		addButton("Watch it", "Be mean about it", "watch_it")


	if(state == "help_her_up"):
		setFlag("JackiModule.Jacki_FirstTimeWasKind", true)
		playAnimation(StageScene.Duo, "stand", {npc="jacki"})
		
		saynn("[say=pc]Are you hurt?[/say]")

		saynn("You crouch near and quickly look over to see if she has any bruises. She seems fine.")

		saynn("[say=jacki]No, I’m good. Thanks.[/say]")

		saynn("You offer her a hand. She grabs it and gets up with your help.")

		saynn("[say=jacki]Just annoyed. Saw some bullies in the bathroom, be careful there. Can’t even go pee.[/say]")

		addButton("Offer help", "Maybe you can go investigate", "offer_help")
		addButton("Okay", "Good to know", "okay")


	if(state == "offer_help"):
		saynn("[say=pc]I can go take a look. Maybe I can deal with them.[/say]")

		saynn("Wolfy shrugs, one of her paws casually rests on her shorts.")

		saynn("[say=jacki]Sure, that would be nice. I gotta run though.[/say]")

		saynn("You nod and let her jog away before you lose her silhouette between some tall bushes.")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")


	if(state == "okay"):
		saynn("[say=pc]I guess I will avoid it for now, thanks.[/say]")

		saynn("Wolfy offers you a simple smile.")

		saynn("[say=jacki]You’re welcome. I gotta run though.[/say]")

		saynn("You nod and let her jog away before you lose her silhouette between some tall bushes.")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")


	if(state == "watch_it"):
		setFlag("JackiModule.Jacki_FirstTimeWasMean", true)
		
		saynn("[say=pc]Watch it, pipsqueak.[/say]")

		saynn("The wolfy looks at you and frowns.")

		saynn("[say=jacki]I can say the same to you.[/say]")

		saynn("She proceeds to try to get up.")

		addButton("Let her", "Her reaction is acceptable", "let_her")
		addButton("Pin her", "Show that girl her place", "pin_her")


	if(state == "let_her"):
		playAnimation(StageScene.Duo, "stand", {npc="jacki"})
		
		saynn("You cross your arms and just watch her get up. The wolfy swipes the dust from her inmate uniform and mostly looks calm.")

		saynn("[say=pc]I’m telling you, next time I will not let it slide.[/say]")

		saynn("[say=jacki]Are you one of those bullies? Your friends have occupied the bathroom, can’t even go pee.[/say]")

		saynn("Huh. You have no idea what friends she is talking about. But before you can say anything the wolfy just escapes you, her silhouette disappears between some tall bushes.")

		# (scene ends)
		addButton("Continue", "Time to go", "endthescene")


	if(state == "pin_her"):
		setFlag("JackiModule.Jacki_FirstTimeWasMeanPinned", true)
		
		saynn("Instead of just letting her get up you shove her before pinning into the cold stone tiles. The wolfy gasps feeling your tight grip on her collar and then snarls at you.")

		saynn("[say=pc]You choose the wrong person to be cocky with. I can make you suffer, oh so much.[/say]")

		saynn("These words had an effect on her, instead growling the wolfy just tilts her head down and whimpers quietly.")

		saynn("[say=jacki]My bad.[/say]")

		saynn("Well that’s probably as good of an apology as you're gonna get. You get up and help the wolfy do the same by pulling on her collar.")

		saynn("[say=jacki]Ow.. Having a really bad day today. First the bullies in the bathroom. Now this.[/say]")

		saynn("[say=pc]Get used to it.[/say]")

		saynn("The wolfy swipes the dust from her inmate uniform and just jogs away, her silhouette disappears between some tall bushes.")

		# (end scene)
		addButton("Continue", "Time to go", "endthescene")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		processTime(60*15)
		
		return

	setState(_action)

