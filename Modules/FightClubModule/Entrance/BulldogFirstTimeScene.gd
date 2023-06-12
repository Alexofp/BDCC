extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "BulldogFirstTimeScene"

func _run():
	if(state == ""):
		addCharacter("bulldog")
		playAnimation(StageScene.Duo, "stand", {npc="bulldog"})

	if(state == ""):
		saynn("Being very curious, you decide to wander closer to the only soul nearby. The high security inmate quickly notices you, he is of a canine species with his face reminding you of a bulldog. His maw is squashed but also angry-looking with fangs clearly visible.")

		saynn("He is leaning against a concrete wall with his buff arms crossed, waiting for your move.")

		addButton("Ask", "Try to get some information", "ask")

	if(state == "ask"):
		saynn("[say=pc]So what are you doing here?[/say]")

		saynn("The buff dude stretches his shoulder and rubs his flat snout before snorting at you.")

		saynn("[say=bulldog]I don’t recognize your face. Fuck off.[/say]")

		saynn("Huh, that was a strange reaction. You decide to stop bugging the mean guy for now and just look around. The only unique properties about this piece of land is how out of the way it is and also a lonely maintenance hatch on one of the walls which doesn’t seem to be powered.")

		saynn("When you focus your gaze on the hatch and try to take a step towards it, you hear growling coming from the dude.")

		saynn("[say=pc]Are you guarding that? What’s behind it?[/say]")

		saynn("[say=bulldog]I told you to fuck off.[/say]")

		saynn("Seems like this guy is not the sharing type.")

		addButton("Intimidate", "Maybe some punches can make him talk", "intimidate")
		addButton("Seduce", "A sweet word or two can make anyone melt", "seduce")
		addButton("Wait", "Just wait and see what happens.", "wait")

	if(state == "intimidate"):
		saynn("[say=pc]Talk is cheap. Gonna keep barking at me, dog?[/say]")

		saynn("The bulldog cracks his neck and flexes his muscles before pushing himself away from the wall. He walks up to you, his chest is like a wall by itself shoving you back. Seems like it’s a fight.")

		addButton("Someone!", "Someone steals your attention", "someone!")

	if(state == "seduce"):
		saynn("[say=pc]You are being awfully mean for such a handsome-looking guy.[/say]")

		saynn("You put arms over your {pc.masc} thighs and slowly approach the guy while putting extra sway into your motions. The bulldog squints, his brows frown. But maybe he just needs some extra convincing.")

		addButton("Someone!", "Someone steals your attention", "someone!")

	if(state == "wait"):
		saynn("You decide not to anger the guy even and just step back. Though you don’t leave completely, you just watch from afar. The bulldog didn’t seem to like that, he sees you spying on him and begins stepping towards your spot while flexing his muscles and cracking his neck and knuckles.")

		saynn("[say=pc]Aww, c’mon. I’m just watching.[/say]")

		saynn("Seems like the fight is inevitable.")

		addButton("Someone!", "Someone steals your attention", "someone!")

	if(state == "someone!"):
		addCharacter("announcer")
		
		saynn("[say=announcer]La-a-adies![/say]")

		saynn("Suddenly another person shows up and steals your and the bulldog's attention. He is a pure human, a very unusual species around here. Black skin, short dark hair, trimmed dark beard. His uniform is that of a lilac inmate. He stops near you and pats the bulldog on the back.")

		saynn("[say=announcer]And gentleman. And everyone in-between, of course, I don’t discriminate.[/say]")

		saynn("The bulldog guy quickly loses his angry temper and nods to the unknown person.")

		saynn("[say=bulldog]Welcome, Mr. Ans. Everyone is waiting for you.[/say]")

		saynn("[say=announcer]Yes-yes, so rude of me to be this late.[/say]")

		saynn("The bulldog focuses his angry gaze at you for a second before going back to the maintenance hatch and loudly knocking on it a few times. After some time, the bulky metal maintenance hatch opens up and the human guy steps in. Though he then turns towards you and spreads his arms slightly.")

		saynn("[say=announcer]Hey there, baby, no time to talk but. I see you wondering about this place. ‘Fraid you will have to take on this challenge to find out. The victories are so-o-o much more sweet if you have to work for them.[/say]")

		saynn("His voice is so deep and soothing, your only thought is that he would do great on radio. The guy bows to you and starts unbuttoning his uniform shirt, clearly in a hurry.")

		saynn("[say=announcer]Bulldog, let them in when you think they are worthy.[/say]")

		saynn("And with that, the human starts heading deeper into the darkness. The bulldog blocks the path and closes the hatch behind him. He crosses his arms again and gazes at you.")

		addButton("Ask", "What can you do to enter", "ask1")

	if(state == "ask1"):
		removeCharacter("announcer")
		
		saynn("[say=pc]So what do you want?[/say]")

		saynn("The bulldog frowns again and scratches his chin.")

		saynn("[say=bulldog]Fifty creds.[/say]")

		saynn("Oh.")

		saynn("[say=pc]50 credits? That’s a lot.[/say]")

		saynn("The guy shrugs. Well, that’s something.")

		addButton("Continue", "See what happens next", "starttalk")


func _react(_action: String, _args):
	if(_action in ["intimidate", "seduce", "wait", "someone!"]):
		processTime(RNG.randi_range(5, 10) * 60)
	
	if(_action == "starttalk"):
		runScene("BulldogTalkScene")
		endScene()
		return
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func getDevCommentary():
	return "Bulldog.. I just needed someone who would guard the entrance to the underground.. And bulldog is that someone x3. Some people seemed to enjoy his content enough to want more. But he is literally just a wall.\n\nIf you ever watched the Caravan Palace - Lone Digger music video, this bulldog would be the bouncer of that club x3"

func hasDevCommentary():
	return true
