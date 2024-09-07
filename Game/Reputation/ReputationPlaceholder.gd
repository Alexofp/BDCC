extends Reference
class_name ReputationPlaceholder

func isPlaceholder() -> bool:
	return true

func getRepLevel(_stat:String) -> int:
	return 0

func getRepScore(_stat:String) -> float:
	return 0.0

func addRep(_stat:String, _howMuch:float, _showMessage:bool = true):
	pass

func setLevel(_stat:String, _newLevel:int, _showMessage:bool = true):
	pass

func addRepBelowLevel(_stat:String, _howMuch:float, _level:int, _showMessage:bool = true):
	pass

func isEventRequired(_eventID:String) -> bool:
	return false

func handleSpecialEvent(_eventID:String):
	pass

func getGenericRepMult(_repID:String, _mult:float = 2.0) -> float:
	return 1.0
