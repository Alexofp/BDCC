extends Reference
class_name CombatAnimPack

# Easier to just define them here rather than add one file per animation

var anims:Dictionary = {}

func _init():
	doAdd()

func frames(_num:int) -> float:
	return float(_num)/24.0

func doAdd():
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "Bite"
		theAnim.animName = "Bite"
		theAnim.animTime = frames(45)
		
		theAnim.animNameKnockedDown = "KnockedDownBite"
		theAnim.animTimeKnockedDown = frames(40)
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "Punch"
		theAnim.animName = "Punch"
		theAnim.animTime = frames(43)
		
		theAnim.animNameKnockedDown = "KnockedDownPunch"
		theAnim.animTimeKnockedDown = frames(30)
		anims[theAnim.id] = theAnim
