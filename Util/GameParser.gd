extends "res://Util/SimpleParser.gd"
class_name GameParser

func callFunc(_command: String, _args: Array):
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
	
	return "!RUNTIME ERROR NO COMMAND FOUND "+_command+" "+str(_args)+"!"
	
func callObjectFunc(_obj: String, _command: String, _args: Array):
	var resolvedName = GM.main.resolveCustomCharacterName(_obj)
	if(resolvedName != null):
		_obj = resolvedName
	
	var object = null
	if(_obj == "pc"):
		object = GM.pc
	elif(GlobalRegistry.getCharacter(_obj) != null):
		object = GlobalRegistry.getCharacter(_obj)
		
	if(object == null):
		return "!RUNTIME ERROR NO CHARACTER FOUND "+_obj+"."+_command+" "+str(_args)+"!"
	if(_command == "name" && _args.size() == 0):
		return object.getName()		
	if(_command == "inmateNumber" && _args.size() == 0 && object.has_method("getInmateNumber")):
		return object.getInmateNumber()		
	if(_command == "inmateNumberFull" && _args.size() == 0 && object.has_method("getFullInmateNumber")):
		return object.getFullInmateNumber()		
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
	if(_command == "verbS"):
		if(_args.size() == 1):
			return object.verbS(str(_args[0]))
		if(_args.size() == 2):
			return object.verbS(str(_args[0]), str(_args[1]))
			
	if(_command in ["penis", "cock"] && _args.size() == 0 && object.has_method("getBodypartLewdDescriptionAndName")):
		return object.getBodypartLewdDescriptionAndName(BodypartSlot.Penis)
	if(_command in ["aPenis", "aCock"] && _args.size() == 0 && object.has_method("getBodypartLewdDescriptionAndNameWithA")):
		return object.getBodypartLewdDescriptionAndNameWithA(BodypartSlot.Penis)
	if(_command in ["penisSize", "cockSize"] && _args.size() == 0 && object.has_method("getBodypartLewdSizeAdjective")):
		return object.getBodypartLewdSizeAdjective(BodypartSlot.Penis)
	if(_command in ["penisDesc", "cockDesc"] && _args.size() == 0 && object.has_method("getBodypartLewdAdjective")):
		return object.getBodypartLewdAdjective(BodypartSlot.Penis)
		
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
	
	return "!RUNTIME ERROR NO COMMAND FOUND "+_obj+"."+_command+" "+str(_args)+"!"
