extends Reference
class_name CombatAnimPack

# Easier to just define them here rather than add one file per animation

var anims:Dictionary = {}

func _init():
	doAdd()

static func frames(_num:int) -> float:
	return float(_num)/24.0

const HD := 3 # Hit delay offset
const HDD := 3 # Hit delay knocked down

func doAdd():
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "bite"
		theAnim.animName = "Bite"
		theAnim.hitDelay = frames(25 -HD)
		theAnim.animNameKnockedDown = "KnockedDownBite"
		theAnim.hitDelayKnockedDown = frames(16 -HDD)
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "punch"
		theAnim.animName = "Punch"
		theAnim.hitDelay = frames(19 -HD)
		theAnim.animNameKnockedDown = "KnockedDownPunch"
		theAnim.hitDelayKnockedDown = frames(12 -HDD)
		theAnim.fists = true
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "kick"
		theAnim.animName = "Kick"
		theAnim.hitDelay = frames(21 -HD)
		theAnim.animNameKnockedDown = "KnockedDownKick"
		theAnim.hitDelayKnockedDown = frames(14 -HDD)
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "shove"
		theAnim.animName = "Shove"
		theAnim.hitDelay = frames(22 -HD)
		theAnim.animNameKnockedDown = "KnockedDownShove"
		theAnim.hitDelayKnockedDown = frames(7 -HDD)
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "stunbaton"
		theAnim.animName = "WeaponSwing"
		theAnim.hitDelay = frames(16 -HD)
		theAnim.animNameKnockedDown = "KnockedDownWeaponSwing"
		theAnim.hitDelayKnockedDown = frames(13 -HDD)
		theAnim.fists = true
		theAnim.weaponRight = "res://Inventory/UnriggedModels/StunBaton/StunBaton.tscn"
		theAnim.weaponOverrideLeft = false
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "throw"
		theAnim.animName = "WeaponThrow"
		theAnim.hitDelay = frames(22 -HD)
		theAnim.animNameKnockedDown = "KnockedDownThrow"
		theAnim.hitDelayKnockedDown = frames(18 -HDD)
		theAnim.fists = true
		#theAnim.weaponRight = "res://Inventory/UnriggedModels/StunBaton/StunBaton.tscn"
		theAnim.weaponOverrideLeft = false
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "shiv"
		theAnim.animName = "WeaponShiv"
		theAnim.hitDelay = frames(18 -HD)
		theAnim.animNameKnockedDown = "KnockedDownWeaponShiv"
		theAnim.hitDelayKnockedDown = frames(20 -HDD)
		theAnim.fists = true
		theAnim.weaponRight = "res://Inventory/UnriggedModels/Shiv/Shiv.tscn"
		theAnim.weaponOverrideLeft = false
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "firepistol"
		theAnim.animName = "WeaponGunShootCombat"
		theAnim.hitDelay = frames(11 -HD)
		theAnim.animNameKnockedDown = "KnockedDownPistolFire"
		theAnim.hitDelayKnockedDown = frames(12 -HDD)
		theAnim.fists = true
		theAnim.weaponLeft = "res://Inventory/UnriggedModels/EnergyPistol/EnergyPistolBlue.tscn"
		theAnim.weaponOverrideLeft = true
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "charge"
		theAnim.animName = "AttackCharge"
		theAnim.hitDelay = frames(9 -HD)
		theAnim.animNameKnockedDown = "KnockedDownShove" # No unique knocked down version
		theAnim.hitDelayKnockedDown = frames(7 -HDD)
		theAnim.allowStateReuse = true
		#theAnim.fists = true
		anims[theAnim.id] = theAnim
