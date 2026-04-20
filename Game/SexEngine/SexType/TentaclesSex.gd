extends SexTypeBase

var tentacleType:int = BigEggType.Plant
var eggTime:int = 12*60*60

func _init():
	id = SexType.TentaclesSex

func processArgs(_args:Dictionary):
	_args[SexMod.DomsStartNaked] = true
	_args[SexMod.DisableDynamicJoiners] = true
	_args[SexMod.DisableDomTalking] = true

func initArgs(_args = {}):
	if(_args.has(SexMod.TentacleMonsterType)):
		tentacleType = _args[SexMod.TentacleMonsterType]
	if(_args.has(SexMod.TentacleEggTime)):
		eggTime = _args[SexMod.TentacleEggTime]

func getDefaultAnimation():
	var sexEngine = getSexEngine()
	var theDomIDs:Array = sexEngine.getXFreeDomIDsForAnim(1)
	var theSubIDs:Array = sexEngine.getXFreeSubIDsForAnim(1)
	
	if(theSubIDs.empty() && theDomIDs.empty()):
		return null
	
	if(theSubIDs.empty()):
		return [StageScene.TentaclesDuo, "stand", {onlyTentacles=true}]
	if(theDomIDs.empty()):
		if(isUnconscious(theSubIDs[0])):
			return [StageScene.Sleeping, "sleep", {pc=theSubIDs[0]}]
		return [StageScene.GivingBirth, "idle", {pc=theSubIDs[0]}]

	#if(isUnconscious(theSubIDs[0])):
	#	return [StageScene.TentaclesSleepOn, "sleep", {pc=theSubIDs[0]}]
	#return [StageScene.TentaclesTease, "tease", {pc=theSubIDs[0]}]

	if(isUnconscious(theSubIDs[0])):
		return [StageScene.TentaclesGangbang, "teasedef", {pc=theSubIDs[0]}]
	return [StageScene.TentaclesGangbang, "tease", {pc=theSubIDs[0]}]

func processAnimationArgs(_args:Dictionary):
	if(tentacleType == BigEggType.Plant):
		_args["plant"] = true
	
	var sexEngine = getSexEngine()
	if(!sexEngine.doms.empty()):
		var theInfo = sexEngine.doms[sexEngine.doms.keys()[0]]
		if(theInfo && theInfo.didJustCame()):
			_args["cum"] = true

func saveData():
	return {
		tentacleType = tentacleType,
		eggTime = eggTime,
	}

func loadData(_data):
	tentacleType = SAVE.loadVar(_data, "tentacleType", BigEggType.Plant)
	eggTime = SAVE.loadVar(_data, "eggTime", 12*60*60)
