extends StatusEffect

func _init():
	id = StatusEffect.Bleeding
	isBattleOnly = true
	
func initArgs(_args = []):
	if(_args.size() > 0):
		turns = _args[0]
	else:
		turns = 3
	
func processBattleTurn():
	character.addPain(2)
	
	turns -= 1
	if(turns <= 0):
		stop()
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	return "Bleeding"

func getEffectDesc():
	return "I'm loosing health. " + str(turns) + " more turns"

func getEffectImage():
	return "res://UI/StatusEffectsPanel/images/bleeding.png"

func getEffectVisibleType():
	return StatusEffectsPanel.EffectType.Red

func combine(_args = []):
	print("I was combined")
	if(_args.size() > 0):
		turns = max(_args[0], turns)
	else:
		turns = max(3, turns)
