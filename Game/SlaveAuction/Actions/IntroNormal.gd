extends AuctionAction

func _init():
	id = "IntroNormal"

func getActionType():
	return AuctionActionType.Intro

func getName() -> String:
	return "Normal introduction"

func getButtonDesc() -> String:
	return "Start the auction while acting normally.\n\nThis action will reveal 3 random preferences of each bidder."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	saynn("The curtains open, revealing {presenter.name}, who is standing on a little raised platform.")
	
	sayPresenter("Good evening, ladies and gentlemen. Welcome to Blacktail Market! Tonight, I present to you a unique and rare offering.")
	
	saynn("The spotlight highlights {slave.name} who is standing on {slave.his} {slave.toes}.")
	
	saynn("The bidders lean forward, curious but composed. You hear their quiet chatter and try to pick out anything useful.")

	for _i in range(3):
		_auction.unlockRandomTraitEachBidder()

func getSlaveReaction(_char:BaseCharacter, _reactionType) -> String:
	if(_reactionType == AuctionSlaveReaction.Obedient):
		return RNG.pick([
			"{slave.name} doesn’t flinch as the light snaps onto {slave.him}, {slave.his} head tilting slightly to the floor in submission. {slave.His} posture remains firm despite the strain. {slave.He} seems to understand where {slave.he} {slave.isAre}.. and accepts {slave.his} fate in silence.",
			"A quiet gasp escapes {slave.name}'s lips, but {slave.he} quickly recovers, standing tall despite {slave.his} position. {slave.His} gaze lowers respectfully, ready to endure whatever is to come. There is no struggle, only the faintest tremor of anticipation.",
			"The bright projector blinds {slave.name} momentarily, but {slave.he} remains composed. {slave.His} breathing is deep as {slave.he} looks around, quickly realizing what is happening.. {slave.He} seems to understand {slave.his} purpose, accepting it without protest.",
		])
	if(_reactionType == AuctionSlaveReaction.Confused):
		return RNG.pick([
			"The light startles {slave.name}, and {slave.his} {slave.masc} body tenses as {slave.he} {slave.isAre} presented to the bidders, lips parting in a soft gasp. {slave.His} big, sad eyes search the big dark room desperately, as if hoping for an explanation. {slave.He} glances at the presenter, a pleading look in {slave.his} eyes.",
			"Confusion flickers in {slave.name}'s eyes as the bright light bears down on {slave.him}. {slave.He} lowers {slave.his} head slightly, lips trembling as if to ask a question, but {slave.he} remains still, sadness weighing heavy on {slave.his} features.",
			"{slave.name} swallows hard, blinking as {slave.he} struggles to make sense of the scene. {slave.His} gaze flits around, unsure and lost, a cloud of sadness settling over {slave.him}. But despite the uncertainty, {slave.he} doesn’t resist.",
		])
	if(_reactionType == AuctionSlaveReaction.Shy):
		return RNG.pick([
			"{slave.name}'s cheeks flush a deep red as the light illuminates {slave.him}, {slave.his} gaze immediately darting to the floor. {slave.He} shifts awkwardly on {slave.his} toes, clearly embarrassed but unwilling to raise {slave.his} voice or eyes.",
			"A startled gasp escapes {slave.name} as the projector light floods the stage. {slave.He} squirms under the attention, face glowing with embarrassment, but {slave.his} eyes never meet the crowd. {slave.He} stays still, trying to disappear into {slave.his} discomfort.",
			"{slave.name} blushes fiercely as the spotlight settles on {slave.him}. {slave.His} body stiffens, clearly uncomfortable, but {slave.he} doesn’t resist. Instead, {slave.he} closes {slave.his} eyes briefly, trying to compose {slave.himself} under the weight of everyone's gaze.",
		])
	if(_reactionType == AuctionSlaveReaction.MindBroken):
		return RNG.pick([
			"{slave.name} doesn't react at all to the light or the crowd. {slave.His} eyes are dull, staring ahead blankly as if {slave.he} has long since given up any sense of awareness or hope. {slave.His} body hangs limp despite being bound upright.",
			"{slave.name}'s breathing is shallow, and {slave.his} gaze is empty, completely devoid of emotion. The light washes over {slave.him}, but {slave.he} doesn't seem to notice. {slave.His} limbs remain slack, like a puppet waiting for orders.",
			"The projector light snaps on, but {slave.name} doesn’t flinch. {slave.His} body is rigid, but there’s no struggle, no recognition in {slave.his} blank expression. {slave.He} stands there, a husk of what {slave.he} once was.",
		])
	if(_reactionType == AuctionSlaveReaction.Desperate):
		return RNG.pick([
			"{slave.name}'s eyes widen as the light hits {slave.him}, panic flashing across {slave.his} face. {slave.He} tugs at the chains, desperation creeping into {slave.his} posture, as if trying to make sense of what’s happening around {slave.him}.",
			"{slave.name} flinches as the projector light burns onto {slave.his} skin. {slave.He} struggles against {slave.his} cuffs, looking wildly at the crowd, pleading silently for someone to intervene. Confusion and fear war with {slave.his} every movement.",
			"With a startled gasp, {slave.name} looks around, eyes frantic. {slave.He} jerks at the restraints, visibly shaking as the realization sinks in. Desperation radiates from {slave.him}, as if begging for a way out, though none comes.",
		])
	if(_reactionType == AuctionSlaveReaction.Angry):
		return RNG.pick([
			"{slave.name}'s eyes narrow as the light snaps onto {slave.him}, a growl barely contained in {slave.his} throat. {slave.He} tugs against the cuffs with raw defiance, daring anyone to challenge {slave.his} strength. {slave.He} refuses to submit, despite the odds.",
			"A snarl escapes {slave.name} as the projector beam locks onto {slave.him}. {slave.His} teeth grit, muscles tense as {slave.he} glares out at the bidders with pure rage. {slave.He} fights against {slave.his} chains, ready to lash out if given the chance.",
			"{slave.name} stands tall despite the restraints, defiance burning in {slave.his} eyes. {slave.He} pulls at the chains with fury, teeth bared. The bright light only fuels {slave.his} anger, and {slave.he} stares down the crowd with hatred in every breath.",
		])
		
#	Obedient,
#	Confused,
#	Shy,
#	MindBroken,
#	Desperate,
#	Angry,
	return "{slave.name} blushes deeply."

func getTraits() -> Dictionary:
	return {
	}
