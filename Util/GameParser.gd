extends "res://Util/SimpleParser.gd"
class_name GameParser

func callFunc(_command: String, _args: Array):
	var shouldBeUpperCase = false
	if(_command.length() > 0 && _command[0].to_upper() == _command[0]):
		shouldBeUpperCase = true
		_command[0] = _command[0].to_lower()
	
	var result = callFuncWrapper(_command, _args)
	if((result is String) && shouldBeUpperCase && result.length() > 0):
		result[0] = result[0].to_upper()
	
	return result
	
func callFuncWrapper(_command: String, _args: Array):
	if(_command == "sayMale" && _args.size() == 1):
		return Util.sayMale(str(_args[0]))
	if(_command == "sayFemale" && _args.size() == 1):
		return Util.sayFemale(str(_args[0]))
	if(_command == "sayAndro" && _args.size() == 1):
		return Util.sayAndro(str(_args[0]))
	if(_command == "sayOther" && _args.size() == 1):
		return Util.sayOther(str(_args[0]))
	if(_command == "sayPlayer" && _args.size() == 1):
		return Util.sayPlayer(str(_args[0]))
	if(_command == "pick"):
		return str(RNG.pick(_args))
	if(_command == "rahiMaster"):
		return GM.main.getFlag("RahiModule.rahiPCName", GM.pc.getName())
	if(_command == "rahiFP" && _args.size() == 2):
		if(GlobalRegistry.getModule("RahiModule").canTalkInFirstPerson()):
			return _args[0]
		else:
			return _args[1]
	if(_command == "taviCorruption"):
		return str(Util.roundF(GM.main.getFlag("TaviModule.Ch6Corruption", 1.0)*100.0, 1))+"%"
	
	return "[color=red]!RUNTIME ERROR NO COMMAND FOUND "+_command+" "+str(_args)+"![/color]"
	
func callObjectFunc(_obj: String, _command: String, _args: Array, overrides: Dictionary = {}):
	if(overrides.has(_obj)):
		_obj = overrides[_obj]
	
	var shouldBeUpperCase = false
	if(_command.length() > 0 && _command[0].to_upper() == _command[0]):
		shouldBeUpperCase = true
		_command[0] = _command[0].to_lower()
	
	var result = callObjectFuncWrapper(_obj, _command, _args)
	if((result is String) && shouldBeUpperCase && result.length() > 0):
		result[0] = result[0].to_upper()
	
	return result
	
