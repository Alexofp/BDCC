extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "AnnouncerFirstTimeTalkScene"

func _run():
	if(state == ""):
		addCharacter("announcer")
		playAnimation(StageScene.Duo, "stand", {npc="announcer"})

	if(state == ""):
		saynn("You stand near the steps that lead to the balcony where the announcer stands and decide to grab his attention by waving. You have to talk loudly since it’s a pretty crowded space.")

		saynn("[say=pc]Hey![/say]")

		saynn("The guy lets out a soft gasp as he notices you, he puts his cane away and approaches you, his hands spread open, welcoming you.")

		saynn("[say=announcer]Oh hey, baby, you made it. Welcome to my little secret paradise. A place where the law is restrained and bred to create true freedom![/say]")

		saynn("He taps on your shoulder softly.")

		saynn("[say=announcer]Had any problems with our guard?[/say]")

		# (if just payed)
		if(!getFlag("FightClubModule.BulldogBeatenUp") || !getFlag("FightClubModule.BulldogSeduced")):
			saynn("[say=pc]Well, I had to pay him quite a bit.[/say]")

			saynn("The announcer chuckles.")

			saynn("[say=announcer]A worthy sacrifice, don’t you think.[/say]")

		# (if beat him)
		elif(getFlag("FightClubModule.BulldogBeatenUp")):
			saynn("[say=pc]Had to beat him up. Hope you don’t mind.[/say]")

			saynn("The announcer chuckles.")

			saynn("[say=announcer]Means you are worthy to be here. He will be fine, the guy enjoys a good fight.[/say]")

		# (if seduced and payed)

		elif(getFlag("FightClubModule.BulldogSeduced")):
			saynn("[say=pc]Uh.. Had to do some negotiations with him.[/say]")

			saynn("The announcer chuckles.")

			saynn("[say=announcer]Oh really? I wonder how that looked.[/say]")

		saynn("He puts his arm over your shoulder and walks you away from the loud crowd. You enter some secluded place that looks like his office. He takes off his purple coat, now not looking any different from any lilac.")

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		saynn("He suddenly gasps and bows to you.")

		saynn("[say=announcer]Excuse my poor manners. People usually address me as ‘The Announcer’. You can just call me Ans.[/say]")

		saynn("[say=pc]I’m {pc.name}[/say]")

		saynn("The guy walks to one of his metal cabinets and pulls out a fancy portsigar. He lights up some expensive-looking bulky cigar and starts casually smoking it. The tone of his voice gets even more lower as he makes his first puff.")

		saynn("[say=announcer]My pleasure. I’m very happy to offer my services.[/say]")

		saynn("[say=pc]So this is some kind of fighting club?[/say]")

		saynn("[say=announcer]Indeed it is. Although I prefer to think about it as a secret society. A place that works entirely differently from the rest of the world while staying in a shadow of the current corrupt regime.[/say]")

		saynn("[say=pc]Yeah, I heard about the rules. Anyone can participate?[/say]")

		saynn("The announcer walks up to you and sends another puff of smoke to the side before proceeding to eye you out.")

		saynn("[say=announcer]If you feel like entertaining the crowd while earning some creds and rep, of course. Just be aware of what will happen if you lose.[/say]")

		saynn("You raise your brow and catch his gaze.")

		saynn("[say=pc]What will?[/say]")

		saynn("The guy chuckles softly and taps on your shoulder again.")

		saynn("[say=announcer]Anything. Killing the opponent is not allowed but anything else.. We’re here to give the crowd a good time, baby, that is all that matters. Go talk to Avy if you wanna test your skills.[/say]")

		saynn("You nod and prepare to leave his office.")

		# (scene ends)

		addButton("Continue", "Leave", "endthescene")


func _react(_action: String, _args):
	if(_action in ["continue"]):
		processTime(RNG.randi_range(5, 10) * 60)
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

