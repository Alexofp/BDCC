extends Object
class_name CombatStance

const STANCE_STANDING_NORMALLY := 0
const STANCE_COMBAT_DEFAULT := 1
const STANCE_COMBAT_RAISED := 2
const STANCE_COMBAT_KARATE := 3
const STANCE_COMBAT_RELAXED := 4
const STANCE_LUST_PROUD := 5
const STANCE_LUST_SLY := 6
const STANCE_LUST_BRAVE := 7

const STANCE_UNIQUE_STUNBATON := 100
const STANCE_UNIQUE_SHIV := 101

const STANCE_UNIQUE_PISTOL := 102
const STANCE_UNIQUE_PISTOLRED := 103
const STANCE_UNIQUE_10MMGUN := 104
const STANCE_UNIQUE_SYRINGE := 105

const STANCE_LUSTACT_BREASTS := 200
const STANCE_LUSTACT_VAGINA := 201
const STANCE_LUSTACT_PENIS := 202
const STANCE_LUSTACT_BUTT := 203
const STANCE_LUSTACT_PENISVAGINA := 204
const STANCE_LUSTACT_PENISBREASTS := 205
const STANCE_LUSTACT_PENISBUTT := 206
const STANCE_LUSTACT_VAGINABREASTS := 207
const STANCE_LUSTACT_VAGINABUTT := 208
const STANCE_LUSTACT_BREASTSBUTT := 209

const MAP_STANCE_TO_INDEX:Dictionary = {
	STANCE_UNIQUE_STUNBATON: 9,
	STANCE_UNIQUE_SHIV: 10,
	STANCE_UNIQUE_PISTOL: 8,
	STANCE_UNIQUE_PISTOLRED: 8,
	STANCE_UNIQUE_10MMGUN: 8,
	STANCE_UNIQUE_SYRINGE: 11,
	STANCE_LUSTACT_BREASTS: 12,
	STANCE_LUSTACT_VAGINA: 13,
	STANCE_LUSTACT_PENIS: 14,
	STANCE_LUSTACT_BUTT: 15,
	STANCE_LUSTACT_PENISVAGINA: 16,
	STANCE_LUSTACT_PENISBREASTS: 17,
	STANCE_LUSTACT_PENISBUTT: 18,
	STANCE_LUSTACT_VAGINABREASTS: 19,
	STANCE_LUSTACT_VAGINABUTT: 20,
	STANCE_LUSTACT_BREASTSBUTT: 21,
}

const STANCE_NAMES:Dictionary = {
	STANCE_STANDING_NORMALLY: "Stand normally",
	STANCE_COMBAT_DEFAULT: "Default fighting stance",
	STANCE_COMBAT_RAISED: "Raised fists stance",
	STANCE_COMBAT_KARATE: "Karate stance",
	STANCE_COMBAT_RELAXED: "Relaxed fighting stance",
	STANCE_LUST_PROUD: "Proud lust stance",
	STANCE_LUST_SLY: "Shy lust stance",
	STANCE_LUST_BRAVE: "Brave lust stance",
	STANCE_UNIQUE_STUNBATON: "Stun baton stance (Unique)",
	STANCE_UNIQUE_SHIV: "Shiv stance (Unique)",
	STANCE_UNIQUE_PISTOL: "Energy gun stance (Unique)",
	STANCE_UNIQUE_PISTOLRED: "Red energy gun stance (Unique)",
	STANCE_UNIQUE_10MMGUN: "10mm gun stance (Unique)",
	STANCE_UNIQUE_SYRINGE: "Syringe (Unique)",
}
const STANCE_TO_WEAPONS:Dictionary = { # [fists, left_hand_weapon, right_hand_weapon]
	STANCE_UNIQUE_PISTOL: [true, "res://Inventory/UnriggedModels/EnergyPistol/EnergyPistolBlue.tscn", ""],
	STANCE_UNIQUE_PISTOLRED: [true, "res://Inventory/UnriggedModels/EnergyPistol/EnergyPistolRed.tscn", ""],
	STANCE_UNIQUE_10MMGUN: [true, "res://Inventory/UnriggedModels/Pistol/Pistol.tscn", ""],
	STANCE_UNIQUE_STUNBATON: [true, "", "res://Inventory/UnriggedModels/StunBaton/StunBaton.tscn"],
	STANCE_UNIQUE_SHIV: [true, "", "res://Inventory/UnriggedModels/Shiv/Shiv.tscn"],
	STANCE_UNIQUE_SYRINGE: [true, "", "res://Inventory/UnriggedModels/Syringe/Syringe.tscn"],
}
const STANCE_TO_HARD:Dictionary = {
	STANCE_LUSTACT_PENIS: true,
	STANCE_LUSTACT_PENISVAGINA: true,
	STANCE_LUSTACT_PENISBREASTS: true,
	STANCE_LUSTACT_PENISBUTT: true,
}

const ATTACK_STANCE_PHYSICAL := 0
const ATTACK_STANCE_LUST := 1
const ATTACK_STANCE_PISTOL := 2
const ATTACK_STANCE_STUNBATON := 3
const ATTACK_STANCE_SHIV := 4

