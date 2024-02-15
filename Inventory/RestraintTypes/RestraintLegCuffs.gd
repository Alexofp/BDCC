extends RestraintData
class_name RestraintLegCuffs

func _init():
	npcDodgeDifficultyMod = 1.1
	restraintType = RestraintType.AnkleCuffs

func defaultStruggle(_pc, _minigame, response):
	var _text = "{user.name} rolls around and tries to helplessly wiggle {user.his} leg cuffs off."
	var _pain = 0
	var _stamina = 0.5 
	if !_pc.hasBoundArms() || !_pc.hasBlockedHands():
		_text = "{user.name} uses {user.his} hands to try and take off the leg cuffs."
	else:
		if failChance(_pc, 10):
			_text += " Ow! {user.name} accidently smashed them against "+RNG.pick(["the wall", "the ground", "something"])
			_pain = RNG.randf_range(0.5, 1)
	response.text += _text
	response.pain += calcStrugglePain(_pc, _pain)
	response.stamina += calcStruggleStamina(_pc, _stamina)
	return response
	
	
func fatalFailStruggle(_pc, _minigame, response):
	response.text += " But it seems like {user.youHe} just tightened it up more."
	response.damage = calcDamage(_pc, _minigame / 4.0)
	response.stamina = calcStruggleStamina(_pc, 2)
	return response

func failStruggle(_pc, _minigame, response):
	response.text += " But without visible effect."
	if failChance(_pc, 20):
		response.text += " Ow! {user.name} accidently smashed them against "+RNG.pick(["the wall", "the ground", "something"])
		response.pain = scaleDamage(RNG.randi_range(5, 10))
	return response
	
func sucessStruggle(_pc, _minigame, response):
	response.damage = calcDamage(_pc, _minigame) * calcRestrainMult(_pc, _minigame)
	return response

func sucessStruggleLocked(_pc, _minigame, response):
	response.text += " But the lock is too strong."
	return response

func sucessStruggleBreak(_pc, _minigame, response):
	response.text += " But it would have been done better if only it was not locked."
	var _mult = calcLockedMult(_pc, _minigame)
	response.damage = calcDamage(_pc, _mult) * calcRestrainMult(_pc, _minigame)
	response.lockDamage = calcLockDamage(_pc, _mult) * calcRestrainMult(_pc, _minigame)
	return response	


func getResistAnimation():
	return "struggle_legs"
