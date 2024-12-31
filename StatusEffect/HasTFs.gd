extends StatusEffectBase

func _init():
	id = StatusEffect.HasTFs
	isBattleOnly = false

	alwaysCheckedForNPCs = true
	alwaysCheckedForPlayer = true
	priorityDuringChecking = 95
	
func shouldApplyTo(_npc):
	if(_npc.hasActiveTransformations()):
		return true
	return false

func getEffectName():
	return "Transformations"

func getEffectDesc():
	var tfHolder:TFHolder = character.getTFHolder()
	if(tfHolder == null):
		return "You shouldn't see this.."
	var tfCount:int = tfHolder.getActiveTransformationsCount()
	return "You are under the effects of "+str(tfCount)+" unknown transformation"+("s" if tfCount != 1 else "")+".."

func getEffectImage():
	return "res://Images/StatusEffects/dna1.png"

func getIconColor():
	return IconColorCyan

func getBuffs():
	var tfHolder:TFHolder = character.getTFHolder()
	if(tfHolder != null):
		return tfHolder.getBuffs()
	return []
