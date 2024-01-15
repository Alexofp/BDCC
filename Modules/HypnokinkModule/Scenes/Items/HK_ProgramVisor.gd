extends SceneBase

var savedText = ""
var uniqueItemID = ""

func _init():
	sceneID = "ProgramVisorScene"

func _initScene(_args = []):
	if(_args.size() > 0):
		uniqueItemID = _args[0]

func _run():
	if(state == ""):
		var visor = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
		
		if(visor.programmedToSuppressPerk() == ""):
			saynn("This visor is currently running the default program.")
		elif(visor.programmedToSuppressPerk() == Perk.HypnosisKeywordsDrawback):
			saynn("This visor is currently programmed to suppress your keyword fixation.")
		elif(visor.programmedToSuppressPerk() == Perk.HypnosisFamousDrawback):
			saynn("This visor is currently programmed to suppress your publicly known triggers.")
		elif(visor.programmedToSuppressPerk() == Perk.HypnosisDeepTranceDrawback):
			saynn("This visor is currently programmed to reduce your vulnerability to hypnosis in general.")
			
		saynn("With a bit of know-how, you should be able to alter the programming and by proxy, your own mind.")
		
		if(visor.programmedToSuppressPerk() != ""):
			addButton("Reset", "Reset the visor to its default settings", "reset")
		if(GM.pc.hasPerk(Perk.HypnosisKeywordsDrawback)):
			addButton("Keywords", "Program the visor to suppress your keyword fixation", "keywords")
		if(GM.pc.hasPerk(Perk.HypnosisFamousDrawback)):
			addButton("Famous", "Program the visor to suppress your publicly known triggers.", "famous")
		if(GM.pc.hasPerk(Perk.HypnosisDeepTranceDrawback)):
			addButton("Deep trance", "Program the visor to reduce your vulnerability to hypnosis in general", "deep_trance")
		addButton("Cancel", "Actually, this could be dangerous", "endthescene")
		
	if(state == "post_program"):
		saynn("You program the visor.")
		
		addButton("Continue", "You did it", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "reset"):
		var visor = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
		visor.programToSuppressPerk("")
		setState("post_program")
		return
	if(_action == "keywords"):
		var visor = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
		visor.programToSuppressPerk(Perk.HypnosisKeywordsDrawback)
		setState("post_program")
		return
	if(_action == "famous"):
		var visor = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
		visor.programToSuppressPerk(Perk.HypnosisFamousDrawback)
		setState("post_program")
		return
	if(_action == "deep_trance"):
		var visor = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
		visor.programToSuppressPerk(Perk.HypnosisDeepTranceDrawback)
		setState("post_program")
		return
	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["savedText"] = savedText
	data["uniqueItemID"] = uniqueItemID
	
	return data
	
func loadData(data):
	.loadData(data)
	
	savedText = SAVE.loadVar(data, "savedText", "")
	uniqueItemID = SAVE.loadVar(data, "uniqueItemID", "")

func resolveCustomCharacterName(_charID):
	if(_charID == "attacker"):
		return "pc"
	
	return null
