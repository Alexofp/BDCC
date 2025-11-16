extends StatusEffectBase

func _init():
	id = StatusEffect.AuraOfDominance
	isBattleOnly = true
	subscribeCheckOnFightStart = true

func checkOnFightStart(_npc, _context:Dictionary) -> Array:
	var theEnemyID:String = contextGetEnemyID(_context)
	
	if(theEnemyID == "pc"):
		var ourID:String = _npc.getID()
		
		var theSpecialRelationship:SpecialRelationshipBase = GM.main.RS.getSpecialRelationship(ourID)
		if(theSpecialRelationship && theSpecialRelationship.shouldHaveAuraOfDominance()):
			return [true, []]
	
	return [false]

func initArgs(_args = []):
#	if(_args.size() > 0):
#		turns = _args[0]
#	else:
#		turns = 6
	pass
	
func processBattleTurn():
	#turns -= 1
	#if(turns <= 0):
	#	stop()
	pass
	
func processTime(_secondsPassed: int):
	pass

func getEffectName():
	return "Aura Of Dominance"

func getEffectDesc():
	return character.getName() + "'s dominant aura makes them feel stronger!"

func getEffectImage():
	return "res://Images/StatusEffects/grab.png"

func getIconColor():
	return IconColorGreen

#func combine(_args = []):
#	if(_args.size() > 0):
#		turns = max(_args[0], turns)
#	else:
#		turns = max(6, turns)

#func saveData():
#	return {
#		"turns": turns,
#	}
#
#func loadData(_data):
#	turns = SAVE.loadVar(_data, "turns", 6)

func getBuffs():
	return [
		buff(Buff.PhysicalDamageBuff, [50.0]),
		buff(Buff.ReceivedPhysicalDamageBuff, [-50.0]),
		buff(Buff.LustDamageBuff, [50.0]),
		buff(Buff.ReceivedLustDamageBuff, [-50.0]),
		buff(Buff.StatusEffectImmunityBuff, [StatusEffect.Stunned, 70.0]),
	]
