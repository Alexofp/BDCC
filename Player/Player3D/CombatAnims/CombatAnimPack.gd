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
		theAnim.hitDelay = frames(14 -HD)
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
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "ChestSlap"
		theAnim.animName = "AttackChestSlap"
		theAnim.hitDelay = frames(11 -HD)
		theAnim.animNameKnockedDown = "KnockedDownShove" # No unique knocked down version
		theAnim.hitDelayKnockedDown = frames(7 -HDD)
		theAnim.allowStateReuse = true
		#theAnim.fists = true
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "LustBeg"
		theAnim.animName = "LustBeg"
		theAnim.hitDelay = frames(45 -HD)
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "LustBodyAttack"
		theAnim.animName = "LustBodyAttack"
		theAnim.hitDelay = frames(72 -HD)
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "LustBreastsAttack"
		theAnim.animName = "LustBreastsAttack"
		theAnim.hitDelay = frames(46 -HD)
		anims[theAnim.id] = theAnim
	if(true): # Meme attack
		var theAnim := CombatAnimBase.new()
		theAnim.id = "LustPlow"
		theAnim.animName = "LustPlow"
		theAnim.hitDelay = frames(120 -HD)
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "LustStretchAttack"
		theAnim.animName = "LustStretchAttack"
		theAnim.hitDelay = frames(58 -HD)
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "ClothingBottomPullDown"
		theAnim.animName = "ClothingBottomPullDown"
		theAnim.hitDelay = frames(21 -HD)
		theAnim.updateAttackerAppearanceOnHit = true
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "ClothingBottomPullDownFull"
		theAnim.animName = "ClothingBottomPullDownFull"
		theAnim.hitDelay = frames(25 -HD)
		theAnim.updateAttackerAppearanceOnHit = true
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "ClothingTopOpen"
		theAnim.animName = "ClothingTopOpen"
		theAnim.hitDelay = frames(20 -HD)
		theAnim.updateAttackerAppearanceOnHit = true
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "ClothingTopPullUp"
		theAnim.animName = "ClothingTopPullUp"
		theAnim.hitDelay = frames(20 -HD)
		theAnim.updateAttackerAppearanceOnHit = true
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "DodgePrepare"
		theAnim.animName = "DodgePrepare"
		theAnim.hitDelay = frames(10 -HD)
		theAnim.hitReaction = CombatAnimBase.REACTION_NOTHING
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "DodgePrepareSly"
		theAnim.animName = "DodgePrepareSly"
		theAnim.hitDelay = frames(10 -HD)
		theAnim.hitReaction = CombatAnimBase.REACTION_NOTHING
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "LickWounds"
		theAnim.animName = "LickWounds"
		theAnim.hitDelay = frames(10 -HD)
		theAnim.hitReaction = CombatAnimBase.REACTION_NOTHING
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "LustCockTaunt"
		theAnim.animName = "LustCockTaunt"
		theAnim.hitDelay = frames(18 -HD)
		theAnim.hard = true
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "LustButt"
		theAnim.animName = "LustButt"
		theAnim.hitDelay = frames(56 -HD)
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "UseSyringe"
		theAnim.animName = "UseSyringe"
		theAnim.hitDelay = frames(11 -HD)
		theAnim.hitReaction = CombatAnimBase.REACTION_NOTHING
		theAnim.fists = true
		theAnim.weaponRight = "res://Inventory/UnriggedModels/Syringe/Syringe.tscn"
		theAnim.weaponOverrideLeft = false
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "TauntPoint"
		theAnim.animName = "TauntPoint"
		theAnim.hitDelay = frames(11 -HD)
		theAnim.hitReaction = CombatAnimBase.REACTION_NOTHING
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "TauntLustLeanIn"
		theAnim.animName = "TauntLustLeanIn"
		theAnim.hitDelay = frames(11 -HD)
		theAnim.hitReaction = CombatAnimBase.REACTION_NOTHING
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "TauntLustComeHere"
		theAnim.animName = "TauntLustComeHere"
		theAnim.hitDelay = frames(11 -HD)
		theAnim.hitReaction = CombatAnimBase.REACTION_NOTHING
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "RemoveAllRestraints"
		theAnim.animName = "RemoveAllRestraints"
		theAnim.hitDelay = frames(11 -HD)
		theAnim.hitReaction = CombatAnimBase.REACTION_NOTHING
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "TailSwipe"
		theAnim.animName = "TailSwipe"
		theAnim.hitDelay = frames(8 -HD)
		theAnim.hitReaction = CombatAnimBase.REACTION_NOTHING
		theAnim.animNameKnockedDown = "KnockedDownShove" # No unique knocked down version
		theAnim.hitDelayKnockedDown = frames(7 -HDD)
		theAnim.allowStateReuse = true
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "WeaponSyringe"
		theAnim.animName = "WeaponSyringe"
		theAnim.hitDelay = frames(20 -HD)
		theAnim.animNameKnockedDown = "KnockedDownWeaponSyringe"
		theAnim.hitDelayKnockedDown = frames(25 -HDD)
		theAnim.fists = true
		theAnim.weaponRight = "res://Inventory/UnriggedModels/Syringe/Syringe.tscn"
		theAnim.weaponOverrideLeft = false
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "RestraintBody"
		theAnim.animName = "RestraintBody"
		theAnim.hitDelay = frames(14 -HD)
		theAnim.animNameKnockedDown = "KnockedDownShove" # No unique knocked down version
		theAnim.hitDelayKnockedDown = frames(7 -HDD)
		theAnim.allowStateReuse = true
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "RestraintCrotch"
		theAnim.animName = "RestraintCrotch"
		theAnim.hitDelay = frames(14 -HD)
		theAnim.animNameKnockedDown = "KnockedDownShove" # No unique knocked down version
		theAnim.hitDelayKnockedDown = frames(7 -HDD)
		theAnim.allowStateReuse = true
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "RestraintEyes"
		theAnim.animName = "RestraintEyes"
		theAnim.hitDelay = frames(14 -HD)
		theAnim.animNameKnockedDown = "KnockedDownShove" # No unique knocked down version
		theAnim.hitDelayKnockedDown = frames(7 -HDD)
		theAnim.allowStateReuse = true
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "RestraintFace"
		theAnim.animName = "RestraintFace"
		theAnim.hitDelay = frames(14 -HD)
		theAnim.animNameKnockedDown = "KnockedDownShove" # No unique knocked down version
		theAnim.hitDelayKnockedDown = frames(7 -HDD)
		theAnim.allowStateReuse = true
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "RestraintHands"
		theAnim.animName = "RestraintHands"
		theAnim.hitDelay = frames(15 -HD)
		theAnim.animNameKnockedDown = "KnockedDownShove" # No unique knocked down version
		theAnim.hitDelayKnockedDown = frames(7 -HDD)
		theAnim.allowStateReuse = true
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "RestraintLegs"
		theAnim.animName = "RestraintLegs"
		theAnim.hitDelay = frames(15 -HD)
		theAnim.animNameKnockedDown = "KnockedDownShove" # No unique knocked down version
		theAnim.hitDelayKnockedDown = frames(7 -HDD)
		theAnim.allowStateReuse = true
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "LustBreastsSelfFeed"
		theAnim.animName = "LustBreastsSelfFeed"
		theAnim.hitDelay = frames(11 -HD)
		theAnim.hitReaction = CombatAnimBase.REACTION_NOTHING
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "LustStrokeAttack"
		theAnim.animName = "LustStrokeAttack"
		theAnim.hitDelay = frames(50 -HD)
		theAnim.hard = true
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "LustStrokeAttackFast"
		theAnim.animName = "LustStrokeAttackFast"
		theAnim.hitDelay = frames(63 -HD)
		theAnim.hard = true
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "LustButtRub"
		theAnim.animName = "LustButtRub"
		theAnim.hitDelay = frames(45 -HD)
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "LustButtWiggle"
		theAnim.animName = "LustButtWiggle"
		theAnim.hitDelay = frames(36 -HD)
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "LustButtShakeOff"
		theAnim.animName = "LustButtShakeOff"
		theAnim.hitDelay = frames(36 -HD)
		theAnim.updateAttackerAppearanceOnHit = true
		#theAnim.hitReaction = CombatAnimBase.REACTION_NOTHING
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "LustOrgasmAttack"
		theAnim.animName = "LustOrgasmAttack"
		theAnim.hitDelay = frames(10 -HD)
		theAnim.hard = true
		#theAnim.hitReaction = CombatAnimBase.REACTION_NOTHING
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "LustBreastsShakeOff"
		theAnim.animName = "LustBreastsShakeOff"
		theAnim.hitDelay = frames(29 -HD)
		theAnim.updateAttackerAppearanceOnHit = true
		#theAnim.hitReaction = CombatAnimBase.REACTION_NOTHING
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "LustRubAttack"
		theAnim.animName = "LustRubAttack"
		theAnim.hitDelay = frames(52 -HD)
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "LustRubAttackFast"
		theAnim.animName = "LustRubAttackFast"
		theAnim.hitDelay = frames(79 -HD)
		anims[theAnim.id] = theAnim
	if(true):
		var theAnim := CombatAnimBase.new()
		theAnim.id = "LustBreastsSqueeze"
		theAnim.animName = "LustBreastsSqueeze"
		theAnim.hitDelay = frames(60 -HD)
		anims[theAnim.id] = theAnim
