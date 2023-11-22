extends PerkBase

func _init():
	id = Perk.BreedRapidConception
	skillGroup = Skill.Breeder

func getVisibleName():
	return "Rapid Conception"

func getVisibleDescription():
	return "Your seed posseses incredible properties. Cumming inside someone's pussy when you have full stamina and your balls are [b]full[/b] will give them a fertility boost and speed up any pregnanices!"

func getSkillTier():
	return 1

func getPicture():
	return "res://Images/Perks/nested-hearts2.png"

func getBuffs():
	return [
	]

func onSexEvent(_event:SexEvent):
	if(_event.getType() == SexEvent.HoleCreampied):
		var hole = _event.getField("hole", BodypartSlot.Vagina)
		if(_event.getSourceChar() == npc && _event.getTargetChar().hasWombIn(hole)):
			var loadSize = _event.getField("loadSize", 0.0)
			var sourceChar = _event.getSourceChar()
			if(sourceChar.hasPenis() && sourceChar.getStaminaLevel() >= 1.0):
				var penis = sourceChar.getBodypart(BodypartSlot.Penis)
				var cumProduction = penis.getFluidProduction()
				if(cumProduction != null):
					if(loadSize >= cumProduction.getCapacity()):
						_event.getTargetChar().addEffect(StatusEffect.RapidConception)
						if(_event.getSourceChar().isPlayer()):
							GM.main.addMessage("Your quality seed makes them more fertile!")
