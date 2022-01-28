extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "PlayerStashScene"

func _run():
	if(state == ""):
		saynn("You find a place you can stash some items in, it's under your pillow. What do you wanna do")
		
		var items = GlobalRegistry.getCharacter("playerstash").getInventory().getAllItems()
		var itemNames = []
		for item in items:
			itemNames.append(item.getVisibleName())
		say("Items in the stash:\n")
		say(Util.join(itemNames, ", "))
		say("\n\n")
		
		items = GM.pc.getInventory().getAllItems()
		itemNames = []
		for item in items:
			itemNames.append(item.getVisibleName())
		say("Your items:\n")
		say(Util.join(itemNames, ", "))
		
		addButton("Stash item", "Hide an item", "hideitemmenu")
		addButton("Take item", "Take an item", "takeitemmenu")
		addButton("Step away", "You're done", "endthescene")
	if(state == "hideitemmenu"):
		saynn("Pick an item you wanna stash")
		
		var items = GM.pc.getInventory().getAllItems()
		for item in items:
			addButton(item.getVisibleName(), item.getVisisbleDescription(), "hideitem", [item.getUniqueID()])
		addButton("Back", "Go back", "")
	if(state == "takeitemmenu"):
		saynn("Pick an item you wanna take")
		
		var items = GlobalRegistry.getCharacter("playerstash").getInventory().getAllItems()
		for item in items:
			addButton(item.getVisibleName(), item.getVisisbleDescription(), "takeitem", [item.getUniqueID()])
		addButton("Back", "Go back", "")

func _react(_action: String, _args):
	if(_action == "hideitem"):
		var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(_args[0])
		GM.pc.getInventory().removeItem(item)
		GlobalRegistry.getCharacter("playerstash").getInventory().addItem(item)
		
		setState("")
		return
	if(_action == "takeitem"):
		var item: ItemBase = GlobalRegistry.getCharacter("playerstash").getInventory().getItemByUniqueID(_args[0])
		GlobalRegistry.getCharacter("playerstash").getInventory().removeItem(item)
		GM.pc.getInventory().addItem(item)
		
		setState("")
		return
	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)
