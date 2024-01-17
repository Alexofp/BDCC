extends RestraintData

func canStruggle():
	return false

func canUnlockWithKey():
	return false

func alwaysSavedWhenStruggledOutOf():
	return true

func getVisibleLevel(_isBlind = false):
	return "999, impossible to remove"

func saveData():
	var data = {}

	return data
	
func loadData(_data):
	pass

func processStruggleTurn(_pc, _isActivelyStruggling):
	if(RNG.chance(10) && (GM.main.getFlag("PortalPantiesModule.Panties_FleshlightsGotStolen") || !_pc.isPlayer())):
		var possible = ["anus"]
		if(_pc.hasVagina()):
			possible.append("vag")
		if(_pc.hasPenis()):
			possible.append("penis")
		
		var randPart = RNG.pick(possible)
		if(randPart == "vag"):
			var texts = [
				"{user.Your} {user.pussyStretch} pussy gets teased through the portal panties by someone!",
				"Someone rubs their cock against {user.your} slit through the portal panties!",
				"Someone’s fingers spread {user.your} pussy folds and tease you through the portal panties!",
				"Someone’s fingers slide in and out {user.your} kitty through the portal panties!",
				"You feel a cock finding {user.your} pussy and sliding inside through the portal panties!",
			]
		
			return {"text": RNG.pick(texts), "lust": scaleDamage(5)}
		if(randPart == "anus"):
			var texts = [
				"{user.Your} {user.analStretch} tailhole gets teased through the portal panties!",
				"Someone rubs their cock against {user.your} anus ring through the portal panties!",
				"Someone’s fingers prod at {user.your} anal star and tease you through the portal panties!",
				"Someone’s fingers slide in and out {user.your} {user.analStretch} anus through the portal panties!",
				"You feel a cock finding {user.your} anal ring and sliding inside through the portal panties!",
			]
		
			return {"text": RNG.pick(texts), "lust": scaleDamage(5)}
		if(randPart == "penis"):
			var texts = [
				"{user.Your} {user.cock} gets teased through the portal panties by someone!",
				"Someone’s lips close around the tip of {user.your} cock through the portal panties!",
				"A tongue licks {user.your} {user.cock} through the portal panties!",
				"Someone’s digits wrap around {user.your} {user.cock} and strokes it through the portal panties!",
				"Someone is grinding {user.your} cock with their pussy through the portal panties!",
			]
		
			return {"text": RNG.pick(texts), "lust": scaleDamage(5)}