const STANCETYPE_TO_STANCES:Dictionary = {
	ATTACK_STANCE_PHYSICAL: [STANCE_COMBAT_DEFAULT, STANCE_COMBAT_RAISED, STANCE_COMBAT_KARATE, STANCE_COMBAT_RELAXED],
	ATTACK_STANCE_LUST: [STANCE_LUST_PROUD, STANCE_LUST_SLY, STANCE_LUST_BRAVE],
	ATTACK_STANCE_PISTOL: [STANCE_UNIQUE_PISTOL],
	ATTACK_STANCE_STUNBATON: [STANCE_UNIQUE_STUNBATON],
	ATTACK_STANCE_SHIV: [STANCE_UNIQUE_SHIV],
}

static func getStanceRawIndex(_indx:int):
	if(MAP_STANCE_TO_INDEX.has(_indx)):
		return MAP_STANCE_TO_INDEX[_indx]
	if(_indx < 0):
		_indx = 0
	return _indx

static func getAll() -> Array:
	return [
		STANCE_STANDING_NORMALLY,
		STANCE_COMBAT_DEFAULT,
		STANCE_COMBAT_RAISED,
		STANCE_COMBAT_KARATE,
		STANCE_COMBAT_RELAXED,
		STANCE_LUST_PROUD,
		STANCE_LUST_SLY,
		STANCE_LUST_BRAVE,
		STANCE_UNIQUE_STUNBATON,
		STANCE_UNIQUE_SHIV,
		STANCE_UNIQUE_PISTOL,
		STANCE_UNIQUE_PISTOLRED,
		STANCE_UNIQUE_10MMGUN,
		STANCE_UNIQUE_SYRINGE,
	]

static func getAllPlayerCanChoose() -> Array:
	return [
		STANCE_STANDING_NORMALLY,
		STANCE_COMBAT_DEFAULT,
		STANCE_COMBAT_RAISED,
		STANCE_COMBAT_KARATE,
		STANCE_COMBAT_RELAXED,
		STANCE_LUST_PROUD,
		STANCE_LUST_SLY,
		STANCE_LUST_BRAVE,
	]

static func getRandomStancePlayerCanChoose() -> int:
	return RNG.pick(getAllPlayerCanChoose())

static func getAllCharacterStanceTypes(_npc) -> Dictionary:
	var result:Dictionary = {}
	
	var _allTheAttacks = _npc.getAttacks("")
	
	for theAttackID in _allTheAttacks:
		var theAttack = GlobalRegistry.getAttack(theAttackID)
		if(!theAttack):
			continue
		var theStanceType:int = theAttack.getStanceType()
		if(theStanceType < 0):
			continue
		if(!result.has(theStanceType)):
			result[theStanceType] = 1
		else:
			result[theStanceType] += 1
	
	if(result.empty()):
		result = {ATTACK_STANCE_PHYSICAL:1}
	
	return result

static func pickStanceBasedOnStanceTypes(_types:Dictionary) -> int:
	if(_types.empty()):
		_types = {ATTACK_STANCE_PHYSICAL:1}
	
	var thePickedStance:int = RNG.pickWeightedDict(_types)
	if(STANCETYPE_TO_STANCES.has(thePickedStance)):
		return RNG.pick(STANCETYPE_TO_STANCES[thePickedStance])
	return STANCE_STANDING_NORMALLY

static func generateStanceBasedOnCharacter(_npc) -> int:
	return pickStanceBasedOnStanceTypes(getAllCharacterStanceTypes(_npc))

static func getStanceName(_indx:int) -> String:
	return STANCE_NAMES.get(_indx, "Unknown")

static func isValid(_indx:int) -> bool:
	if(STANCE_NAMES.has(_indx)):
		return true
	return false

static func getStanceBasedOnLustActivities(_act:Array) -> int:
	if(_act.empty()):
		return -1
	var _hasBreast:bool = false
	var _hasPenis:bool = false
	var _hasVag:bool = false
	var _hasButt:bool = false
	
	if(_act.has(LustActivity.GropingChest)):
		_hasBreast = true
	if(_act.has(LustActivity.GropingButt) || _act.has(LustActivity.ProddingAnal)):
		_hasButt = true
	if(_act.has(LustActivity.StrokingCock)):
		_hasPenis = true
	if(_act.has(LustActivity.SpreadingPussy)):
		_hasVag = true
	
	if(_hasPenis):
		if(_hasVag):
			return STANCE_LUSTACT_PENISVAGINA
		if(_hasBreast):
			return STANCE_LUSTACT_PENISBREASTS
		if(_hasButt):
			return STANCE_LUSTACT_PENISBUTT
		return STANCE_LUSTACT_PENIS
	
	if(_hasVag):
		if(_hasBreast):
			return STANCE_LUSTACT_VAGINABREASTS
		if(_hasButt):
			return STANCE_LUSTACT_VAGINABUTT
		return STANCE_LUSTACT_VAGINA
	
	if(_hasBreast):
		if(_hasButt):
			return STANCE_LUSTACT_BREASTSBUTT
		return STANCE_LUSTACT_BREASTS
	
	if(_hasButt):
		return STANCE_LUSTACT_BUTT
	
	return -1
