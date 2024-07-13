extends Object
class_name DatapackSceneTriggerType

const None = "None"
const EnterRoom = "EnterRoom"
const EnterAnyRoom = "EnterAnyRoom"
const EnterPlayerCell = "EnterPlayerCell"

static func getName(triggerType):
	if(triggerType == None):
		return "None"
	if(triggerType == EnterRoom):
		return "Enter room"
	if(triggerType == EnterAnyRoom):
		return "Enter any room"
	if(triggerType == EnterPlayerCell):
		return "Enter player room"
	
	return "Error?"

static func getAll():
	return [
		None,
		EnterRoom,
		EnterAnyRoom,
		EnterPlayerCell,
	]

static func getAllWithNames():
	var result = []
	for triggerType in getAll():
		result.append([triggerType, getName(triggerType)])
	return result

static func getEditVars(triggerType):
	if(triggerType == EnterRoom):
		return {
			"room": {
				name = "Room name",
				type = "string",
				value = "SOME ROOM",
			},
		}
	
	return {}
