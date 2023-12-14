extends SceneBase

func _init():
	sceneID = "HK_GetEngineeringFreebieVisor"
	
func _initScene(_args = []):
	pass

func _run():
	if(state == ""):
		saynn("Huh. There's an unmarked package tucked in the corner. Wonder who left it here?")
		saynn("You take it and unwrap it. Seem's there's some kind of visor inside. Weird.")
		addButton("Yoink", "Finders keepers", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		GM.pc.getInventory().addItem(GlobalRegistry.createItem("HypnovisorMk0"))
		endScene()
		return
		
	setState(_action)
