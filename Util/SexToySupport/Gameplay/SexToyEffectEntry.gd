extends Reference
class_name SexToyEffectEntry

var type:int = SexToyEffect.SIMPLE
var groups:Array = [SexToyGroup.Main]

var curve:Curve
var curveTime:float = 10.0

var sequence:Array = [1.0, 2.5] # [strength, time, strength, time, strength, time]

func trigger(_layer:int, _shouldLoop:bool):
	for groupID in groups:
		if(!SexToyManager.groups.has(groupID)):
			continue
		var theGroup:SexToyGroupInstance = SexToyManager.groups[groupID]
		
		if(type == SexToyEffect.SIMPLE):
			var theSimple := getSimple()
			theGroup.vibratePattern([theSimple.x, theSimple.y], _layer, _shouldLoop)
		elif(type == SexToyEffect.SEQUENCE):
			theGroup.vibratePattern(sequence, _layer, _shouldLoop)
		elif(type == SexToyEffect.CURVE):
			theGroup.vibrateCurve(curve, curveTime, _layer, _shouldLoop)

func getSimple() -> Vector2: #[strength time]
	if(sequence.empty()):
		return Vector2(1.0, 2.0)
	if(sequence.size() == 1):
		return Vector2(sequence[0], 2.0)
	return Vector2(sequence[0], sequence[1])

func setSimple(_intensity:float, _time:float):
	sequence = [_intensity, _time]

func saveData() -> Dictionary:
	var theData:Dictionary = {
		type = type,
		groups = groups,
	}
	if(type == SexToyEffect.SIMPLE):
		theData["sequence"] = sequence
	elif(type == SexToyEffect.SEQUENCE):
		theData["sequence"] = sequence
	else:
		theData["curveTime"] = curveTime
		theData["curve"] = saveCurve(curve)
	
	return theData

func loadData(_data:Dictionary):
	type = SAVE.loadVar(_data, "type", SexToyEffect.SIMPLE)
	var newGroups:Array = SAVE.loadVar(_data, "groups", [SexToyGroup.Main])
	groups.clear()
	for theI in newGroups:
		groups.append(int(theI)) # Json numbers are floats, gotta convert them into ints
	if(type == SexToyEffect.SIMPLE || type == SexToyEffect.SEQUENCE):
		sequence = SAVE.loadVar(_data, "sequence", [1.0, 2.5])
	elif(type == SexToyEffect.CURVE):
		curveTime = SAVE.loadVar(_data, "curveTime", 10.0)
		curve = loadCurve(SAVE.loadVar(_data, "curve", {}))

func saveCurve(_curve:Curve) -> Dictionary:
	if(!_curve):
		return {}
	var thePoints:Array = []
	var pointAm:int = _curve.get_point_count()
	for _i in pointAm:
		var thePos:Vector2 = _curve.get_point_position(_i)
		thePoints.append([
			thePos.x, thePos.y,
			_curve.get_point_left_tangent(_i), _curve.get_point_right_tangent(_i),
			_curve.get_point_left_mode(_i), _curve.get_point_right_mode(_i), 
		])
	return {
		points = thePoints,
	}

func loadCurve(_data:Dictionary) -> Curve:
	if(_data.empty()):
		return Curve.new()
	
	var theCurve := Curve.new()
	var thePoints:Array = SAVE.loadVar(_data, "points", [])
	for thePointEntry in thePoints:
		if(thePointEntry.size() < 6):
			continue
		var thePos:Vector2 = Vector2(thePointEntry[0], thePointEntry[1])
		theCurve.add_point(thePos, thePointEntry[2], thePointEntry[3], int(thePointEntry[4]), int(thePointEntry[5]))
	
	return theCurve
