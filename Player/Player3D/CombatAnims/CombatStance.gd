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

const STANCE_UNIQUE_PISTOL := 8

const MAP_STANCE_TO_INDEX:Dictionary = {
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
	STANCE_UNIQUE_PISTOL: "Pistol stance (Unique)",
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
		STANCE_UNIQUE_PISTOL,
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
