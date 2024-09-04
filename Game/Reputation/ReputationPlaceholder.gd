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
