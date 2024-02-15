extends RestraintData
class_name RestraintBlindfold

func _init():
	npcDodgeDifficultyMod = 0.8
	restraintType = RestraintType.Blindfold

func canInspectWhileBlindfolded():
	return true

func canUnlockWithKey():
	return false

func canBeCut():
	return true
	
func alwaysSavedWhenStruggledOutOf():
	return true

func shouldDoStruggleMinigame(_pc):
	var _armsFree = !_pc.hasBoundArms()
	if(_armsFree):
		return false
	return .shouldDoStruggleMinigame(_pc)


func defaultStruggle(_pc, _minigame, response):
	if !_pc.hasBoundArms() && !_pc.hasBlockedHands():
		response.text = "Because {user.name}'s hands are free {user.he} manages to just untie {user.his} blindfold."
		response.damage = 1.0
		response.stamina = 0
	elif !_pc.hasBoundArms():
		response.text = "{user.name}'s hands are free but they are bound together so {user.name} has to awkwardly bend to reach the blindfold."
		response.damage = 1.0
		response.stamina = response.stamina / 2
	return response
		
func fatalFailStruggle(_pc, _minigame, response):
	response.text = "{user.name} shakes {user.his} head, but the blindfold unfortunately slip back."
	response.damage = -1.0
	return response

func sucessStruggle(_pc, _minigame, response):
	response.text = "{user.name} shakes {user.his} head, trying to make the blindfold slip off."
	response.damage = calcDamage(_pc)
	return response

func getResistAnimation():
	return "struggle_gag"
