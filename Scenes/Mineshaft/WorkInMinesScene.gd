extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "WorkInMinesScene"

func _run():
	if(state == ""):
		saynn("((There will be a longer first-time mining scene))")
		
		saynn("You grab a pickaxe and go deep into the mines")

		addButton("Work", "Do the work", "work")
	
	if(state == "work"):
		saynn("You spend a few hours, pushing minecarts around and mining rocks. You feel tired as heck but you earned a few work credits")
		
		addButton("Continue", "Finally rest", "endthescene")

func _react(_action: String, _args):
	if(_action == "work"):
		
		GM.pc.addCredits(10)
		GM.pc.addStamina(-40)
		
		processTime(2*60*60)
		
		addMessage("You earned 10 work credits")

	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)
