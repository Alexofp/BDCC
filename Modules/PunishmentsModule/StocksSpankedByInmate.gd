extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "StocksSpankedByInmate"

func _reactInit():
	GM.pc.addLust(20)
	addMessage("+20 lust")
	
	if(RNG.chance(50)):
		var zone = BodyWritingsZone.getRandomZone()
		GM.pc.addBodywriting(zone, BodyWritings.getRandomWritingIDForZone(zone))
		addMessage("Someone also left a memento on your "+BodyWritingsZone.getZoneVisibleName(zone)+"..")
		

func _run():
	if(state == ""):
		# (if can see)
		if(!GM.pc.isBlindfolded()):
			saynn("You can feel someone walking towards you from behind. You try to look back but can only catch glimpses of an inmate uniform.")

		# (if blind)
		else:
			saynn("You can feel someone walking towards you. You can’t even tell who with that blindfold, you only hear footsteps.")

		saynn("Suddenly you feel a hand slapping your {pc.thick} butt! Ow. You try to cover yourself but no, you are completely helpless.")

		# (one of these)
		if(RNG.chance(20)):
			saynn("You can hear a male humming.")

		# (another)
		elif(RNG.chance(20)):
			saynn("You can hear a male chuckle.")

		# (another)
		else:
			saynn("[sayMale]"+RNG.pick([
				"Want another one?",
				"Just look at this slut with {pc.his} ass out like that.",
				"Beg and I might just fuck you. Haha.",
				"You deserve it.",
				"So how did you end up there. Wait, I don’t care.",
				"Let me just tender some meat.",
				"Your butt is pretty soft.",
			])+"[/sayMale]")

		saynn("The inmate puts his hands on you and gropes your rear before giving it another firm spank, making your butt jiggle. You let out a muffled noise.")

		# (if has vagina && chance)
		if(GM.pc.hasReachableVagina() && RNG.chance(50)):
			# (if clothed)
			if(!GM.pc.isFullyNaked()):
				saynn("His hand lands on your crotch and rubs it. You can feel his digits digging into the fabric. You try to close your legs but he just spanks you again and forces them open. You moan softly as he teases you..")

			# (if naked)
			else:
				saynn("His hand reaches down to your crotch area, you can feel his digits tracing around your exposed cunt. You try to close your legs but he just spanks you again and forces them open. You moan softly as he teases you..")

		# (if has cock && chance)
		if(GM.pc.hasReachablePenis() && RNG.chance(50)):
			# (if clothed)
			if(!GM.pc.isFullyNaked()):
				saynn("Then his hand slides down to your bulge, digits dig into the cloth and give your ballsack a gentle squeeze. Then he starts stroking you out through the clothing, sliding his hand back and forth. It’s arousing.")

			# (if naked)
			else:
				saynn("Then his hand slides to your {pc.cock}. He gathers your balls into his hand and gives them a gentle squeeze. Then his digits wrap around your shaft and start stroking you, very teasingly. It’s so arousing.")

		saynn("He gives another few spanks, each one harder than the last, until he starts to see red shine. Then he chuckles and leaves you alone. You certainly got turned on more than off.")

		addButton("Continue", "Ow", "endthescene")

func _react(_action: String, _args):

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

