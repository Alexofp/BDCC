extends NpcOwnerEventBase

var whoWon:String = ""

func _init():
	id = "NpcFight"
	reactsToTags = []

func onStart(_args:Array):
	setState("start")
	setSubResult(SUB_CONTINUE)
	
	involveCharID(C_EXTRA1, _args[0])
	involveCharID(C_EXTRA2, _args[1])

func start():
	playAnimation(StageScene.Duo, "stand", {pc=getRoleID(C_EXTRA1), npc=getRoleID(C_EXTRA2)})
	saynn("{npc1.name} and {npc2.name} are about to fight!")
	
	addContinue("doFight")

func start_do(_id:String, _args:Array):
	if(_id == "doFight"):
		#TODO: calculate power and compare. Same as how pawns work
		if(RNG.chance(50)):
			whoWon = "npc1"
			setState("npc1_won")
		else:
			whoWon = "npc2"
			setState("npc2_won")

func npc1_won():
	playAnimation(StageScene.Duo, "stand", {pc=getRoleID(C_EXTRA1), npcAction="defeat", npc=getRoleID(C_EXTRA2)})
	
	saynn("{npc1.name} won!")
	addButton("Continue", "See what happens next", "endEvent", ["npc1"])
	

func npc2_won():
	playAnimation(StageScene.Duo, "defeat", {pc=getRoleID(C_EXTRA1), npc=getRoleID(C_EXTRA2)})
	
	saynn("{npc2.name} won!")
	addButton("Continue", "See what happens next", "endEvent", ["npc2"])
	
func didNpc1Win() -> bool:
	return whoWon == "npc1"

func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	data["whoWon"] = whoWon
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	whoWon = SAVE.loadVar(_data, "whoWon", "")
