extends SlaveActivityBase

var lastReport:String = ""

func _init():
	id = "MilkingInMedical"
	
func getVisibleName():
	return "Milking in medical"

func getActivityText():
	var theText:String = "{npc.name} is being milked in the medical!"

	if(lastReport != ""):
		theText += "\n\nToday, {npc.he} produced this:\n"+lastReport

	return theText

func onStart(_args = []):
	pass

func onNewDay():
	var fluidsGot:Dictionary = GM.main.SCI.doMilkCharacter(getChar())
	
	if(fluidsGot.empty()):
		lastReport = " - Nothing"
		return
	lastReport = ""
	for fluidID in fluidsGot:
		var theFluidOBJ:FluidBase = GlobalRegistry.getFluid(fluidID)
		var fluidName:String = theFluidOBJ.getVisibleName() if theFluidOBJ != null else fluidID
		
		lastReport += " - "+fluidName+": "+str(Util.roundF(fluidsGot[fluidID], 1))+" ml"

func preventsStatsDecay():
	return true

func preventsNormalInteractions():
	return true

func hoursPassed(_howMuch):
	pass

func getInteractActions():
	return [
		{
			name = "Cancel",
			desc = "Bring your slave back.",
			sceneID = "SlaveryCancelActivity",
			args = ["You find {npc.name} in the medical and begin {npc.him} back."],
			buttonChecks = [],
		}
	]

func getCustomInteractAnimInfo():
	# Different anim here
	return [StageScene.Duo, "stand", {pc="pc", npc=getCharID()}]

func saveData():
	var data = .saveData()
	
	data["lastReport"] = lastReport
	
	return data

func loadData(_data):
	.loadData(_data)
	
	lastReport = SAVE.loadVar(_data, "lastReport", "")
