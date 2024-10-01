extends AuctionTrait

func _init():
	ids = [
		"FetishSexBottom",
		"FetishSexTop",
		"FetishSexExotic",
	]

func getName(_id:String) -> String:
	if(_id == "FetishSexBottom"):
		return "SEX (BOTTOM)"
	if(_id == "FetishSexTop"):
		return "SEX (TOP)"
	if(_id == "FetishSexExotic"):
		return "SEX (EXOTIC)"
	
	return "ERROR"

func calculateScore(_id:String, _char:BaseCharacter) -> float:
	if(_id == "FetishSexBottom"):
		var result:float = 0.0
		
		var totalChecks:int = 2
		result += _char.fetishHolder.scoreFetish({
			Fetish.AnalSexReceiving: 1.0,
			Fetish.OralSexReceiving: 1.0,
			})
		if(_char.hasAnyWomb()):
			result += _char.fetishHolder.scoreFetish({
				Fetish.BeingBred: 1.0,
				})
			totalChecks += 1
		if(_char.hasVagina()):
			result += _char.fetishHolder.scoreFetish({
				Fetish.VaginalSexReceiving: 1.0,
				})
			totalChecks += 1
		
		return clamp(result / totalChecks * 3.0, -1.0, 1.0)
	if(_id == "FetishSexTop"):
		var result:float = 0.0
		
		var totalChecks:int = 2
		result += _char.fetishHolder.scoreFetish({
			Fetish.AnalSexGiving: 1.0,
			Fetish.VaginalSexGiving: 1.0,
			Fetish.StraponSexAnal: 1.0,
			Fetish.StraponSexVaginal: 1.0,
			Fetish.OralSexGiving: 1.0,
			})
		
		return clamp(result / totalChecks * 3.0, -1.0, 1.0)
	if(_id == "FetishSexExotic"):
		var result:float = 0.0
		
		var totalChecks:int = 7
		result += _char.fetishHolder.scoreFetish({
			Fetish.FeetplayGiving: 1.0,
			Fetish.FeetplayReceiving: 1.0,
			Fetish.RimmingGiving: 1.0,
			Fetish.RimmingReceiving: 1.0,
			Fetish.Tribadism: 1.0,
			Fetish.UnconsciousSex: 1.0,
			Fetish.Condoms: 1.0,
			})
		
		return clamp(result / totalChecks * 4.0, -1.0, 1.0)

	
	return 0.0
