extends AuctionAction

func _init():
	id = "EmphasizeBreasts"

func getActionType():
	return AuctionActionType.Emphasize

func getName() -> String:
	return "Breasts"

func getButtonDesc() -> String:
	return "Really show off the slave's breasts.\n\nDoesn't reveal any preferences, has a negative effects on bidders who don't strongly prefer any of the presented traits."

func onAct(_char:BaseCharacter, _auction, _slaveTraits:Dictionary):
	if(_slaveTraits.has("BreastsSmall") && _slaveTraits["BreastsSmall"] > 0.0):
		if(!_char.hasNonFlatBreasts()):
			saynn("{presenter.You} gently {presenter.youVerb('cup')} slave's pecs, lifting them slightly and drawing attention to the male nips. {presenter.YourHis} hands glide over them with a touch that both reveals and emphasizes their beauty.")
			
			sayPresenter("Neat, aren’t they? For those of you who appreciate raw powerful forms, these are perfect.")
		else:
			saynn("{presenter.You} gently {presenter.youVerb('cup')} slave's {slave.breasts}, lifting them slightly and drawing attention to their delicate size. {presenter.YourHis} hands glide over them with a touch that both reveals and emphasizes their beauty.")
			
			sayPresenter("Petite, aren’t they? For those of you who appreciate a more subtle form, these are perfect.")
	if(_slaveTraits.has("BreastsAverage") && _slaveTraits["BreastsAverage"] > 0.0):
		saynn("{presenter.You} {presenter.youVerb('move')} closer to {slave.name}, cupping {slave.hisHer} {slave.breasts} in {presenter.YourHis} hands, lifting them slightly to give the bidders a clear view. {presenter.YouHe} {presenter.youVerb('run')} your thumbs over {slave.hisHer} nipples, making sure to highlight their firmness.")
	
		sayPresenter("These are some beatiful, firm little babies. Trust me, they are incredibly fun to grope.")
	if(_slaveTraits.has("BreastsHuge") && _slaveTraits["BreastsHuge"] > 0.0):
		saynn("{presenter.You} {presenter.youVerb('approach', 'approaches')} {slave.name} before gripping {slave.hisHer} {slave.breasts} with both hands, lifting and squeezing them gently to emphasize their fullness. {presenter.YouHe} {presenter.youVerb('smile')} at the bidders as you continue to present the heavy curves to them.")
	
		sayPresenter("Look at the size of these! Full, soft, and incredibly fun to squeeze. You won’t find a better pair, trust me.")

func getTraits() -> Dictionary:
	return {
		"BreastsSmall": 2.0,
		"BreastsAverage": 2.0,
		"BreastsHuge": 2.0,
	}

func getPassiveDesireGain() -> float:
	return -1.0

func isEmphasizeAction() -> bool:
	return true

func getPositiveReaction(_char:BaseCharacter, _slaveTraits:Dictionary) -> String:
	if(_slaveTraits.has("BreastsSmall") && _slaveTraits["BreastsSmall"] > 0.0):
		if(!_char.hasNonFlatBreasts()):
			return RNG.pick([
				'Flat and toned, just the way I like it.',
				'A firm, flat chest? Yes please.',
				'So elegant.',
				'So lean.',
				'Exactly what I’m looking for.',
				'Muscular and flat.',
				'That flat chest is ideal for what I need.',
			])
		else:
			return RNG.pick([
				'I prefer small breasts, they are so much more cute.',
				'Perky and petite? I’ll take that over huge tits any day.',
				'Small and perky. Just the way I like them.',
				'Size doesn’t matter when they look this perfect.',
				'Lean and beautiful.',
				'Those small, tight breasts? Perfect.',
			])
	if(_slaveTraits.has("BreastsAverage") && _slaveTraits["BreastsAverage"] > 0.0):
		return RNG.pick([
			'Now that’s what I like to see.',
			'Perfect!',
			'These are ideal.',
			'Huh. Yeah. They’re just right, not too much, not too little.',
			'Perfect breasts.',
			'Those are some good-looking tits.',
			'Yes!',
		])
	if(_slaveTraits.has("BreastsHuge") && _slaveTraits["BreastsHuge"] > 0.0):
		return RNG.pick([
			'Give me, give me!',
			'Oh, that\'s my weakness.',
			'Perfect for my tastes. I love a lot to handle!',
			'Those massive beauties? Yes!',
			'Finally, something with size.',
			'The bigger, the better.',
		])
	
	return .getPositiveReaction(_char, _slaveTraits)
