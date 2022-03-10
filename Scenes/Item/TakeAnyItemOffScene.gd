extends "res://Scenes/SceneBase.gd"


func _init():
	sceneID = "TakeAnyItemOffScene"

func _run():
	if(state == ""):
		var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(sceneArgs[0])
		
		saynn("You "+item.getTakingOffStringLong(false))

		addButton("Continue", "You took off an item", "endthescene")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(sceneArgs[0])
		GM.pc.getInventory().removeEquippedItem(item)
		GM.pc.getInventory().addItem(item)
		
		endScene()
		return
	
	setState(_action)

func _react_scene_end(_tag, _result):
	setState("")
