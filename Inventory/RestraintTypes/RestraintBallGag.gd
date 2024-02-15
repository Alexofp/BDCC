extends RestraintData
class_name RestraintBallGag

func _init():
	restraintType = RestraintType.Gag

func canBeCut():
	return tightness < 0.9

func calcCutDamage(_pc, mult = 1.0):
	return .calcCutDamage(_pc, mult) / 1.2

func defaultStruggle(_pc, _minigame, response):
	if !_pc.hasBoundArms() || !_pc.hasBlockedHands():
		response.text = "{user.name} tries to bite down on the ball in {user.his} mouth "
	else:
		response.text = "{user.youHe} struggle, trying to make the "+getItem().getVisibleName()+" slip off "
	response.stamina += calcStruggleStamina(_pc, 1) 
	return response

func fatalFailStruggle(_pc, _minigame, response):
	if !_pc.hasBoundArms() || !_pc.hasBlockedHands():
		response.text += " but the rubber makes it very tough plus it got deeper in the mouth."
	else:
		response.text += " but it seems like {user.youHe} just tightened it up more."
	response.damage = calcDamage(_pc, _minigame / 4.0)
	response.stamina = calcStruggleStamina(_pc, 2)
	return response

func afterStruggle(_pc, _minigame, response):
	if(failChance(_pc, 20)):
		response.text += " The ball in {user.his} mouth makes {user.him} drool a lot."
		response.lust += calcStruggleLust(_pc, 5)
	return response


func getResistAnimation():
	return "struggle_gag"
