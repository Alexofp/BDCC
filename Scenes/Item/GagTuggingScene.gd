extends "res://Scenes/SceneBase.gd"


func _init():
	sceneID = "GagTuggingScene"

func _run():
	if(state == ""):
		#var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(sceneArgs[0])
		
		saynn("You stop and focus your attention on your gag. It consist out of a leather harness, a part that goes into your mouth and a sturdy little padlock")
		
		saynn("It's locked so you can't just take it off but maybe you can try to do something about it")

		addButton("Leave it", "Nothing you can do", "leaveit")
		if(GM.pc.hasBoundArms()):
			addDisabledButton("Tug", "Your bound arms don't let you do this")
		else:
			if(GM.pc.getStamina() <= 0):
				addDisabledButton("Tug", "You are too tired to do this")
			else:
				addButton("Tug", "Try to tug on it", "tug")
				
		if(GM.pc.getStamina() <= 0):
			addDisabledButton("Wiggle off", "You are too tired to do this")
		else:
			addButton("Wiggle off", "Try to wiggle the restraint off. Less effective than tugging on it but you don't need your arms to be free", "wiggle")

	if(state == "tugfail"):
		saynn("You try and tug on the harness but the straps are too tight, causing you to drool a lot")
		
		saynn("You realize how kinky it looks from the side and feel slightly more aroused")
		
		saynn("You definitely made some progress though it also took quite a bit of your stamina")
		
		addButton("Continue", "Oh well", "")

	if(state == "tugsuccess"):
		saynn("You try and tug on your harness. You drool but after many attempts you finally manage to slip it off your face")
		
		saynn("You can finally close your mouth")
		
		saynn("You put the unlocked gag into your inventory")
		
		addButton("Continue", "Nice!", "endthescene")

	if(state == "wigglefail"):
		saynn("You shake your head, desperately trying to wiggle the harness off but it sits too tight")
		
		saynn("You realize how kinky it looks from the side and feel aroused")
		
		saynn("You made some progress but now you feel tired, you can only pant and drool continuously")
		
		addButton("Continue", "Oh well", "")

	if(state == "wigglesuccess"):
		saynn("You shake you head and, finally, after a few minutes of doing so, you feel the harness give in and slip off")
		
		saynn("You can finally close your mouth")
		
		saynn("You put the unlocked gag into your inventory")
		
		addButton("Continue", "Nice!", "endthescene")

	if(state == "leaveit"):
		saynn("You leave your gag alone. Maybe drooling constantly isn't that bad")
		
		addButton("Continue", "Oh well", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "tug"):
		if(RNG.chance(20)):
			setState("tugsuccess")
			var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(sceneArgs[0])
			item.unlock()
			GM.pc.getInventory().removeEquippedItem(item)
			GM.pc.getInventory().addItem(item)
		else:
			setState("tugfail")
			GM.pc.addLust(10)
		GM.pc.addStamina(-20)
		return
	
	if(_action == "wiggle"):
		if(RNG.chance(5)):
			setState("wigglesuccess")
			var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(sceneArgs[0])
			item.unlock()
			GM.pc.getInventory().removeEquippedItem(item)
			GM.pc.getInventory().addItem(item)
		else:
			setState("wigglefail")
			GM.pc.addLust(10)
		GM.pc.addStamina(-30)
		return
	
	setState(_action)
