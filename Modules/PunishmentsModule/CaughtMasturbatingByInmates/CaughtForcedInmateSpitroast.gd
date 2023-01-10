extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "CaughtForcedInmateSpitroast"

func _run():
	if(state == ""):
		addCharacter("inmateCrowd")
		playAnimation(StageScene.Solo, "stand")

	if(state == ""):
		saynn("Two reds boldly approach you, one of them catches your arm while another already puts his paws all over your {pc.thick} butt and groping it.")

		saynn("[say=pc]Hey![/say]")

		saynn("Your first instinct is to break free and punch one of them but the guys basically sandwich you, giving very little leeway, rendering your strength useless. Instead you shove one away and then are met with a smack on your ass. Ow.")

		# (if red)
		if(GM.pc.getInmateType() == InmateType.HighSec):
			saynn("[say=inmateMale]Being a red doesn’t mean you’re untouchable, slut.[/say]")

		# (if general)
		if(GM.pc.getInmateType() == InmateType.General):
			saynn("[say=inmateMale]Wearing orange doesn’t protect you against public use, slut.[/say]")

		# (if lilac)
		if(GM.pc.getInmateType() == InmateType.SexDeviant):
			saynn("[say=inmateMale]Shut up and do what you’re good at, being used in public, lilac slut.[/say]")

		saynn("They keep groping your {pc.masc} ass and {pc.breasts} but surely they won’t stop there.")

		addButton("Submit", "Let them grope you..", "submit")
		addButtonWithChecks("Resist", "Try to resist the best you can. This will be humiliating", "resist", [], [ButtonChecks.HasStamina])
		addButtonWithChecks("Kick balls", "Use your agility to escape the situation", "kick_balls", [], [[ButtonChecks.StatCheck, Stat.Agility, 5], ButtonChecks.HasStamina])

	if(state == "kick_balls"):
		# (needs agility > 5 and stamina)

		saynn("Since your fists are useless, you quickly come up with a different solution. You shove the inmate in front away before delivering a powerful kick into his crotch area. You concentrate all of your hate into that blow and it shows, the guy cries out from pain and drops onto his knees instantly while grabbing onto his poor bulge.")

		saynn("[say=inmateMale]Ugh..[/say]")

		saynn("Before the second guy can realize what happened, you slip from under his grasp and turn around before kicking his scrotum too. A very low blow but it proves to be very effective, the second guy clenches his legs and drops onto the floor.")

		saynn("[say=inmateMale2]Fuck![/say]")

		saynn("It was you or them, all things considered it was pretty merciful from your side. You quickly escape, leaving the inmates to roll around and try to ease the pain.")

		saynn("[say=inmateMale]Crazy fucking bitch.[/say]")

		# (scene ends)
		addButton("Continue", "See what happens next", "endthescene")

	if(state == "resist"):
		# (uses stamina)

		saynn("You shove the guys away again and again but they keep caressing your {pc.masc} curves. They then expose their dicks, canine one with a knot and feline one with barbs. The barbed one gets shoved between your {pc.thick} legs and slides back and forth, using your thighs for pleasure while the knotted one just rubs against your hips.")

		saynn("[say=pc]Quit it already, it’s not funny.[/say]")

		saynn("You free an arm and send one of them a slap on the face. In return you got a few smacks on your ass, giving it a nice red color.")

		saynn("[say=inmateMale]Fine, have it your way.[/say]")

		saynn("The cat behind you prods the inner sides of your knees. That was enough to make you lose balance and hit the floor. Now, after forcing you to kneel, the guys get a good grasp on your hair while shoving their cocks into your face. You clench your fists and tap at their legs while the two cocks are rubbing against your cheeks, lips and leaking precum all over your hair. They use you like some kind of toy, so humiliating.")

		saynn("[say=pc]I won’t suck you off, get lost![/say]")

		saynn("[say=inmateMale]Don’t worry, slut, I ain’t getting my cock anywhere close to your teeth.[/say]")

		saynn("That calms you down a bit, at least they won’t face fuck you. But, you soon realize what their plans are, both inmates start stroking their dicks in your clear view! Struggling seems useless now, each time you try to get up they both force you back onto your knees.")

		saynn("Little transparent strings of precum hang from the tips of their cocks before landing on your hair, marking you with their scents. Catching the eyes of other inmates as they pass by makes you feel even more embarrassed, you place your palms on the guy’s knees to try and keep them somewhat away. But they keep jerking themselves off and panting while watching you blush.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("You can’t deny that the view makes you somewhat horny, your slit is getting wet and needy from watching all these cocks..")

		saynn("[say=inmateMale]Hope you’re ready~. Here comes a big one.[/say]")

		addButton("Get cummed on", "Bukkake time! Fun time!", "get_cummed_on")

	if(state == "get_cummed_on"):
		saynn("Suddenly a thick line of cum shoots over your head. Then another but from a different side. The first waves go the farthest and make a mess on your {pc.masc} back and {pc.thick} butt. You close your eyes and mouth as the next ones land on your face. Then their cocks cum all over your shoulder and {pc.breasts}. So much mess.")

		saynn("[say=inmateMale]Welcome to the prison, cum slut.[/say]")

		saynn("After spending their loads all over you, the two inmates put their cocks and leave you with a huge mess. That could have gone worse. You’re left on your knees, waiting for the cum to slide down enough so you can open your eyes.")

		# (scene ends)
		addButton("Continue", "See what happens next", "endthescene")

	if(state == "submit"):
		# (if not naked)
		if(!GM.pc.isFullyNaked()):
			saynn("Can’t escape their grasp, might as well try to enjoy it, you hold onto the inmate in front and pant slightly while they explore your body, shoving their paws under your clothes and rubbing your privates.")

		# (if naked)
		else:
			saynn("Can’t escape their grasp, might as well try to enjoy it, you hold onto the inmate in front and pant slightly while they explore your body, sliding their paws over your curves and rubbing your privates.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("The inmates notice your lack of resistance and only get more eager, one paw reaches down to your slit and starts playing with the clit, making you moan slightly.")

		# (if no pussy)
		else:
			saynn("The inmates notice your lack of resistance and only get more eager, one paw reaches down to your tailhole and starts playing with it, prodding and rubbing, making you moan slightly.")

		saynn("You begin to enjoy it even though they are still acting rough with you, both inmates expose their cocks, a knotted canine one is rubbing between your legs while a barbed feline one leaks precum onto your hips.")

		# (if has cock)
		if(GM.pc.isWearingChastityCage()):
			saynn("Your own {pc.cock} is becoming quite hard too in its little cage, begging for some attention that it obviously won’t receive.")
		elif(GM.pc.hasPenis()):
			saynn("Your own {pc.cock} is becoming quite hard too, begging for some attention that it probably won’t receive.")

		saynn("[say=pc]H-hey..[/say]")

		saynn("[say=inmateMale]Shut up and bend over, whore.[/say]")

		saynn("A guy pushes on your back, inviting you to submit further.")

		addButton("Bend forward", "Let them spitroast you", "bend_forward")

	if(state == "bend_forward"):
		saynn("You obey the rough touch and lean forward just to have the second guy catch you and move his barbed cock near your face, letting you see it from a very close distance.")

		# (if has clothes and pussy)
		if(!GM.pc.isFullyNaked() && GM.pc.hasVagina()):
			saynn("All the while the guy tugs on your clothes and removes enough to expose your wet pussy! He gives your ass a smack and watches you squirm before him.")

		# (if no clothes and pussy)
		elif(GM.pc.isFullyNaked() && GM.pc.hasVagina()):
			saynn("All the while the guy forces you to spread your legs more, exposing your wet pussy! He gives your ass a smack and watches you squirm before him.")

		# (if has clothes and no pussy)
		elif(!GM.pc.isFullyNaked() && !GM.pc.hasVagina()):
			saynn("All the while the guy tugs on your clothes and removes enough to expose your {pc.analStretch} tailhole! He lubes it up with his spit and gives your ass a smack before watching you squirm.")

		# (if no clothes and no pussy)
		elif(GM.pc.isFullyNaked() && !GM.pc.hasVagina()):
			saynn("All the while the guy forces you to spread your legs more, exposing your {pc.analStretch} tailhole! He lubes it up with his spit and gives your ass a smack before watching you squirm.")

		saynn("Fuck, you’re feeling kinda excited, you stick your tongue out and give the barbed member a little lick, tasting his pre. All the while the guy behind slides his cock between your {pc.thick} buns, teasing. You wish they would start fucking you already, your legs are spread and mouth is slightly opened while you are bend forward with cocks on both sides.")

		# (if has pussy)
		if(GM.pc.hasVagina()):
			saynn("They seem to be in sync between each other, it's hard to notice but they both seem to nod before suddenly thrusting inside you, barbed cock parts your lips and slides down your throat while the knotted cock gets shoved from the other end, stretching your pussy enough to enter inside the fuckhole and coat your wet inner walls with pre.")

			saynn("You’d happily let out a pleasure noise but your mouth is busy while the both guys ares fucking your holes. The feline cock testing your gag reflex and scratching at the throat walls with its soft barbs while the knotted one gets rammed deeper down your sex with each thrust, causing you to bounce between the two dicks.")

			saynn("You hold onto the cat before and eagerly treat his cock with your tongue and lips, your ass gets smacked again but you don’t even care, that only adds to the sensations. You blush seeing others watch you being spitroasted.")

			# (if has cock)
			if(GM.pc.hasPenis()):
				saynn("Your pleasure point being rubbed makes you leak pre almost constantly, your cock is throbbing each time you’re being pounded.")

		# (if has no pussy)
		else:
			saynn("They seem to be in sync between each other, it's hard to notice but they both seem to nod before suddenly thrusting inside you, barbed cock parts your lips and slides down your throat while the knotted cock gets shoved from the other end, stretching your fuckhole enough to enter and coat your wet inner walls with pre.")

			saynn("You’d happily let out a pleasure noise but your mouth is busy while the both guys ares fucking your holes. The feline cock testing your gag reflex and scratching at the throat walls with its soft barbs while the knotted one gets rammed deeper down your ass with each thrust, causing you to bounce between the two dicks.")

			saynn("You hold onto the cat before and eagerly treat his cock with your tongue and lips, your ass gets smacked again but you don’t even care, that only adds to the sensations. You blush seeing others watch you being spitroasted.")

			# (if has cock)
			if(GM.pc.hasPenis()):
				saynn("Your pleasure point being rubbed makes you leak pre almost constantly, your cock is throbbing each time you’re being pounded.")

		addButton("Creampies", "With extra cream please", "creampies")

	if(state == "creampies"):
		# (if pussy)
		if(GM.pc.hasVagina()):
			saynn("You are stuck between the two inmates, being spitroasted hard. You feel the guy’s knot inflate as it slaps against your pussy folds, struggling to fit. The other guy’s barbs are getting harder too, causing them to rake at your throat walls more.")

			saynn("[say=inmateMale]Fuck, hope you like pups.[/say]")

			saynn("Huh? Before you can realize it, the guy knots you, shoving his meaty orb down your slit and stretching it wide before the whole cock gets concealed inside you. He breaks into your womb and starts filling it full of sticky virile seed! All the while the cat meets you by shoving his barbed cock as deep as your throat allows before cumming too, stuffing your belly. So much sudden stimulation sends you over the edge, causing your body to squirm, both your pussy and throat clench around the shafts, milking them for all their cum.")

			# (if has cock)
			if(GM.pc.hasPenis()):
				saynn("Your {pc.cock} wastes its load and leaves a mess on the floor. At least it felt amazing.")

			saynn("[say=inmateMale]So-o good, this slut is a natural.[/say]")

			saynn("Your legs give up slightly but the inmates support you with their hands and their cocks, pretty much keeping you hovering while you are being their cock warmer. It's very hard to breathe so your eyes slowly roll up as your tongue works on cleaning the cock inside your mouth.")

			saynn("When they’re done stuffing your belly and womb, both inmates pull out, leaving you on the floor in all the mess with your holes leaking cum before just walking away, satisfied.")

			saynn("[say=pc]H-hey..[/say]")

			saynn("They just chuckle.")

			# (scene ends)

		# (if no pussy)
		if(!GM.pc.hasVagina()):
			saynn("You are stuck between the two inmates, being spitroasted hard. You feel the guy’s knot inflate as it slaps against your {pc.analStretch} anus, struggling to fit. The other guy’s barbs are getting harder too, causing them to rake at your throat walls more.")

			saynn("[say=inmateMale]Fuck, gonna..[/say]")

			saynn("Huh? Before you can realize it, the guy knots you, shoving his meaty orb down your tailhole and stretching it wide before the whole cock gets concealed inside you. He knots your fuckhole and starts filling it full of sticky warm seed! All the while the cat meets you by shoving his barbed cock as deep as your throat allows before cumming too, stuffing your belly. So much sudden stimulation sends you over the edge, causing your body to squirm, both your ass and throat clench around the shafts, milking them for all their cum.")

			# (if has cock)
			if(GM.pc.hasPenis()):
				saynn("Your {pc.cock} wastes its load and leaves a mess on the floor. At least it felt amazing.")

			saynn("[say=inmateMale]So-o good, this slut is a natural.[/say]")

			saynn("Your legs give up slightly but the inmates support you with their hands and their cocks, pretty much keeping you hovering while you are being their cock warmer. It's very hard to breathe so your eyes slowly roll up as your tongue works on cleaning the cock inside your mouth.")

			saynn("When they’re done stuffing your belly and ass, both inmates pull out, leaving you on the floor in all the mess with your holes leaking cum before just walking away, satisfied.")

			saynn("[say=pc]H-hey..[/say]")

			saynn("They just chuckle.")

		# (scene ends)
		addButton("Continue", "See what happens next", "endthescene")


func _react(_action: String, _args):

	if(_action == "kick_balls"):
		GM.pc.addStamina(-20)

	if(_action == "resist"):
		GM.pc.addStamina(-20)

	if(_action == "get_cummed_on"):
		processTime(60*6)
		GM.pc.cummedOnBy("inmateMale")
		GM.pc.cummedOnBy("inmateMale2")
		
		if(RNG.chance(50)):
			var zone = BodyWritingsZone.getRandomZone()
			GM.pc.addBodywriting(zone, BodyWritings.getRandomWritingIDForZone(zone))
			addMessage("They also left a memento on your "+BodyWritingsZone.getZoneVisibleName(zone)+"..")

	if(_action == "creampies"):
		processTime(60*6)
		if(GM.pc.hasVagina()):
			GM.pc.gotVaginaFuckedBy("inmateMale")
			GM.pc.cummedInVaginaBy("inmateMale")
			GM.pc.addTallymarkCrotch()
		else:
			GM.pc.gotAnusFuckedBy("inmateMale")
			GM.pc.cummedInAnusBy("inmateMale")
			GM.pc.addTallymarkButt()
		GM.pc.cummedOnBy("inmateMale")
		GM.pc.gotThroatFuckedBy("inmateMale2")
		GM.pc.cummedInMouthBy("inmateMale2")
		GM.pc.addTallymarkFace()
		GM.pc.cummedOnBy("inmateMale2")
		GM.pc.addSkillExperience(Skill.SexSlave, 10, "caught_inmate_spitroast")
		
		addMessage("They drew some tallymarks on you")
		
		if(RNG.chance(50)):
			var zone = BodyWritingsZone.getRandomZone()
			GM.pc.addBodywriting(zone, BodyWritings.getRandomWritingIDForZone(zone))
			addMessage("They also left a memento on your "+BodyWritingsZone.getZoneVisibleName(zone)+"..")

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

