extends Reference
class_name SexEngineResult

var doms:Dictionary = {}
var subs:Dictionary = {}
var subsWon:bool = false

func clear():
	doms.clear()
	subs.clear()
	subsWon = false

func hasSub(_subID:String) -> bool:
	return subs.has(_subID)

func hasDom(_domID:String) -> bool:
	return doms.has(_domID)

func getSub(_subID:String) -> SexEngineResultSub:
	if(!subs.has(_subID)):
		return null
	return subs[_subID]

func getDom(_domID:String) -> SexEngineResultDom:
	if(!doms.has(_domID)):
		return null
	return doms[_domID]

func isSubUnconscious(_subID:String) -> bool:
	if(!hasSub(_subID)):
		return false
	return getSub(_subID).isUnconscious

func getAverageDomSatisfaction() -> float:
	if(doms.empty()):
		return 0.0
	var domSatisfaction:float = 0.0
	for domID in doms:
		domSatisfaction += getDom(domID).satisfaction
	domSatisfaction /= doms.size()
	return domSatisfaction

func getAverageSubSatisfaction() -> float:
	if(subs.empty()):
		return 0.0
	var subSatisfaction:float = 0.0
	for subID in subs:
		subSatisfaction += getSub(subID).satisfaction
	subSatisfaction /= subs.size()
	return subSatisfaction

func getAverageSatisfaction() -> float:
	if(doms.empty() && subs.empty()):
		return 0.0
	var theSatisfaction:float = 0.0
	for domID in doms:
		theSatisfaction += getDom(domID).satisfaction
	for subID in subs:
		theSatisfaction += getSub(subID).satisfaction
	theSatisfaction /= (doms.size()+subs.size())
	return theSatisfaction

func getDomSatisfaction(_domID:String) -> float:
	if(!doms.has(_domID)):
		return 0.0
	return doms[_domID].satisfaction

func getSubSatisfaction(_subID:String) -> float:
	if(!subs.has(_subID)):
		return 0.0
	return subs[_subID].satisfaction

func getDomOrgasmCount(_domID:String) -> int:
	if(!doms.has(_domID)):
		return 0
	return doms[_domID].timesCame
	
func getSubOrgasmCount(_subID:String) -> int:
	if(!subs.has(_subID)):
		return 0
	return subs[_subID].timesCame

func getDomTotalOrgasmCount() -> int:
	var result:int = 0
	for domID in doms:
		result += doms[domID].timesCame
	return result

func getSubTotalOrgasmCount() -> int:
	var result:int = 0
	for subID in subs:
		result += subs[subID].timesCame
	return result

func getTotalOrgasmCount() -> int:
	var result:int = 0
	for domID in doms:
		result += doms[domID].timesCame
	for subID in subs:
		result += subs[subID].timesCame
	return result

func didSubsWin() -> bool:
	return subsWon

func saveData() -> Dictionary:
	var domsData:Dictionary = {}
	for domID in doms:
		domsData[domID] = doms[domID].saveData()
	var subsData:Dictionary = {}
	for subID in subs:
		subsData[subID] = subs[subID].saveData()
	
	return {
		doms = domsData,
		subs = subsData,
		subsWon = subsWon,
	}

func loadData(_data:Dictionary):
	subsWon = SAVE.loadVar(_data, "subsWon", false)
	var domsData:Dictionary = SAVE.loadVar(_data, "doms", {})
	var subsData:Dictionary = SAVE.loadVar(_data, "subs", {})
	
	doms.clear()
	subs.clear()
	
	for domID in domsData:
		var newDomResult:SexEngineResultDom = SexEngineResultDom.new()
		newDomResult.id = domID
		newDomResult.loadData(SAVE.loadVar(domsData, domID, {}))
		doms[domID] = newDomResult
	for subID in subsData:
		var newSubResult:SexEngineResultSub = SexEngineResultSub.new()
		newSubResult.id = subID
		newSubResult.loadData(SAVE.loadVar(subsData, subID, {}))
		subs[subID] = newSubResult
