extends RestraintData
class_name RestraintMuzzle

func _init():
	restraintType = RestraintType.Muzzle
	
func canBeCut():
	return tightness < 0.9
	
func calcCutDamage(_pc, mult = 1.0):
	return .calcCutDamage(_pc, mult) / 1.3

func calcRestrainMult(_pc, _minigame):
	var mult = .calcRestrainMult(_pc, _minigame)
	if !_pc.hasBoundArms() || !_pc.hasBlockedHands():
		if _pc.hasPerk(Perk.BDSMPerfectStreak):
			mult *= 0.8
		else:
			mult *= 0.7
	return mult


func defaultStruggle(_pc, _minigame, response):
	if !_pc.hasBoundArms() && !_pc.hasBlockedHands():
		response.text += "{user.name} tugs on the straps of {user.his} head harness, trying to take it off"
	else: 
		response.text = "{user.name} desperately tries to wiggle the harness off {user.his} head"
	return response

func afterStruggle(_pc, _minigame, response):
	if failChance(_pc, 40) && (_pc.hasBoundArms() || _pc.hasBlockedHands()):
			response.text += " Shaking {user.his} head so much makes {user.him} disoriented."
			response.pain = scaleDamage(5)
	return response
	

func getResistAnimation():
	return "struggle_gag"
