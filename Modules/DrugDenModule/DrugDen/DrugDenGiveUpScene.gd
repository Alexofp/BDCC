extends SceneBase

func _init():
	sceneID = "DrugDenGiveUpScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "stand")
		
		saynn("Are you sure you want to give up?")
		
		addButton("Give up", "Enough exploring", "do_give_up")
		addButton("Cancel", "You changed your mind!", "endthescene")

	if(state == "do_give_up"):
		playAnimation(StageScene.Solo, "kneel")

		saynn("You decide to stop exploring this place and just wait..")
		
		saynn("Eventually you get so hungry and tired that you can't keep your eyes open anymore. You collapse completely..")

		saynn("The last thing you see is some kind of blue glow surrounding you..")
		
		addButton("Continue", "See what happens next", "stop_run")
	
	if(state == "stop_run"):
		playAnimation(StageScene.Sleeping, "sleep")
		addCharacter("eliza")
		aimCameraAndSetLocName("medical_hospitalwards")
	
		saynn("[say=eliza]Wakey-wakey![/say]")
		
		saynn("You open your eyes.. and realize that you're somewhere in the medical wing.")
		
		saynn("[say=eliza]Nanobots worked like a charm! I treated some of your injuries while you were taking a nap. Eat this muffin too, you're starving![/say]")
	
		saynn("She gives you a muffin. You eat it immediately. It tastes like the best thing you have ever eaten in your life.")
	
		saynn("[say=pc]Thanks..[/say]")
		
		saynn("She points at a drawer near your hospital bed.")
		
		saynn("[say=eliza]All your things are in there.[/say]")
		
		saynn("You get up, grab all your belongings and prepare to follow Eliza.")
		
		addButton("Follow", "See where she will bring you", "back_to_lobby")
		
	if(state == "back_to_lobby"):
		GM.pc.setLocation("med_lobbymain")
		aimCameraAndSetLocName("med_lobbymain")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		
		saynn("Eliza brings you out into the lobby.")
		
		saynn("[say=eliza]Take care now![/say]")
		
		addButton("Continue", "Time to go!", "endthescene")
		addButton("Run back", "Rush back to the hidden drug den entrance", "endthescene_rushback")
	
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	if(_action == "endthescene_rushback"):
		GM.pc.setLocation("yard_deadend2")
		endScene()
		return
	if(_action == "do_give_up"):
		GM.main.processTimeUntil(23*60*60)
	if(_action == "stop_run"):
		GM.pc.setLocation("medical_hospitalwards")
		GM.main.stopDungeonRun()
		GM.pc.addPain(-GM.pc.getPain())
		GM.pc.addLust(-GM.pc.getLust())
		GM.pc.addStamina(GM.pc.getMaxStamina())



	setState(_action)
