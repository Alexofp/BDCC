extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "EatInCanteenScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "sit")
		
		saynn("You get into the queue and wait. The canteen is always busy with hungry inmates, some sit alone but you spot quite a few groups too.")
		
		saynn("Finally you approach the counter. Behind it is a kitchen with a few cooks doing their job. A thick window blocks inmates from getting in.")

		saynn("The menu is not that huge, there is no menu actually, the only thing inmates get are some kind of grey paste on a plate.")

		saynn("You take the offered plate and a basic spoon. Then you look around and spot an empty table. You take a sit and begin to ponder if you're hungry enough.")

		addButton("Eat it", "Yummy", "doeat")
		addButton("Don't eat", "Yuck", "donteat")

			
	if(state == "doeat"):
		saynn("You take your time consuming the paste, it's practically tasteless but it's better than nothing.")
		
		addButton("Continue", "Stand up and continue on your way", "endthescene")
		GM.ES.triggerRun(Trigger.EatingInCanteen)
		
	if(state == "donteat"):
		saynn("You leave the plate without taking a single bite.")
		
		addButton("Continue", "Leave", "endthescene")
		GM.ES.triggerRun(Trigger.EatingInCanteen)

func _react(_action: String, _args):
	if(_action == "doeat"):		
		GM.pc.afterEatingAtCanteen()
		processTime(60 * 5)
		
		setFlag("Canteen_PlayerAteToday", true)
		
		if(GM.ES.triggerReact(Trigger.EatingInCanteen)):
			endScene()
			return
		
		addMessage("You got an energy boost and don't feel as hungry anymore.")


	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)
