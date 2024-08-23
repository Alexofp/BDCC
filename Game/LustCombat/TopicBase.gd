extends Reference
class_name TopicBase

# One object for each topic would be too much strain, all topics in one object would be too messy. My solution is to group them into a few objects
var handles_ids = []

func _init():
	pass

# 0 - no, 1 - yessss
# Fuzzy logic
func getTopicValue(_topicID, _pc):
	return 0.0

func getVisibleName(_topicID):
	return "error:"+str(_topicID)

static func linearCloseness(myvalue: float, targetValue: float, offset: float = 0.3, deadzone: float = 0.0) -> float:
	if(myvalue >= (targetValue - deadzone) && myvalue <= (targetValue + deadzone)):
		return 1.0
	
	var leftValue = targetValue - offset - deadzone
	var rightValue = targetValue + offset + deadzone
	
	if(myvalue >= leftValue && myvalue <= (targetValue - deadzone)):
		return (myvalue - leftValue) / offset
		
	if(myvalue <= rightValue && myvalue >= (targetValue + deadzone)):
		return 1.0 - (myvalue - (targetValue + deadzone)) / offset
	
	return 0.0

static func constantIfBelow(myvalue: float, belowValue: float, constantValue: float, otherwise: float) -> float:
	if(myvalue <= belowValue):
		return constantValue
	else:
		return otherwise

static func constantIfAbove(myvalue: float, aboveValue: float, constantValue: float, otherwise: float) -> float:
	if(myvalue >= aboveValue):
		return constantValue
	else:
		return otherwise

func shouldUseAre(_topicID) -> bool:
	return getChatName(_topicID).ends_with("s")

func getChatName(_topicID) -> String:
	return getVisibleName(_topicID)

func canUseInChat(_topicID) -> bool:
	return true

func getHowMuchAddsToLikeness(_topicID) -> float:
	return 1.0

func getAddsToFocus(_topicID, _focus) -> float:
	return 0.0
