extends SexActivityBase

var npcsWithPortals:Array

func _init():
	id = "AdvancedStraponPickTarget"
	
	activityName = "Strapon target"
	activityDesc = "Select which penis to use in your advanced strapon!"
	activityCategory = ["Wear"]

func getGoals():
	return {
	}

func getSupportedSexTypes():
	return {
		SexType.DefaultSex: true,
		SexType.StocksSex: true,
		SexType.SlutwallSex: true,
		SexType.BitchsuitSex: true,
		SexType.TentaclesSex: true,
	}

func canStopSexWithThisActivity() -> bool:
	return true

func getActivityBaseScore(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	return 0.0

func getTags(_indx:int) -> Array:
	if(_indx == DOM_0):
		return [SexActivityTag.HandsUsed]
	return []

func canStartActivity(_sexEngine: SexEngine, _domInfo: SexDomInfo, _subInfo: SexSubInfo):
	if(!_domInfo.getChar().isPlayer()):
		return false
	
	if(!_domInfo.getChar().isWearingAdvancedStrapon()):
		return false
	
	return .canStartActivity(_sexEngine, _domInfo, _subInfo)

func startActivity(_args):
	npcsWithPortals = GM.main.calculateNpcsWithPortalPanties()

func getActions(_indx:int):
	if(_indx == DOM_0):
		addAction("cancel", 1.0, "Cancel", "You changed your mind", {A_PRIORITY:2001})
		addAction("pick", 0.0, "Clear", "Select the hologram strapon!", {
			A_CATEGORY: [], A_ARGS: [""], A_PRIORITY: 2002,
		})
		for theNpc in npcsWithPortals:
			if(theNpc.canUsePenisThroughPortal()):
				addAction("pick", 0.0, theNpc.getName(), "Select this target's penis!", {
					A_CATEGORY: [], A_ARGS: [theNpc.getID()], A_PRIORITY: 2005,
				})

func doAction(_indx:int, _actionID:String, _action:Dictionary):
	if(_actionID == "cancel"):
		endActivity()
	if(_actionID == "pick"):
		var theID:String = _action["args"][0]
		var theStrapon = getDom().getWornStrapon()
		if(theStrapon && theStrapon.has_method("setPenisTarget")):
			theStrapon.setPenisTarget(theID)
			if(theID.empty()):
				addText("{dom.You} {dom.youVerb('select')} the hologram setting on {dom.yourHis} advanced strapon!")
			else:
				addText("{dom.You} {dom.youVerb('project')} "+GlobalRegistry.getCharacter(theID).getName()+"'s penis on {dom.yourHis} advanced strapon!")
		endActivity()

func saveData():
	var data = .saveData()
	
	return data
	
func loadData(data):
	.loadData(data)
	
	npcsWithPortals = GM.main.calculateNpcsWithPortalPanties()
