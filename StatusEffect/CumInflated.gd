extends StatusEffectBase

func _init():
	id = StatusEffect.CumInflated
	isBattleOnly = false
	
	alwaysCheckedForNPCs = true
	alwaysCheckedForPlayer = true
	priorityDuringChecking = 88
	
func shouldApplyTo(_npc):
	if(_npc.getCumInflationLevel() > 0.01):
		return true
	return false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_secondsPassed: int):
	pass

func getEffectName():
	return "Cum Inflated"

func getEffectDesc():
	var cumInflationLevel = character.getCumInflationLevel()
	
	if(cumInflationLevel <= 1.5):
		return "Your belly has a slight visible bump"
	if(cumInflationLevel <= 4.5):
		return "Your belly looks quite inflated!"
	
	return "Wow, you are stuffed so much that you look pregnant!"

func getEffectImage():
	var cumInflationLevel = character.getCumInflationLevel()
	if(cumInflationLevel <= 4.5):
		return "res://Images/StatusEffects/belly.png"
		
	return "res://Images/StatusEffects/bloating.png"

func getIconColor():
	return IconColorPurple

func combine(_args = []):
	pass
