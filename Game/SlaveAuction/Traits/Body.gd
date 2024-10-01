extends AuctionTrait

func _init():
	ids = [
		"BodySlim",
		"BodyAverage",
		"BodyThick",
		
		"Masculine",
		"Androgynous",
		"Feminine",
	]

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
	
	return "ERROR"

func calculateScore(_id:String, _char:BaseCharacter) -> float:
	var thickness:float = _char.getThickness()/100.0
	var femininity:float = _char.getFemininity()/100.0
	if(_id == "BodySlim"):
		if(thickness <= 0.33):
			return 1.0
	if(_id == "BodyAverage"):
		if(thickness > 0.33 && thickness <= 0.66):
			return 1.0
	if(_id == "BodyThick"):
		if(thickness > 0.66):
			return 1.0
			
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
