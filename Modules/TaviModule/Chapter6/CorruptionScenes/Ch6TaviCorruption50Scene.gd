extends SceneBase

func _init():
	sceneID = "Ch6TaviCorruption50Scene"

func _run():
	if(state == ""):
		addCharacter("tavi")
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("Today feels.. different. You step into Tavi's cell and find her just standing near her bed, her back pressed against one of the walls.")

		saynn("[say=pc]Hey there, Tavi. You look like..[/say]")

		saynn("She directs her gaze towards you and.. smiles.")

		saynn("[say=pc]You look like yourself. Almost.[/say]")

		saynn("Tavi tilts her head to the side slightly, her little smirk keeps shining brightly.")

		saynn("[say=tavi]I feel better, yeah. Whatever you're doing to me.. it seems to be working.[/say]")

		saynn("She pushes herself away from the wall and starts stepping around you, swaying her hips.")

		saynn("[say=tavi]And you.. Have you forgotten how to call me already?[/say]")

		saynn("[say=pc]Miss Tavi?[/say]")

		saynn("She giggles softly, her paw sliding over your shoulder, threatening to sink its claws.")

		saynn("[say=tavi]How about you.. say it fully. On your knees obviously~.[/say]")

		addButton("Kneel", "Kneel before Tavi", "do_kneel")
		addButton("Make me", "You're not gonna kneel willingly", "make_me")
	if(state == "do_kneel"):
		playAnimation(StageScene.Duo, "kneel", {npc="tavi"})
		saynn("You kneel before Tavi and lower your chin.")

		saynn("[say=pc]You are Miss Tavi. And I am your pet.[/say]")

		saynn("Her clawed paw grabs you by the chin and makes you look up at her. Her dominant aura is strong.")

		saynn("[say=tavi]Much better~. Thank you.[/say]")

		saynn("She scritches you under the chin.")

		saynn("[say=tavi]I need to think about our next move.. So for now.. I'm still yours.[/say]")

		saynn("She helps you to get up. It seems, Tavi has managed to overcome her constant heat.. or maybe she is just hiding it really well.")

		addButton("Continue", "See what happens next", "start_talking")
	if(state == "make_me"):
		playAnimation(StageScene.Duo, "defeat", {npc="tavi"})
		saynn("You decide to test Tavi a little bit.")

		saynn("[say=pc]Make me.[/say]")

		saynn("Something flashes in Tavi's eyes as her paws suddenly find their way to your hair. A second later and you're already kneeling before her, your hair strands held firmly by her paw.")

		saynn("[say=tavi]Better~?[/say]")

		saynn("[say=pc]Ow.. ow ow-ow..[/say]")

		saynn("Tavi leans in closer, her sharp fangs out on display. The pain makes you quickly change your mind.")

		saynn("[say=pc]You're Miss Tavi. You're my miss. And I'm your pet![/say]")

		saynn("[say=tavi]Much better~. Thank you.[/say]")

		saynn("She lets go of the hair and scritches you under the chin instead.")

		saynn("[say=tavi]I need to think about our next move.. So for now.. I'm still yours.[/say]")

		saynn("It seems, Tavi has managed to overcome her constant heat.. or maybe she is just hiding it really well.")

		addButton("Continue", "See what happens next", "start_talking")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_kneel"):
		processTime(3*60)

	if(_action == "make_me"):
		processTime(3*60)

	if(_action == "start_talking"):
		runScene("Ch6TaviTalkScene")
		endScene()
		return

	setState(_action)
