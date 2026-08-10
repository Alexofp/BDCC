extends Reference
class_name CombatAnimPack

# Easier to just define them here rather than add one file per animation

var anims:Dictionary = {}

func _init():
	doAdd()

static func frames(_num:int) -> float:
	return float(_num)/24.0

func doAdd():
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "bite"
		theAnim.animName = "Bite"
		theAnim.animTime = frames(45)
		
		theAnim.animNameKnockedDown = "KnockedDownBite"
		theAnim.animTimeKnockedDown = frames(40)
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "punch"
		theAnim.animName = "Punch"
		theAnim.animTime = frames(43)
		
		theAnim.animNameKnockedDown = "KnockedDownPunch"
		theAnim.animTimeKnockedDown = frames(30)
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "kick"
		theAnim.animName = "Kick"
		theAnim.animTime = frames(52)
		
		theAnim.animNameKnockedDown = "KnockedDownKick"
		theAnim.animTimeKnockedDown = frames(30)
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "shove"
		theAnim.animName = "Shove"
		theAnim.animTime = frames(40)
		
		theAnim.animNameKnockedDown = "KnockedDownShove"
		theAnim.animTimeKnockedDown = frames(30)
		anims[theAnim.id] = theAnim
