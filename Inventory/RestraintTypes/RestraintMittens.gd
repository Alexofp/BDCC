extends RestraintData
class_name RestraintMittens

func _init():
	npcDodgeDifficultyMod = 1.2
	restraintType = RestraintType.Mittens

func canBeCut():
	return tightness < 0.9
	
func calcCutDamage(_pc, mult = 1.0):
	return .calcCutDamage(_pc, mult) / 1.4

func isFree(_pc):
	return !_pc.hasBoundArms() && !_pc.isBitingBlocked()

func isPartialFree(_pc):
	return !_pc.hasBlockedHands()
	
func defaultStruggle(_pc, _minigame, _response):
	var _text = "{user.name} tries to helplessly wiggle the mittens off"
	if isFree(_pc):
		_text = "{user.name} bites on one of the mittens and tries to free {user.his} arm. Not very effective but better than nothing."
	elif isPartialFree(_pc):
		_text = "{user.name} steps on the mittens and tries to pull {user.his} arms out of them"
	return ResponseData.new(_text,  0.0, 0.0, calcStruggleLust(_pc, 0), calcStrugglePain(_pc, 0), calcStruggleStamina(_pc,  1))

func afterStruggle(_pc, _minigame, response):
	if failChance(_pc, 40) && isFree(_pc):
			response.text += " Ow! {user.name} accidently smashed them against "+RNG.pick(["the wall", "the ground", "something"])
			response.pain = scaleDamage(RNG.randi_range(5, 10))
	elif failChance(_pc, 10) && isFree(_pc):
		response.text += " Ow, {user.name} accidentally bit {user.his} hand."
		response.pain = scaleDamage(5)
	return response
	
