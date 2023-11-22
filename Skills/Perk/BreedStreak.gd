extends PerkBase

func _init():
	id = Perk.BreedStreak
	skillGroup = Skill.Breeder

func getVisibleName():
	return "Breeder's Streak"

func getVisibleDescription():
	return "Cum inside anyone to start a streak! Each new unique partner extends that streak. The higher your streak, the stronger you become. But your streak ends if you haven't came inside anyone new in 6 hours."

func getSkillTier():
	return 2

func getPicture():
	return "res://Images/Perks/badge.png"

func getBuffs():
	return [
	]

func onSexEvent(_event:SexEvent):
	if(_event.getType() == SexEvent.HoleCreampied || _event.getType() == SexEvent.StraponCreampied):
		if(_event.getSourceChar() == npc):
			npc.addEffect(StatusEffect.BreedersStreak, [_event.targetCharID])
