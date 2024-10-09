extends AuctionTrait

func _init():
	ids = [
		"BodySlim",#
		"BodyAverage",#
		"BodyThick",#
		
		"Masculine",#
		"Androgynous",#
		"Feminine",#
		
		"BreastsSmall",#
		"BreastsAverage",#
		"BreastsHuge",#
		
		"PenisSmall",#
		"PenisAverage",#
		"PenisLong",#
		
		"VaginaTight",#
		"VaginaLoose",#
		
		"AnusTight",#
		"AnusLoose",#
		
		"Pregnant",#
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

func getBidderOutbidReactions(_id:String, _char:BaseCharacter) -> Array:
	if(_id == "BodySlim"):
		return [
			"That slim frame will look perfect in my collar.",
			"I'll enjoy bending that slender body to my will.",
			"That tight little body is all mine.",
			"That slim waist will look perfect against me.",
		]
	if(_id == "BodyAverage"):
		return [
			"Strong and flexible, exactly my type.",
			"That body is just what I need.",
		]
	if(_id == "BodyThick"):
		return [
			"That thick body is built for pleasure, and it’ll be mine.",
			"Those hips will be perfect under my hands.",
			"That ass and hips belong to me, and no one else.",
		]
	if(_id == "Masculine"):
		return [
			"That strong, masculine body will submit to me soon.",
			"I'll make that brute strength kneel before me.",
			"I need that body.",
		]
	if(_id == "Androgynous"):
		return [
			"I need that body.",
			"I'll savor it.",
		]
	if(_id == "Feminine"):
		return [
			"That beauty will be under me soon.",
			"No one will touch that soft, delicate body but me.",
			"I’ll own that girly figure.",
			"I'll be the one to enjoy {slave.him}.",
		]
	if(_id == "BreastsSmall"):
		return [
			"Those small tits are perfect for my hands.",
			"That petite chest is exactly what I want.",
			"Those tiny breasts are all mine.",
			"Those small, perky tits will look perfect beneath me.",
		]
	if(_id == "BreastsAverage"):
		return [
			"Those perfect tits will be mine soon.",
			"Those breasts will be all mine.",
			"Perfect tits, and they’ll be in my hands soon.",
		]
	if(_id == "BreastsHuge"):
		return [
			"Those massive tits are mine.",
			"I'll be the one enjoying those huge tits.",
			"Those tits are worth every credit, back off.",
			"Those big, soft tits will belong to me soon.",
		]
	if(_id == "PenisSmall"):
		return [
			"That tiny cock will be fun to humiliate.",
			"I’ll break that little cock personally.",
			"That small thing will be begging for release.",
			"I’ll put that little cock to proper use.",
		]
	if(_id == "PenisAverage"):
		return [
			"That cock will serve me perfectly.",
			"That cock is mine to use however I want.",
			"I’ll make sure that cock knows who it belongs to.",
			"A solid cock like that will obey my whims soon.",
		]
	if(_id == "PenisLong"):
		return [
			"That cock will be mine to control.",
			"No one else is getting their hands on that juicy cock.",
			"That thick, long cock is going to be mine.",
			"I’ll ride that long cock until it’s mine completely.",
		]
	if(_id == "VaginaTight"):
		return [
			"That tight little pussy will belong to me soon.",
			"I’ll stretch that tight pussy until it’s mine.",
			"I will claim that tight little pussy.",
			"That pussy will squeeze perfectly around me.",
			"I’ll be the one to claim that tight cunt.",
		]
	if(_id == "VaginaLoose"):
		return [
			"That pussy will be perfect for me.",
			"That pussy’s going to take me in all the way.",
			"I’ll bid for that cunt until it’s mine.",
			"That pussy will learn what it’s made for soon.",
		]
	if(_id == "AnusTight"):
		return [
			"That tight ass is mine to claim.",
			"I’ll break that tight hole to my will.",
			"That tight little hole will be begging for more.",
			"That ass is going to feel every inch of me.",
		]
	if(_id == "AnusLoose"):
		return [
			"That ass will take all I give it.",
			"I’ll make that hole remember it.",
			"That ass will be stretched to perfection.",
			"That hole will be mine, no question.",
		]
	if(_id == "Pregnant"):
		return [
			"A pregnant slut like that is rare, and I’ll have her.",
			"I’ll take care of that pregnant body soon enough.",
			"Pregnant and obedient? She’s all mine.",
			"That round belly and swollen tits will be mine to enjoy.",
		]
		
	return []
