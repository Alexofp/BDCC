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
	saynn("{npc1.name} and {npc2.name} prepare to fight!")

	var char1FightScore:float = calcPowerScoreOf(C_EXTRA1)
	var char2FightScore:float = calcPowerScoreOf(C_EXTRA2)
	char1FightScore *= char1FightScore
	char2FightScore *= char2FightScore
	var theChar1Chance:float = char1FightScore / (char1FightScore + char2FightScore)
	saynn("{npc1.name}'s chance to win: "+str(Util.roundF(theChar1Chance*100.0, 1))+"%\n{npc2.name}'s chance to win: "+str(Util.roundF((1.0-theChar1Chance)*100.0, 1)))
	
	addContinue("doFight")

func calcPowerScoreOf(_role:int) -> float:
	var charFightScore:float = getChar(_role).calculatePowerScore()
	if(getRoleID(_role) == getOwnerID()):
		charFightScore *= 2.0
	return max(charFightScore, 1.0)

func start_do(_id:String, _args:Array):
	if(_id == "doFight"):
		var char1FightScore:float = calcPowerScoreOf(C_EXTRA1)
		var char2FightScore:float = calcPowerScoreOf(C_EXTRA2)
		var randTable:Array = [
			[true, char1FightScore*char1FightScore],
			[false, char2FightScore*char2FightScore],
		]
		var didChar1Win:bool = RNG.pickWeightedPairs(randTable)
		
		if(didChar1Win):
			whoWon = "npc1"
			makeRoleExhausted(C_EXTRA2)
			setState("npc1_won")
		else:
			whoWon = "npc2"
			makeRoleExhausted(C_EXTRA1)
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
	
func didWin() -> bool:
	return whoWon == "npc1"

func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	data["whoWon"] = whoWon
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	whoWon = SAVE.loadVar(_data, "whoWon", "")
