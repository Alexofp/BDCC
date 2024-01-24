extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "PortalPantiesTestsScene"

func _reactInit():
	if(!getFlag("PortalPantiesModule.Panties_FirstTestHappened")):
		setState("FirstPoke")
		setFlag("PortalPantiesModule.Panties_FirstTestHappened", true)
	else:
		var possible = [
			"pencils_poke",
			"drink_poke",
		]
		if(GM.pc.hasPenis() && !GM.pc.hasReachablePenis() && !GM.pc.isWearingChastityCage()):
			possible.append_array([
				"cock_only_poke",
				"cock_tease_poke",
				"cock_milker",
			])
		if(GM.pc.hasVagina()):
			possible.append_array([
				"pussy_tease_poke",
				"pussy_pump",
				
			])
		setState(RNG.pick(possible))
		
	GM.pc.addCredits(1)

func _run():

	if(state == "FirstPoke"):
		playAnimation(StageScene.SexPortalMasturbation, RNG.pick(["inside"]), {onlyLeft=true, npc="pc"})
		
		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("You feel cold air washing over your {pc.pussyStretch} pussy. You grab onto your crotch and realize that your pussy is still somewhere else entirely, such a strange feeling. Then you feel your sex being poked with some tool.. Probably a thermometer. And that’s it. Was that the first test?")

			saynn("You brush a hand over your fancy panties and continue on your way as if nothing happened.")
		# (else)
		else:
			saynn("You feel cold air washing over your {pc.analStretch} tailhole. You grab onto your butt and realize that your anus is still somewhere else entirely, such a strange feeling. Then you feel the area around it being poked with some thermometer, causing you to clench.. And that’s it. Was that the first test?")

			saynn("You brush a hand over your fancy panties and continue on your way as if nothing happened.")
		addButton("Continue", "That wasn't too bad", "endthescene")




	if(state == "pencils_poke"):
		playAnimation(StageScene.SexPortalMasturbation, RNG.pick(["inside"]), {onlyLeft=true, npc="pc"})
		
		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("Suddenly you feel latex brushing against your sex. Someone’s digits are gently spreading open your folds, causing you to bite your lip. You can’t even see whoever does it to you which makes it so much more exciting.")

			# (if has cock)
			if(GM.pc.isWearingChastityCage()):
				saynn("You feel someone’s digits gently stroke your chastity cage, causing your cock to twitch. Can’t they do something more..")
			elif(GM.pc.hasPenis()):
				saynn("You feel yourself getting harder, you would expect your {pc.cock} to start applying pressure onto the panties but no, there is zero bulging. You feel someone’s digits gently stroke you, causing your cock to twitch. Can’t they do something more..")

			saynn("Then you feel some object inserted into your slit.. it feels like a.. pen? And then there is much more stuffing your hole soon after. Are they using you to store their writing utensils? At least you got paid a credit for that still.")

		# (if no pussy)
		else:
			saynn("Suddenly you feel latex brushing against your butt. Someone’s digits are prodding at your tailhole and then gently spreading it open, causing you to bite your lip. You can’t even see whoever does it to you which makes it so much more exciting.")

			# (if has cock)
			if(GM.pc.isWearingChastityCage()):
				saynn("You feel someone’s digits gently stroke your chastity cage, causing your cock to twitch. Can’t they do something more..")
			elif(GM.pc.hasPenis()):
				saynn("You feel yourself getting harder, you would expect your {pc.cock} to start applying pressure onto the panties but no, there is zero bulging. You feel someone’s digits gently stroke you, causing your cock to twitch. Can’t they do something more..")

			saynn("Then you feel some object inserted into your butt.. it feels like a.. pen? And then there is much more stuffing your hole soon after. Are they using you to store their writing utensils? At least you got paid a credit for that still.")

		addButton("Continue", "That wasn't too bad", "endthescene")
		
		

	if(state == "drink_poke"):
		playAnimation(StageScene.SexPortalMasturbation, RNG.pick(["inside"]), {onlyLeft=true, npc="pc"})
		
		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("You eek as suddenly someone inserts a cold speculum into your slit, spreading it wide open. You grab onto your panties but realize that there is nothing that you can do about your pussy while it’s attached to that fleshlight.")

			saynn("Then you feel someone pouring in some kind of drink inside your sex. And.. then adding a straw? Someone is totally using your pussy as their personal mug. You almost don’t mind it though..")

		# (else)
		else:
			saynn("You eek as suddenly someone inserts a cold speculum into your tailhole, spreading it wide open. You grab onto your panties but realize that there is nothing that you can do about your butthole while it’s attached to that fleshlight.")

			saynn("Then you feel someone adding a condom and pouring in some kind of drink inside you. And.. then adding a straw? Someone is totally using your butt as their personal mug. You almost don’t mind it though..")
		
		addButton("Continue", "That wasn't too bad", "endthescene")




	if(state == "cock_only_poke"):
		playAnimation(StageScene.SexPortalMasturbation, RNG.pick(["sex", "fast"]), {onlyLeft=true, npc="pc"})
		
		
		# (needs a cock)

		saynn("You feel digits attaching some kind of electrodes to your {pc.cock}. They start stimulating your shaft by sending a small amount of current through it. Your cock’s muscles react by tensing up, causing you to swiftly get hard.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("Then you let out a gasp as the tip of your cock seems to be brushing.. against your own slit. You shut your legs and look around, hoping that no one sees you and your blushing face. You feel your sensitive folds being spread by your own flesh, you’re almost begging for it to happen but it all just ends with teasing.")

		# (else)
		else:
			saynn("Then you let out a gasp as the tip of your cock seems to be brushing.. against your own butthole. You shut your legs and look around, hoping that no one sees you and your blushing face. You feel your sensitive taihole being prodded by your own flesh, you’re almost begging for it to happen but it all just ends with teasing.")

		saynn("After the electrodes gather enough data, they are disconnected from your cock, letting it rest again.")

		addButton("Continue", "That wasn't too bad", "endthescene")


	if(state == "cock_tease_poke"):
		playAnimation(StageScene.SexPortalMasturbation, RNG.pick(["sex"]), {onlyLeft=true, npc="pc"})
		
		# (needs a cock)

		saynn("Suddenly you feel some kind of vibrating toy tapped directly to the tip of your {pc.cock}. You look down at your portal panties and squirm helplessly after realizing there is nothing you can do. The toy seems to be set to its maximum setting though, your shaft quickly becomes hard and twitchy as you try to keep your mouth shut.")

		addButton("Endure it", "Nothing else you can do", "endure_it")

	if(state == "endure_it"):
		playAnimation(StageScene.SexPortalMasturbation, RNG.pick(["inside", "fast"]), {onlyLeft=true, npc="pc"})
		
		saynn("Muffled noises escape from you as you are pushed towards your orgasm already, you feel your cock shooting out a string of precum as the toy is vibrating against it relentlessly.")

		saynn("But just before you can experience your orgasm, the toy is pulled away, leaving you denied and desperate. You don’t care if anyone’s watching, you can’t stop squirming for another few minutes.")

		addButton("Continue", "That wasn't too bad", "endthescene")



	if(state == "pussy_tease_poke"):
		playAnimation(StageScene.SexPortalMasturbation, RNG.pick(["inside", "sex"]), {onlyLeft=true, npc="pc"})
		
		# (needs pussy)

		saynn("While you are doing something, a sudden vibrator gets pressed against your pussy lips! It feels like you are being teased with a magic wand but you can’t see it, only feel it, your portal panties are keeping your slit on some fleshlight somewhere deep in one of the labs.")

		saynn("You stop whatever you’re doing and shut your legs while helplessly tugging on your panties, little muffled moans escape from you.")

		addButton("Endure it", "Nothing else you can do", "endure_it1")

	if(state == "endure_it1"):
		playAnimation(StageScene.SexPortalMasturbation, RNG.pick(["inside", "fast"]), {onlyLeft=true, npc="pc"})
		
		
		saynn("You’re so wet already and the magic wand seems to be vibrating harder as the time passes. You can’t help but to squirm as your sensitive folds and the clit are all getting teased so much. You’re dripping but luckily no one around can tell that, they can only notice your cheeks blushing red and your jumpiness.")

		saynn("Your breathing is fast, your heart is racing, you feel like you’re gonna cum. Your pussy starts to twitch and pulsate but just before you get that sweet release, the wand gets pulled away, stealing your orgasm!")

		saynn("Desperate moans escape through your lips as you try to rub your crotch to cum but can’t, you’re at full mercy of the person on the other end and they don’t really seem to care about your climax.")

		addButton("Continue", "That wasn't too bad", "endthescene")



	if(state == "pussy_pump"):
		playAnimation(StageScene.SexPortalMasturbation, RNG.pick(["sex"]), {onlyLeft=true, npc="pc"})
		
		
		saynn("You feel something attached to your pussy! You can’t see it obviously but you feel the plastic rim pressed around your whole slit. Then you feel it.. pumping on your sex. Did they attach a pussy pump?")

		saynn("You also notice that one of the security cameras is directly watching you. The pump starts doing its work on your slit, applying pressure and pumping on it, causing your pussy lips to become more buffy. It feels so good that you can’t help but to start moaning.")

		# (if has cock)
		if(GM.pc.hasPenis()):
			saynn("Another pump is then connected to your {pc.cock} and idly sucks on it.")

		addButton("Cum", "It’s gonna make you cum!", "cum")

	if(state == "cum"):
		playAnimation(StageScene.SexPortalMasturbation, RNG.pick(["inside", "fast"]), {onlyLeft=true, npc="pc"})
		
		
		saynn("You close your legs and tilt your head down, trying to look normal to others but it’s really hard to endure this for long. The pump starts going through its cycles faster until you are pushed past the peak. You throw your head back and let out a very muffled but long moan as your slit starts squirting. And the pump takes full advantage of that, it collects all your juices and keeps milking you during the orgasm, causing your sex to squirt again and again.")

		# (if has cock)
		if(GM.pc.hasPenis()):
			saynn("Your {pc.cock} shoots out its load too before it gets collected by the pump. It felt so good to cum.")

		addButton("Continue", "That wasn't too bad", "endthescene")



	if(state == "cock_milker"):
		# (needs cock)
		playAnimation(StageScene.SexPortalMasturbation, RNG.pick(["sex"]), {onlyLeft=true, npc="pc"})
		
		saynn("A cock milker gets attached to your {pc.cock}! You can’t see it, your portal panties aren’t even bulging but the thing already starts stroking you with a steady pace, getting you nice and hard.")

		if(GM.pc.isWearingChastityCage()):
			saynn("It feels so good, the fleshy ribbed texture of the milker vibrates, making you feel like you’re fucking someone and quickly pushing you to your first orgasm.")
		else:
			saynn("It feels so good, the fleshy ribbed texture of the milker makes you feel like you’re fucking someone, quickly pushing you to your first orgasm.")

		addButton("Cum!", "You can’t endure it", "cum!")

	if(state == "cum!"):
		playAnimation(StageScene.SexPortalMasturbation, RNG.pick(["inside", "fast"]), {onlyLeft=true, npc="pc"})
		
		
		saynn("You open your mouth slightly and pant heavily as your cock bursts with waves of sticky {pc.cum}, stuffing the milker full. But the milkers neatly pumps all of it out into a separate container and continues to milk you until your balls are left dry.")

		saynn("You’re squirming a lot and trying to catch your breath, hoping that nobody saw you cumming. Luckily there is zero mess.")

		addButton("Continue", "That wasn't too bad", "endthescene")


func _react(_action: String, _args):
	if(_action in ["cock_only_poke", "endure_it", "endure_it1"]):
		GM.pc.addLust(20)
	
	if(_action in ["cum", "cum!"]):
		GM.pc.orgasmFrom("pc")
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

