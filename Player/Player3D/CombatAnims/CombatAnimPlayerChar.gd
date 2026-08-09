extends Reference
class_name CombatAnimPlayerChar

var id:int

var queue:Array = []

const DO_WAIT := 0
const DO_ANIM := 1

signal playAnim(_id, _anim)

func addWait(_howLong:float):
	queue.append([DO_WAIT, _howLong])

func addAnim(_anim:String):
	queue.append([DO_ANIM, _anim])

func isBusy() -> bool:
	return !queue.empty()

func processQueue(_dt:float):
	while(!queue.empty()):
		var curEl:Array = queue.front()
		var elType:int = curEl[0]
		
		if(elType == DO_WAIT):
			curEl[1] -= _dt
			if(curEl[1] > 0.0):
				return
		
		if(elType == DO_ANIM):
			emit_signal("playAnim", id, curEl[1])
		
		queue.pop_front()
		
