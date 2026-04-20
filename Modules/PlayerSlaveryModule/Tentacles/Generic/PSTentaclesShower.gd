extends SceneBase

func _init():
	sceneID = "PSTentaclesShower"

func _reactInit():
	#addCharacter(GM.main.PS.getTentaclesCharID())
	GM.pc.afterTakingAShower()
	processTime(60*10)
	pass

func resolveCustomCharacterName(_charID):
	if(_charID == "ten"):
		return GM.main.PS.getTentaclesCharID()
	if(_charID == "sci1"):
		return GM.main.PS.getScientist1CharID()
	if(_charID == "sci2"):
		return GM.main.PS.getScientist2CharID()

func _run():
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(state == ""):
		playAnimation(StageScene.Showering, "body", {pc="pc", bodyState={naked=true}})
		saynn("You approach the shower and turn it on. The water seems nice and warm.")

		saynn("No one is watching.. well.. except for the security camera on the opposite wall of the cell. Your best hope is the camera having too low of a resolution to see.. everything.")

		if (_tentacles.isNormal() || _tentacles.isTiny() || _tentacles.isSmalll()):
			saynn("Oh yeah, there are obviously the tentacles too in the room with you. They don't really have any eyes.. but they can probably somehow sense you showering anyway. Maybe you can even offer them a good view..")

			_tentacles.talk("We are not looking, feel safe.")
		saynn("You take off your leotard and step under the thin stream, letting it run over your shoulders and down your back.")

		saynn("There is liquid soap here too. You put some on your hands and start working it into your hair and body.")

		if (GM.pc.isEggStuffed()):
			saynn("You obviously notice how big your belly is.. from all the eggs that are inside you. Your hands carefully rub all across it.")

			if (_tentacles.isNormal() || _tentacles.isTiny() || _tentacles.isSmalll()):
				saynn("The tentacles watch you wash your bumpy belly with extra interest. One of them suddenly reaches out to gently rub your belly as well.")

				_tentacles.talk("Sorry, the temptation was too strong for us.")
		saynn("Steam rises, fogging the windows around you a bit.")

		saynn("Eventually, you wash yourself clean. You grab a blanket and rub yourself dry.")

		addButton("Continue", "See what happens next", "endthescene")
		if (_tentacles.isNormal() || _tentacles.isSmalll()):
			if (_tentacles.getPrefer() != _tentacles.EVENT_LEWD):
				addButton("Masturbate", "Touch yourself while the tentacles are watching..", "do_touch_self")
			else:
				addDisabledButton("Masturbate", "The tentacles already prefer to be lusty..")
	if(state == "do_touch_self"):
		addCharacter(GM.main.PS.getTentaclesCharID())
		if (GM.pc.hasReachablePenis()):
			playAnimation(StageScene.Showering, "stroke", {pc="pc", bodyState={naked=true, hard=true}, cum=true,pcCum=true})
			saynn("You decide to give the tentacles a small show and start stroking your {pc.penis} while they are watching!")

			saynn("Quiet moans escape your lips as your hand slides back and forth across your hard shaft, your other hand holding onto the wall.")

			saynn("You give the tentacles a quick glimpse.. and see that their tips are becoming slick.. drippy even. The scent of that nectar reaches your senses, making you more eager.")

			saynn("Soon, you push yourself over the edge and grunt as your balls start to pulse, your cock shooting strings of juicy {pc.cum}, painting the wall.")

			saynn("That felt good.")

		elif (GM.pc.hasReachableVagina()):
			playAnimation(StageScene.Showering, "rub", {pc="pc", bodyState={naked=true, hard=true}})
			saynn("You decide to give the tentacles a small show and start rubbing your {pc.pussyStretch} pussy while they are watching!")

			saynn("Quiet moans escape your lips as you switch between flicking your clit and fingering your pussy hole, your other hand holding onto the wall.")

			saynn("You give the tentacles a quick glimpse.. and see that their tips are becoming slick.. drippy even. The scent of that nectar reaches your senses, making you more eager.")

			saynn("Soon, you push yourself over the edge and let out a raw noise of pleasure as the orgasm comes crashing down, making your legs shake. Your pussy clenches around your digits in erratic ways until the very last wave of ecstasy..")

			saynn("That felt good.")

		elif (GM.pc.isWearingChastityCage()):
			playAnimation(StageScene.Showering, "rub", {pc="pc", bodyState={naked=true, hard=true}})
			saynn("You decide to give the tentacles a small show and reach down to your chastity cage. You play and tug on it while they are watching! You can't really reach your locked dick to stimulate it directly.. but it still feels nice.")

			saynn("Quiet moans escape your lips as your hand desperately tugs on your cage and plays with your balls, your other hand holding onto the wall.")

			saynn("You give the tentacles a quick glimpse.. and see that their tips are becoming slick.. drippy even. The scent of that nectar reaches your senses, making you more eager.")

			saynn("As much as you try.. you can't really make yourself cum.. aw. Still.. It felt good.")

		else:
			playAnimation(StageScene.Showering, "rub", {pc="pc", bodyState={naked=true, hard=true}})
			saynn("You decide to give the tentacles a small show and reach your hand between your legs to play with your {pc.analStretch} tailhole while they are watching!")

			saynn("Quiet moans escape your lips as you switch between rubbing the ring and fingering it, your other hand holding onto the wall.")

			saynn("You give the tentacles a quick glimpse.. and see that their tips are becoming slick.. drippy even. The scent of that nectar reaches your senses, making you more eager.")

			saynn("Soon, you push yourself over the edge and let out a raw noise of pleasure as the orgasm comes crashing down, making your legs shake. Your tailhole clenches around your digits in erratic ways until the very last wave of ecstasy..")

			saynn("That felt good.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_touch_self"):
		_tentacles.setPrefer(_tentacles.EVENT_LEWD)
		if(!GM.pc.isWearingChastityCage()):
			GM.pc.orgasmFrom("pc")

	setState(_action)
