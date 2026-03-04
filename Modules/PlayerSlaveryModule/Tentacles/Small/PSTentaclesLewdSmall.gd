extends SceneBase

func _init():
	sceneID = "PSTentaclesLewdSmall"

func _reactInit():
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS
	addCharacter(GM.main.PS.getTentaclesCharID())
	
	var possible:Array = []
	
	#if(possible.empty()):
	#	possible.append("0")
	
	if(possible.size() > 0):
		setState(RNG.pick(possible))
	

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
		_tentacles.doAnimDuo("idle")
		if (_tentacles.lust <= 0):
			saynn("The tentacles approach you.. they seem.. interested in you?")

			saynn("A few of them slowly extend toward you.. stopping a foot or so away. Their tips gently sway in the air.. just observing. They make no move to touch.. they're just observing your presence.")

		elif (_tentacles.lust <= 2):
			saynn("The tentacles approach you.. they seem.. kinda curious.")

			saynn("A few of them drift even closer, almost within brushing distance. Their tips gently sway in the air, observing you and your body. One of the tendrils does a quick light tap on your wrist before quickly retreating.")

		elif (_tentacles.lust <= 5):
			saynn("The tentacles approach you, one of them loosely curls around your wrist already.. like it's holding your hand or something.")

			saynn("The rest are just observing your body, their tips are slick with juices while tracing the outer counters of your hips and thighs.. occasionally brushing against them.")

			saynn("They sure seem a lot more touchy now.")

		elif (_tentacles.lust <= 8):
			saynn("The tentacles approach you and eagerly coil around your chest and hips, embracing you. They wrap around your arms and legs too.. not tightly.. but possessively.")

			saynn("You feel their slow, exploring strokes along your neck, your thighs, your back.. They're clearly hungry for more contact.")

		else:
			saynn("The tentacles surround you in an instant, their tips glide over every part of you with a lusty touch.. curling, caressing, grasping.")

			saynn("They're dripping juices and pulsing with warm, slick tension..")

		if (!_tentacles.didRubLustEvent):
			addButton("Rub", "Gently rub the tentacles", "0")
		else:
			if (_tentacles.lust <= 2):
				addButton("Stroke tentacle", "Pick one of the tentacles and give it a stroke!", "1")
			if (_tentacles.lust <= 2):
				addButton("Kiss tentacle", "Pick one of the tentacles and kiss it!", "2")
			if (_tentacles.lust >= 2 && _tentacles.lust <= 5):
				addButton("Let it explore you", "Let the tentacle monster explore your body!", "3")
			if (_tentacles.lust >= 3):
				addButton("Bondage", "Let the tentacles play with you and tie you up!", "4")
			if (_tentacles.lust >= 4):
				addButton("Light choking", "Let the tentacles choke you a little!", "5")
			if (_tentacles.lust >= 5):
				addButton("Stroke them!", "Stroke the tentacles like a slut and see what happens!", "6")
			if (_tentacles.lust >= 5):
				addButton("Deep kiss", "Kiss one of the tentacles and let it stretch your throat a bit..", "7")
			if (_tentacles.lust >= 5 && _tentacles.isNormal()):
				addButton("Submit", "(Sex) Let the tentacles do whatever they want with you!", "8")
		addButton("Shoo!", "Tell the tentacles to stop", "say_shoo")
		addButton("Run!", "The tentacles seem to be interested in you.. why not use that to make them move around more!", "do_jog")
	if(state == "do_jog"):
		if (_tentacles.agility <= 2):
			saynn("You can sense that they're interested in you.. maybe even lusty for you a bit. But before they can touch you.. you start jogging in place.")

			saynn("[say=pc]Wanna touch me? You will have to catch me first.[/say]")

			saynn("You start a slow jog around the cell. The tentacles pause at first.. clearly confused.. but then attempt to follow.")

			saynn("It's almost sad. They slither forward, their movements uncoordinated and sluggish. One tentacle trips over itself, tangling into a knot. Another drags heavily, barely keeping up. By the time you've made one lap, they've moved maybe a few meters.")

			saynn("[say=pc]..Okay.. Lots of work ahead of us.[/say]")

			saynn("A tentacle finally reaches you, clearly tired. It weakly pats your ankle.. before giving up. Looks like its lust has been replaced by exhaustion.")

		elif (_tentacles.agility <= 4):
			saynn("They clearly wanna touch you.. but you dodge to the side and begin jogging!")

			saynn("[say=pc]I won't let you touch me so easily. Try to keep up with me first.[/say]")

			saynn("They try to chase you.. sort of. Despite them being somewhat strong by now, their movements are still awkward, knocking into the bed and the fridge all the time.. and also into each other too. One overshoots a corner and smacks into the shower. Another tries to cut you off and swipe your leg.. but miscalculates and ends up hitting the floor.")

			saynn("Still, they're trying. They're not even close.. but they're trying.")

			_tentacles.talk("You.. play.. difficult..")
			saynn("[say=pc]Move those tendrils, c'mon.[/say]")

			saynn("After a few laps, you decide to stop it there. The tentacles eventually catch up.. and just rest against your legs. Their lust is replaced with exhaustion.")

		elif (_tentacles.agility <= 6):
			saynn("123")

		elif (_tentacles.agility <= 8):
			saynn("123")

		else:
			saynn("123")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "say_shoo"):
		playAnimation(StageScene.Solo, "stand")
		saynn("You shoo the tentacle away from you.")

		saynn("You're not feeling frisky.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "0"):
		playAnimation(StageScene.TentaclesStroke, "tease", {plant=true})
		saynn("You reach out and catch one of the slender tentacles.. It reflexively pulls back when it feels your hand.. but you calm it down with gentle touches.")

		saynn("[say=pc]Easy now.[/say]")

		saynn("As you slowly run your digits along its length, the tentacle goes very still and obedient. When that happens, you just keep rubbing it gently.. like you're petting it, feeling its strange vine-like texture. A soft, almost shivering ripple travels down its length in response.")

		saynn("You can feel it leaning ever so slightly into the pressure of your hand, a silent request for more.. but you think that it's enough for now.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "1"):
		playAnimation(StageScene.TentaclesStroke, "stroke", {plant=true})
		saynn("You catch one of the tentacles with your hands. It gives a startled little twitch, trying to slip free.")

		saynn("[say=pc]Easy. I'm not gonna hurt you.[/say]")

		saynn("You don't grip it very tightly.. you just let it rest against the palm of your hand while your digits are gently massaging it with slow circles over its smooth surface. You can feel the texture getting a bit slick under your touch.. and the tension melts away.")

		saynn("Feeling a bit more brave, you begin to stroke the tentacle along its length.. which makes the whole monster gently sway in response. Your hand is catching some kind of juice that the tentacle is secreting.. it lowers the friction greatly.")

		saynn("As you stop to ponder about it.. the tip of the tentacle curls back and nudges your hand. It clearly wants more.")

		saynn("And so you deliver, giving the tendril a few more long deliberate strokes, from the base to the tip.")

		saynn("[say=pc]That's enough for now.[/say]")

		saynn("You release it. The tentacle lingers for a moment, hovering near your hand. You gently push it away.. until the monster decides to move on.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "2"):
		playAnimation(StageScene.TentaclesStroke, "fast", {plant=true})
		saynn("Your gaze settles on one of the more curious tentacles, its tip swaying gently near your shoulder.")

		saynn("You feel like you wanna do something with it.. And so you lean in and press your lips to its smooth, cool surface. You smooch it!")

		saynn("The tentacle freezes still, surprised. You hold the kiss for a moment longer.. a quiet, closed-mouth touch of your lips.. before pulling back.")

		saynn("A slow, deep shiver runs through the tendril's entire length, from the tip you just kissed all the way back to its hidden base.")

		saynn("The tentacle doesn't retreat.. instead, it gently pokes your neck, its tip leaving a little wet smooch of its own. It's being flirty, it's kinda cute.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "3"):
		saynn("You're curious what the tentacles will do to you now.. so you present yourself for them.. completely naked. This is certainly unusual.. but you don't feel any fear.")

		saynn("The tentacles just watch you from a far at first.. but eventually one of them reaches out to brush against your side with a light touch. You don't pull away.. allowing it to do so. Soon, another joins in. Together, they begin a slow, curious exploration.")

		saynn("They trace the shape of your {pc.thick} waist, the curve of your {pc.masc} hip, gently mapping you out. One of the tentacles slides higher, brushing the underside of your {pc.breasts}, circling them with a soft, playful caress.")

		saynn("[say=pc]Mmhh..[/say]")

		saynn("The sensations make you moan ever so quietly. The tentacles pulse gently in response, probably feeling encouraged.")

		if (GM.pc.hasReachableVagina()):
			playAnimation(StageScene.TentaclesGrope, "grope", {plant=true, bodyState={naked=true,hard=true}})
			saynn("One slick tendril joins and dips lower, following the line of your stomach. It brushes, like a feather, over your pussy.. a teasing touch that makes your breath hitch. It doesn't press further, just rests there for a second, sending warmth throughout your whole body.")

		elif (GM.pc.hasReachablePenis()):
			playAnimation(StageScene.TentaclesGrope, "stroke", {plant=true, bodyState={naked=true,hard=true}})
			saynn("One slick tendril joins and dips lower, coiling loosely around your thighs before sliding inward. It grazes, ever so softly, against your {pc.penis}.. a slow, casual stroke along your length that sends warmth throughout your whole body.")

		else:
			playAnimation(StageScene.TentaclesGrope, "grope", {plant=true, bodyState={naked=true,hard=true}})
			saynn("One slick tendril joins and dips lower, following the line of your stomach. It brushes, like a feather, over your crotch.. sliding further between your legs until it stumbles upon your {pc.analStretch} tailhole. It doesn't prod it, just leaving a teasing touch that makes your breath hitch.")

		saynn("[say=pc]Ah.. that should be enough for now.[/say]")

		saynn("After that fun little session, you notice that the rest of the tentacles get all slick and drippy..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "4"):
		playAnimation(StageScene.TentaclesBondage, "kneel", {plant=true})
		saynn("You're feeling a bit kinky and the monster can feel it.")

		saynn("A tentacle, one that's thin and more agile than the rest, reaches up beside you and finds your wrists. Before you can answer, it loops itself gently but firmly around one wrist.. and then the other, pulling them together behind your back.")

		saynn("Your chest is now pushed forward because of that.. no way to cover yourself.. The hold is secure.. but not fight enough to hurt. It feels nice.")

		saynn("[say=pc]Have you been practising?[/say]")

		saynn("Another slender tentacle reaches up towards your face and brushes against your cheek. It feels very alien.. but still.. The tentacle has a somewhat pleasant warm texture to it. The tendril pulls further, wrapping around the back of your head.. and then gliding over your eyes, blocking the light!")

		saynn("[say=pc]Ohh.. interesting.[/say]")

		saynn("That's not it. A third tentacle presses lightly against your lips. It doesn't force its way in.. just rests there.. a silent, leafy gag. You can still easily breathe through your nose.")

		saynn("Some more tentacles join and wrap themselves around your thighs, adding the final touch of restraining your legs, rendering you completely helpless in the end.")

		saynn("[say=pc]Mm-m..[/say]")

		saynn("You're just being held there.. immobilized by a tentacle monster, completely at its mercy. And it feels good. They don't pull or strain.. just simply hold, occasionally bringing your limbs together when you try to move them.")

		_tentacles.talk("We enjoyed it as well.")
		saynn("Eventually, they loosen up the grip, allowing you to become free again. You pull the green blindfold and gag off and watch as the monster sways happily.")

		saynn("You give the tentacles some pats.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "5"):
		playAnimation(StageScene.TentaclesChoke, "tease", {plant=true})
		saynn("The tentacles surround you, their movement smooth and deliberate, gliding over your skin, sending little sparks of warmth all throughout you..")

		saynn("[say=pc]Feeling bold? Alright.. let's play.[/say]")

		saynn("You guide one of the tentacles and bring it up to your neck. It needs no further instruction.. carefully curling around, creating a loose but possessive loop.")

		saynn("After that, you just give it full control, raising your chin slightly and pulling your hands away.")

		saynn("Feeling that, the tentacles begin to slightly increase the pressure, now creating a second collar of sorts around your neck. A collar and a leash..")

		saynn("Seeing that you don't show any resistance, the tentacle continues to tighten up, now actually constraining your air intake.")

		saynn("Your breath hitches.. Another tendril supports the back of your head, holding you gently in place.")

		saynn("Your lips are parted as you're chasing the fading bits of air that you can still catch. Your vision starts to sparkle at the edges.. with a subtle wave of deep darkness fading in behind them.")

		saynn("[say=pc]Hh..[/say]")

		saynn("The tentacles feel your complete trust.. and put a little more pressure, closing your throat completely. All you can do is silently gasp for oxygen. The spots begin to dance more fiercely in your eyes, the whole cell starts becoming all rainbow-y.. At the same time, the all-consuming darkness creeps further, narrowing your vision to an extremely small circle.")

		if (GM.pc.hasReachableVagina()):
			saynn("Feels good.. Your pussy slit is wet from the extremely high levels of arousal..")

		elif (GM.pc.hasReachablePenis()):
			saynn("Feels good.. Your cock is throbbing super hard from the extremely high levels of arousal..")

		elif (GM.pc.isWearingChastityCage()):
			saynn("Feels good.. Your locked away cock is throbbing super hard in its cage from the extremely high levels of arousal.")

		saynn("Without even realizing it, you go limp.. completely helpless and airless.. suspended only by the tentacles' grip.")

		saynn("Only then is when the tentacles finally loosen the grip, making you produce a loud, ragged gasp!")

		saynn("[say=pc]Ah-h..[/say]")

		saynn("You start hungrily grabbing the air with your mouth. The vision slowly returns to you, your brain gradually recovering from the oxygen deprivation.")

		saynn("The tentacles gently set you down onto the floor.")

		_tentacles.talk("We hope that you have enjoyed this.")
		saynn("[say=pc]That was great.. hah..[/say]")

		saynn("You rub your neck.. that is now a bit bruised from all the choking. Still, worth it.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "6"):
		playAnimation(StageScene.TentaclesGangbang, "stroke", {plant=true, bodyState={naked=true, hard=true}})
		saynn("The tentacles are swaying around you.. and that makes the air thick with some kind of sweet scent. The tendrils are shiny with a thin, slick sheen.")

		saynn("Watching them.. smelling them.. A reckless, hungry impulse takes you. Without a word, you get down to your knees before them.")

		saynn("You reach out, your hands grabbing two of the nearest tentacles, your digits gripping around their tips while they pulse eagerly in your grasp. You begin to stroke them.. slowly.. following the curvature from their thick bases to their pointy end, your thumbs rubbing circles into their slick skin. A low, shivering shudder runs through the whole mass of them.")

		saynn("[say=pc]C'mon, I can take more..[/say]")

		saynn("One of the thin tentacles presses its dripping tip against the side of your neck, leaving a cool, wet trail as it glides up to your jawline. Another one finds its way between your {pc.breasts}, rubbing softly against them. You gasp, your focus divided between the ones in your hands and the ones beginning to explore.")

		saynn("The thin tentacle becomes very bold and is now brushing against your lips. You don't hesitate and take the slick, pointy tip into your mouth. The taste reminds you of honey a bit. It doesn't thrust, just pulses gently as you start sucking on it, your tongue sliding around it.")

		saynn("[say=pc]Mmh..[/say]")

		if (GM.pc.hasReachableVagina()):
			saynn("Another tentacle finds its way between your thighs, now rubbing against your slick pussy, catching your wetness onto itself and sharing its juices back.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Another tentacle finds its way between your thighs, now rubbing against your dick, catching your pre onto itself and coating your member with its juices instead.")

		elif (GM.pc.isWearingChastityCage()):
			saynn("Another tentacle finds its way between your thighs, now rubbing against your chastity cage, catching the pre that your locked dick is leaking and coating your little cage with its juices instead.")

		else:
			saynn("Another tentacles finds its way between your thighs, now rubbing against your tailhole, coating it with a layer of juices.")

		saynn("Your chest, your crotch, your mouth, your hands.. You're surrounded by tentacles, stroking or being stroked in return. The air fills with soft, wet sounds and your own muffled moans around the green tip in your mouth. Their movements grow more urgent.. their pulsing becoming faster.. all the while you stroke them faster.")

		saynn("It doesn't take long before you feel something building.. some kind of tension in the tentacles. They all begin to throb in unison..")

		addButton("Orgasm", "See what happens next", "6_cum")
	if(state == "6_cum"):
		playAnimation(StageScene.TentaclesGangbang, "inside", {plant=true, bodyState={naked=true, hard=true}})
		saynn("They don't just cum.. They give you a whole shower.")

		saynn("[say=pc]Mmmph..![/say]")

		saynn("With a series of shuddering convulsions, the tentacles that you were stroking jerk in your grasp. The one in your mouth pushes a little deeper as it pulses.. before releasing a flood of warm, sweet nectar onto your tongue and down your throat.")

		saynn("At the same time, the one against your chest arches and spurts, painting your neck, your chin and your {pc.breasts} in streaks of that shiny honey-like cum..")

		saynn("More join, throbbing and releasing, showering your face, your hair, your kneeling body in their sticky, sweet juices.. Your own orgasm overwhelms you, making you squirm and throw your head back, your busy lips producing hot, muffled moans.")

		saynn("[say=pc]Mhh-h~..[/say]")

		saynn("After they're done getting you drenched and trembling.. the tentacles slowly retract, leaving you on your knees, panting, covered in juices. They sway gently above you, their lust satisfied.. for now.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "7"):
		playAnimation(StageScene.TentaclesDeepthroat, "sex", {plant=true, bodyState={naked=true, hard=true}})
		saynn("You look at the thick, shiny tentacle swaying before you.. A little bead of juices gathers at its tip and hangs from it for a bit.. before dripping to the floor. A sudden desire heats you up..")

		saynn("[say=pc]Come here.[/say]")

		saynn("You don't just touch it with your hands.. instead, you reach towards it and press your lips to its slick, warm surface. It tastes faintly of honey nectar.. it makes you wanna continue.")

		saynn("You leave another little kiss and then open your mouth, letting your tongue slide out to lap at the taste.. and to tease the sensitive tip.")

		saynn("Feeling a bit more bold, you catch the tip of your lips and let a small part of it into your mouth, your tongue now licking around it and playing with it.")

		saynn("That deep kiss triggers something..")

		saynn("With a sudden, eager push, the tentacle slides further past your lips and teeth, over your tongue. You gasp.. but you don't pull away, letting it fill your mouth and do what it wants to you..")

		saynn("The tentacle's tip quickly finds the back of your mouth.. and goes even deeper, sliding down your throat, testing how well you can suppress your gag reflex.")

		saynn("Your tight throat walls stretch around the invading girth.. your eyes begin watering on their own.")

		saynn("Occupying your throat was just the start.. the tentacle begins to move. Slow, probing thrusts at first, rubbing against your inner walls. You can feel every pulse of it.")

		saynn("Muffled moans try to escape around it, the sound vibrating along its length.. which only makes it eager. The pace quickens, becoming a steady, relentless deep-throating rhythm.")

		saynn("Your hands come up to grasp near the base of it.. not to push away.. but to guide it, to take it deeper. There is a visible bump appearing on your neck each time the tentacle goes down your throat.")

		saynn("[say=pc]Mmhh.. mmphh.. mhh..[/say]")

		addButton("Climax", "See what happens next", "7_cum")
	if(state == "7_cum"):
		playAnimation(StageScene.TentaclesDeepthroat, "inside", {plant=true, bodyState={naked=true, hard=true}})
		saynn("As your reflex starts making you gag and choke on it, the tension inside the tentacle begins to rise. The movements become more urgent, less controlled. Then, with a powerful, shuddering thrust, it locks itself deep in your throat.. and begins to pulse hard.")

		saynn("Thick, warm, honey-lick fluid gets pumped directly into your stomach. Each throbbing pulse is a flood of sweet juices, filling you with a spreading, heavy warmth. The tentacle continues to twitch and pump, ensuring every last drop is deposited deep inside you.. until your belly feels full.")

		saynn("Finally, spent, it slowly retracts, sliding back out of your throat with a wet pop. As it happens, you instantly start coughing and gasping for air.. the tentacle leaving you panting hard.")

		saynn("The tentacle hovers before your eyes, slick with spit and its own juices, giving a satisfied, lazy tremble.")

		saynn("[say=pc]..wow.. fuck..[/say]")

		saynn("That was something..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "8"):
		_tentacles.doAnimDuo("glare", {npcAction="kneel"})
		saynn("You decide to present yourself to {psTentacles}, submitting to their will completely.")

		saynn("Time to see what they will do to you..")

		addButton("Continue", "See what happens next", "8_startSex")
	if(state == "8_after"):
		saynn("You had fun with the tentacles..")

		saynn("They've certainly only gotten more lusty after this.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "8_afterEgged"):
		playAnimation(StageScene.TFLook, "start")
		saynn("You had fun with the tentacles..")

		saynn("And now, when you look down, you can't help but to notice your belly being quite round.")

		saynn("It looks like you got stuffed with eggs! You can feel them shifting inside you slightly as you move..")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "0"):
		_tentacles.train(_tentacles.STAT_LUST)
		_tentacles.didRubLustEvent = true

	if(_action == "1"):
		_tentacles.train(_tentacles.STAT_LUST)

	if(_action == "2"):
		_tentacles.train(_tentacles.STAT_LUST)

	if(_action == "3"):
		_tentacles.train(_tentacles.STAT_LUST)

	if(_action == "4"):
		_tentacles.train(_tentacles.STAT_LUST)

	if(_action == "5"):
		_tentacles.train(_tentacles.STAT_LUST)

	if(_action == "6"):
		_tentacles.train(_tentacles.STAT_LUST)

	if(_action == "7"):
		_tentacles.train(_tentacles.STAT_LUST)

	if(_action == "say_shoo"):
		_tentacles.trainNothing()

	if(_action == "do_jog"):
		_tentacles.train(_tentacles.STAT_AGILITY)
		_tentacles.doJog()

	if(_action == "6_cum"):
		GM.pc.orgasmFrom("pc")
		var tentID:String = _tentacles.getTentaclesCharID()
		getCharacter(tentID).fillBalls(RNG.randf_range(0.2, 0.5))
		GM.pc.cummedOnBy(tentID, FluidSource.Penis)
		getCharacter(tentID).fillBalls(RNG.randf_range(0.2, 0.5))
		GM.pc.cummedInMouthBy(tentID, FluidSource.Penis)

	if(_action == "7_cum"):
		var tentID:String = _tentacles.getTentaclesCharID()
		getCharacter(tentID).fillBalls(RNG.randf_range(0.2, 0.5))
		GM.pc.cummedInMouthBy(tentID, FluidSource.Penis)

	if(_action == "8_startSex"):
		_tentacles.prepareForSex()
		runScene("GenericSexScene", [_tentacles.getTentaclesCharID(), "pc", SexType.TentaclesSex, {}], "tentaclesSex")
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "tentaclesSex"):
		var _tentacles:PlayerSlaveryTentacles = GM.main.PS
		_tentacles.train(_tentacles.STAT_LUST)
		if(!_tentacles.noticedEgged && GM.pc.isEggStuffedBy(_tentacles.getTentaclesCharID())):
			setState("8_afterEgged")
			_tentacles.noticedEgged = true
		else:
			setState("8_after")
