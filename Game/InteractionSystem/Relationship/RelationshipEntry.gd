extends Reference
class_name RelationshipEntry

var affection:float = 0.0
var lust:float = 0.0

func shouldBeRemoved() -> bool:
	return abs(affection) < 0.01 && abs(lust) < 0.01
