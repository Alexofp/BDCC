extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "BulldogTalkScene"

func _reactInit():
	if(GM.ES.triggerReact(Trigger.TalkingToNPC, ["bulldog"])):
		endScene()
		return

func _run():
	if(state == ""):
		addCharacter("bulldog")
		playAnimation(StageScene.Duo, "stand", {npc="bulldog"})

	if(state == ""):
		saynn("You stand before the guy that is basically a walking wall. He is blocking the path to some kind of special maintenance hatch.")

		addButton("Pay", "Use your credits to pay the guy", "trypay")
		addButton("Intimidate", "Try to fight the guy. This will be a very tough one", "intimidate")
		if(!getFlag("FightClubModule.BulldogSeduced")):
			addButtonWithChecks("Sex?", "Offer to pay with your body. This will be very rough..", "sex?", [], [[ButtonChecks.StatCheck, Stat.Sexiness, 5]])
		else:
			addDisabledButton("Sex?", "You already seduced him..")
		addButton("Leave", "You don't feel like talking", "endthescene")
		GM.ES.triggerRun(Trigger.TalkingToNPC, ["bulldog"])

	if(state == "pay"):
		saynn("[say=pc]How much was it again?[/say]")

		saynn("The guy turns more grumpy.")

		saynn("[say=bulldog]Fifty creds.[/say]")
		
		if(GM.pc.getCredits() >= 50):
			addButton("Pay 50 credits", "Give him your hard earned credits", "pay_50_credits")
		else:
			addDisabledButton("Pay 50 credits", "You don't have that much..")
		addButton("Naah", "You don't wanna pay", "")

	if(state == "pay_50_credits"):
		saynn("You pull out a credit chip that contains 50 credits and hand it to the guy. He quickly checks it and puts it away.")

		saynn("[say=pc]What now?[/say]")

		saynn("The dude smirks and turns around. He then starts pounding on the hatch with some kind of specific pattern. Three slow thumps and two fast ones.")

		saynn("After a few seconds, the hatch opens. And the guy allows you to walk in. Finally.")

		addButton("Walk in", "See what this place is about", "walk_in")

	if(state == "pay_25"):
		# (after seducing)

		saynn("[say=pc]So.. it was 20, wasn’t it?[/say]")

		saynn("The guy chuckles.")

		saynn("[say=bulldog]Don’t oversell yourself. Twenty five.[/say]")

		if(GM.pc.getCredits() >= 25):
			addButton("Pay 25 credits", "Give him your hard earned credits", "pay_25_credits")
		else:
			addDisabledButton("Pay 25 credits", "You don't have that much..")
		addButton("Naah", "You don't wanna pay", "")

	if(state == "pay_25_credits"):
		saynn("You pull out a credit chip that contains 25 credits and hand it to the guy. He quickly checks it and puts it away.")

		saynn("[say=pc]What now?[/say]")

		saynn("The dude smirks and turns around. He then starts pounding on the hatch with some kind of specific pattern. Three slow thumps and two fast ones.")

		saynn("After a few seconds, the hatch opens. And the guy allows you to walk in. Finally.")

		addButton("Walk in", "See what this place is about", "walk_in")


	if(state == "intimidate"):
		saynn("[say=pc]How about I beat you up instead?[/say]")

		saynn("Bulldog stretches his shoulders and spits to the side.")

		saynn("[say=bulldog]How about you stop barking at me and do the thing.[/say]")

		saynn("Seems like it’s a fight.")

		addButton("Fight", "Let's do this", "startfight")

	if(state == "if_won"):
		saynn("Defeated, the bulldog growls as he hits the floor.")

		saynn("[say=pc]So. Am I worthy or do you need your ass kicked more?[/say]")

		saynn("The dude coughs and softly chuckles at your words, his voice sounds so raspy.")

		saynn("[say=bulldog]You’re worthy alright.[/say]")

		saynn("He leans back and reaches for the maintenance hatch. He pounds 5 times on it, 3 times slowly and 2 fast. After a few seconds, the door opens up, allowing you to come in. At last.")

		# (scene ends)

		addButton("Walk in", "See what this place is about", "walk_in")

	if(state == "if_lost"):
		saynn("You lose the fight and collapse down to your knees.")

		saynn("[say=bulldog]That was stupid.[/say]")

		saynn("You are too weak to continue. He grabs you by the collar and uses his strength to toss you away.")

		# (scene ends)
		addButton("Continue", "Ow", "getthrownout")


func _react(_action: String, _args):
	if(_action == "walk_in"):
		processTime(3*60)
		setFlag("FightClubModule.BulldogBypassed", true)
		GM.pc.setLocation("fight_entrance")
		endScene()
		runScene("FightClubIntroScene")
		return
	
	if(_action == "pay_50_credits"):
		GM.pc.addCredits(-50)
	if(_action == "pay_25_credits"):
		GM.pc.addCredits(-25)
	
	if(_action == "sex?"):
		runScene("BulldogSexScene")
		setFlag("FightClubModule.BulldogSeduced", true)
		endScene()
		return
	
	if(_action == "trypay"):
		if(!getFlag("FightClubModule.BulldogSeduced")):
			setState("pay")
		else:
			setState("pay_25")
		return
	
	if(_action == "startfight"):
		runScene("FightScene", ["bulldog"], "bulldogfight")
	
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "getthrownout"):
		GM.pc.setLocation("gym_yoga")
		endScene()
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "bulldogfight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		#var wonHow = _result[1]
		
		if(battlestate == "win"):
			setState("if_won")
			setFlag("FightClubModule.BulldogBeatenUp", true)
			addExperienceToPlayer(100)
		else:
			setState("if_lost")
			#addExperienceToPlayer(5)
