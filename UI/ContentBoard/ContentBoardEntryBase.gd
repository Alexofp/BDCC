extends Reference
class_name ContentBoardEntryBase

var id:String = ""

func getName() -> String:
	return "Fill me"

func getDesc() -> String:
	return "Write the description here!"

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
	var theStatus := getStatus()
	return ContentBoardStatus.doesCountAsStarted(theStatus)

func isCompleted() -> bool:
	return getStatus() == ContentBoardStatus.Completed

func getFlag(_flagID:String, _default = null):
	if(!GM.main):
		return _default
	return GM.main.getFlag(_flagID, _default)
