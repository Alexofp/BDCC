extends LustAction

func _init():
	id = "NpcMiscSwayHips"
	hasByDefault = true
	
func shouldShow(_lustState: LustCombatState, _args):
	if(_lustState.getCharacter() == GM.pc):
		return false
	
	return true

func canDo(_lustState: LustCombatState, _args):
	if(_lustState.getCharacter() == GM.pc):
		return .canDo(_lustState, _args)
	else:
		var _fudge = .canDo(_lustState, _args)
		if(typeof(_fudge) == TYPE_ARRAY):
			return _fudge[0]
		else:
			return _fudge

func getVisibleName(_lustState: LustCombatState, _args):
	return "NpcMiscSwayHips"

func getVisibleDescription(_lustState: LustCombatState, _args):
	return "You should not see this"

func doAction(_lustState: LustCombatState, _args):
	#_lustState.getCharacter().addLust(3)
	
	var character = _lustState.getCharacter()
	
	var text = ""
	if(RNG.chance(50)):
		text += "{<npc>.nameS} movements become slow and sensual, turning the fight into an alluring dance. {<npc>.name} turns and flexes in just the right way to show off {<npc>.their} {<npc>.masc} body, emphasizing their sex appeal. "
#		text += "\n\n"
	else:
		text += "{<npc>.name} adds some sexy flair, swinging {<npc>.their} {<npc>.thick} hips around and flaunting {<npc>.their} {<npc>.masc} curves, in an attempt to tempt {pc.name}. "
#		text += "\n\n"
		
	if(RNG.chance(60) && character.hasEffect(StatusEffect.CoveredInCum)):
		text += "As {<npc>.their} sticky, cum-covered body sways sensually, {pc.name} can't help but watch {<npc>.himHer} drip. "
#		text += "\n\n"
	
	if(RNG.chance(50) && character.isFullyNaked()):
		text += "Every last bit of {pc.yourHis} opponent is exposed, and {<npc>.name} takes full advantage of this, {<npc>.their} hands caress {<npc>.their} naughty bits with practiced ease. "
#		text += "\n\n"
	
#	if(RNG.chance(40) && character.hasBodypart(BodypartSlot.Breasts) && !character.isBodypartCovered(BodypartSlot.Breasts)):
#		text += "Your {pc.breasts} are exposed to anyone to see. Hard perky nips follow the body and brush against the air as you shake your butt. "
#		text += "\n\n"
#
#	if(RNG.chance(40) && character.hasBodypart(BodypartSlot.Penis) && !character.isBodypartCovered(BodypartSlot.Penis)):
#		text += "Your rock-hard {pc.cock} is out and dripping pre, balls swaying in the air. "
#		text += "\n\n"
#
#	if(RNG.chance(40) && character.hasBodypart(BodypartSlot.Vagina) && !character.isBodypartCovered(BodypartSlot.Vagina)):
#		text += "You’re not hiding your pussy slit, you teasingly show the sensitive drippy folds as you turn around and rub your legs together. "
#		text += "\n\n"
	
#	if(RNG.chance(40) && (character.hasEffect(StatusEffect.HasCumInsideVagina) || character.hasEffect(StatusEffect.HasCumInsideAnus))):
#		text += "And wow, someone’s cum is leaking out of your used hole and dripping down your thighs, creating such a mess. It looks so hot though, anyone who sees you would think that you’re a natural cum slut. "
#		text += "\n\n"
#
#	if(RNG.chance(50) && character.hasEffect(StatusEffect.HasTallyMarks)):
#		text += "As you swing around, people that see you might spot that you have some black vertical lines drawn on your body, each one is a mark of somebody using you. "
#		text += "\n\n"
#
#	if(RNG.chance(50) && character.hasEffect(StatusEffect.HasBodyWritings)):
#		text += "Someone left writings on your body and right now anyone can see them clearly. "
#		text += "\n\n"


	return {
		text = text.replace("<npc>", character.getID()),
		lust = 1,
	}

func getLustTopics():
	return {
		InterestTopic.FeminineBody : 1.0,
		InterestTopic.MasculineBody : 1.0,
		InterestTopic.AndroBody : 1.0,
		InterestTopic.ThickBody : 0.8,
		InterestTopic.SlimBody : 0.8,
		InterestTopic.AverageMassBody : 0.8,
		InterestTopic.CoveredInCum : 0.7,
		InterestTopic.CoveredInLotsOfCum : 0.5,
		InterestTopic.FullyNaked : 0.7,
		InterestTopic.ExposedPussy : 0.4,
		InterestTopic.ExposedAnus : 0.4,
		InterestTopic.ExposedBreasts : 0.4,
		InterestTopic.ExposedCock : 0.4,
		InterestTopic.ExposedPanties : 0.4,
		InterestTopic.ExposedBra : 0.4,
		InterestTopic.TallyMarks : 0.8,
		InterestTopic.Bodywritings : 0.8,
		InterestTopic.Gags : 0.3,
		InterestTopic.Blindfolds : 0.3,
		InterestTopic.BDSMRestraints : 0.4,
		InterestTopic.ButtPlugs : 0.5,
		InterestTopic.VaginalPlugs : 0.5,
		InterestTopic.Pregnant: 1.0,
	}

func getPriority():
	return 0

func isTease():
	return true

func getExperience(_lustState: LustCombatState, _args):
	return null # npc skill experience is not tracked

func getVisibility():
	return -10 # to avoid triggering visibility checks. as that mechanic is for the player
