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
	HasStrapons,
	IsWearingChastityCage,
	HasChastityCageInInventory,
	HasItemID,
	HasReachablePenisOrVaginaOrHasStrapon,
	HasBreastPump,
	HasPenisPump,
	NotWearingItem,
	CanStartSex,
	HasReachableOrCagedPenisOrReachableVagina,
	HasItemWithTag,
	
	CHECKSAMMOUNT,
}

const ChecksTexts = [
	"NotLate",
	"NotGagged",
	"NotOralBlocked",
	"NotHandsBlocked",
	"NotArmsRestrained",
	"NotLegsRestrained",
	"NotBlindfolded",
	"NotCollapsed",
	"SkillCheck",
	"StatCheck",
	"PerkCheck",
	"HasCondoms",
	"HasReachablePenis",
	"HasReachableVagina",
	"HasReachableAnus",
	"HasReachableVaginaOrAnus",
	"HasPenis",
	"HasVagina",
	"NotStunned",
	"HasStamina",
	"HasCredits",
	"ContentEnabled",
	"CanWearStrapon",
	"HasStraponAndCanWear",
	"HasStrapons",
	"IsWearingChastityCage",
	"HasChastityCageInInventory",
	"HasItemID",
	"HasReachablePenisOrVaginaOrHasStrapon",
	"HasBreastPump",
	"HasPenisPump",
	"NotWearingItem",
	"CanStartSex",
	"HasReachableOrCagedPenisOrReachableVagina",
	"HasItemWithTag",
]

static func getAllWithNames():
	var result = []
	for _i in range(CHECKSAMMOUNT):
		result.append([_i, getName(_i)])
	return result

static func getName(thecheck:int):
	if(thecheck < 0 || thecheck >= ChecksTexts.size()):
		return "Error?"
	return ChecksTexts[thecheck]

static func getEditVars(thecheck:int):
	if(thecheck == PerkCheck):
		return {
			"1": {
				name = "Perk name",
				type = "advancedSelector",
				value = Perk.StartInfertile,
				values = GlobalRegistry.getPerks().keys(),
			},
		}
	if(thecheck == StatCheck):
		return {
			"1": {
				name = "Stat name",
				type = "advancedSelector",
				value = Stat.Agility,
				values = GlobalRegistry.getStats().keys(),
			},
			"2": {
				name = "Min stat",
				type = "number",
				value = 5,
				int = true,
			},
		}
	if(thecheck == SkillCheck):
		return {
			"1": {
				name = "Skill name",
				type = "advancedSelector",
				value = Skill.BDSM,
				values = GlobalRegistry.getSkills().keys(),
			},
			"2": {
				name = "Min level",
				type = "number",
				value = 5,
				int = true,
			},
		}
	if(thecheck == HasCredits):
		return {
			"1": {
				name = "Min credits",
				type = "number",
				value = 5,
				int = true,
			},
		}
	if(thecheck == ContentEnabled):
		return {
			"1": {
				name = "Content",
				type = "advancedSelector",
				value = ContentType.Watersports,
				values = ContentType.getAll(),
			},
		}
	if(thecheck in [HasItemID, NotWearingItem]):
		return {
			"1": {
				name = "Item id",
				type = "advancedSelector",
				value = "appleitem",
				values = GlobalRegistry.getItemRefs().keys(),
			},
		}
	if(thecheck == HasItemWithTag):
		return {
			"1": {
				name = "Item tag",
				type = "advancedSelector",
				value = ItemTag.BDSMRestraint,
				values = ItemTag.getNamesAndValues(),
			},
		}
	
	return {}

static func getReasonText(reason):
	var args = reason
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
	if(reason == HasStrapons):
		return "You need a strapon in your inventory to do this"
	if(reason == IsWearingChastityCage):
		return "You're not wearing a chastity cage"
	if(reason == NotCollapsed):
		return "You can't do this while collapsed"
	if(reason == HasChastityCageInInventory):
		return "You don't have any chastity cages in your inventory"
	if(reason == HasItemID):
		return "You don't have the required item"
	if(reason == HasReachablePenisOrVaginaOrHasStrapon):
		return "Need a reachable penis, vagina or a strapon in inventory"
	if(reason == HasBreastPump):
		return "You don't have any breast pumps in your inventory"
	if(reason == HasPenisPump):
		return "You don't have any penis pumps in your inventory"
	if(reason == NotWearingItem):
		return "You need to get rid of "+GlobalRegistry.getItemRef(args[1]).getVisibleName()
	if(reason == CanStartSex):
		return "You can't start sex while you are wearing restraints"
	if(reason == HasReachableOrCagedPenisOrReachableVagina):
		return "You need to have a penis or a reachable vagina"
	if(reason == HasItemWithTag):
		return "You don't have the required kind of item"
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
		if(reason == HasStrapons):
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
		if(reason == HasItemID):
			if(!GM.pc.getInventory().hasItemID(args[1])):
				return args
		if(reason == HasReachablePenisOrVaginaOrHasStrapon):
			if(!GM.pc.hasReachablePenis() && !GM.pc.hasReachableVagina() && !GM.pc.hasStrapons()):
				return args
		if(reason == HasBreastPump):
			if(GM.pc.getInventory().getItemsWithTag(ItemTag.BreastPump).size() <= 0):
				return args
		if(reason == HasPenisPump):
			if(GM.pc.getInventory().getItemsWithTag(ItemTag.PenisPump).size() <= 0):
				return args
		if(reason == NotWearingItem):
			if(GM.pc.getInventory().hasItemIDEquipped(args[1])):
				return args
		if(reason == CanStartSex):
			if(GM.pc.hasBoundArms()):
				return NotArmsRestrained
			if(GM.pc.hasBlockedHands()):
				return NotHandsBlocked
			if(GM.pc.hasBoundLegs()):
				return NotLegsRestrained
			if(GM.pc.isOralBlocked()):
				return NotOralBlocked
		if(reason == HasReachableOrCagedPenisOrReachableVagina):
			if(!GM.pc.hasReachablePenis() && !GM.pc.isWearingChastityCage() && !GM.pc.hasReachableVagina()):
				return reason
		if(reason == HasItemWithTag):
			if(GM.pc.getInventory().getItemsWithTag(args[1]).size() <= 0):
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
