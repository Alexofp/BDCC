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
	var object = null
	if(_obj == "pc"):
		object = GM.pc
	elif(GlobalRegistry.getCharacter(_obj) != null):
		object = GlobalRegistry.getCharacter(_obj)
		
	if(object == null):
		return "!RUNTIME ERROR NO CHARACTER FOUND "+_obj+"."+_command+" "+str(_args)+"!"
	if(_command == "name" && _args.size() == 0):
		return object.getName()		
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
	
	return "!RUNTIME ERROR NO COMMAND FOUND "+_obj+"."+_command+" "+str(_args)+"!"
