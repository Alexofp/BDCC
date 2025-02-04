extends PerkBase

func _init():
	id = Perk.CumUniqueBiology
	skillGroup = Skill.CumLover
	dungeonWeight = 0.0

func getVisibleName():
	return "Unique Biology"

func getVisibleDescription():
	return "Your fuckholes have adjusted to all sorts of cocks, gaining some animalistic traits in the process. Knotting you is now easier (and makes you feel good), barbed cocks can cause ovulation, and flared horsecocks will remove all other cum on penetration."

func getSkillTier():
	return 1

func getPicture():
	return "res://Images/Perks/fortune-cookie.png"

func getBuffs():
	return [
	]

func onSexEvent(_event:SexEvent):
	if(_event.getTargetChar() != npc):
		return
	
	if(_event.getType() == SexEvent.HoleCreampied || _event.getType() == SexEvent.FilledCondomInside):
		var hole = _event.getField("hole", BodypartSlot.Vagina)
		var knotted = _event.getField("knotted", false)
		
		if(knotted && (hole in [BodypartSlot.Vagina, BodypartSlot.Anus])):
			_event.getTargetChar().addPain(-30)
			_event.getTargetChar().addStamina(30)
			if(npc.isPlayer()):
				GM.main.addMessage("Being knotted feels so good!")

	if(_event.getType() == SexEvent.HolePenetrated):
		var hasBarbs = _event.getSourceChar().bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisBarbs)
		var hasFlare = _event.getSourceChar().bodypartHasTrait(BodypartSlot.Penis, PartTrait.PenisFlare)
		var hole = _event.getField("hole", BodypartSlot.Vagina)
		
		if(hole in [BodypartSlot.Vagina, BodypartSlot.Anus]):
			if(hasBarbs && npc.hasWombIn(hole)):
				if(npc.forceOvulate()):
					if(npc.isPlayer()):
						GM.main.addMessage("Barbs are scratching your inner walls, triggering ovulation!")
			if(hasFlare):
				var bodypart:Bodypart = npc.getBodypart(hole)
				if(bodypart.isOrificeStuffed()):
					bodypart.clearOrificeFluids()
					if(npc.isPlayer()):
						GM.main.addMessage("The bulbous glans have pushed all other seed from your "+BodypartSlot.getVisibleName(hole).to_lower()+"!")
