extends Reference
class_name SexEngineResult

var doms:Dictionary = {}
var subs:Dictionary = {}

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
