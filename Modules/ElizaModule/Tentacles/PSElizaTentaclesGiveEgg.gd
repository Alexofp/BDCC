extends SceneBase

func _init():
	sceneID = "PSElizaTentaclesGiveEgg"

func _run():
	if(state == ""):
		addCharacter("eliza")
		saynn("[say=pc]About the eggs..[/say]")

		saynn("[say=eliza]Yes, with all the current DNA that we have, it will cost us "+str(getModule("ElizaModule").getTentaclesCostStr())+" to produce a perfect specimen.[/say]")

		addButton("Enough", "Enough talking about this", "endthescene")
		if (GM.pc.getInventory().hasItemID("PlantEgg")):
			addButton("Give egg", "Give Eliza another egg!", "give_egg")
		else:
			addDisabledButton("Give egg", "You don't have any plant eggs in your inventory")
		if (GM.pc.getCredits() >= getModule("ElizaModule").getTentaclesCost()):
			addButton("Pay "+getModule("ElizaModule").getTentaclesCostStr()+"", "Pay this many credits to create a perfect egg", "begin_stuff")
		else:
			addDisabledButton("Pay "+getModule("ElizaModule").getTentaclesCostStr(), "You don't have this many credits..")
	if(state == "give_egg"):
		saynn("You give Eliza one of your plant eggs.")

		saynn("[say=eliza]Perfect. Now it should cost us only "+str(getModule("ElizaModule").getTentaclesCostStr())+" to produce a perfect specimen.[/say]")

		saynn("You nod.")

		addButton("Continue", "See what happens next", "")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "give_egg"):
		getModule("ElizaModule").addTentacleEgg()
		GM.pc.getInventory().removeXOfOrDestroy("PlantEgg", 1)
		addMessage("Total amount of eggs given is "+str(getFlag("ElizaModule.tent_eggs", 0)))

	if(_action == "begin_stuff"):
		GM.pc.addCredits(-getModule("ElizaModule").getTentaclesCost())
		runScene("PSElizaTentaclesBorn")
		setFlag("ElizaModule.tent_born", true)
		endScene()
		return

	setState(_action)
