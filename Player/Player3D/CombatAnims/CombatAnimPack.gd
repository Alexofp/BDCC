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
		theAnim.animNameKnockedDown = "KnockedDownBite"
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "punch"
		theAnim.animName = "Punch"
		theAnim.animNameKnockedDown = "KnockedDownPunch"
		theAnim.fists = true
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "kick"
		theAnim.animName = "Kick"
		theAnim.animNameKnockedDown = "KnockedDownKick"
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "shove"
		theAnim.animName = "Shove"
		theAnim.animNameKnockedDown = "KnockedDownShove"
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "stunbaton"
		theAnim.animName = "WeaponSwing"
		theAnim.animNameKnockedDown = "KnockedDownWeaponSwing"
		theAnim.fists = true
		theAnim.weaponRight = "res://Inventory/UnriggedModels/StunBaton/StunBaton.tscn"
		theAnim.weaponOverrideLeft = false
		anims[theAnim.id] = theAnim
