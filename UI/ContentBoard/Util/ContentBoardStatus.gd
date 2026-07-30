extends Object
class_name ContentBoardStatus

const Unknown := 0
const ConditionsNotMet := 1
const NotStarted := 2
const InProgress := 3
const Completed := 4
const Impossible := 5
const Cancelled := 6
const Unavailable := 7
const Completedish := 8

const StatusToColor:Dictionary = {
	Unknown: Color.red,
	ConditionsNotMet: Color.orange,
	NotStarted: Color.lightblue,
	InProgress: Color.yellow,
	Completed: Color.green,
	Impossible: Color.firebrick,
	Cancelled: Color.darkgray,
	Unavailable: Color.gray,
	Completedish: Color.green,
}
const StatusToText:Dictionary = {
	Unknown: "Unknown",
	ConditionsNotMet: "Conditions not met",
	NotStarted: "Not started",
	InProgress: "In progress",
	Completed: "Completed!",
	Impossible: "Impossible",
	Cancelled: "Cancelled",
	Unavailable: "Unavailable",
	Completedish: "Completed-ish",
}

static func getColor(_status:int) -> Color:
	return StatusToColor.get(_status, Color.red)

static func getText(_status:int) -> String:
	return StatusToText.get(_status, "Impossible")

static func doesCountAsStarted(_status:int) -> bool:
	if(_status == InProgress):
		return true
	if(_status == Completed):
		return true
	if(_status == Completedish):
		return true
	
	return false

static func doesCountAsCompleted(_status:int) -> bool:
	if(_status == Completed):
		return true
	if(_status == Completedish):
		return true
	
	return false
