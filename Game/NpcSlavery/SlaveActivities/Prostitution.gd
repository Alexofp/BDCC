extends SlaveActivityBase

var workHoursLeft:int = 12
var workHoursRemember:int = 12
var earnedCreds:int = 0
var slutSkill:int = 0

func _init():
	id = "Prostitution"
	
func getVisibleName():
	return "Prostitution"

func onStart(_args = []):
	slutSkill = getSlave().getSlaveSkill(SlaveType.Slut)
	
	workHoursLeft = RNG.randi_range(3,4)
	if(slutSkill >= 8):
		workHoursLeft += RNG.randi_range(2,4)
	if(slutSkill >= 11):
		workHoursLeft += RNG.randi_range(3,5)
	if(slutSkill >= 13):
		workHoursLeft += RNG.randi_range(3,6)
	if(slutSkill >= 15):
		workHoursLeft += RNG.randi_range(4,6)
	workHoursRemember = workHoursLeft

func onNewDay():
	pass

func preventsStatsDecay():
	return false

func preventsNormalInteractions():
	return true

func getActivityText():
	return "{npc.name} is currently out of there, whoring {npc.himself} out.\n\n{npc.He} will find you after {npc.he} finishes working.\n\nYou can cancel this but then you won't receive your slut's earned credits."

func hoursPassed(_howMuch):
	if(workHoursLeft <= 0):
		return
	for _i in range(_howMuch):
		if(workHoursLeft > 0):
			workHoursLeft -= 1
			processOneWorkHour()

func processOneWorkHour():
	var npcSlave:NpcSlave = getSlave()
	# Probably could use some fancy formulas here
	var chanceEarned = 15 + slutSkill * 3
	var chanceMod = Util.remapValue(npcSlave.getObedience(), 0.0, 1.0, 0.5, 1.0) * Util.remapValue(npcSlave.getLove(), 0.0, 1.0, 0.5, 1.0) * Util.remapValue(npcSlave.getBrokenSpirit(), 0.0, 1.0, 0.5, 1.0)
	
	if(RNG.chance(chanceEarned * chanceMod)):
		var potentialPayout:int = RNG.randi_range(1, Util.maxi(1, int(round(sqrt(slutSkill+1)))))
		earnedCreds += potentialPayout
		getSlave().addExperience(2)

func canReceiveCredits():
	return workHoursLeft <= 0

func getEarnedCredits():
	return earnedCreds

func getInteractActions():
	return [
		{
			name = "Cancel",
			desc = "Find your slut and tell them to stop whoring themselves out.",
			sceneID = "SlaveryCancelActivity",
			args = ["You find {npc.name} out in the prison and tell {npc.him} to stop working. Since you disturbed {npc.his} work, you won't get any credits."],
			buttonChecks = [],
		}
	]

func getCustomInteractAnimInfo():
	return [StageScene.Solo, "stand", {pc="pc"}]

func saveData():
	var data = .saveData()
	
	data["workHoursLeft"] = workHoursLeft
	data["earnedCreds"] = earnedCreds
	data["slutSkill"] = slutSkill
	data["workHoursRemember"] = workHoursRemember
	
	return data

func loadData(_data):
	.loadData(_data)
	
	workHoursLeft = SAVE.loadVar(_data, "workHoursLeft", 12)
	earnedCreds = SAVE.loadVar(_data, "earnedCreds", 0)
	slutSkill = SAVE.loadVar(_data, "slutSkill", 0)
	workHoursRemember = SAVE.loadVar(_data, "workHoursRemember", 0)
