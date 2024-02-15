extends RestraintData
class_name RestraintHandCuffs

func _init():
	restraintType = RestraintType.WristCuffs


func defaultStruggle(_pc, _minigame, response):
	var _text = "{user.name} tries to helplessly wiggle the handcuffs off."
	var _stamina = 0.5 
	var _lust = 0
	if !_pc.hasBlockedHands() && !_pc.isBitingBlocked():
		_text = "{user.name} uses {user.his} hands and mouth to try and take off the handcuffs without unlocking them."
		if(failChance(_pc, 20)):
			_text += " {user.name} finds {user.himself} drooling a lot."
			_lust = scaleDamage(5)
	if !_pc.hasBlockedHands():
		_text = "{user.name} can't use {user.his} mouth but {user.he} can just about reach the handcuffs with {user.his} hands. {user.name} is tugging on the restrant, trying to slip it off."
	if !_pc.isBitingBlocked():
		_text = "{user.name} is trying to wiggle the handcuffs off. Not being able to use hands really sucks but using {user.his} mouth instead helps {user.him} to keep them still."
		_stamina = 1.0
		if(failChance(_pc, 40)):
			_text += " {user.name} finds {user.himself} drooling a lot."
			_lust = scaleDamage(5)
	response.stamina += calcStruggleStamina(_pc, _stamina)
	response.lust += _lust
	response.text += _text
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
	
