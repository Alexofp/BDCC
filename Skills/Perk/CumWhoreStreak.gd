extends PerkBase

func _init():
	id = Perk.CumWhoreStreak
	skillGroup = Skill.CumLover
	dungeonWeight = 0.0

func getVisibleName():
	return "Cum Whore Streak"

func getVisibleDescription():
	return "Let people cum inside you to start a streak! Each new unique partner extends that streak. The higher your streak, the stronger you become. But your streak ends if nobody new has came inside you in 6 hours."

func getSkillTier():
	return 2

func getPicture():
	return "res://Images/Perks/lovedice.png"

func getBuffs():
	return [
	]

func onSexEvent(_event:SexEvent):
	if(_event.getType() == SexEvent.HoleCreampied || _event.getType() == SexEvent.StraponCreampied):
		if(_event.getTargetChar() == npc):
			npc.addEffect(StatusEffect.CumWhoreStreak, [_event.sourceCharID])
