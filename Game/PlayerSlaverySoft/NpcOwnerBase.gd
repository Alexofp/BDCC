extends Reference
class_name NpcOwnerBase

var id:String = "error"

var level:int = 1
var influence:float = 0.5
var charID:String = ""

var shouldAppoach:bool = false

func setRelationship(_softSlavery):
	charID = _softSlavery.charID

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

func getExtraCategoryText() -> String:
	var theText:String = "\n"
	theText += "Level: "+str(level)
	theText += "\nInfluence: "+str(Util.roundF(influence*100.0, 1))+"%"
	return theText

func shouldOwnerApproachPC() -> bool:
	return shouldAppoach

#[id, args]
func getApproachEvent() -> Array:
	shouldAppoach = false
	return ["FuckInStocks", []]

func onNewDay():
	shouldAppoach = true

func saveData() -> Dictionary:
	return {}

func loadData(_data:Dictionary):
	pass
