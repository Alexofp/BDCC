extends ItemBase

var tfID:String = ""
var tfArgs:Dictionary = {}

func _init():
	id = "TFPill"

func getVisibleName():
	return "Strange Pill"
	
func getDescription():
	return "A pill that lacks any labels or instructions. Who knows what it will do..\n[color=cyan]This pill might have some kind of transformative effect on your body.[/color]"

func canUseInCombat():
	return true

func pillStartTF(_user) -> String:
	if(tfID == ""):
		tfID = TFUtil.generateTFIDForAPill()
		
		if(tfID != ""):
			var tf = GlobalRegistry.getTransformationRef(tfID)
			if(tf != null):
				tfArgs = tf.generatePillArgs()
	
	
	if(tfID == "" || GlobalRegistry.getTransformationRef(tfID) == null || !GlobalRegistry.getTransformationRef(tfID).isPossibleFor(_user) || _user.getTFHolder()==null):
		return "{USER.You} {USER.youVerb('swallow')} the pill.. but nothing happens. Was that a fake one?".replace("USER", _user.getID())
	
	_user.getTFHolder().startTransformation(tfID, tfArgs)
	return "{USER.You} {USER.youVerb('swallow')} the weird pill..".replace("USER", _user.getID())

func useInCombat(_attacker, _receiver):
	removeXOrDestroy(1)
	return pillStartTF(_attacker)

func getPossibleActions():
	return [
		{
			"name": "Consume",
			"scene": "UseItemLikeInCombatScene",
			"description": "Take the pill",
		},
	]

func getPrice():
	return 3

func canSell():
	return true

func canCombine():
	return false

#func tryCombine(_otherItem):
#	if(tfID == "" && _otherItem.tfID == ""):
#		return .tryCombine(_otherItem)
#	return false

func addsIntoxication():
	return 0.1

func getTimedBuffs():
	return [
	]

func getBuffsDurationSeconds():
	return 60*60*12

func getTimedBuffsTurns():
	return [
	]

func getBuffsDurationTurns():
	return 5

func getTags():
	return [
		#ItemTag.SoldByMedicalVendomat,
		ItemTag.SexEngineDrug,
		]

func getBuyAmount():
	return 1

func getSexEngineInfo(_sexEngine, _domInfo, _subInfo):
	#var sub:BaseCharacter = _subInfo.getChar()
	#var dom:BaseCharacter = _domInfo.getChar()
	
	return {
		"name": "Strange Pill",
		"usedName": "a strange pill",
		"desc": getDescription(),
		"scoreOnSub": 0.0,#_domInfo.goalsScoreMax({SexGoal.FuckVaginal: 1.0, SexGoal.FuckAnal: 0.5}, _subInfo.charID)*_domInfo.fetishScore({Fetish.Breeding: 1.0}),
		"scoreOnSelf": 0.0,
		"scoreSubScore": _subInfo.fetishScore({Fetish.TFReceiving: 1.0}),
		"canUseOnDom": true,
		"canUseOnSub": true,
		"maxUsesByNPC": 1,
	}

func useInSex(_receiver):
	var _theText:String = pillStartTF(_receiver)
	return {
		text = "Nothing happens at first..",
	}

func getItemCategory():
	return ItemCategory.Medical

func saveData():
	var data = .saveData()
	
	data["tfID"] = tfID
	data["tfArgs"] = tfArgs
	
	return data
	
func loadData(data):
	.loadData(data)
	
	tfID = SAVE.loadVar(data, "tfID", "")
	tfArgs = SAVE.loadVar(data, "tfArgs", {})
