extends RestraintData
class_name HK_RestraintVisor

func _init():
	npcDodgeDifficultyMod = 0.8
	restraintType = "HK_RestraintVisor"

func canInspectWhileBlindfolded():
	return true

func canUnlockWithKey():
	return false
	
func alwaysSavedWhenStruggledOutOf():
	return true

func shouldDoStruggleMinigame(_pc):
	if(HK_CharUtil.isInTrance(_pc) && !_pc.hasPerk(HK_Perk.GoodAtVisors)):
		return false #cannot succeed
	if(HK_CharUtil.isHypnotized(_pc)):
		return true
	if(_pc.hasBoundArms() || _pc.hasBlockedHands()):
		return true
		
	return false
	
func doStruggle(_pc, _minigame):
	var _handsFree = !_pc.hasBlockedHands()
	var _armsFree = !_pc.hasBoundArms()
	var _legsFree = !_pc.hasBoundLegs()
	var _canSee = !_pc.isBlindfolded()
	var _canBite = !_pc.isBitingBlocked()
	
	var text = "error?"
	var lust = 0
	var pain = 0
	var damage = 0
	var stamina = 0
	
	var hypnotized = HK_CharUtil.isHypnotized(_pc)
	var inTrance = HK_CharUtil.isInTrance(_pc)
	var wasPerfect = _minigame >= 2
	
	if(inTrance && !_pc.hasPerk(HK_Perk.GoodAtVisors)):
		text = "{user.name} tries to... to... \n\nWhat? Must have not been important."
		damage = 0.0
		return {"text": text, "damage": damage, "lust": lust, "pain": pain, "stamina": stamina}
		
	if(_handsFree && _armsFree):
		if(!hypnotized || wasPerfect):
			text = "{user.name} reaches up and removes {user.his} " + getItem().getVisibleName() + "."
			damage = 1.0
		else:
			text = "{user.name} reaches up and... absentmindedly scratches {user.his} chin."
			damage = 0.0
	elif(_handsFree):
		if(!hypnotized || wasPerfect):
			text = "Awkwardly bending to reach due to {user.his} bound arms, {user.name} manages to grab onto and remove {user.his} " + getItem().getVisibleName() + "."
			damage = 1.0
			stamina = 5
		else:
			text = "Awkwardly bending to reach due to {user.his} bound arms, {user.name}... absentmindely scratches {user.his} chin."
			damage = 0.0
			stamina = 5
	else:
		if(!hypnotized || wasPerfect):
			text = "{user.name} shakes {user.his} head, trying to dislodge {user.his} " + getItem().getVisibleName() + "."
			damage = calcDamage(_pc)
		else:
			text = "{user.name} shakes {user.his} head, trying to adjust {user.his} " + getItem().getVisibleName() + "."
			damage = -calcDamage(_pc)
		stamina = 10
	return {"text": text, "damage": damage, "lust": lust, "pain": pain, "stamina": stamina}

func getResistAnimation():
	return "struggle_gag"
