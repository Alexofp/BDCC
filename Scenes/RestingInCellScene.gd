extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "RestingInCellScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Sleeping, "sleep")
		
		saynn("You lay down on your stiff prisoner bed and let out a tired sigh.")
		
		saynn("What do you wanna do?")

		addButton("Stand up", "No time for resting", "endthescene")

		addButton("Sleep", "Sleep until the next day and recover your stamina", "gosleep")

		var currentTime = GM.main.getTime()
		for t in [8, 10, 12, 14, 16, 18, 20, 22]:
			if(currentTime < t*60*60):
				addButton("Rest %02d:00" % [t], "Wake up when the time becomes %02d:00" % [t], "restuntil", [t])
			else:
				addDisabledButton("Rest %02d:00" % [t], "Too late for that today")
			
	if(state == "rested"):
		saynn("You spend some time in your cell. You feel less tired.")
		
		addButton("Continue", "Time to wake up", "endthescene")
		
	if(state == "slept"):
		playAnimation(StageScene.Sleeping, "sleep", {bodyState={naked=true}})
		
		saynn("You slept in your cell. It's not the most pleasent experience but you managed to recover your energy.")
		
		saynn("You wake up when all the prison lights begin to turn on.")
		
		saynn("Welcome to day "+str(GM.main.getDays())+" of your sentence.")
		
		addButton("Continue", "Time to wake up", "endthesceneandtriggerevents")
		
		GM.ES.triggerRun(Trigger.WakeUpInCell)

func _react(_action: String, _args):
	if(_action == "restuntil"):
		var newt = _args[0]
		
		var timePassed = GM.main.processTimeUntil(newt * 60 * 60)
		GM.pc.afterRestingInBed(timePassed)
		
		if(GM.ES.triggerReact(Trigger.Waiting, [timePassed])):
			endScene()
			return
		
		setState("rested")
		return
		
	if(_action == "gosleep"):
		GM.main.startNewDay()
		GM.pc.afterSleepingInBed()
		
		if(GM.ES.triggerReact(Trigger.SleepInCell)):
			pass
		
		setState("slept")
		return

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "endthesceneandtriggerevents"):
		GM.pc.updateAppearance()
		
		if(GM.ES.triggerReact(Trigger.WakeUpInCell)):
			GM.main.showLog()
			endScene()
			return
		GM.main.showLog()
		
		endScene()
		return
	
	setState(_action)
