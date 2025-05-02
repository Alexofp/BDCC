extends SceneBase

func _init():
	sceneID = "DrugDenStartScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "stand")
		
		saynn("You're standing in front of an abandoned maintenance vent that will lead you down to the underground drug den.")
		
		saynn("You will have to leave all your items here. They will be returned to you after the run. Your stats/perks will also be temporary reset while you're there.")
		
		var highestLevel:int = int(GM.main.getFlag("DrugDenModule.HighestDrugDenLevel", 0))
		sayn("Highest reached level: "+str(highestLevel))
		
		var raidedLabsAmount:int = int(GM.main.getFlag("DrugDenModule.RaidedLabs", 0))
		saynn("Amount of drug labs that you have looted/destroyed: "+str(raidedLabsAmount))
		
		saynn("Do you wanna start a new run?")
		
		addButton("New run", "Start exploring the tunnels", "do_start")
		addButton("Cancel", "You changed your mind!", "endthescene")

	if(state == "do_start"):
		aimCameraAndSetLocName(GM.pc.getLocation())
		
		saynn("You stash your belongings in the designated stash and squeeze into the maintenance vent...")
		
		saynn("A wave of harsh, chemical-laced air floods your lungs. It clings to your senses, dulling your mind and sapping your strength. This will take some adjusting..")
		
		saynn("Very soon you begin to lose your bearings. Every tunnel starts looking the same.. and the darkness doesn't help either. Here is hope that Eliza's nanobots will work..")
		
		addButton("Continue", "Time to do this", "endthescene_markfirst")
	
	
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	if(_action == "endthescene_markfirst"):
		endScene()
		setFlag("DrugDenModule.FirstTimeHappened", true)
		return
	if(_action == "do_start"):
		GM.main.DrugDenRun = DrugDen.new()
		GM.main.DrugDenRun.start()


	setState(_action)
