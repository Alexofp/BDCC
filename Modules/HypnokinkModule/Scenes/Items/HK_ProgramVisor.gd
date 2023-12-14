extends SceneBase

var savedText = ""
var uniqueItemID = ""

func _init():
	sceneID = "HK_ProgramVisorScene"

func _initScene(_args = []):
	if(_args.size() > 0):
		uniqueItemID = _args[0]

func _run():
	if(state == ""):
		if(GM.pc.hasPerk(Perk.KeywordsDrawback)):
			addButton("Keywords", "Program the visor to suppress your keyword fixation", "keywords")
		if(GM.pc.hasPerk(Perk.FamousDrawback)):
			addButton("Famous", "Program the visor to suppress your triggers.", "famous")
		if(GM.pc.hasPerk(Perk.DeepTranceDrawback)):
			addButton("Deep trance", "Program the visor to reduce your vulnerability to hypnosis", "deep_trance")
		
	if(state == "post_program"):
		saynn("You program the visor.")
		
		addButton("Continue", "You did it", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "keywords"):
		var visor: HK_HypnoVisor = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
		visor.programToSuppressPerk(Perk.KeywordsDrawback)
		setState("post_program")
		return
	if(_action == "famous"):
		var visor: HK_HypnoVisor = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
		visor.programToSuppressPerk(Perk.FamousDrawback)
		setState("post_program")
		return
	if(_action == "deep_trance"):
		var visor: HK_HypnoVisor = GM.pc.getInventory().getItemByUniqueID(uniqueItemID)
		visor.programToSuppressPerk(Perk.DeepTranceDrawback)
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
