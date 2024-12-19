extends AuctionAction

func _init():
	id = "EmphasizeHoles"

func getActionType():
	return AuctionActionType.Emphasize

func getName() -> String:
	return "Holes"

func getButtonDesc() -> String:
	return "Spread the slave's butt and really show off their holes.\n\nDoesn't reveal any preferences, has a negative effects on bidders who don't strongly prefer any of the presented traits."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	var hasVag:bool = _char.hasVagina()
	var vagTight:bool = (_slaveTraits.has("VaginaTight") && _slaveTraits["VaginaTight"] > 0.0)
	#var vagLoose:bool = (_slaveTraits.has("VaginaLoose") && _slaveTraits["VaginaLoose"] > 0.0)
	var anusTight:bool = (_slaveTraits.has("AnusTight") && _slaveTraits["AnusTight"] > 0.0)
	#var anusLoose:bool = (_slaveTraits.has("AnusLoose") && _slaveTraits["AnusLoose"] > 0.0)
	
	if(hasVag):
		if(vagTight && anusTight):
			saynn("{presenter.You} {presenter.youVerb('step')} behind {slave.name}, grabbing {slave.hisHer} hips and pulling {slave.himHer} back slightly to display {slave.hisHer} perfectly toned body. Slowly, {presenter.youHe} {presenter.youVerb('spread')} {slave.hisHer} cheeks wide, revealing both {slave.hisHer} tight, inviting pussy and clenched anus to the bidders.")
			
			sayPresenter("Take a look, folks! This slave comes with two tightly wrapped packages for your pleasure. You won’t find anything as snug as this, built to grip and squeeze every inch you give.")
			
			saynn("{presenter.YouHe} {presenter.youVerb('run')} your fingers teasingly around {slave.hisHer} holes, emphasizing just how firm and untouched they are.")
			
			sayPresenter("Both holes, perfectly tight, perfectly ready for whatever you choose.")
		elif(vagTight || anusTight):
			saynn("With a steady hand, {presenter.you} {presenter.youVerb('take')} hold of {slave.name}’s hips, pulling {slave.himHer} back before spreading {slave.hisHer} cheeks wide, giving the bidders a perfect view of both the pussy and anus.")
			
			sayPresenter("Let’s get a good look at what’s on offer. {slave.He} {slave.isAre} ready from both ends, eager and waiting for whatever you decide to fill.")
			
			saynn("{presenter.YouHe} {presenter.youVerb('make')} sure the bidders can see everything, running {presenter.yourHis} fingers near {slave.hisHer} openings.")
			
			sayPresenter("Two perfect holes, versatile and ready for all kinds of play.")
		else:
			saynn("{presenter.You} confidently {presenter.youVerb('step')} behind the slave, gripping {slave.hisHer} hips firmly and spreading {slave.hisHer} cheeks wide, making sure to display the well-worn, gaping holes of both {slave.hisHer} pussy and anus to the bidders.")
			
			sayPresenter("Here we have a slave who’s clearly seen some use! Look at how loose these holes are, ready to take whatever you throw at them.")
		
			saynn("{presenter.YouHe} {presenter.youVerb('trace')} the edges of both gaping entrances, showing just how open and inviting they are.")

			sayPresenter("Plenty of space to fill, whether you choose the front or the back. It’s all ready for more!")
	else:
		if(anusTight):
			saynn("{presenter.You} {presenter.youVerb('step')} behind the slave, placing both hands on {slave.hisHer} hips before spreading {slave.hisHer} cheeks to present the tight, puckered anus to the bidders.")
			
			sayPresenter("Here we have a perfectly tight hole, ready for anyone who enjoys a little resistance. Just look at how clenched {slave.hisHer} little back door is.")
			
			saynn("{presenter.YouHe} {presenter.youVerb('press', 'presses')} lightly around the edge, letting the bidders get a clear view of the tightness.")
			
			sayPresenter("Perfectly tight, ready to grip every inch you give.")
		else:
			saynn("With a confident grip, {presenter.you} {presenter.youVerb('pull')} the slave's hips back and {presenter.youVerb('spread')} {slave.hisHer} cheeks wide, showcasing the loose, well-worn anus for all the bidders to see.")
			
			sayPresenter("Now, this one here’s seen some use! Just look at how open this hole is, no need to worry about tightness here.")
			
			saynn("{presenter.YouHe} {presenter.youVerb('trace')} the edges, making sure the bidders can see how much room there is.")
			
			sayPresenter("Plenty of space for any kind of play. This one’s ready to take whatever you’ve got!")
	
func getTraits() -> Dictionary:
	return {
		"VaginaTight": 2.0,
		"VaginaLoose": 2.0,
		"AnusTight": 2.0,
		"AnusLoose": 2.0,
	}

func getPassiveDesireGain() -> float:
	return -1.0

func isEmphasizeAction() -> bool:
	return true

func getPositiveReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	if(_slaveTraits.has("AnusTight") && _slaveTraits["AnusTight"] > 0.0 && _slaveTraits.has("VaginaTight") && _slaveTraits["VaginaTight"] > 0.0):
		return RNG.pick([
			'A tight one, huh? That’s what I like to hear.',
			'Perfect, I’ve been wanting something fresh like that.',
			'Tight? That’s enough to get my interest.',
			'Sounds like the ideal ass for me.',
			'Oh yeah, I will enjoy stretching {slave.her} out.',
			'The things I can do to such a hole..',
		])
	else:
		return RNG.pick([
			'Now that’s what I like to see.',
			'Perfect!',
			'Well-used and no complaints - that’s exactly what I need.',
			'Loose, huh? That’s perfect for my plans.',
			'This one’s going to get a lot of use!',
		])
	
	#return .getPositiveReaction(_char, _slaveTraits)
