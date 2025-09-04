extends Reference
class_name FetishBase

var id = "error"
var dynamicChangesPersonalityAffectors:Dictionary = {}

func getVisibleName():
	return "Error"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	return []

func isPossibleFor(_character):
	return true

func getInitialInterest(_character):
	return FetishInterest.Likes

func getFetishChangePersonalityMod(_personality:Personality) -> float:
	var result:float = 1.0
	
	for personalityStat in dynamicChangesPersonalityAffectors:
		var thePersWantValue:float = dynamicChangesPersonalityAffectors[personalityStat]
		var thePersValue:float = _personality.getStat(personalityStat)
		
		result += thePersWantValue * thePersValue
		
	return max(result, 0.5)

func getDynamicChangeThreshold() -> float:
	return 5.0
	
func getDynamicChangeThresholdMax() -> float:
	return 10.0
