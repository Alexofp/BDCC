extends PerkBase

func _init():
	id = Perk.BreedBreedersBliss
	skillGroup = Skill.Breeder
	dungeonWeight = 0.0

func getVisibleName():
	return "Breeder's Bliss"

func getVisibleDescription():
	return "Heat is the prime state for breeding. Orgasming inside someone's pussy while they are in heat will relief 20 pain and give you 20 stamina back!"

func getSkillTier():
	return 0

func getPicture():
	return "res://Images/Perks/insemination.png"

func getBuffs():
	return [
	]

func onSexEvent(_event:SexEvent):
	if(_event.getType() == SexEvent.HoleCreampied || _event.getType() == SexEvent.StraponCreampied):
		if(_event.getSourceChar() == npc && _event.getTargetChar().isInHeat()):
			var hole = _event.getField("hole", BodypartSlot.Vagina)
			if(_event.getTargetChar().hasWombIn(hole)):
				_event.getSourceChar().addPain(-20)
				_event.getSourceChar().addStamina(20)
				if(_event.getSourceChar().isPlayer()):
					GM.main.addMessage("Feels so good to cum inside someone who is in heat!")
