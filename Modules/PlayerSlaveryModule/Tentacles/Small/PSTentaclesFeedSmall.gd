extends SceneBase

func _init():
	sceneID = "PSTentaclesFeedSmall"

func _reactInit():
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS
	addCharacter(GM.main.PS.getTentaclesCharID())
	
	var possible:Array = []
	
	if(_tentacles.mind <= 2 && _tentacles.agility <= 2):
		possible.append("0")
	else:
		possible.append("1") # snack
		possible.append("2") # chicken
		possible.append("3") # raw meat
		possible.append("4") # 'milk'
	
	if(possible.empty()):
		possible.append("0")
	
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
		saynn("You shouldn't see this")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "0"):
		_tentacles.doAnimDuo("idle")
		saynn("You approach the tentacles and see them trying to open the fridge.")

		saynn("Hard to see it behind the.. forest of tendrils. Either they can't find the handle or they're not strong enough to open the door.")

		saynn("Either way, it looks like they're hungry!")

		addButton("Chicken", "Give them some chicken", "0_chicken")
		addButton("Snack", "Give them something random to snack on", "0_snack")
		addButton("Broccoli", "Feed some broccoli!", "0_broccoli")
		addButton("Refuse", "Refuse to feed them", "0_refuse")
	if(state == "0_chicken"):
		_tentacles.doAnimDuo("eat")
		saynn("You're still not sure if feeding any kind of meat to a plant is a good idea..")

		saynn("But this ain't your usual kind of plant.")

		saynn("You open the fridge yourself and offer the tentacles a roasted chicken. You leave it carefully on the floor and step back.")

		saynn("[say=pc]There you go. You probably need proteins.[/say]")

		saynn("The tentacles happily wrap their tentacles around the chicken and then dig their pointy tips into the meat. You don't see any teeth or mouths even.. but somehow it can just absorb it.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "0_snack"):
		_tentacles.doAnimDuo("eat")
		saynn("You're not sure what to give to the tentacles.. so you just grab a bag of chips and offer it to them.")

		saynn("[say=pc]Want these?[/say]")

		saynn("You leave the bag on the floor and watch as the tentacles approach it. Maybe you should have opened it first because now they look confused. They can't really absorb the foil wrap.")

		saynn("Right.. You get the tentacles' attention and bring your hands together before pulling them aside quickly, simulating a motion of opening a bag.")

		if (_tentacles.mind <= 1):
			saynn("The tentacles, in their current state, lack any kind of intelligence to understand what your gesture means.. so they just smash the bag.. which causes a small explosion of chips all across the floor.")

			saynn("They're not the smartest.. but they still got the snack opened.")

			saynn("All the tentacles begin picking up the chips and consuming them.")

		else:
			saynn("The tentacles lack any fingers to do exactly what you did.. But they attempt it anyway.")

			saynn("Two of the tendrils squish the bag between them and then use the tips to grab the foil and spread it open, revealing the chips!")

			saynn("[say=pc]Good job.[/say]")

			saynn("The rest of the tentacles delve into the bag and start eating the snack. They rip the bag completely in the process..")

			saynn("They're not the smartest.. but they're getting there.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "0_broccoli"):
		_tentacles.doAnimDuo("eat")
		saynn("You try to think about what plants usually eat..")

		saynn("They don't really eat anything, do they? They just absorb the light and drink the water that's in their soil.")

		saynn("The tentacles aren't really your usual kind of plant..")

		saynn("You find some broccoli and decide to feed it to them. It's a snack.. it has water.. should be good enough.")

		saynn("The tentacles curl around the cold green bush with a stem.. and crush all the juices out of it.. before absorbing it all through its skin.")

		saynn("Interesting.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "0_refuse"):
		_tentacles.doAnimDuo("glare")
		saynn("You refuse to feed the tentacles and just watch them struggle to open the fridge.")

		saynn("They slide their tentacles all across the cold surface of its door. A few of them stumble upon the handle.. but fail to tug on it with enough force.")

		saynn("Eventually, they just start banging their tips against the fridge, clearly becoming frustrated.")

		saynn("They leave a few small dents.. but that's about it.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "1"):
		_tentacles.doAnimDuo("idle")
		saynn("As you approach the tentacles, you see them grabbing the handle of the fridge and opening it!")

		saynn("They then reach inside.. and grab a bag of chips.")

		saynn("Snacks probably aren't the best food if you wanna keep them in shape..")

		addButton("Let them eat", "Allow them to eat the snack", "1_allow")
		addButton("Reason", "Try to explain them that the snacks are bad for them", "1_explain")
		addButton("Yoink it", "Take the bag away from them before they eat it!", "1_yoink")
	if(state == "1_allow"):
		_tentacles.doAnimDuo("eat")
		saynn("You decide to allow them to eat the snack.")

		if (_tentacles.mind <= 3):
			saynn("They grab the bag.. but now they're not sure how to open it.")

			saynn("Instead of being smart about it, they just put the bag on the floor and smash it with a tentacle, causing the air pressure to open the bag for them.. while sending the chips all over the floor in the process.")

			saynn("They start snacking on the floor chips.")

		elif (_tentacles.mind >= 5):
			saynn("They grab the bag.. but now they're thinking about how to open it.")

			_tentacles.talk("Can you open the bag for us?")
			saynn("For some reason, you get an urge to help them. Without thinking about it, you approach the tentacles and open the bag for them.")

			saynn("In return, you get a few chips and a pat on the head. And also a feeling of satisfaction. Worth it.")

		else:
			saynn("They grab the bag.. but now they're thinking about how to open it.")

			saynn("Eventually, the tentacles figure out to use their tips to pull on the bag until it opens with a nice satisfying pop!")

			saynn("The monster sinks its tendrils into the bag and starts nomming the chips..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "1_explain"):
		_tentacles.doAnimDuo("eat")
		saynn("You get the tentacles' attention as they grab the bag.")

		saynn("[say=pc]Hey.. The chips are bad for you. Maybe you should try broccoli instead?[/say]")

		saynn("It feels like they completely ignored you..")

		saynn("One of the tentacles smashes the bag against the floor, making all the chips fly out.")

		saynn("The rest of the tentacles start picking them up and eating them.")

		saynn("[say=pc]You like floor chips.. got it.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "1_explain_yes"):
		_tentacles.doAnimDuo("idle")
		saynn("You get the tentacles' attention as they grab the bag.")

		saynn("[say=pc]Hey.. The chips are bad for you. Maybe you should try broccoli instead?[/say]")

		saynn("The monster stops doing what it has been doing..")

		_tentacles.talk("Perhaps. We will trust you.")
		saynn("Then, they slowly put the bag back into the fridge.. and grab some broccoli instead.")

		saynn("It's cold.. but it doesn't stop them from crushing it between their tentacles and sucking all the juices that way.")

		saynn("[say=pc]Thank you for listening.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "1_yoink"):
		_tentacles.doAnimDuo("glare")
		saynn("Before the tentacles can open the bag, you quickly run up to them and yoink it!")

		saynn("[say=pc]These are bad for you.[/say]")

		saynn("All of the pointy tips instantly stare at you.")

		saynn("[say=pc]Uh..[/say]")

		saynn("Your next few minutes are spent running away from the tentacles while they attempt to chase you down.")

		if (RNG.chance(_tentacles.agility*15)):
			saynn("Eventually, one of the tentacles manages to curl around your ankle and make you trip! The bag of chips slides out of your hands and quickly gets picked up by the other tendrils.")

			saynn("The tentacle monster is enjoying its snack.. while you're busy panting. It's getting fast, that thing..")

		else:
			saynn("Eventually, the tentacles give up and just curl around themselves. It looks kinda sad..")

			saynn("[say=pc]Fine-e..[/say]")

			saynn("You throw the tentacles some chips and they happily eat them.")

		saynn("Both of you got a good workout out of this.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "1_yoink_angry"):
		_tentacles.doAnimDuo("eat")
		saynn("Before the tentacles can open the bag, you quickly run up to them and yoink it!")

		saynn("[say=pc]These are bad for you.[/say]")

		saynn("But.. before you can finish that sentence, one of the tentacles already snatches the bag back!")

		_tentacles.talk("Leave the bag to us.")
		saynn("[say=pc]Really?[/say]")

		saynn("You try to steal the bag again.. but the tentacles are ready this time.. they hold onto them while you keep pulling.. until the bag suddenly explodes into a beautiful rain of chips.")

		_tentacles.talk("Now look what you have done.")
		saynn("They sure don't look happy about it, the tentacles are vibrating like cobras..")

		saynn("Still, they begin picking up the dirty floor chips and eating them.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "2"):
		_tentacles.doAnimDuo("idle")
		saynn("As you approach the tentacles, you see them grabbing the handle of the fridge and opening it!")

		saynn("They then look inside.. and see a whole roasted chicken just waiting there for them.")

		addButton("Allow it", "Allow them to eat the chicken!", "2_allow")
		addButton("Deny", "Prevent them from eating the chicken!", "2_deny")
	if(state == "2_allow"):
		_tentacles.doAnimDuo("eat")
		saynn("Some chicken isn't gonna hurt, the tentacles need all the protein they can get.")

		if (_tentacles.agility >= 5):
			saynn("You just watch as the tentacles pull the roasted chicken out.. and then easily rip it apart before squeezing and absorbing the meat. Wow.")

			saynn("They sure got strong.")

		elif (_tentacles.agility >= 3):
			saynn("You just watch as the tentacles carefully pull the roasted chicken out and hold it above the floor. Multiple tentacles curl around the chicken's wings and legs.. before proceeding to try to tear it apart.")

			saynn("It takes some time but eventually they manage to do so, ripping the limbs off before absorbing all the meat.")

		else:
			saynn("You just watch as the tentacles try to awkwardly pull the roasted chicken out. It takes quite a few tentacles to hold it above the floor.. while the rest dig into the meat and begin absorbing it.")

			saynn("Some time later, they finally finished their meal!")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "2_deny"):
		_tentacles.doAnimDuo("glare")
		saynn("You run up to the fridge and close it shut before the tentacles have a chance to grab anything!")

		saynn("[say=pc]Nope, you're not eating this.[/say]")

		if (_tentacles.agility >= 7):
			saynn("The many tentacles stare at you.. intently.")

			_tentacles.talk("You can't stop us, why are you trying.")
			saynn("A few tendrils begin reaching out.. but you slap them away.. again and again.. until one of them catches your wrist and holds it in place.")

			saynn("The way it's advancing towards you.. makes you think that it's about to do something. The tentacles start curling.. but not around you.. around the fridge.")

			saynn("The monster suddenly lifts it above the floor.. and relocates it so that your body is no longer blocking it.")

			saynn("[say=pc]Wow.[/say]")

			saynn("That's one way to solve a problem..")

			saynn("It looks like the tentacles lost interest in the chicken after this stunt.. they just wanted to do this.")

		elif (_tentacles.agility >= 5):
			saynn("The many tentacles stare at you.. intently.")

			_tentacles.talk("We do not wish to harm you.")
			saynn("A few tendrils begin reaching out.. but you slap them away.. again and again.. until one of them catches your wrist and holds it in place.")

			saynn("You try to use your other arm.. but the tentacles catch that one too..")

			saynn("You try to kick the tentacles.. but your leg quickly gets bound by the tendrils as well.")

			saynn("And so.. you're standing on one leg.. completely helpless.")

			saynn("[say=pc]Alright, you win. The chicken is yours.[/say]")

			saynn("Hearing that.. the monster just lets you go.. and then slithers away.")

		else:
			saynn("The many tentacles stare at you.. A few try to reach out but they're easy to deflect.")

			_tentacles.talk("We have a wish for nutrients.")
			saynn("[say=pc]I don't want you to eat it, okay? Maybe you want something else?[/say]")

			saynn("Eventually, the monster gives up and just slithers away.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "3"):
		_tentacles.doAnimDuo("idle")
		saynn("As you approach the tentacles, you see them grabbing the handle of the fridge and opening it!")

		saynn("They then look inside.. and notice a raw, uncooked stake. And, for some reason, they want it.")

		saynn("Maybe letting them feel what real meat tastes like isn't the best idea..")

		addButton("Allow it", "Allow them to eat the stake!", "3_allow")
		addButton("Deny", "Prevent them from eating the meat!", "3_deny")
	if(state == "3_allow"):
		_tentacles.doAnimDuo("eat")
		saynn("..or maybe letting them get familiar with the taste of meat is exactly what you want.")

		if (_tentacles.agility >= 5):
			saynn("You just watch as the tentacles grab the stake.. and then easily rip it apart before squeezing and absorbing all the juices and blood. Wow. They didn't even leave any bones.")

		elif (_tentacles.agility >= 3):
			saynn("You just watch as the tentacles grab the stake.. and then dig into the meat with its hungry pointy tips, squeezing all the juices and blood out of it before absorbing it.")

		else:
			saynn("You just watch as the tentacles try to awkwardly pull the stake out. It takes quite a few tentacles to hold it above the floor.. while the rest dig into the meat and begin absorbing it.")

			saynn("Some time later, they finally finished their meal! The blood is still dripping from the tips..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "3_deny"):
		_tentacles.doAnimDuo("glare")
		saynn("You run up to the fridge and close it shut before the tentacles have a chance to grab anything!")

		saynn("[say=pc]Nope, you're not eating this.[/say]")

		if (_tentacles.agility >= 7):
			saynn("The many tentacles stare at you.. intently.")

			_tentacles.talk("You can't stop us, why are you trying.")
			saynn("A few tendrils begin reaching out.. but you slap them away.. again and again.. until one of them catches your wrist and holds it in place.")

			saynn("The way it's advancing towards you.. makes you think that it's about to do something. The tentacles start curling.. but not around you.. around the fridge.")

			saynn("The monster suddenly lifts it above the floor.. and relocates it so that your body is no longer blocking it.")

			saynn("[say=pc]Wow.[/say]")

			saynn("That's one way to solve a problem..")

			saynn("It looks like the tentacles lost interest in the meat after this stunt.. they just wanted to do this.")

		elif (_tentacles.agility >= 5):
			saynn("The many tentacles stare at you.. intently.")

			_tentacles.talk("We do not wish to harm you.")
			saynn("A few tendrils begin reaching out.. but you slap them away.. again and again.. until one of them catches your wrist and holds it in place.")

			saynn("You try to use your other arm.. but the tentacles catch that one too..")

			saynn("You try to kick the tentacles.. but your leg quickly gets bound by the tendrils as well.")

			saynn("And so.. you're standing on one leg.. completely helpless.")

			saynn("[say=pc]Alright, you win. The meat is yours.[/say]")

			saynn("Hearing that.. the monster just lets you go.. and then slithers away.")

		else:
			saynn("The many tentacles stare at you.. A few try to reach out but they're easy to deflect.")

			_tentacles.talk("We have a wish for nutrients.")
			saynn("[say=pc]I don't want you to eat it, okay? Maybe you want something else?[/say]")

			saynn("Eventually, the monster gives up and just slithers away.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "4"):
		_tentacles.doAnimDuo("idle")
		saynn("As you approach the tentacles, you see them grabbing the handle of the fridge and opening it!")

		saynn("They then look inside.. and notice a 'milk' bottle. It has no label.. but you're pretty sure that it's more than just milk.")

		saynn("For some reason, they really wanna empty that bottle.")

		addButton("Allow it", "Allow them to drink the milk!", "4_allow")
		addButton("Deny", "Prevent them from eating the meat!", "4_deny")
	if(state == "4_allow"):
		_tentacles.doAnimDuo("eat")
		saynn("What the heck, why not.")

		saynn("You just watch as the tentacles grab the bottle.. and open it with a precise flick of a tentacle. After that, the monster just pours this milk all over itself, letting the skin of its many tendrils absorb the fluid.")

		saynn("As the milk gets absorbed, a different fluid replaces it. The tentacles sway slowly as they become all shiny and drippy..")

		if (_tentacles.lust >= 5):
			saynn("They're extremely lusty already.. but it looks like they just got even more horny.")

		elif (_tentacles.lust >= 3):
			saynn("Whatever it is, it sure makes them look more.. lusty.")

		else:
			saynn("It sure made them a bit more.. inviting.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "4_deny"):
		_tentacles.doAnimDuo("glare")
		saynn("You run to the fridge and close it before the tentacles have a chance to grab the milk bottle.")

		saynn("[say=pc]Nope, you're not drinking that stuff. Don't even think about it.[/say]")

		if (_tentacles.lust >= 6):
			saynn("The tentacles rub you in sensitive places to try to make you move. You let out a few moans.. but stay still.")

			saynn("Eventually, they give up and move on.")

		elif (_tentacles.lust >= 3):
			saynn("The tentacles gently stroke your hips, inviting you to move aside. Despite all of that, you stand still.")

			saynn("Eventually, they give up and move on.")

		else:
			saynn("The tentacles poke your hips a few times.. but you just stand still.")

			saynn("Eventually, they give up and move on.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "0_chicken"):
		_tentacles.train(_tentacles.STAT_AGILITY)

	if(_action == "0_snack"):
		_tentacles.trainNothing()

	if(_action == "0_broccoli"):
		_tentacles.trainNothing()

	if(_action == "0_refuse"):
		_tentacles.train(_tentacles.STAT_ANGER)

	if(_action == "1_allow"):
		_tentacles.trainNothing()

	if(_action == "1_explain"):
		if(RNG.chance(_tentacles.mind*15)):
			_tentacles.trainNothing()
			setState("1_explain_yes")
			return
		_tentacles.trainNothing()

	if(_action == "1_yoink"):
		if(RNG.chance(_tentacles.anger*15)):
			_tentacles.train(_tentacles.STAT_ANGER)
			setState("1_yoink_angry")
			return
		_tentacles.train(_tentacles.STAT_AGILITY)

	if(_action == "2_allow"):
		_tentacles.train(_tentacles.STAT_AGILITY)

	if(_action == "2_deny"):
		_tentacles.trainNothing()

	if(_action == "3_allow"):
		_tentacles.train(_tentacles.STAT_ANGER)

	if(_action == "3_deny"):
		_tentacles.trainNothing()

	if(_action == "4_allow"):
		_tentacles.train(_tentacles.STAT_LUST)

	if(_action == "4_deny"):
		_tentacles.trainNothing()

	setState(_action)
