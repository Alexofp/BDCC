extends AuctionTrait

func _init():
	ids = [
		"MindStaff",#
		"MindInmate",#
		
		"SkillSlut",#
		"SkillPet",#
		"SkillSubmissive",#
		
		"MindBroken",#
		"MindSubmitted",#
	]

func getTraitType(_id:String):
	return AuctionTraitType.Mind

func getName(_id:String) -> String:
	if(_id == "MindStaff"):
		return "Staff member"
	if(_id == "MindInmate"):
		return "Inmate"
	if(_id == "SkillSlut"):
		return "Slut skill"
	if(_id == "SkillPet"):
		return "Pet skill"
	if(_id == "SkillSubmissive"):
		return "Submissive skill"
	if(_id == "MindBroken"):
		return "Mindbroken"
	if(_id == "MindSubmitted"):
		return "Submitted"
	
	return "ERROR"

func calculateScore(_id:String, _char:BaseCharacter) -> float:
	if(_id == "MindStaff"):
		if(_char.isStaff()):
			return 1.0
	if(_id == "MindInmate"):
		if(_char.isInmate()):
			return 1.0
	if(_id in ["SkillSlut", "SkillPet", "SkillSubmissive", "MindBroken", "MindSubmitted"]):
		if(!_char.isSlaveToPlayer()):
			return 0.0
		var npcSlavery:NpcSlave = _char.getNpcSlavery()
		if(_id == "SkillSlut"):
			if(npcSlavery.getSlaveSkill(SlaveType.Slut) >= 5):
				return clamp(npcSlavery.getSlaveSkill(SlaveType.Slut) / 15.0, 0.0, 1.0)
		if(_id == "SkillPet"):
			if(npcSlavery.getSlaveSkill(SlaveType.Pet) >= 5):
				return clamp(npcSlavery.getSlaveSkill(SlaveType.Pet) / 15.0, 0.0, 1.0)
		if(_id == "SkillSubmissive"):
			if(npcSlavery.getSlaveSkill(SlaveType.Submissive) >= 5):
				return clamp(npcSlavery.getSlaveSkill(SlaveType.Submissive) / 15.0, 0.0, 1.0)
		if(_id == "MindBroken"):
			if(npcSlavery.isMindBroken()):
				return 1.0
		if(_id == "MindSubmitted"):
			if(npcSlavery.hasSubmittedToPC()):
				return 1.0
	
	return 0.0

func getBidderChance(_id:String) -> float:
	if(_id == "MindBroken"):
		return .getBidderChance(_id) / 2.0
	return .getBidderChance(_id)

func getBidderPositiveChance(_id:String) -> float:
	if(_id == "MindBroken"):
		return 40.0
	return .getBidderPositiveChance(_id)
