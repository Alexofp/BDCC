extends AuctionAction

func _init():
	id = "EmphasizeBody"

func getActionType():
	return AuctionActionType.Emphasize

func getName() -> String:
	return "Body"

func getButtonDesc() -> String:
	return "Emphasize the slave's curves and femininity/masculinity.\n\nDoesn't reveal any preferences, has a negative effects on bidders who don't strongly prefer any of the presented traits."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	var isMasc:bool = (_slaveTraits.has("Masculine") && _slaveTraits["Masculine"] > 0.0)
	var isAndr:bool = (_slaveTraits.has("Androgynous") && _slaveTraits["Androgynous"] > 0.0)
	var isFemi:bool = (_slaveTraits.has("Feminine") && _slaveTraits["Feminine"] > 0.0)
	var isSlim:bool = (_slaveTraits.has("BodySlim") && _slaveTraits["BodySlim"] > 0.0)
	var isAver:bool = (_slaveTraits.has("BodyAverage") && _slaveTraits["BodyAverage"] > 0.0)
	var isThic:bool = (_slaveTraits.has("BodyThick") && _slaveTraits["BodyThick"] > 0.0)
	
	if(isFemi):
		if(isSlim):
			saynn("{presenter.You} {presenter.youVerb('step')} closer to {slave.name}, running {presenter.yourHis} hands down {slave.hisHer} delicate, slender figure. With a firm grip, {presenter.youHe} {presenter.youVerb('pull')} {slave.himHer} forward slightly, giving the bidders a better view of the feminine beauty before them.")
			
			sayPresenter("Look at this slender beauty.. graceful, refined, and perfectly feminine. A body built for elegance and obedience.")
		if(isAver):
			saynn("With a confident smile, {presenter.you} {presenter.youVerb('approach', 'approaches')} the slave before sliding {presenter.yourHis} hands along the gentle curves of {slave.hisHer} well-proportioned body. The {slave.thick} shape of {slave.hisHer} hips and waist exudes an incredibly alluring feminine charm.")
			
			sayPresenter("Feast your eyes on these perfect proportions - balanced, girly, and ready to serve in any way you desire.")
		if(isThic):
			saynn("{presenter.You} {presenter.youVerb('approach', 'approaches')} {slave.name} before placing {presenter.yourHis} hands on the slave's full, curvy hips, running them over the lush figure before the crowd. {slave.HeShe} radiates a robust femininity, the soft, thick curves inviting attention.")
			
			sayPresenter("This one’s body is just impossible to resist.. voluptuous and undeniably feminine. All the softness you could ever want.")
	if(isAndr):
		if(isSlim):
			saynn("{presenter.You} {presenter.youVerb('step')} up to {slave.name}, {presenter.yourHis} hands tracing along the slim, androgynous lines of {slave.hisHer} body. {presenter.YouHe} {presenter.youVerb('let')} the light of the projector play on that fit body.. highlighting the curves.")
			
			sayPresenter("This is something truly unique - a slender body that walks the line between feminine and masculine, appealing to those with an eye for both.")
		if(isAver):
			saynn("Standing close to {slave.name}, {presenter.you} {presenter.youVerb('let')} your hands glide along {slave.hisHer} neutral, balanced frame. {slave.HisHer} body is neither overly feminine nor masculine, with proportions that offer a harmonious middle ground.. so {presenter.youHe} {presenter.youVerb('make')} sure to highlight that.")
			
			sayPresenter("A perfect body.. neither too soft nor too firm. This body will adapt to any role, ready to serve however you see fit.")
		if(isThic):
			saynn("{presenter.You} {presenter.youVerb('place')} {presenter.yourHis} hands firmly on {slave.name}’s full, solid frame, emphasizing the thick but evenly balanced body. Neither strongly masculine nor feminine..")
			
			sayPresenter("Look at this strong, thick build. Balanced in every way.. perfectly suited for any task or role you have in mind.")
	if(isMasc):
		if(isSlim):
			saynn("{presenter.You} {presenter.youVerb('approach', 'approaches')} {slave.name}, running {presenter.yourHis} hands over the taut, firm lines of {slave.hisHer} lean body. The masculine definition is subtle but clear, strength lying beneath the slim build.")
			
			sayPresenter("Look at this slim form.. that just radiates raw strength. This body is built for service and endurance.")
		if(isAver):
			saynn("{presenter.You} {presenter.youVerb('step')} up to {slave.name}, letting {presenter.yourHis} hands glide over {slave.hisHer} firm, well-defined chest and shoulders. The proportions are strong and masculine, with enough muscle to promise strength without overwhelming bulk.")
			
			sayPresenter("Strong, balanced, and masculine. This one will serve with power and grace, perfect for those who appreciate a firm hand.")
		if(isThic):
			saynn("{presenter.You} {presenter.youVerb('place')} {presenter.yourHis} hands on {slave.name}’s broad, powerful shoulders, running them down {slave.hisHer} thick, muscular body. Every inch of {slave.himHer} exudes strength and dominance, a truly imposing figure.")
			
			sayPresenter("Here’s a body built for power and control.. Thick, masculine, and ready to be put to work in every possible way.")
			

