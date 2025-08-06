extends SceneBase

func _init():
	sceneID = "PSMilkCafeGameplayScene"

func _run():
	if(state == ""):
		#playAnimation(StageScene.Solo, "stand")
		setCharactersEasyList(GM.main.PS.getCharacterList())
		
		say(GM.main.PS.getFinalText())
		var theActions:Array = GM.main.PS.getFinalActions()
		for actionEntry in theActions:
			var theIndx:int = actionEntry[0]
			var isEnabled:bool = (actionEntry[1] != "")
			var actionName:String = actionEntry[2]
			var actionDesc:String = actionEntry[3]
			
			if(theIndx < 0):
				if(!isEnabled):
					addDisabledButton(actionName, actionDesc)
				else:
					addButton(actionName, actionDesc, "doAction", [actionEntry])
			else:
				if(!isEnabled):
					addDisabledButtonAt(theIndx, actionName, actionDesc)
				else:
					addButtonAt(theIndx, actionName, actionDesc, "doAction", [actionEntry])
	if(state == "end_credits"):
		saynn("YOU WON!")
		addButton("Continue", "See what happens next", "doEnd")
	if(state == "end_annoying"):
		saynn("YOU ANNOYED THE OWNERS UNTIL THEY DECIDED TO LET YOU GO! YOU WON.")
		addButton("Continue", "See what happens next", "doEnd")
	if(state == "end_breaklock"):
		saynn("YOU BROKE THE LOCK AND ESCAPED!")
		addButton("Continue", "See what happens next", "doEnd")
	if(state == "end_officer"):
		playAnimation(StageScene.Duo, "kneel", {npc="psmilkofficer", npcAction="sit", bodyState={leashedBy="psmilkofficer"}})
		saynn("The officer brings you onto his ship and shows you around. Quite spacious for a ship that doesn't require any extra crew..")

		saynn("There is only one bedroom though.. but you're not complaining.. anything is better than sleeping in the old freezer. And the idea of sleeping with your new owner is actually quite appealing.")

		saynn("After a quick ship tour, he plants his butt into the captain's chair.. and invites you to kneel nearby.")

		saynn("[say=psmilkofficer]Hold tight.[/say]")

		saynn("He guides the ship out of the docks.. and directs it towards the many colorful stars.")

		saynn("Freedom. Well.. kinda.")

		addButton("Continue", "See what happens next", "officer_choice")
	if(state == "officer_choice"):
		saynn("After setting the course, the autopilot grabs the controls, allowing the officer to focus on something else. He grabs a laptop and starts using it.")

		saynn("[say=psmilkofficer]You know.. I've typed a report here. All I have to do is press 'Send'. But I promised to not get them into trouble.[/say]")

		saynn("You tilt your head.")

		saynn("[say=psmilkofficer]So I will delete it. But I gotta go visit the toilet first.[/say]")

		saynn("He gives you a quick headpat.. and gets up, leaving his laptop on his chair.")

		saynn("When he is gone, you decide to take a peek.")

		saynn("It's a report about a space cafe.. the one you were in. It explains how its owners are holding illegal slaves and using them to profit. There is some proof attached.. some photos.")

		addButton("Send it", "Send the report", "officer_send")
		addButton("Do nothing", "Just sit still", "officer_nosend")
	if(state == "officer_send"):
		saynn("You press the giant 'Send' button.")

		saynn("The screen tells you that the report has been submitted successfully.")

		saynn("Soon, your owner returns.")

		saynn("[say=psmilkofficer]Hah. Oops. Looks like it got accidentally sent. Oh well. Wasn't me, it's the tech's fault.[/say]")

		saynn("He closes the laptop and kisses you on the cheek.")

		addButton("Continue", "See what happens next", "officer_goodlife")
	if(state == "officer_nosend"):
		saynn("You decide against pressing that button and just wait for your owner to come back.")

		saynn("Soon, he does.")

		saynn("[say=psmilkofficer]Well, I guess that's the right thing.[/say]")

		saynn("He deletes the report and closes his laptop.. before giving you a kiss on the cheek.")

		addButton("Continue", "See what happens next", "officer_goodlife")
	if(state == "officer_goodlife"):
		saynn("You spend the next few months traveling around the galaxy with your owner. Over time, you learned more about him.. and he learned more about your time at BDCC.")

		saynn("His meetings were quite draining.. but at least he knew he could always use you to drain his balls.")

		saynn("Nobody knew that a high-ranking AlphaCorp officer had a personal pet living on his ship.. officially that is. Unofficially.. people obviously had their suspicions. Why else would his ship need a bluespace signal jammer installed?")

		saynn("Still, it was fun. Like you were living a dream.")

		saynn("Sadly, all good things eventually come to an end and dreams are no exception.")

		saynn("[say=psmilkofficer]I'm sorry, cutie pie. They really are after me. If they find out, I will lose my seat in seconds.. end up out of the street. Or worse.. on a battlefield.[/say]")

		saynn("You're kneeling near his chair, your usual spot. The wolf is scritching you behind the ears.")

		saynn("[say=psmilkofficer]I don't care too much about it.. but I don't even want to know what they will do with you. And yeah.. I hate that I can't even show you off to anyone. I hate that you're sitting here all day, in this cage of a ship.[/say]")

		saynn("You can see a few lonely tears streaming down his cheeks.")

		saynn("[say=psmilkofficer]I could release you.. but your collar will just ping your location to the nearest AlphaCorp patrol. It won't work. Nothing will.[/say]")

		saynn("He looks into your eyes.")

		saynn("[say=psmilkofficer]It pains me to say it.. but I think you'd be happier back in your prison. I hope you're not angry at me.[/say]")

		saynn("You nuzzle his leg.")

		saynn("[say=pc]It's okay, really. I'm glad we shared so much time together.[/say]")

		saynn("His cheeks get even more wet.")

		saynn("He nods.")

		addButton("Continue", "See what happens next", "officer_back_interogation")
	if(state == "officer_back_interogation"):
		removeCharacter("psmilkofficer")
		addCharacter("intro_detective")
		aimCameraAndSetLocName("intro_interogation")
		playAnimation(StageScene.Solo, "sit")
		saynn("Hours later, you're already sitting in the familiar chair.. just a little less clothed this time.")

		saynn("[say=intro_detective]So you're saying that you don't know how you managed to evade our search for multiple months?[/say]")

		saynn("[say=pc]Yep.[/say]")

		saynn("He rolls his pen on his clawed digit.")

		saynn("[say=intro_detective]You're not giving me a lot to work with. It's in our best interest to paint the whole picture. The judges, if they see a blindspot, they will assume the worst.[/say]")

		saynn("[say=pc]Tell the judges to buy some buttplugs. They will need them.[/say]")

		saynn("Jake tilts his head slightly at first.. but then his expression switches to a very mean one.")

		addButton("Continue", "See what happens next", "in_bdcc")
	if(state == "in_bdcc"):
		aimCameraAndSetLocName(GM.pc.getLocation())
		playAnimation(StageScene.Duo, "stand", {npc="risha"})
		removeCharacter("intro_detective")
		addCharacter("risha")
		saynn("A few moments later..")

		saynn("[say=risha]Here is your shit.[/say]")

		saynn("At least.. you don't have to start from zero.")

		saynn("[say=risha]Be glad that I decided against just throwing it all out.[/say]")

		saynn("You nod.")

		saynn("You're back in your cell. Home, sweet home.")

		addButton("Continue", "See what happens next", "endthescene")
	
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "doAction"):
		var result:Dictionary = GM.main.PS.doFinalAction(_args[0])
		if(result.has("fight")):
			runScene("FightScene", [result["fight"]], "fight_scene")
		elif(result.has("sex")):
			runScene("GenericSexScene", result["sex"], "sex_scene")
		elif(result.has("end")):
			setState(result["end"])
		else:
			if(!GM.main.checkTFs()):
				GM.main.showLog()
		return

	if(_action == "doEnd"):
		GM.main.stopPlayerSlavery()
		GM.pc.setLocation(GM.pc.getCellLocation())
		endScene()
		return

	if(_action == "in_bdcc"):
		GM.pc.setLocation(GM.pc.getCellLocation)
		GM.main.stopPlayerSlavery()
		addMessage("All your items were returned to you.")

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "sex_scene"):
		GM.main.PS.processSexEnd(_result[0])
	if(_tag == "fight_scene"):
		var battlestate = _result[0]
		GM.main.PS.processFightEnd(battlestate == "win")
