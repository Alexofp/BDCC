extends Object
class_name ButtonChecks

enum {
	NotLate,
	NotGagged,
	NotOralBlocked,
	NotHandsBlocked,
	NotArmsRestrained,
	NotLegsRestrained,
	NotBlindfolded,
	NotCollapsed,
	SkillCheck,
	StatCheck,
	PerkCheck,
	HasCondoms,
	HasReachablePenis,
	HasReachableVagina,
	HasReachableAnus,
	HasReachableVaginaOrAnus,
	HasPenis,
	HasVagina,
	NotStunned,
	HasStamina,
	HasCredits,
	ContentEnabled,
	CanWearStrapon,
	HasStraponAndCanWear,
	IsWearingChastityCage,
	HasChastityCageInInventory,
}

static func getReasonText(reason):
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
	if(reason == NotBlindfolded):
		return "You can't do this while blindfolded"
	if(reason == HasCondoms):
		return "You don't have any condoms"
	if(reason == HasReachablePenis):
		return "You need to have a reachable dick"
	if(reason == HasReachableVagina):
		return "You need to have a reachable pussy"
	if(reason == HasReachableAnus):
		return "You need to have a reachable anus"
	if(reason == HasReachableVaginaOrAnus):
		return "You need to have a reachable pussy or anus"
	if(reason == HasPenis):
		return "You need to have a dick"
	if(reason == HasVagina):
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
	if(reason == HasCredits):
		return "You need more credits!"
	if(reason == ContentEnabled):
		return ""
	if(reason == CanWearStrapon):
		return "You can't wear strapons"
	if(reason == HasStraponAndCanWear):
		return "You don't have any strapons or can't put on one"
	if(reason == IsWearingChastityCage):
		return "You're not wearing a chastity cage"
	if(reason == NotCollapsed):
		return "You can't do this while collapsed"
	if(reason == HasChastityCageInInventory):
		return "You don't have any chastity cages in your inventory"
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
		if(reason == NotBlindfolded):
			if(GM.pc.isBlindfolded()):
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
		if(reason == HasReachableAnus):
			if(!GM.pc.hasReachableAnus()):
				return reason
		if(reason == HasReachableVaginaOrAnus):
			if(!GM.pc.hasReachableAnus() && !GM.pc.hasReachableVagina()):
				return reason
		if(reason == HasPenis):
			if(!GM.pc.hasPenis()):
				return reason
		if(reason == HasVagina):
			if(!GM.pc.hasVagina()):
				return reason
		if(reason == NotStunned):
			if(GM.pc.hasEffect(StatusEffect.Stunned)):
				return reason
		if(reason == HasStamina):
			if(GM.pc.getStamina() <= 0):
				return reason
		if(reason == HasCredits):
			if(GM.pc.getCredits() < args[1]):
				return reason
		if(reason == ContentEnabled):
			if(!OPTIONS.isContentEnabled(args[1])):
				return args
		if(reason == CanWearStrapon):
			if(!GM.pc.canWearStrapon()):
				return args
		if(reason == HasStraponAndCanWear):
			if(!GM.pc.canWearStrapon()):
				return args
			if(!GM.pc.hasStrapons()):
				return args
		if(reason == IsWearingChastityCage):
			if(!GM.pc.isWearingChastityCage()):
				return args
		if(reason == NotCollapsed):
			if(GM.pc.hasEffect(StatusEffect.Collapsed)):
				return args
		if(reason == HasChastityCageInInventory):
			if(!GM.pc.hasChastityCages()):
				return args
			
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
			
		if(reason == ContentEnabled):
			var contentName = ContentType.getVisibleName(args[1])
			result += "["+str(contentName)+" content]"
	
	if(result != ""):
		result += " "
	return result
