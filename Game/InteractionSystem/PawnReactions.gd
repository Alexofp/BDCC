extends Object
class_name PawnReactions

enum {
	BODYWRITINGS,
	TALLYMARKS,
	COVERED_IN_CUM,
	COVERED_IN_PISS,
	ON_A_LEASH,
	NAKED,
	CAN_GRAB_AND_FUCK,
	GETTING_FUCKED,
}

static func saynn(theText:String):
	GM.main.IS.saynnExtra(theText)

static func sayPawn(_thePawn, theText:String):
	saynn("[say="+_thePawn.charID+"]"+theText+"[/say]")

static func doReact(_pawnTarget, _pawnReacts):
	var _pc:BaseCharacter = _pawnTarget.getChar()
	var _npc:BaseCharacter = _pawnReacts.getChar()
	var _rep:ReputationPlaceholder = _pc.getReputation()
	var possible = []
	
	var exposure:float = _pc.getExposure()
	var chance:float = 20.0 + exposure * 50.0
	if(!RNG.chance(chance)):
		return false
	
	if(_pc.hasBodywritings()):
		possible.append(BODYWRITINGS)
	
	if(_pc.hasTallymarks()):
		possible.append(TALLYMARKS)
	
	if(_pc.isCoveredInCum() || _pc.isCoveredInGirlCum()):
		possible.append(COVERED_IN_CUM)
	
	if(_pc.isCoveredInPiss()):
		possible.append(COVERED_IN_PISS)
	
	if(_pc.isFullyNaked()):
		possible.append(NAKED)
	
	if(_pawnTarget.canGrabAndFuck()):
		possible.append(CAN_GRAB_AND_FUCK)
	
	if(_pawnTarget.isOnALeash()):
		possible.append(ON_A_LEASH)
	
	if(_pawnTarget.isBeingFucked()):
		possible.append(GETTING_FUCKED)
	
	if(possible.size() <= 0):
		return false
	
	var pickedReact = RNG.pick(possible)
	
	_rep.addRep(RepStat.Whore, 0.05)
	
	if(pickedReact == BODYWRITINGS):
		saynn(_npc.getName()+" notices your bodywritings.")
		sayPawn(_pawnReacts, "SLUTTT!")
	
	if(pickedReact == TALLYMARKS):
		saynn(_npc.getName()+" notices your tallymarks.")
		sayPawn(_pawnReacts, "HOW MANY TIMES DID YOU GET FUCKED, SLUT!")
	
	if(pickedReact == COVERED_IN_CUM):
		saynn(_npc.getName()+" notices your messy appearance.")
		sayPawn(_pawnReacts, "SO MUCH CUM, WHAT A SLUT!")
	
	if(pickedReact == COVERED_IN_PISS):
		saynn(_npc.getName()+" notices your.. very.. messy appearance.")
		sayPawn(_pawnReacts, "EW, GO WASH YOURSELF, PISS-SLUT!")
	
	if(pickedReact == NAKED):
		saynn(_npc.getName()+" walks by and sees you naked.")
		sayPawn(_pawnReacts, "WHAT A WHORE!")
	
	if(pickedReact == CAN_GRAB_AND_FUCK):
		saynn(_npc.getName()+" notices you.")
		sayPawn(_pawnReacts, "WOW, SOMEONE SHOULD TAKE ADVANTAGE OF THAT ASS!")
	
	if(pickedReact == ON_A_LEASH):
		saynn(_npc.getName()+" sees you getting dragged off somewhere.")
		sayPawn(_pawnReacts, "HAHA! YOU LOVE BEING PARADED AROUND, SLUT?")
	
	if(pickedReact == GETTING_FUCKED):
		saynn(_npc.getName()+" sees you getting fucked.")
		sayPawn(_pawnReacts, "YEAH, A SLUT IS GETTING FUCKED!")
	
	return true
