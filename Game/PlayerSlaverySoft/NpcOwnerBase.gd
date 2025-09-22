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

func addInfluence(_am:float):
	influence += _am
	influence = clamp(influence, 0.0, 1.0)

func getInfluence() -> float:
	return influence

func saveData() -> Dictionary:
	return {}

func loadData(_data:Dictionary):
	pass
