extends Reference
class_name SexEngineResultSub

var id:String = ""

var timesCame:int = 0
var averageLust:float = 0.0
var averageResistance:float = 0.0
var averageFear:float = 0.0
var satisfaction:float = 0.0
var isUnconscious:bool = false

func grabInfo(_sexEngine, _subInfo):
	id = _subInfo.getCharID()
	timesCame = _subInfo.timesCame
	averageLust = _subInfo.getAverageLust()
	satisfaction = _subInfo.calculateFinalSatisfaction()
	averageResistance = _subInfo.getAverageResistance()
	averageFear = _subInfo.getAverageFear()
	isUnconscious = _subInfo.isUnconscious()

func doFastSex(_sexEngine, _subInfo):
	id = _subInfo.getCharID()
	timesCame = RNG.randi_range(0, 3)
	averageLust = RNG.randf_rangeX2(0.0, 1.0)
	satisfaction = RNG.randf_rangeX2(0.0, 1.0)
	averageResistance = RNG.randf_rangeX2(0.0, 1.0)
	averageFear = RNG.randf_rangeX2(0.0, 1.0)
	isUnconscious = RNG.chance(5)

func saveData() -> Dictionary:
	return {
		tc = timesCame,
		al = averageLust,
		s = satisfaction,
		ar = averageResistance,
		af = averageFear,
		iu = isUnconscious,
	}

func loadData(_data:Dictionary):
	timesCame = SAVE.loadVar(_data, "tc", 0)
	averageLust = SAVE.loadVar(_data, "al", 0.0)
	satisfaction = SAVE.loadVar(_data, "s", 0.0)
	averageResistance = SAVE.loadVar(_data, "ar", 0.0)
	averageFear = SAVE.loadVar(_data, "af", 0.0)
	isUnconscious = SAVE.loadVar(_data, "iu", false)
