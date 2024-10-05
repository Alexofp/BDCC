extends AuctionTrait

func _init():
	ids = [
		"BodySlim",
		"BodyAverage",
		"BodyThick",
		
		"Masculine",
		"Androgynous",
		"Feminine",
		
		"BreastsSmall",
		"BreastsAverage",
		"BreastsHuge",
		
		"PenisSmall",
		"PenisAverage",
		"PenisLong",
		
		"VaginaTight",
		"VaginaLoose",
		
		"AnusTight",
		"AnusLoose",
		
		"Pregnant",
	]

func getTraitType(_id:String):
	return AuctionTraitType.Body

func getName(_id:String) -> String:
	if(_id == "BodySlim"):
		return "Slim body"
	if(_id == "BodyAverage"):
		return "Average body"
	if(_id == "BodyThick"):
		return "Thick body"
	if(_id == "Masculine"):
		return "Masculine"
	if(_id == "Androgynous"):
		return "Androgynous"
	if(_id == "Feminine"):
		return "Feminine"
	if(_id == "BreastsSmall"):
		return "Small breasts"
	if(_id == "BreastsAverage"):
		return "Average-sized breasts"
	if(_id == "BreastsHuge"):
		return "Huge breasts"
	if(_id == "PenisSmall"):
		return "Small penis"
	if(_id == "PenisAverage"):
		return "Average-length penis"
	if(_id == "PenisLong"):
		return "Long penis"
	if(_id == "VaginaTight"):
		return "Tight pussy"
	if(_id == "VaginaLoose"):
		return "Stretched pussy"
	if(_id == "AnusTight"):
		return "Tight anus"
	if(_id == "AnusLoose"):
		return "Stretched anus"
	if(_id == "Pregnant"):
		return "Pregnant"
	
	return "ERROR"

func calculateScore(_id:String, _char:BaseCharacter) -> float:
	if(_id in ["BreastsSmall", "BreastsAverage", "BreastsHuge"]):
		var breasts = _char.getBodypart(BodypartSlot.Breasts)
		if(breasts == null):
			return 0.0
		var size = breasts.getSize()
		if(_id == "BreastsSmall"):
			if(size <= BreastsSize.B):
				return 1.0
		if(_id == "BreastsAverage"):
			if(size > BreastsSize.B && size <= BreastsSize.D):
				return 1.0
		if(_id == "BreastsHuge"):
			if(size > BreastsSize.D):
				return 1.0
		return 0.0
	
	if(_id in ["PenisSmall", "PenisAverage", "PenisLong"]):
		var penis = _char.getBodypart(BodypartSlot.Penis)
		if(penis == null):
			return 0.0
		var size = penis.getLength()
		if(_id == "PenisSmall"):
			if(size <= 11.0):
				return 1.0
		if(_id == "PenisAverage"):
			if(size > 11.0 && size <= 18.0):
				return 1.0
		if(_id == "PenisLong"):
			if(size > 18.0):
				return 1.0
		return 0.0
	
	if(_id in ["VaginaTight", "VaginaLoose"]):
		var vagina = _char.getBodypart(BodypartSlot.Vagina)
		if(vagina == null):
			return 0.0
		var orifice = vagina.getOrifice()
		if(orifice == null):
			return 0.0
		var looseness:float = orifice.getLooseness()
		if(_id == "VaginaTight"):
			if(looseness <= 2.0):
				return 1.0
		if(_id == "VaginaLoose"):
			if(looseness > 2.0):
				return 1.0
		return 0.0
	
	if(_id in ["AnusTight", "AnusLoose"]):
		var anus = _char.getBodypart(BodypartSlot.Anus)
		if(anus == null):
			return 0.0
		var orifice = anus.getOrifice()
		if(orifice == null):
			return 0.0
		var looseness:float = orifice.getLooseness()
		if(_id == "AnusTight"):
			if(looseness <= 2.0):
				return 1.0
		if(_id == "AnusLoose"):
			if(looseness > 2.0):
				return 1.0
		return 0.0
	
	if(_id == "Pregnant"):
		if(_char.isVisiblyPregnant()):
			return 1.0
	
	if(_id in ["BodySlim", "BodyAverage", "BodyThick"]):
		var thickness:float = _char.getThickness()/100.0
		if(_id == "BodySlim"):
			if(thickness <= 0.33):
				return 1.0
		if(_id == "BodyAverage"):
			if(thickness > 0.33 && thickness <= 0.66):
				return 1.0
		if(_id == "BodyThick"):
			if(thickness > 0.66):
				return 1.0
		return 0.0
			
	if(_id in ["Masculine", "Androgynous", "Feminine"]):
		var femininity:float = _char.getFemininity()/100.0
		if(_id == "Masculine"):
			if(femininity <= 0.4):
				return 1.0
		if(_id == "Androgynous"):
			if(femininity > 0.4 && femininity <= 0.6):
				return 1.0
		if(_id == "Feminine"):
			if(femininity > 0.6):
				return 1.0
		return 0.0
	
	return 0.0
