extends "res://Scenes/SceneBase.gd"


func _init():
	sceneID = "PutOnAnyItemScene"

func _run():
	if(state == ""):
		var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(sceneArgs[0])
		
		saynn("You "+item.getPuttingOnStringLong(false))

		addButton("Continue", "You put on an item", "endthescene")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(sceneArgs[0])
		GM.pc.getInventory().removeItem(item)
		GM.pc.getInventory().equipItem(item)
		
		
		endScene()
		return
	
	setState(_action)

func _react_scene_end(_tag, _result):
	setState("")
