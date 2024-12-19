extends StatusEffectBase

func _init():
	id = "SexOverstimulated"
	isBattleOnly = false
	
	alwaysCheckedForNPCs = true
	alwaysCheckedForPlayer = true
	priorityDuringChecking = 46
	
func shouldApplyTo(_npc):
	if(GM.main == null || !GM.main.supportsSexEngine()):
		return false
	
	if(!_npc.hasVisiblyOverstimulatedSensitiveZone()):
		return false
	return true
	
func initArgs(_args = []):
	pass
	
func processBattleTurn():
	pass
	
func processTime(_minutesPassed: int):
	pass

func getEffectName():
	return "Overstimulated!"

func getEffectDesc():
	var texts := []
	var zones = character.getSensitiveZones()
	for zoneA in zones:
		var zone:SensitiveZone = zoneA
		
		if(zone.isVisiblyOverstimulated()):
			texts.append(zone.getNameIs()+" overstimulated ("+str(Util.roundF(zone.getOverstimulation()*100.0, 1))+"%)")
	
	return Util.join(texts, "\n")+"\n\nOverstimulated zones will lose sensitivity when stimulated further!"

func getEffectImage():
	return "res://Images/StatusEffects/light-thorny-triskelion.png"

func getIconColor():
	return IconColorRed

func combine(_args = []):
	pass

func getBuffs():
	return []
