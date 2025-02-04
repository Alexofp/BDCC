extends Reference
class_name PerkBase

var npc = null
var id = "error"
var skillGroup = Skill.Combat
var dungeonWeight:float = 1.0

func getVisibleName():
	return "Error"

func getVisibleDescription():
	return "Error bad"

func getMoreDescription():
	return ""

func runOnceWhenLearned():
	pass

func getSkillGroup():
	return skillGroup

func getSkillTier():
	return 0
	
func hiddenWhenLocked() -> bool:
	return false
	
func hiddenWhenUnlocked() -> bool:
	return false

func toggleable() -> bool:
	return true
	
func unlockable() -> bool:
	return true

func getPicture():
	return "res://Images/Perks/upgrade.png"

func getCost():
	return Util.maxi(int(getSkillTier() + 1), 0)

func getRequiredPerks():
	return []

func setCharacter(newnpc):
	npc = newnpc

func addsAttacks():
	return []

func processBattleTurn():
	pass
	
func onFightStart(_contex = {}):
	pass

func processBattleTurnContex(_contex = {}):
	pass

func onFightEnd(_contex = {}):
	pass

func onSexStarted(_contex = {}):
	pass

func processSexTurnContex(_contex = {}):
	pass

func onSexEvent(_event:SexEvent):
	pass

func onSexEnded(_contex = {}):
	pass
	
func onSexEndedWhenDisabled(_contex = {}):
	pass
	
func onSexStartedWhenDisabled(_contex = {}):
	pass
	
func onFightEndWhenDisabled(_contex = {}):
	pass
	
func onFightStartWhenDisabled(_contex = {}):
	pass
	
func onPerkToggled(_isEnabledNow):
	pass
	
func getBuffs():
	return []

func getDungeonWeight() -> float:
	return dungeonWeight

func canAppearInDungeons() -> bool:
	if(skillGroup == Skill.Start):
		return false
	if(skillGroup == Skill.Fertility):
		return false
	if(skillGroup == Skill.Hypnosis):
		return false
	if(dungeonWeight <= 0.0):
		return false
	return true

func buff(buffid, args = []):
	var buff: BuffBase = GlobalRegistry.createBuff(buffid)
	buff.initBuff(args)
	return buff

func saveData():
	return {
	}

func loadData(_data):
	#level = SAVE.loadVar(data, "level", 0)
	pass
