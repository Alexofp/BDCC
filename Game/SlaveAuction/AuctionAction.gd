extends Reference
class_name AuctionAction

var id:String = "error"
var savedTexts:Array = []

func getName() -> String:
	return getNameFromTraits()

func getButtonName() -> String:
	return getName()

func getButtonDesc() -> String:
	return "FILL ME"

func getActionType():
	return AuctionActionType.Fetish

func saynn(theText:String):
	savedTexts.append(theText)

func sayPresenter(theText:String):
	saynn("[say=presenter]"+theText+"[/say]")

func saySlave(theText:String):
	saynn("[say=slave]"+theText+"[/say]")

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	return {
		text = "FILL MEEEEE",
		slaveReaction = getSlaveReaction(_char, _auction.getSlaveReactionType()),
		traits = getTraits(),
		desire = getPassiveDesireGain(),
	}

func might() -> bool:
	return RNG.chance(mightChance())

func mightChance() -> float:
	return 50.0

func onActFinal(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	savedTexts.clear()
	var theResult = onAct(_char, _auction, _slaveTraits)
	if(theResult == null):
		theResult = {}
	
	if(savedTexts.size() > 0):
		theResult["text"] = Util.join(savedTexts, "\n\n")
	savedTexts.clear()
	return theResult

func getPositiveReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	return RNG.pick([
		"Interesting..",
		"Now we’re talking.",
		"Very tempting.",
		"I like that.",
		"That's worth bidding for.",
		"Yes, great.",
		"Perfect.",
		"Exactly what I'm looking for.",
	])

func getNegativeReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	return RNG.pick([
		"Not for me.",
		"Pass.",
		"Uninterested.",
		"Not my taste.",
		"That's not what I'm looking for.",
		"Ehh.",
	])

func getSlaveReaction(_char:BaseCharacter, _reactionType) -> String:
	if(_reactionType == AuctionSlaveReaction.Obedient):
		return RNG.pick([
			"{slave.name} lowers {slave.his} gaze obediently, showing zero resistance.",
			"{slave.name} remains motionless, showing no sign of discomfort, merely acknowledging the attention.",
			"{slave.name}'s eyes flick briefly to the floor as if accepting {slave.his} place.",
			"{slave.name} bows {slave.his} head slightly in deference, the words barely causing a reaction.",
			"{slave.name} stands tall, showing no outward response, as if {slave.he} knows this is what {slave.he} was trained for.",
			"{slave.name}'s posture remains composed, a quiet acceptance of {slave.his} role in the auction.",
		])
	if(_reactionType == AuctionSlaveReaction.Confused):
		return RNG.pick([
			"A flicker of confusion crosses {slave.name}'s face, but {slave.he} remains quiet, unsure of how to respond.",
			"{slave.name}'s lips tremble slightly, {slave.his} eyes darting away as {slave.he} processes.. everything.",
			"{slave.name} swallows nervously, a faint sadness visible in {slave.his} expression.",
			"{slave.name} bites {slave.his} lip, trying to stay composed despite the conflicting emotions.",
			"{slave.name}'s eyes well up slightly, the attention clearly affecting {slave.his} fragile state of mind.",
			"{slave.name} glances down, sadness pulling at {slave.his} features as {slave.he} hears the words.",
		])
	if(_reactionType == AuctionSlaveReaction.Shy):
		return RNG.pick([
			"{slave.name}'s cheeks flush a deep crimson as {slave.he} shifts uncomfortably under the scrutiny.",
			"{slave.name} lowers {slave.his} head, trying to hide the embarrassed blush creeping across {slave.his} face.",
			"{slave.name} squirms slightly, {slave.his} blush intensifying with every word spoken.",
			"A tiny gasp escapes {slave.name}'s lips, {slave.his} eyes darting nervously around the room.",
			"{slave.name} bites {slave.his} lower lip, {slave.his} cheeks burning from the attention.",
			"{slave.name} shivers slightly, clearly uncomfortable, but does nothing to protest the words.",
		])
	if(_reactionType == AuctionSlaveReaction.MindBroken):
		return RNG.pick([
			"{slave.name} doesn't react at all, {slave.his} eyes blank and devoid of recognition.",
			"{slave.name} stares ahead, showing no signs of understanding or emotion.",
			"{slave.name}'s body remains limp, not acknowledging the words or attention.",
			"{slave.name} stands still, {slave.his} face expressionless as if {slave.he} doesn’t even hear the words.",
			"{slave.name} blinks slowly, {slave.his} vacant eyes showing no comprehension.",
			"{slave.name} remains completely passive, like a doll with no will of {slave.his} own.",
		])
	if(_reactionType == AuctionSlaveReaction.Desperate):
		return RNG.pick([
			"{slave.name}'s eyes widen in panic, {slave.his} breathing quickening as the attention hits {slave.him}.",
			"{slave.He} struggles against {slave.his} restraints, fear flickering in {slave.his} eyes as the words sink in.",
			"A look of desperation crosses {slave.name}'s face, {slave.he} seems on the verge of begging for escape.",
			"{slave.name} shakes {slave.his} head slightly, as if trying to deny the description, confusion clear in {slave.his} eyes.",
			"{slave.name} stares at the crowd, clearly overwhelmed, searching for some kind of help.",
			"{slave.name} shifts anxiously, his gaze darting between the bidders, silently pleading.",
		])
	if(_reactionType == AuctionSlaveReaction.Angry):
		return RNG.pick([
			"{slave.name}'s jaw clenches tighter with every new bid, fury building in {slave.his} gaze.",
			"{slave.name} glares at the crowd, hate-filled eyes daring the bidders to keep going, as if ready to fight them all.",
			"{slave.name} growls under {slave.his} breath, the rising bids only fueling {slave.his} anger further.",
			"{slave.name} spits on the ground, the aggressive bidding war enraging {slave.him} even more.",
			"{slave.name}'s eyes burn with defiance as the numbers climb, clearly refusing to accept {slave.his} fate quietly.",
			"{slave.name} jerks against {slave.his} restraints, every new bid making {slave.him} more determined to resist.",
		])
		
	return "{slave.name} blushes deeply."

func getTraits() -> Dictionary:
	return {
	}

func getPassiveDesireGain() -> float:
	return 0.2

func canUse(_char:BaseCharacter, _slaveTraits:Dictionary) -> Array:
	return [true]

func canOnlyUseOnce() -> bool:
	return true

func requiresAtLeastOneTraitForSlave() -> bool:
	return true

func isEmphasizeAction() -> bool:
	return false

func getNameFromTraits() -> String:
	var theTraits:Dictionary = getTraits()
	
	if(theTraits.empty()):
		return "ERROR??"
	
	var traitID:String = theTraits.keys()[0]
	var theTraitObj = GlobalRegistry.getAuctionTrait(traitID)
	return theTraitObj.getName(traitID)
