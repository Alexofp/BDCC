extends Reference
class_name CombatAnimPlayerChar

var id:int
var knockedDown:bool = false # Is the Doll currently 'knocked down'

var queue:Array = []

const DO_WAIT := 0
const DO_ANIM := 1

signal playAnim(_id, _anim, _args)

func addWait(_howLong:float):
	queue.append([DO_WAIT, _howLong])

func addAnimNoWait(_anim:String, _args:Array = []):
	queue.append([DO_ANIM, _anim, _args])

func addAnim(_anim:String, _args:Array = []):
	queue.append([DO_ANIM, _anim, _args])
	addWait(getAnimLen(_anim))

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
			emit_signal("playAnim", id, curEl[1], curEl[2])
		
		queue.pop_front()
		
func doProcess(_dt:float):
	processQueue(_dt)

var theAnimTree:AnimationNodeStateMachine = preload("res://Player/StageScene3D/Scenes3/CombatAnimTree.tres")
func getAnimLen(_anim:String) -> float:
	if(theAnimTree.has_node(_anim)):
		var theNode = theAnimTree.get_node(_anim)
		if(theNode && (theNode is AnimationNodeAnimation)):
			var theAnimNode:AnimationNodeAnimation = theNode
			var theAnimName:String = theAnimNode.animation
			if(GlobalRegistry.combatAnimLen.has(theAnimName)):
				return GlobalRegistry.combatAnimLen[theAnimName]
		
	return 1.0
