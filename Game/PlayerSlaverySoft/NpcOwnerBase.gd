extends Reference
class_name NpcOwnerBase

var id:String = "error"

var level:int = 1
var influence:float = 0.5

func getVisibleName() -> String:
	return "Fill me!"

func getInteractEvents() -> Array:
	return [
		
	]

func saveData() -> Dictionary:
	return {}

func loadData(_data:Dictionary):
	pass
