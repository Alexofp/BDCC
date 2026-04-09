extends Reference
class_name SexToyTriggerEntry

var type:int = SexToyTrigger.Lust
var effects:Array = [] #Array[SexToyEffectEntry]
var inverted:bool = false # For passive triggers

func shouldBeRemoved() -> bool:
	return effects.empty() && !inverted

func checkShouldBeRemoved():
	if(shouldBeRemoved()):
		SexToyManager.gameplay.triggers.erase(type)

func isPassive() -> bool:
	return SexToyTrigger.isPassive(type)
