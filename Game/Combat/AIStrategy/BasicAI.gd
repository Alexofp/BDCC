extends AIStrategyBase
class_name BasicAI

func getNextAttackID(_enemy):
	return getBestAttackIDWeighted(_enemy)
