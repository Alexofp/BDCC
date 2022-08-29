extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "CaughtForcedInmateBJ"

func _run():
	if(state == ""):
		addCharacter("inmateMale")

	if(state == ""):
		saynn("You feel somebody approaching you from behind. It was too late though, he unceremoniously grabs you by the hair by the hair and pulls you down onto your knees before shoving his knotted cock into your face. His grasp is pretty painful, you wince and let out an annoyed noise.")

		saynn("[say=inmateMale]Quit whining and open your fucking mouth already.[/say]")

		saynn("You can’t even get a good look of his face as he starts using you as some kind of whore, roughly shoving your face into his balls while the knotted shaft leaks precum onto your hair.")

		saynn("When you try to complain or escape he only slaps your face and pulls you towards his cock again, it seems he doesn’t mind being rough with you.")

		saynn("[say=inmateMale]Quit resisting, no one will save you.[/say]")

		addButton("Open mouth", "Let him use your throat willingly", "open_mouth")
		addButtonWithChecks("Shove away", "Use your strength to overpower him", "shove_away", [], [ButtonChecks.HasStamina, [ButtonChecks.StatCheck, Stat.Strength, 6]])


	if(state == "open_mouth"):
		saynn("You close your eyes and obey, lowering your resistance. As soon as you part your lips, you feel him shoving his canine cock past your teeth and down your throat, the guy clearly knows what he wants. You try to gasp but instead only choke on his shaft, the inmate gets a better grip on your hair before proceeding to fuck your face, shoving his dick in and out of your {pc.throatStretch} throat, stretching it out.")

		saynn("[say=pc]Gh-.. h.. mh..[/say]")

		saynn("[say=inmateMale]Yeah, whore, gag more, it feels fucking great.[/say]")

		saynn("It’s not like you have a choice, each time you try to breathe you feel your gag reflex triggering, causing you to make wet noises while your throat clenches around his shaft. Your blow job is sloppy but he seems to love it, the guy eagerly humps your face, bringing his peak closer. You might be getting used to it..")

		addButton("Cum", "Oh no, he is gonna cum", "cum")

	if(state == "cum"):
		saynn("The guy throws his head back and shoves his cock as deep as your throat allows, his knot is applying a great amount of pressure on your lips but that wasn’t enough to knot you. You spend a few seconds being his total cock slave before he suddenly starts to grunt and shooting his load directly down your throat.")

		saynn("It’s just too much, his cock steals your ability to breathe or even moan, your throat gets tighter around that shaft, milking it for all its cum.")

		saynn("As he starts to pull out, the last strings of his cum land into your opened mouth and onto your face, leaving quite a fancy mess. You’re forced to wear his facials and have a constant taste of his cock now.")

		saynn("[say=inmateMale]Yeah, swallow it all, bitch.[/say]")

		saynn("And just like that, he lets go of your hair and puts his cock away before leaving you alone.")

		# (scene ends)
		addButton("Continue", "See what happens next", "endthescene")


	if(state == "shove_away"):
		# (requires strength 6+, maybe stamina too)

		saynn("You manage to get a grasp on his fingers and pry them off one by one before shoving the guy away. He growls but doesn’t go further with you, instead showing off his sharp fangs before putting his cock away.")

		saynn("[say=inmateMale]Well go fuck yourself then.[/say]")

		# (scene ends)
		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):

	if(_action == "cum"):
		processTime(60*6)
		GM.pc.gotThroatFuckedBy("inmateMale")
		GM.pc.cummedInMouthBy("inmateMale")
		GM.pc.cummedOnBy("inmateMale")

	if(_action == "shove_away"):
		processTime(60*1)
		GM.pc.addStamina(-20)

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

