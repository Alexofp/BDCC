extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "WorkInMinesScene"

func _run():
	if(state == ""):
		saynn("You grab a pickaxe and go deep into the mines.")

		addButton("Work", "Do the work", "work")
	
	if(state == "work"):
		saynn("You spend a few hours, pushing minecarts around and mining rocks. You feel tired as heck but you earned something at least.")
		
		addButton("Continue", "Finally rest", "endthescene")

		GM.ES.triggerRun(Trigger.WorkingInMines)

func _react(_action: String, _args):
	if(_action == "work"):
		
		GM.pc.addCredits(1)
		GM.pc.addStamina(-40)
		
		processTime(2*60*60)
		
		if(GM.ES.triggerReact(Trigger.WorkingInMines)):
			endScene()
			return
		
		addMessage("You earned 1 work credit")

	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)
