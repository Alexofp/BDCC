extends Reference
class_name SexEngineResultDom

var id:String = ""

var timesCame:int = 0
var averageLust:float = 0.0
var satisfaction:float = 0.0
# average anger?
# lost to sub?

func grabInfo(_sexEngine, _domInfo):
	id = _domInfo.getCharID()
	timesCame = _domInfo.timesCame
	averageLust = _domInfo.getAverageLust()
	satisfaction = _domInfo.calculateFinalSatisfaction()

func doFastSex(_sexEngine, _domInfo):
	id = _domInfo.getCharID()
	timesCame = RNG.randi_range(0, 3)
	averageLust = RNG.randf_rangeX2(0.0, 1.0)
	satisfaction = RNG.randf_rangeX2(0.0, 1.0)

func saveData() -> Dictionary:
	return {
		tc = timesCame,
		al = averageLust,
		s = satisfaction,
	}

func loadData(_data:Dictionary):
	timesCame = SAVE.loadVar(_data, "tc", 0)
	averageLust = SAVE.loadVar(_data, "al", 0.0)
	satisfaction = SAVE.loadVar(_data, "s", 0.0)
