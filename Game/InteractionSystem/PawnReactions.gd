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
	LEASHING_SOMEONE,
	FUCKING_SOMEONE,
}

static func saynn(theText:String):
	GM.main.IS.saynnExtra(theText)

static func sayPawn(_thePawn, theText:String):
	saynn("[say="+_thePawn.charID+"]"+theText+"[/say]")

static func sayModular(_pawnReacts, _pawnTarget, _id):
	sayPawn(_pawnReacts, ModularDialogue.generate(_id, {main=_pawnReacts.getChar(),target=_pawnTarget.getChar()}))

static func doReact(_pawnTarget, _pawnReacts):
	var _pc:BaseCharacter = _pawnTarget.getChar()
	var _npc:BaseCharacter = _pawnReacts.getChar()
	var _rep:ReputationPlaceholder = _pc.getReputation()
	var possible = []
	
	var exposure:float = _pc.getExposure()
	var chance:float = 10.0 + exposure * 10.0
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
	
	if(_pc.getExposedPrivates().size() > 0):#_pc.isFullyNaked()):
		possible.append(NAKED)
	
	if(_pawnTarget.canGrabAndFuck()):
		possible.append(CAN_GRAB_AND_FUCK)
	
	if(_pawnTarget.isOnALeash()):
		possible.append(ON_A_LEASH)
	
	if(_pawnTarget.isBeingFucked()):
		possible.append(GETTING_FUCKED)
	
	if(_pawnTarget.isLeashingSomeone()):
		possible.append(LEASHING_SOMEONE)
	
	if(_pawnTarget.isFuckingSomeone()):
		possible.append(FUCKING_SOMEONE)
	
	if(possible.size() <= 0):
		return false
	
	var pickedReact = RNG.pick(possible)
	
	if(pickedReact in [LEASHING_SOMEONE, FUCKING_SOMEONE]):
		_rep.addRep(RepStat.Alpha, 0.1)
		
		if(pickedReact == LEASHING_SOMEONE):
			saynn(_npc.getName()+" walks by and notices you leashing someone.")
			sayModular(_pawnReacts, _pawnTarget, "ReactLEASHING_SOMEONE")
		
		if(pickedReact == FUCKING_SOMEONE):
			saynn(_npc.getName()+" walks by and notices you fucking someone.")
			sayModular(_pawnReacts, _pawnTarget, "ReactFUCKING_SOMEONE")
	else:
		_rep.addRep(RepStat.Whore, 0.05)
		
		if(pickedReact == BODYWRITINGS):
			saynn(_npc.getName()+" walks by and notices your bodywritings.")
			sayModular(_pawnReacts, _pawnTarget, "ReactBODYWRITINGS")
		
		if(pickedReact == TALLYMARKS):
			saynn(_npc.getName()+" walks by and notices your tallymarks.")
			sayModular(_pawnReacts, _pawnTarget, "ReactTALLYMARKS")
		
		if(pickedReact == COVERED_IN_CUM):
			saynn(_npc.getName()+" walks by and notices your messy appearance.")
			sayModular(_pawnReacts, _pawnTarget, "ReactCOVERED_IN_CUM")
		
		if(pickedReact == COVERED_IN_PISS):
			saynn(_npc.getName()+" walks by and notices your.. very.. messy appearance.")
			sayModular(_pawnReacts, _pawnTarget, "ReactCOVERED_IN_PISS")
		
		if(pickedReact == NAKED):
			saynn(_npc.getName()+" walks by and takes note of your private bits.")
			sayModular(_pawnReacts, _pawnTarget, "ReactNAKED")
		
		if(pickedReact == CAN_GRAB_AND_FUCK):
			saynn(_npc.getName()+" walks by and notices you.")
			sayModular(_pawnReacts, _pawnTarget, "ReactCAN_GRAB_AND_FUCK")
		
		if(pickedReact == ON_A_LEASH):
			saynn(_npc.getName()+" sees you getting dragged off somewhere.")
			sayModular(_pawnReacts, _pawnTarget, "ReactON_A_LEASH")
		
		if(pickedReact == GETTING_FUCKED):
			saynn(_npc.getName()+" walks by and sees you getting fucked.")
			sayModular(_pawnReacts, _pawnTarget, "ReactGETTING_FUCKED")
		
	return true
