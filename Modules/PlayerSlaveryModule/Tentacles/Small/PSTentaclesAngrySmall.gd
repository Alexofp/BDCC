extends SceneBase

func _init():
	sceneID = "PSTentaclesAngrySmall"

func _reactInit():
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS
	addCharacter(GM.main.PS.getTentaclesCharID())
	
	var possible:Array = []
	
	if(_tentacles.anger <= 4):
		possible.append("0") #bonk
		possible.append("1")
		possible.append("2")
		possible.append("3")
	elif(_tentacles.anger <= 7):
		possible.append("4")
		possible.append("5")
		possible.append("6")
		possible.append("7")
	_tentacles.train(_tentacles.STAT_ANGER)
	
	if(possible.empty()):
		possible.append("0")
	
	if(possible.size() > 0):
		setState(RNG.pick(possible))
	
	if(state == "0"):
		GM.pc.addPain(10)

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
		saynn("You shouldn't see this.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "0"):
		_tentacles.doAnimDuo("whip")
		saynn("You were minding your own business.. when you suddenly feel one of the tentacles bonking you! Ow.")

		saynn("You turn around and look at it.")

		saynn("It seems to be angry because you "+str(_tentacles.getAngryReason())+".. but it quickly calms down after seeing your glare.")

		_tentacles.talk("We're sorry that we did that.")
		addButton("Continue", "See what happens next", "endthescene")
	if(state == "1"):
		_tentacles.doAnimDuo("glare")
		saynn("Your path gets blocked by the tentacles! They don't really have any eyes.. but you can still feel their angry glare. The air itself feels heavy..")

		saynn("They are probably upset because you "+str(_tentacles.getAngryReason())+".")

		saynn("The monster doesn't touch you or anything.. It simply watches you and silently judges your actions.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "2"):
		_tentacles.doAnimDuo("whip2")
		saynn("The tentacles approach you, twitching slightly as their tips watch you intently.")

		saynn("[say=pc]What now?[/say]")

		saynn("Suddenly, one of the slender tendrils sneakily reaches out behind you and then smacks your {pc.thick} butt! It doesn't hit too hard.. but it still stings.")

		saynn("[say=pc]Hey![/say]")

		saynn("You spin around, more surprised than hurt.. but the tendril has already vanished back into the forest of them. The monster doesn't move.. but you can almost sense a feeling of smug satisfaction passing through its swaying tentacles.")

		saynn("It looks like they did it because you "+str(_tentacles.getAngryReason())+".")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "3"):
		_tentacles.doAnimDuo("poke")
		saynn("You almost trip as a tentacle loops itself securely around your ankle, anchoring you to the spot.")

		saynn("You look down.. and see more of them approaching and sliding up along your legs and curling around your wrists, binding them. They then tighten their grip.. not enough to hurt, but enough to make their point. They're probably upset because you "+str(_tentacles.getAngryReason())+".")

		saynn("[say=pc]Really?[/say]")

		_tentacles.talk("We could do something worse.. but we won't.. for now..")
		saynn("For a long moment, you're just held there. The tentacles don't squeeze or pull.. they just hold you restrained. Then, as smoothly as they tightened, they loosen and slip away, leaving you alone.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "4"):
		_tentacles.doAnimDuo("whip", {npcAction="hurt"})
		saynn("Your path gets blocked by the tentacles! They seem upset because you "+str(_tentacles.getAngryReason())+".")

		saynn("[say=pc]So? What are you gonna do?[/say]")

		saynn("The many tendrils vibrate like cobra tails. Then, a single one of them flicks forward, faster than a whipcrack. There is a sharp, sudden pinch at your side.")

		saynn("[say=pc]Ow.[/say]")

		saynn("You jump back and grab onto the spot. Luckily, the tentacle didn't even break the skin. You're not even sure how it did that, the tentacle has no teeth.. but it managed to leave a small mark.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "5"):
		playAnimation(StageScene.TentaclesBondage, "bondage", {plant=true})
		saynn("You hear a quiet hiss behind you. As you look behind, you see that it's the slick tentacles sliding across the floor.")

		saynn("Before you can react, a thick, ropy tendril coils around your waist and arms, giving you a sudden tight embrace.")

		saynn("[say=pc]Wha-![/say]")

		saynn("Your protest is cut short as a thinner tentacle presses firmly over your mouth, its tip pushing against your lips. At the same time, another tendril unfurls from above, covering your eyes, plunging you into complete darkness!")

		saynn("All of this is probably happening because you "+str(_tentacles.getAngryReason())+".")

		saynn("You can't see.. You can barely make a sound beyond a muffled grunt without letting the tentacle into your mouth.. Other tendrils slide over your {pc.masc} body.. not just binding.. but also exploring. Some tie around your thighs, some painfully-squeeze your {pc.breasts}.. and some give your ass a few humiliating spanks.")

		saynn("After that.. invasive.. hug.. the tentacles finally back away, letting you see and speak again.")

		saynn("[say=pc]Ow.. fuck..[/say]")

		saynn("Your whole body feels sore now.")

		saynn("It will probably get even worse if you don't treat them right.. The tentacles are getting really mean.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "6"):
		playAnimation(StageScene.TentaclesChoke, "tease", {plant=true})
		saynn("The tentacle monster approaches you.. Before you can react, one of the tendrils darts towards your neck and coils around it!")

		saynn("[say=pc]Hey![/say]")

		saynn("You feel an immediate pressure around your throat. It's not a crushing grip.. but a tight squeeze instead that makes your next breath almost impossible. Your hands fly up to your neck on instinct, trying to pull the angry snake off.. but it just curls around your neck another time to increase its grab.")

		saynn("Dark spots begin to appear at the edge of your vision, little gasps escape your lips. But just when the lightheadedness begins to set in, the tentacle relaxes. Cool air rushes back into your lungs as you start coughing, your hands holding onto your bruised neck.")

		saynn("[say=pc]..Fuck.. that was tight.[/say]")

		saynn("You're not sure if it's even able to snap your neck.. but you don't wanna find that out either. All of this is probably happening because you "+str(_tentacles.getAngryReason())+".")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "7"):
		playAnimation(StageScene.TentaclesSex, "tease", {plant=true})
		saynn("You feel something touching your ankles.. and also your wrists. You look down and see tentacles curling around your limbs!")

		saynn("[say=pc]Hey, wait![/say]")

		saynn("In one smooth, effortless motion, they lift you clear off the floor and suspend you in the air. You'd try to get free.. but more and more tentacles wrap around your body, arms and legs, keeping you completely helpless.")

		saynn("A thinner, more agile tendril shows up, stopping just inches from your face. It hovers there, vibrating with clear intent. It gradually drifts lower, tracing a slow, threatening line down your chest and stomach while the rest of the tentacles wrench your limbs, sending plenty waves of pain through you!")

		saynn("You growl, your whole body tensing up as your muscles get strained hard. It feels like this will never end.. but eventually it does. Slowly and gradually, the tentacles set you back down to your feet. The tentacles unwind and retreat, leaving you shaky and intimidated.")

		saynn("They could have done way more than they did.. but it looks like they're not mean enough for that yet.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
