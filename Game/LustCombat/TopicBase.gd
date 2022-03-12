extends Reference
class_name TopicBase

var id = "error"
# One object for each topic would be too much strain, all topics in one object would be too messy. My solution is to group them into a few objects
var handles_ids = []

func _init():
	pass

# 0 - no, 1 - yessss
# Fuzzy logic
func getTopicValue(_topicID, _pc):
	return 0

func getVisibleName(_topicID):
	return "error:"+str(_topicID)

static func linearCloseness(myvalue, targetValue, offset = 0.3, deadzone = 0.0):
	if(myvalue >= (targetValue - deadzone) && myvalue <= (targetValue + deadzone)):
		return 1.0
	
	var leftValue = targetValue - offset - deadzone
	var rightValue = targetValue + offset + deadzone
	
	if(myvalue >= leftValue && myvalue <= (targetValue - deadzone)):
		return (myvalue - leftValue) / offset
		
	if(myvalue <= rightValue && myvalue >= (targetValue + deadzone)):
		return 1.0 - (myvalue - (targetValue + deadzone)) / offset
	
	return 0.0

func getTeaseValue(_topicID, _teaseType):
	return 0.0
