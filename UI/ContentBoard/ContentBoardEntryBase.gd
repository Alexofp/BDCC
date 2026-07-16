extends Reference
class_name ContentBoardEntryBase

var id:String = ""

func getName() -> String:
	return "Fill me"

func getDesc(_isFull:bool) -> String:
	return "Write the description here!"

func getCompletedDesc() -> String:
	return ""

func getKinks() -> Array:
	return []

func getStartConditions() -> Array:
	return [
		[ContentBoardCondition.Incomplete, "Do a hecking meow"],
		[ContentBoardCondition.InProgress, "Meow meow"],
		[ContentBoardCondition.Complete, "Meow meow!!"],
	]

func getProgressText() -> String:
	return "Do something I dunno"

func getStatus() -> int:
	return ContentBoardStatus.Unknown

func isStarted() -> bool:
	return ContentBoardStatus.doesCountAsStarted(getStatus())

func isCompleted() -> bool:
	return ContentBoardStatus.doesCountAsCompleted(getStatus())

func getFlag(_flagID:String, _default = null):
	if(!GM.main):
		return _default
	return GM.main.getFlag(_flagID, _default)

func completeIf(_flagID:String) -> int:
	if(getFlag(_flagID, false)):
		return ContentBoardCondition.Complete
	return ContentBoardCondition.Incomplete

func completeIfBool(_b:bool) -> int:
	if(_b):
		return ContentBoardCondition.Complete
	return ContentBoardCondition.Incomplete
	
