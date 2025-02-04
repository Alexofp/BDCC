extends PerkBase

func _init():
	id = Perk.BreedCumInflationHeat
	skillGroup = Skill.Breeder
	dungeonWeight = 0.0

func getVisibleName():
	return "Forced Ovulation"

func getVisibleDescription():
	return "Maybe the cum will reach their ovaries if you keep stuffing their womb. Cumming inside someone who is cum-inflated has a chance to trigger heat and, in turn, ovulation."

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/forcedovulation.png"

func getBuffs():
	return [
	]

func onSexEvent(_event:SexEvent):
	if(_event.getType() == SexEvent.HoleCreampied || _event.getType() == SexEvent.StraponCreampied):
		var hole = _event.getField("hole", BodypartSlot.Vagina)
		var targetChar = _event.getTargetChar()
		if(_event.getSourceChar() == npc && RNG.chance(30) && _event.getTargetChar().hasWombIn(hole)):
			if(targetChar.hasEffect(StatusEffect.CumInflated) || targetChar.getCumInflationLevel(false) > 0.01):
				var isOvul = false
				if(targetChar.isInHeat() && RNG.chance(50) && targetChar.forceOvulate()):
					isOvul = true
				else:
					targetChar.forceIntoHeat()
				if(_event.getSourceChar().isPlayer()):
					if(RNG.chance(1)):
						GM.main.addMessage("PLAP PLAP PLAP PLAP")
					elif(RNG.chance(5)):
						GM.main.addMessage("GET PREGNANT GET PREGNANT GET PREGNANT GET PREGNANT")
					else:
						if(isOvul):
							GM.main.addMessage("You are making them ovulate!")
						else:
							GM.main.addMessage("You are triggering their heat!")
