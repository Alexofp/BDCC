extends StatusEffectBase

func _init():
	id = StatusEffect.SexEngineLikes
	isBattleOnly = false
	
	alwaysCheckedForNPCs = true
	alwaysCheckedForPlayer = true
	priorityDuringChecking = 50
	
func shouldApplyTo(_npc):
	if(GM.main != null && GM.main.supportsSexEngine()):
		return true
	return false
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	return "Fetishes"

func getEffectDesc():
	var fetishHolder: FetishHolder = character.getFetishHolder()
	if(fetishHolder == null):
		return "Error"
	
	var texts = []
	for fetishID in fetishHolder.getFetishes():
		var fetish:FetishBase = GlobalRegistry.getFetish(fetishID)
		var fetishInterest = fetishHolder.getFetishInterest(fetishID)
		if(fetishInterest == FetishInterest.Neutral):
			continue
		var fetishColor = FetishInterest.getColorString(fetishInterest)
		var fetishInterestText = FetishInterest.getVisibleName(fetishInterest)
		
		texts.append(fetish.getVisibleName()+": "+"[color="+fetishColor+"]"+fetishInterestText+"[/color]")
	return Util.join(texts, "\n")

func getEffectImage():
	return "res://Images/StatusEffects/opposite-hearts.png"

func getIconColor():
	return IconColorPurple

func combine(_args = []):
	pass

func getBuffs():
	return []
