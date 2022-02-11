extends Object
class_name Flag

const TestFlag = "TestFlag"
const Canteen_PlayerAteToday = "Canteen_PlayerAteToday"

static func resetFlagsOnNewDay():
	GM.main.setFlag(Canteen_PlayerAteToday, false)
