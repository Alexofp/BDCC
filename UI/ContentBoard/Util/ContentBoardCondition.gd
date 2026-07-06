extends Object
class_name ContentBoardCondition

const Incomplete := 0
const Complete := 1
const InProgress := 2
const Impossible := 3

const StatusToColor:Dictionary = {
	Incomplete: Color.white,
	Complete: Color.green,
	InProgress: Color.yellow,
	Impossible: Color.red,
}

static func getColor(_status:int) -> Color:
	return StatusToColor.get(_status, Color.red)
