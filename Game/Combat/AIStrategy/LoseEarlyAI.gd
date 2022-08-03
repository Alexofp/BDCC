extends AIStrategyBase
class_name LoseEarlyAI

func getNextAttackID(_enemy):
	return getBestAttackIDWeighted(_enemy)

func turnPassed(_enemy):
	var charObject: BaseCharacter = getCharacter()
	if(charObject.getPainLevel() >= 0.5):
		charObject.addLust(charObject.lustThreshold())
	
		return charObject.getName() + " suddenly lets out a loud moan and drops to " + charObject.hisHer() +" knees!"