func callObjectFuncWrapper(_obj: String, _command: String, _args: Array):
	var resolvedName = GM.main.resolveCustomCharacterName(_obj)
	if(resolvedName != null):
		_obj = resolvedName
	
	var object = null
	if(_obj == "pc"):
		object = GM.pc
	elif(GlobalRegistry.getCharacter(_obj) != null):
		object = GlobalRegistry.getCharacter(_obj)
		
	if(object == null):
		return "[color=red]!RUNTIME ERROR NO CHARACTER FOUND "+_obj+"."+_command+" "+str(_args)+"![/color]"
	if(_command == "name" && _args.size() == 0):
		return object.getName()		
	if(_command == "nameS" && _args.size() == 0):
		return object.getName()+"'s"
	if(_command in ["nameOrYou", "you"] && _args.size() == 0):
		if(object.isPlayer()):
			return "you"
		else:
			return object.getName()
	if(_command in ["youHe"] && _args.size() == 0):
		if(object.isPlayer()):
			return "you"
		else:
			return object.heShe()
	if(_command in ["himYou", "youHim"] && _args.size() == 0):
		if(object.isPlayer()):
			return "you"
		else:
			return object.himHer()
	if(_command in ["hisYour", "hisYou", "yourHis", "youHis"] && _args.size() == 0):
		if(object.isPlayer()):
			return "your"
		else:
			return object.hisHer()
	if(_command in ["nameSOrYou", "your"] && _args.size() == 0):
		if(object.isPlayer()):
			return "your"
		else:
			return object.getName()+"'s"
	if(_command in ["youAre"] && _args.size() == 0):
		if(object.isPlayer()):
			return "are"
		else:
			return object.isAre()
	if(_command == "youVerb"):
		if(object.isPlayer()):
			return str(_args[0])
		if(_args.size() == 1):
			return object.verbS(str(_args[0]))
		if(_args.size() == 2):
			return object.verbS(str(_args[0]), str(_args[1]))
	if((_command == "yourself") && _args.size() == 0):
		if(object.isPlayer()):
			return "yourself"
		return object.himselfHerself()
	if(_command == "inmateNumber" && _args.size() == 0 && object.has_method("getInmateNumber")):
		return object.getInmateNumber()		
	if(_command == "inmateNumberFull" && _args.size() == 0 && object.has_method("getFullInmateNumber")):
		return object.getFullInmateNumber()		
	if(_command == "inmateColor" && _args.size() == 0 && object.has_method("getInmateColorString")):
		return object.getInmateColorString()		
	if(_command == "say" && _args.size() == 1):
		return object.formatSay(str(_args[0]))
	if((_command == "she" || _command == "he" || _command == "heShe") && _args.size() == 0):
		return object.heShe()
	if((_command == "his" || _command == "her" || _command == "hisHer") && _args.size() == 0):
		return object.hisHer()
	if((_command == "him" || _command == "himHer") && _args.size() == 0):
		return object.himHer()
	if((_command == "is" || _command == "are" || _command == "isAre") && _args.size() == 0):
		return object.isAre()
	if((_command == "has" || _command == "have" || _command == "hasHave") && _args.size() == 0):
		return object.hasHave()
	if((_command == "himself" || _command == "herself" || _command == "himselfHerself") && _args.size() == 0):
		return object.himselfHerself()
	if(_command in ["verbS", "verb"]):
		if(_args.size() == 1):
			return object.verbS(str(_args[0]))
		if(_args.size() == 2):
			return object.verbS(str(_args[0]), str(_args[1]))
			
	if(_command in ["penis", "cock", "dick"] && _args.size() == 0 && object.has_method("getBodypartLewdDescriptionAndName")):
		return object.getBodypartLewdDescriptionAndName(BodypartSlot.Penis)
	if(_command in ["aPenis", "aCock", "aDick"] && _args.size() == 0 && object.has_method("getBodypartLewdDescriptionAndNameWithA")):
		return object.getBodypartLewdDescriptionAndNameWithA(BodypartSlot.Penis)
	if(_command in ["penisSize", "cockSize", "dickSize"] && _args.size() == 0 && object.has_method("getBodypartLewdSizeAdjective")):
		return object.getBodypartLewdSizeAdjective(BodypartSlot.Penis)
	if(_command in ["penisDesc", "cockDesc", "dickDesc"] && _args.size() == 0 && object.has_method("getBodypartLewdAdjective")):
		return object.getBodypartLewdAdjective(BodypartSlot.Penis)
	if(_command in ["penisSizeStr", "cockSizeStr", "dickSizeStr"] && _args.size() == 0 && object.has_method("getPenisSizeString")):
		return object.getPenisSizeString()
		
	if(_command == "vagina" && _args.size() == 0 && object.has_method("getBodypartLewdDescriptionAndName")):
		return object.getBodypartLewdDescriptionAndName(BodypartSlot.Vagina)
	if(_command == "aVagina" && _args.size() == 0 && object.has_method("getBodypartLewdDescriptionAndNameWithA")):
		return object.getBodypartLewdDescriptionAndNameWithA(BodypartSlot.Vagina)
		
	if(_command == "breasts" && _args.size() == 0 && object.has_method("getBodypartLewdDescriptionAndName")):
		return object.getBodypartLewdDescriptionAndName(BodypartSlot.Breasts)
	if(_command == "breastsSize" && _args.size() == 0 && object.has_method("getBodypartLewdSizeAdjective")):
		return object.getBodypartLewdSizeAdjective(BodypartSlot.Breasts)
	if(_command == "breastsDesc" && _args.size() == 0 && object.has_method("getBodypartLewdAdjective")):
		return object.getBodypartLewdAdjective(BodypartSlot.Breasts)
		
	if(_command == "tail" && _args.size() == 0 && object.has_method("getBodypartLewdDescriptionAndName")):
		return object.getBodypartLewdDescriptionAndName(BodypartSlot.Tail)
	if(_command == "aTail" && _args.size() == 0 && object.has_method("getBodypartLewdDescriptionAndNameWithA")):
		return object.getBodypartLewdDescriptionAndNameWithA(BodypartSlot.Tail)
	if(_command == "tailSize" && _args.size() == 0 && object.has_method("getBodypartLewdSizeAdjective")):
		return object.getBodypartLewdSizeAdjective(BodypartSlot.Tail)
	if(_command == "tailDesc" && _args.size() == 0 && object.has_method("getBodypartLewdAdjective")):
		return object.getBodypartLewdAdjective(BodypartSlot.Tail)
		
	if(_command in ["thick", "slim"] && _args.size() == 0 && object.has_method("getThicknessAdjective")):
		return object.getThicknessAdjective()
	if(_command in ["feminine", "masculine", "masc"] && _args.size() == 0 && object.has_method("getFeminityAdjective")):
		return object.getFeminityAdjective()
	
	if(_command in ["undressMessage"] && _args.size() == 0 && object.has_method("getUndressMessage")):
		return object.getUndressMessage(false)
	if(_command in ["undressMessageS"] && _args.size() == 0 && object.has_method("getUndressMessage")):
		return object.getUndressMessage(true)
	
	if(_command == "inmateType" && _args.size() == 0 && object.has_method("getInmateType")):
		var inmateType = object.getInmateType()
		return InmateType.getOfficialName(inmateType)
	
	if(_command == "milk" && _args.size() == 0):
		var breasts = object.getBodypart(BodypartSlot.Breasts)
		var milkType = breasts.getProducingFluidType()
		if(milkType == null):
			return "[color=red]ERROR:NO_MILK[/color]"
		return BodilyFluids.getFluidName(milkType)
		
	if(_command == "cum" && _args.size() == 0):
		var penis = object.getBodypart(BodypartSlot.Penis)
		var cumType = penis.getProducingFluidType()
		if(cumType == null):
			return "[color=red]ERROR:NO_CUM[/color]"
		return BodilyFluids.getFluidName(cumType)
	
	if(_command in ["analStretch", "anusStretch"] && _args.size() == 0):
		var bodypart:BodypartAnus = object.getBodypart(BodypartSlot.Anus)
		if(bodypart == null):
			return "[color=red]ERROR:NOBODYPART[/color]"
		var orifice:Orifice = bodypart.getOrifice()
		if(orifice == null):
			return "[color=red]ERROR:NOANUS[/color]"
		return orifice.getLoosenessString()
		
	if(_command in ["pussyStretch", "vaginaStretch"] && _args.size() == 0):
		var bodypart:BodypartVagina = object.getBodypart(BodypartSlot.Vagina)
		if(bodypart == null):
			return "[color=red]ERROR:NOBODYPART[/color]"
		var orifice:Orifice = bodypart.getOrifice()
		if(orifice == null):
			return "[color=red]ERROR:NOVAGINA[/color]"
		return orifice.getLoosenessString()
		
	if(_command in ["throatStretch"] && _args.size() == 0):
		var bodypart:BodypartHead = object.getBodypart(BodypartSlot.Head)
		if(bodypart == null):
			return "[color=red]ERROR:NOBODYPART[/color]"
		var orifice:Orifice = bodypart.getOrifice()
		if(orifice == null):
			return "[color=red]ERROR:NOTHROAT[/color]"
		return orifice.getLoosenessString()
	
	if(_command in ["bodyContents", "bodyMess"] && _args.size() == 0):
		var thetext = Util.humanReadableList(object.getFluids().getFluidList())
		if(thetext == null || thetext == ""):
			return "nothing"
		return thetext
	
	if(_command in ["pussyContents", "vaginaContents"] && _args.size() == 0):
		var bodypart:BodypartVagina = object.getBodypart(BodypartSlot.Vagina)
		if(bodypart == null):
			return "[color=red]ERROR:NOBODYPART[/color]"
		var orifice:Orifice = bodypart.getOrifice()
		if(orifice == null):
			return "[color=red]ERROR:NOVAGINA[/color]"
		var thetext = Util.humanReadableList(orifice.getFluidList())
		if(thetext == null || thetext == ""):
			return "nothing"
		return thetext
	
	if(_command in ["buttContents", "assContents", "anusContents"] && _args.size() == 0):
		var bodypart = object.getBodypart(BodypartSlot.Anus)
		if(bodypart == null):
			return "[color=red]ERROR:NOBODYPART[/color]"
		var orifice:Orifice = bodypart.getOrifice()
		if(orifice == null):
			return "[color=red]ERROR:NOANUS[/color]"
		var thetext = Util.humanReadableList(orifice.getFluidList())
		if(thetext == null || thetext == ""):
			return "nothing"
		return thetext
	
	if(_command in ["throatContents"] && _args.size() == 0):
		var bodypart = object.getBodypart(BodypartSlot.Head)
		if(bodypart == null):
			return "[color=red]ERROR:NOBODYPART[/color]"
		var orifice:Orifice = bodypart.getOrifice()
		if(orifice == null):
			return "[color=red]ERROR:NOTHROAT[/color]"
		var thetext = Util.humanReadableList(orifice.getFluidList())
		if(thetext == null || thetext == ""):
			return "nothing"
		return thetext
	
	if(_command in ["straponContents"] && _args.size() == 0):
		return object.getStraponContentsReadableString()
	
	if(_command in ["privates"] && _args.size() == 0):
		var bodypartsToCheck = [BodypartSlot.Breasts, BodypartSlot.Penis, BodypartSlot.Vagina, BodypartSlot.Anus]
		
		var result = []
		for partID in bodypartsToCheck:
			if(!object.hasBodypart(partID)):
				continue
			var bodypart = object.getBodypart(partID)
			
			if(partID == BodypartSlot.Vagina):
				var orifice:Orifice = bodypart.getOrifice()
				if(orifice == null):
					continue
				result.append(orifice.getLoosenessString()+" pussy")
			elif(partID == BodypartSlot.Anus):
				var orifice:Orifice = bodypart.getOrifice()
				if(orifice == null):
					continue
				result.append(orifice.getLoosenessString()+" anus")
			else:
				result.append(object.getBodypartLewdDescriptionAndName(partID))
		
		return Util.humanReadableList(result)
	
	if(_command in ["boy", "boyGirl", "girl"] && _args.size() == 0):
		if(object.getGender() == Gender.Male):
			return "boy"
		elif(object.getGender() == Gender.Female):
			return "girl"
		elif(object.getGender() == Gender.Other):
			return "thing"
		else:
			if(object.getFemininity() >= 50):
				return "girl"
			else:
				return "boy"
	
	return "[color=red]!RUNTIME ERROR NO COMMAND FOUND "+_obj+"."+_command+" "+str(_args)+"![/color]"
