extends "res://Scenes/SceneBase.gd"


func _init():
	sceneID = "PutOnAnyItemScene"

func _run():
	if(state == ""):
		if(GM.pc.hasBoundArms()):
			saynn("You really try to put that on but your bound arms prevent you from doing so")
			
			addButton("Continue", "Aww", "endthescene")
		else:
			var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(sceneArgs[0])
			
			saynn("You "+item.getPuttingOnStringLong(false))

			addButton("Continue", "You put on an item", "putonandendthescene")


func _react(_action: String, _args):
	if(_action == "putonandendthescene"):
		var item: ItemBase = GM.pc.getInventory().getItemByUniqueID(sceneArgs[0])
		GM.pc.getInventory().removeItem(item)
		GM.pc.getInventory().equipItem(item)
		
		
		endScene()
		return
		
	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)

func _react_scene_end(_tag, _result):
	setState("")
