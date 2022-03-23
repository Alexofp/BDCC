extends "res://Scenes/SceneBase.gd"


func _init():
	sceneID = "TakeAnyItemOffScene"

func _run():
	if(state == ""):
		if(GM.pc.hasBlockedHands()):
			saynn("You really try to take anything off but your blocked hands prevent you from doing so")
			
			addButton("Continue", "Aww", "endthescene")
		else:
			var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(sceneArgs[0])
			
			if(GM.pc.hasBoundArms()):
				saynn("It's very awkward to do with bound arms but you just about managed. You "+item.getPuttingOnStringLong(false))
			else:
				saynn("You "+item.getTakingOffStringLong(false))

			addButton("Continue", "You took off an item", "removeitemandendthescene")


func _react(_action: String, _args):
	if(_action == "removeitemandendthescene"):
		var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(sceneArgs[0])
		GM.pc.getInventory().removeEquippedItem(item)
		GM.pc.getInventory().addItem(item)
		
		endScene()
		return
		
	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)

func _react_scene_end(_tag, _result):
	setState("")
