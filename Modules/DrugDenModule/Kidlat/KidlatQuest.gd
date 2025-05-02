extends QuestBase

func _init():
	id = "KidlatQuest"

func getVisibleName():
	return "Kidlat's Shop of Wonders"

func getProgress():
	var result = []
	
	var curPurAm:int = getFlag("DrugDenModule.KidlatItemsBought", 0)
	var s1hap:bool = getFlag("DrugDenModule.Kidlat1Hap", false)
	var s2hap:bool = getFlag("DrugDenModule.Kidlat2Hap", false)
	var s3hap:bool = getFlag("DrugDenModule.Kidlat3Hap", false)
	var s4hap:bool = getFlag("DrugDenModule.Kidlat4Hap", false)
	var s5hap:bool = getFlag("DrugDenModule.Kidlat5Hap", false)
	var s6hap:bool = getFlag("DrugDenModule.Kidlat6Hap", false)
	var s6knows:bool = getFlag("DrugDenModule.Kidlat6Knows", false)
	var s7hap:bool = getFlag("DrugDenModule.Kidlat7Hap", false)
	var s7knows:bool = getFlag("DrugDenModule.Kidlat7Knows", false)
	var s8hap:bool = getFlag("DrugDenModule.Kidlat8Hap", false)
	
	var whatDoStr:String = ""
	
	if(s1hap && !s2hap):
		if(curPurAm < 3):
			var diff:int = 3 - curPurAm
			whatDoStr = "Buy "+str(diff)+" more item"+("s" if diff != 1 else "")+" from her to progress the story."
		else:
			whatDoStr = "Meet her during a [b]new[/b] drug den run to progress the story."
	
	result.append("You found Kidlat, a kitty that runs her little shop down in the drug den. You have currently bought "+str(curPurAm)+" item"+("s" if curPurAm != 1 else "")+" from her.")
	
	if(s2hap && !s3hap):
		whatDoStr = ""
		result.append("Some junkie in the drug den stole Kidlat's uniform! Find it to progress the story. You will probably find some info by beating up one of the boss junkies.")
	
	if(s3hap):
		result.append("You returned Kidlat her uniform! She will now sell better items.")
	
		if(curPurAm < 6):
			var diff:int = 6 - curPurAm
			whatDoStr = "Buy "+str(diff)+" more item"+("s" if diff != 1 else "")+" from her to progress the story."
		else:
			whatDoStr = "Meet her during a [b]new[/b] drug den run to progress the story."
	
	if(s4hap && !s5hap):
		whatDoStr = ""
		result.append("Kidlat triggered a trap that locked some restraints onto her. Find 2 restraint keys and give them to her in order to progress the story.")
	
	if(s5hap):
		result.append("You helped unlock Kidlat's restraints! She will now sell more items.")
		
		if(curPurAm < 9):
			var diff:int = 9 - curPurAm
			whatDoStr = "Buy "+str(diff)+" more item"+("s" if diff != 1 else "")+" from her to progress the story."
		else:
			whatDoStr = "Meet her during a [b]new[/b] drug den run to progress the story."
	
	if(s6knows && !s6hap):
		whatDoStr = ""
		result.append("Kidlat is very horny from alcohol. Find and feed her an anaphrodisiac pill in order to progress the story.")
		
	if(s6hap):
		result.append("You helped to cool Kidlat down! Kidlat will now have better prices for you.")
		
		if(curPurAm < 12):
			var diff:int = 12 - curPurAm
			whatDoStr = "Buy "+str(diff)+" more item"+("s" if diff != 1 else "")+" from her to progress the story."
		else:
			whatDoStr = "Meet her during a drug den run to progress the story."
	
	if(s7knows && !s7hap):
		whatDoStr = ""
		result.append("Kidlat needs to be protected from the junkie in order to progress the story.")
		
	if(s7hap):
		whatDoStr = ""
		result.append("You have protected Kidlat from the booze junkie!")
		
		if(!s8hap):
			whatDoStr = "Find Kidlat in the cellblock in order to progress the story!"
	
	if(s8hap):
		whatDoStr = ""
		result.append("You can now find Kidlat in the lilac cellblock!")
	
	if(whatDoStr != "" && !result.empty()):
		result[result.size() - 1] += (" " + whatDoStr)

	return result

func isVisible():
	return getFlag("DrugDenModule.Kidlat1Hap")

func isCompleted():
	return getFlag("DrugDenModule.Kidlat8Hap")

func isMainQuest():
	return false