func getTraits() -> Dictionary:
	return {
		"Masculine": 2.0,
		"Androgynous": 2.0,
		"Feminine": 2.0,
		"BodySlim": 2.0,
		"BodyAverage": 2.0,
		"BodyThick": 2.0,
	}

func getPositiveReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	if(_slaveTraits.has("Masculine") && _slaveTraits["Masculine"] > 0.0):
		return RNG.pick([
			'Strong, I like that.',
			'Very powerful.',
			'Impressive physique.',
			'Perfection.',
			'Now we’re talking.',
			'Now that’s a strong body.',
		])
	if(_slaveTraits.has("Androgynous") && _slaveTraits["Androgynous"] > 0.0):
		return RNG.pick([
			'Perfection.',
			'Captivating.',
			'Interesting, for sure.',
		])
	if(_slaveTraits.has("Feminine") && _slaveTraits["Feminine"] > 0.0):
		return RNG.pick([
			'Beautiful and graceful.',
			'Just the right amount of girly!',
			'Just the softness I like.',
			'Gorgeous.',
			'A true beauty.',
		])
	
	return .getPositiveReaction(_char, _slaveTraits)
	
func getPassiveDesireGain() -> float:
	return -1.0

func isEmphasizeAction() -> bool:
	return true

func getSlaveReaction(_char:BaseCharacter, _reactionType) -> String:
	if(_reactionType == AuctionSlaveReaction.Obedient):
		return RNG.pick([
			"{slave.name} stands perfectly still as {presenter.yourHis} hands glide over {slave.hisHer} body, {slave.hisHer} head bowed in silent submission. {slave.HeShe} accepts the attention without resistance, ready to be shown off.",
			"{slave.name} doesn’t flinch, merely adjusting {slave.hisHer} posture slightly to make it easier for {presenter.you} to present {slave.himHer} to the crowd. Every movement is deliberate and obedient.",
			"{slave.name} holds {slave.hisHer} position without protest, standing tall as {presenter.you} {presenter.youVerb('emphasize')} every inch of {slave.hisHer} body for the bidders to see.",
			"{slave.name} keeps {slave.hisHer} eyes downcast, silently allowing {presenter.you} to show off {slave.hisHer} form, every movement precise and compliant.",
			"{slave.name} stands firm, shifting only when necessary to give {presenter.you} complete control over the display, perfectly obedient in every way.",
			"{slave.name} remains completely still, giving {presenter.you} full access to highlight {slave.hisHer} body to the bidders. {slave.HeShe} offers no resistance, accepting {slave.hisHer} role in the auction.",
		])
	if(_reactionType == AuctionSlaveReaction.Confused):
		return RNG.pick([
			"{slave.name} glances at {presenter.you} with a soft, confused expression, unsure of what's happening but offering no resistance as {presenter.you} present {slave.hisHer} body to the crowd.",
			"{slave.name}'s eyes flicker with sadness, but {slave.heShe} stands still, allowing {presenter.you} to highlight {slave.hisHer} form despite the clear confusion in {slave.hisHer} gaze.",
			"A soft sigh escapes {slave.name}'s lips as {presenter.you} {presenter.youVerb('trace')} {slave.hisHer} form, {slave.hisHer} confusion evident, but {slave.heShe} doesn’t struggle against {presenter.your} touch.",
			"{slave.name} bites {slave.hisHer} lip, eyes reflecting sadness as {presenter.you} {presenter.youVerb('show')} off {slave.hisHer} body. Confusion lingers, but {slave.heShe} remains passive under {presenter.your} control.",
			"{slave.name} stands with a sorrowful expression, clearly unsure of what’s happening, but remains compliant as {presenter.you} {presenter.youVerb('emphasize')} {slave.hisHer} form for the bidders.",
			"{slave.name} gazes at the floor, sadness clouding {slave.hisHer} features, but {slave.heShe} doesn’t resist as {presenter.you} {presenter.youVerb('run')} {presenter.your} hands over {slave.hisHer} body.",
		])
	if(_reactionType == AuctionSlaveReaction.Shy):
		return RNG.pick([
			"{slave.name} blushes deeply, a bright red color spreading across {slave.hisHer} cheeks as {presenter.you} {presenter.youVerb('run')} {presenter.your} hands over {slave.hisHer} form. {slave.HeShe} fidgets slightly, clearly embarrassed.",
			"{slave.name} squirms, {slave.hisHer} face flushed as {presenter.you} {presenter.youVerb('emphasize')} {slave.hisHer} body for the crowd. {slave.HeShe} can’t hide the shy discomfort that fills {slave.himHer}.",
			"A soft gasp escapes {slave.name}'s lips, {slave.hisHer} cheeks burning with embarrassment as {presenter.you} {presenter.youVerb('trace')} {slave.hisHer} form, making {slave.himHer} the focus of attention.",
			"{slave.name} looks away, face flushed with shy embarrassment as {presenter.you} {presenter.youVerb('run')} {presenter.your} hands over {slave.hisHer} body, clearly overwhelmed by the attention.",
			"{slave.name}'s body trembles slightly as {presenter.you} {presenter.youVerb('highlight')} {slave.hisHer} form, a deep blush creeping up {slave.hisHer} neck, too shy to meet the bidders' gaze.",
			"{slave.name} turns {slave.hisHer} face away, {slave.hisHer} cheeks glowing red as {presenter.you} {presenter.youVerb('display')} {slave.hisHer} body for the crowd, shy and flustered under the attention.",
		])
	if(_reactionType == AuctionSlaveReaction.MindBroken):
		return RNG.pick([
			"{slave.name} stands still, eyes dull and unfocused as {presenter.you} {presenter.youVerb('touch')} {slave.hisHer} body. There’s no reaction, {slave.heShe} doesn’t seem to notice what’s happening.",
			"{slave.name} remains motionless, {slave.hisHer} gaze vacant as {presenter.you} {presenter.youVerb('emphasize')} {slave.hisHer} form. {slave.HeShe} is completely detached from reality, unresponsive to {presenter.your} touch.",
			"{slave.name}'s body is limp, {slave.hisHer} mind too far gone to care about being displayed. {slave.HeShe} offers no resistance, no acknowledgment of what’s happening around {slave.himHer}.",
			"{slave.name} stares blankly into the distance, completely indifferent to {presenter.your} touch. {slave.HeShe} doesn’t react as {presenter.you} {presenter.youVerb('highlight')} {slave.hisHer} body, broken beyond recognition.",
			"{slave.name} doesn’t move, eyes empty as {presenter.you} {presenter.youVerb('present')} {slave.hisHer} body. {slave.HeShe} stands there like a lifeless doll, unaware of the attention.",
			"{slave.name} stays utterly still, no emotion crossing {slave.hisHer} face as {presenter.you} {presenter.youVerb('handle')} {slave.hisHer} body. The auction may as well not exist for {slave.himHer}.",
		])
	if(_reactionType == AuctionSlaveReaction.Desperate):
		return RNG.pick([
			"{slave.name} squirms in place, confusion and panic evident in {slave.hisHer} wide eyes as {presenter.you} {presenter.youVerb('display')} {slave.hisHer} body to the bidders. {slave.HeShe} tugs at {slave.hisHer} restraints, but to no avail.",
			"{slave.name}'s breath quickens, desperation in {slave.hisHer} eyes as {presenter.you} {presenter.youVerb('emphasize')} {slave.hisHer} form. {slave.HeShe} looks around frantically, clearly not understanding what’s happening.",
			"{slave.name} glances at {presenter.you} in confusion, breathing heavily as {presenter.youHe} {presenter.youVerb('show')} off {slave.hisHer} body. Desperation flickers in {slave.hisHer} eyes, unsure of what to expect.",
			"{slave.name} shifts uneasily, pulling at {slave.hisHer} chains as {presenter.you} {presenter.youVerb('handle')} {slave.hisHer} body. {slave.HeShe} seems lost and desperate, confused by the attention.",
			"{slave.name} trembles as {presenter.you} {presenter.youVerb('run')} {presenter.your} hands over {slave.hisHer} form, fear and confusion mixing with the desperation in {slave.hisHer} expression.",
			"{slave.name} stares at the crowd, {slave.hisHer} chest rising and falling rapidly as {presenter.you} {presenter.youVerb('display')} {slave.hisHer} body, clearly overwhelmed by confusion and panic.",
		])
	if(_reactionType == AuctionSlaveReaction.Angry):
		return RNG.pick([
			"{slave.name} glares at {presenter.you} with fury in {slave.hisHer} eyes as {presenter.youHe} {presenter.youVerb('run')} {presenter.yourHis} hands over {slave.hisHer} form. {slave.HeShe} pulls against {slave.hisHer} restraints, clearly hating every second of it.",
			"{slave.name} bares {slave.hisHer} teeth, a growl escaping as {presenter.you} {presenter.youVerb('emphasize')} {slave.hisHer} body. {slave.HeShe} fights against the chains, anger radiating from {slave.himHer}.",
			"{slave.name} sneers at the bidders, trying to pull away from {presenter.your} touch as {presenter.youHe} {presenter.youVerb('present')} {slave.hisHer} body. Every movement is filled with defiance and rage.",
			"{slave.name} tugs violently at the restraints, eyes blazing with anger as {presenter.you} {presenter.youVerb('handle')} {slave.hisHer} body. {slave.HeShe} refuses to be passive, fighting every touch.",
			"{slave.name} growls, hatred burning in {slave.hisHer} gaze as {presenter.you} {presenter.youVerb('display')} {slave.hisHer} body. {slave.HeShe} is clearly not broken, determined to resist even now.",
			"{slave.name} spits on the floor, fury in {slave.hisHer} eyes as {presenter.you} {presenter.youVerb('emphasize')} {slave.hisHer} form. {slave.HeShe} pulls at the chains, refusing to submit.",
		])
		
	return "{slave.name} blushes deeply."
