extends AIStrategyBase
class_name BasicAI

func getNextAttacksWeighted(_enemy):
	return getBestAttackIDsWeighted(_enemy)
