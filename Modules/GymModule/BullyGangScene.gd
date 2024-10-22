extends "res://Scenes/SceneBase.gd"

var gotPayed = false

func _init():
	sceneID = "BullyGangScene"

func _run():
	if(state == ""):
		addCharacter("gymbully")
		addCharacter("gymbully2")
		addCharacter("gymbully3")
		playAnimation(StageScene.Duo, "stand", {npc="gymbully"})

	if(state == ""):
		# (if first time)
		if(!getModuleFlag("GymModule", "Gym_BullyGangIntroduced")):
			setModuleFlag("GymModule", "Gym_BullyGangIntroduced", true)
			
			saynn("As you look around the gym area and think about what you wanna do, three inmates approach you from behind. Two guys and a girl. The main guy taps on your shoulder. You hear a very raspy male voice.")

			saynn("[say=gymbully]Hey, you. That’s right, I’m talking to you.[/say]")

			saynn("You turn around and see that they are all wearing red inmate uniforms but also red bands on their heads, probably a sign of being in the same gang.")

			saynn("[say=gymbully]Haven’t seen you here before. You aware of how things work here?[/say]")

			saynn("They don’t seem to be very kind to newcomers. You shake your head slightly.")

			saynn("[say=gymbully]We control this area, kiddo. And if you wanna be here you better pay up. Official price is 5 credits a day.[/say]")

			saynn("[say=pc]And what if I don’t?[/say]")

			saynn("[say=gymbully]Then you leave.[/say]")

			saynn("The girl barks at you from over the shoulder of the main guy.")

			# (if general inmate)
			if(GM.pc.getInmateType() == InmateType.General):
				saynn("[say=gymbully3]That’s right, general block bitch. Couldn’t even pull a trigger to earn yourself red clothes?[/say]")

			# (if red inmate)
			elif(GM.pc.getInmateType() == InmateType.HighSec):
				saynn("[say=gymbully3]Yeah, pay up or fuck off, bitch.[/say]")

			# (if lilac)
			elif(GM.pc.getInmateType() == InmateType.SexDeviant):
				saynn("[say=gymbully3]You better pay before you get shared between all the inmates here, lilac slut.[/say]")
		
		# (if not the first time)
		else:
			saynn("Three inmates approach you, the same ones that you remember. They make a circle around you.")

			saynn("[say=gymbully]You know why we’re here. Pay up or leave.[/say]")

		if(GM.pc.getCredits() >= 5):
			addButton("Pay", "Well, what can you do", "pay")
		else:
			addDisabledButton("Pay", "Not enough credits")
		addButton("Intimidate", "Tell them you won’t leave or pay", "intimidate")

	if(state == "pay"):
		saynn("You hand them a chip with some credits. The main guy quickly checks it and puts it away before offering you a smile.")

		saynn("[say=gymbully]Pleasure doing business with you.[/say]")

		saynn("The trio steps away from you and goes to bully someone else.")

		# (scene ends)
		addButton("Continue", "Sigh", "endthescene")

	if(state == "intimidate"):
		saynn("[say=pc]I’m not leaving. And I’m not paying. How about you and your sidekicks go bug someone else.[/say]")

		saynn("The main guy chuckles, others growl at you.")

		saynn("[say=gymbully]Let’s see how you will speak after we fuck your pretty face up.[/say]")

		addButton("Fight", "Time to fight", "fight")

	if(state == "if_won"):
		saynn("The gang members quickly scatter away as you beat their leader.")
		
		addButton("Continue", "Nice", "endthescene")

	if(state == "if_lost"):
		saynn("Defeated, you drop down to your knees. The gang members then shove you onto the ground and pin you while the main guy searches through your pockets.")

		saynn("[say=gymbully]Easy there, sweetheart. I’m not taking everything.[/say]")

		# (if has 5 credits)
		if(gotPayed):
			saynn("His hand finds a chip with 5 credits on you and takes it.")

			saynn("[say=gymbully]See. Enjoy yourself. For now.[/say]")

		# (if not enough)
		else:
			saynn("His hand was unable to find enough credits on you. He sighs.")

			saynn("[say=gymbully]I almost feel pitiful for taking your last credits away. But then again, the experience is worth more than money, ain’t that true.[/say]")


		addButton("Continue", "Ow", "endthescene")
		# (scene ends)

func _react(_action: String, _args):

	if(_action == "pay"):
		processTime(5 * 60)
		GM.pc.addCredits(-5)

	if(_action == "fight"):
		runScene("FightScene", ["gymbully"], "gymbullyfight")

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()
	
	data["gotPayed"] = gotPayed
	
	return data
	
func loadData(data):
	.loadData(data)
	
	gotPayed = SAVE.loadVar(data, "gotPayed", false)

func _react_scene_end(_tag, _result):
	if(_tag == "gymbullyfight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		#var wonHow = _result[1]
		
		if(battlestate == "win"):
			setState("if_won")
			addExperienceToPlayer(30)
		else:
			setState("if_lost")
			
			if(GM.pc.getCredits() >= 5):
				gotPayed = true
				GM.pc.addCredits(-5)
			else:
				gotPayed = false
			#addExperienceToPlayer(5)

func getDevCommentary():
	return "I was.. pretty out of it while writing this scene. That's why its so short and doesn't have any sex scenes and is kinda bad.\n\nThis scene is why I shouldn't write anything while I'm sad/depressed, heh. Should I remove it/rewrite it? Maybe. But to get rid of these bullies completely I would probably try to make a quest. Something about you and Nova teaming up and trying to destroy their gang.. or getting gangbanged x3 why not both"

func hasDevCommentary():
	return true
