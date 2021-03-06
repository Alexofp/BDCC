extends Object
class_name ButtonChecks

enum {
	NotLate,
	NotGagged,
	NotOralBlocked,
	NotHandsBlocked,
	NotArmsRestrained,
	NotLegsRestrained,
	SkillCheck,
	StatCheck,
	PerkCheck,
	HasCondoms,
	HasReachablePenis,
	HasReachableVagina,
	NotStunned,
	HasStamina,
}

static func getReasonText(reason):
	#var args = reason
	if(reason is Array):
		reason = reason[0]
	
	if(reason == NotLate):
		return "It's way too late to do this"
	if(reason in [NotGagged, NotOralBlocked]):
		return "You can't do this while gagged"
	if(reason == NotHandsBlocked):
		return "You can't do this with your hands blocked"
	if(reason == NotArmsRestrained):
		return "You can't do this while your arms are restrained"
	if(reason == NotLegsRestrained):
		return "You can't do this while your legs are restrained"
	if(reason == HasCondoms):
		return "You don't have any condoms"
	if(reason == HasReachablePenis):
		return "You need to have a dick"
	if(reason == HasReachableVagina):
		return "You need to have a pussy"
	if(reason == SkillCheck):
		return ""
	if(reason == StatCheck):
		return ""
	if(reason == PerkCheck):
		return ""
	if(reason == NotStunned):
		return "You can't do this while stunned"
	if(reason == HasStamina):
		return "You don't have any stamina to do this"
	return "Error?"

static func check(checks: Array):
	for reason in checks:
		var args = reason
		if(reason is Array):
			reason = reason[0]
		
		if(reason == NotLate):
			if(GM.main.isVeryLate()):
				return reason
		if(reason == NotGagged):
			if(GM.pc.isGagged()):
				return reason
		if(reason == NotOralBlocked):
			if(GM.pc.isOralBlocked()):
				return reason
		if(reason == NotArmsRestrained):
			if(GM.pc.hasBoundArms()):
				return reason
		if(reason == NotHandsBlocked):
			if(GM.pc.hasBlockedHands()):
				return reason
		if(reason == NotLegsRestrained):
			if(GM.pc.hasBoundLegs()):
				return reason
		if(reason == SkillCheck):
			var skill: SkillBase = GM.pc.getSkillsHolder().getSkill(args[1])
			if(skill == null || skill.getLevel() < args[2]):
				return args
		if(reason == StatCheck):
			if(GM.pc.getStat(args[1]) < args[2]):
				return args
		if(reason == PerkCheck):
			if(!GM.pc.hasPerk(args[1])):
				return args
		if(reason == HasCondoms):
			if(!GM.pc.hasCondoms()):
				return reason
		if(reason == HasReachablePenis):
			if(!GM.pc.hasReachablePenis()):
				return reason
		if(reason == HasReachableVagina):
			if(!GM.pc.hasReachableVagina()):
				return reason
		if(reason == NotStunned):
			if(GM.pc.hasEffect(StatusEffect.Stunned)):
				return reason
		if(reason == HasStamina):
			if(GM.pc.getStamina() <= 0):
				return reason
	return null

static func getPrefix(checks: Array):
	var result = ""
	for reason in checks:
		var args = reason
		if(reason is Array):
			reason = reason[0]
		
		if(reason == SkillCheck):
			var skill: SkillBase = GlobalRegistry.createSkill(args[1])
			result += "["+skill.getVisibleName()+" "+str(args[2])+"+]"
			
		if(reason == StatCheck):
			var stat: StatBase = GlobalRegistry.getStat(args[1])
			result += "["+stat.getVisibleName()+" "+str(args[2])+"+]"
			
		if(reason == PerkCheck):
			var perk: PerkBase = GlobalRegistry.createPerk(args[1])
			result += "["+perk.getVisibleName()+" perk]"
	
	if(result != ""):
		result += " "
	return result
