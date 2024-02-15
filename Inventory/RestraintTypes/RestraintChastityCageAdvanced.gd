extends RestraintChastityCage

func canUnlockWithKey():
	return false
	
func alwaysSavedWhenStruggledOutOf():
	return true


func defaultStruggle(_pc, _minigame, response):

	if(failChance(_pc, 10) || (_minigame < 0.7)):
		response.text += "{user.name}'s chastity cage BEEPS.. And then suddenly [b]shocks[/b] {user.his} {user.penis}!"
		response.pain += RNG.randi_range(10, 20)
	else:
		if !_pc.hasBlockedHands() && !_pc.hasBoundArms():
			response.text += "{user.name} tugs on {user.his} chastity cage, trying to take it off."
			response.damage += calcDamage(_pc)
			response.stamina += 10
		else:
			response.text += "{user.name} desperately tries to wiggle {user.his} chastity cage off but makes almost no progress."
			response.damage += calcDamage(_pc, 0.1)
			response.stamina += 5
		
		if !_pc.hasBlockedHands() && !_pc.hasBoundArms() && failChance(_pc, 20):
			response.text += " Touching {user.his} caged cock made {user.him} quite aroused."
			response.lust += scaleDamage(5)
		elif(failChance(_pc, 20)):
			response.text += " {user.He} accidentally pinched {user.his} balls. Ow."
			response.pain += scaleDamage(5)
		
		if(failChance(_pc, 30)):
			response.text += " {user.name}'s chastity cage BEEPS.. But doesn't do anything to {user.him} this time. Phew."
	response.skipRest()
	return response

