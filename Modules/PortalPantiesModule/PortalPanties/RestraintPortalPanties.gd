extends RestraintData

func canStruggle():
	return false

func canUnlockWithKey():
	return false

func getVisibleLevel(_isBlind = false):
	return "999, impossible to remove"

func saveData():
	var data = {}

	return data
	
func loadData(_data):
	pass

func processStruggleTurn(_pc, _isActivelyStruggling):
	if(RNG.chance(10) && GM.main.getFlag("PortalPantiesModule.Panties_FleshlightsGotStolen")):
		var possible = ["anus"]
		if(GM.pc.hasVagina()):
			possible.append("vag")
		if(GM.pc.hasPenis()):
			possible.append("penis")
		
		var randPart = RNG.pick(possible)
		if(randPart == "vag"):
			var texts = [
				"Your {pc.pussyStretch} pussy gets teased through the portal panties by someone!",
				"Someone rubs their cock against your slit through the portal panties!",
				"Someone’s fingers spread your pussy folds and tease you through the portal panties!",
				"Someone’s fingers slide in and out your kitty through the portal panties!",
				"You feel a cock finding your pussy and sliding inside through the portal panties!",
			]
		
			return {"text": RNG.pick(texts), "lust": scaleDamage(5)}
		if(randPart == "anus"):
			var texts = [
				"Your {pc.analStretch} tailhole gets teased through the portal panties!",
				"Someone rubs their cock against your anus ring through the portal panties!",
				"Someone’s fingers prod at your anal star and tease you through the portal panties!",
				"Someone’s fingers slide in and out your {pc.analStretch} anus through the portal panties!",
				"You feel a cock finding your anal ring and sliding inside through the portal panties!",
			]
		
			return {"text": RNG.pick(texts), "lust": scaleDamage(5)}
		if(randPart == "penis"):
			var texts = [
				"Your {pc.cock} gets teased through the portal panties by someone!",
				"Someone’s lips close around the tip of your cock through the portal panties!",
				"A tongue licks your {pc.cock} through the portal panties!",
				"Someone’s digits wrap around your {pc.cock} and strokes it through the portal panties!",
				"Someone is grinding your cock with their pussy through the portal panties!",
			]
		
			return {"text": RNG.pick(texts), "lust": scaleDamage(5)}
