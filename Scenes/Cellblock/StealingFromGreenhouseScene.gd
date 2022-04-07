extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "StealingFromGreenhouseScene"

func _run():
	if(state == ""):
		saynn("You approach the greenhouses, each one looks like a huge long tent with lots of artificial lights inside. You have to sneak around cause at any moment you can spotted by the workers or some guard.")
		
		saynn("The station seems to be growing quite a variety of fruits and vegetables but you also notice some mushrooms and different types of alien plants and herbs, most of which are unknown to you.")

		saynn("You decide that it's too dangerous to try and sneak inside one but you notice a few wooden crates left out in the open. You guess that it wouldn't be too hard to open one but you might be caught during it.")
		
		saynn("What do you wanna do?")

		addButton("Steal an apple", "Try and open the apple crate", "apple")
		addButton("Don't steal", "Too dangerous", "endthescene")

			
	if(state == "apple"):
		saynn("You manage to pry open one of the crates and steal a few apples. Time to make escape.")
		
		addButton("Continue", "Try to escape without being seen", "caughtcheck")

func _react(_action: String, _args):
	if(_action == "apple"):
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("appleitem"))
		if(RNG.chance(50)):
			GM.pc.getInventory().addItem(GlobalRegistry.createItem("appleitem"))
			addMessage("You stole 2 apples")
		else:
			addMessage("You stole an apple")
	
	if(_action == "caughtcheck"):		
		processTime(10 * 5)
		
		if(RNG.chance(80)):
			if(GM.ES.trigger(Trigger.CaughtStealingInGreenhouse)):
				endScene()
				return
		endScene()
		addMessage("Seems like you got away safely")
		return


	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)
