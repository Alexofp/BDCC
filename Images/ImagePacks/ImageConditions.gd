extends Object
class_name ImageConditions

static func areTrue(conditions):
	for condition in conditions:
		if(condition is int):
			condition = [condition]
		var con = condition[0]
		var args = condition
		args.pop_front()
		
		if(con == ImageCon.MalePC):
			if(!GM.pc.hasPenis()):
				return false
			if(GM.pc.hasVagina()):
				return false
			if(GM.pc.getFemininity() > 0.5 && GM.pc.getGender() != Gender.Male):
				return false
		if(con == ImageCon.ShemalePC):
			if(!GM.pc.hasPenis()):
				return false
			if(GM.pc.hasVagina()):
				return false
			if(GM.pc.getFemininity() < 0.4):
				return false
		if(con == ImageCon.FemalePC):
			if(GM.pc.hasPenis()):
				return false
			if(!GM.pc.hasVagina()):
				return false
			if(GM.pc.getFemininity() < 0.5 && GM.pc.getGender() != Gender.Female):
				return false
		if(con == ImageCon.HermPC):
			if(!GM.pc.hasPenis()):
				return false
			if(!GM.pc.hasVagina()):
				return false
				
		if(con == ImageCon.FlagIsTrue):
			if(!GM.main.getFlag(args[0])):
				return false
		if(con == ImageCon.FlagIsFalse):
			if(GM.main.getFlag(args[0])):
				return false
		if(con == ImageCon.FlagEquals):
			if(GM.main.getFlag(args[0]) != args[1]):
				return false
		if(con == ImageCon.FlagAbove):
			if(GM.main.getFlag(args[0]) <= args[1]):
				return false
		if(con == ImageCon.FlagBelow):
			if(GM.main.getFlag(args[0]) >= args[1]):
				return false
		if(con == ImageCon.FlagAboveOrEqual):
			if(GM.main.getFlag(args[0]) < args[1]):
				return false
		if(con == ImageCon.FlagBelowOrEqual):
			if(GM.main.getFlag(args[0]) > args[1]):
				return false
	return true
