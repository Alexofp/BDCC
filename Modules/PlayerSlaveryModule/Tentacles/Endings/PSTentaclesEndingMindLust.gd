extends SceneBase

func _init():
	sceneID = "PSTentaclesEndingMindLust"

func _reactInit():
	addCharacter(GM.main.PS.getTentaclesCharID())

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
		_tentacles.doAnim("idle")
		aimCameraAndSetLocName("pstent_important")
		saynn("They made a huge mistake, trapping you here with those tentacles. And it's time to make them regret that decision.")

		saynn("You look around.. The door into your cell seems impenetrable. And even the window.. the one that the scientists were looking at you from.. you're fairly certain that breaking it would take way too long.")

		saynn("[say=pc]You have a plan perhaps? Something better than just trying to break the window?[/say]")

		_tentacles.talk("We do. Are you okay if we.. play around with the guards.")
		saynn("Play around.. that's an interesting way to say it.")

		saynn("[say=pc]As long as it doesn't involve killing them, I'm down.[/say]")

		saynn("The tips of the tentacles get all wet and drippy when you say that. They're getting excited already..")

		saynn("One of the armored guards starts walking past your cell, squeezing his weapon tightly. He glances at the window to make sure you're still there.. but then just walking past.. a standard patrol.")

		saynn("But then he takes a different route. Rather than following the corridor, he heads towards your door.")

		saynn("[say=pc]Huh.[/say]")

		saynn("The guard approaches the control panel. He scans something.. and the door begins to unseal itself with a hiss.. and then it opens.")

		saynn("He steps inside, armored from toes to the tip of his head. You can't even see his eyes behind an advanced-looking helmet.")

		saynn("The tentacles don't move.. and don't strike. And so you do the same, curious about what will happen next.")

		saynn("The guard slowly approaches the fridge.. opens it.. and leaves his gun inside. After that, he starts stripping his armor and putting each piece into the fridge as well.. until he is wearing nothing at all.")

		saynn("The guard then slowly approaches you.. before suddenly arching his back and letting out a lusty moan.. His face shows pure pleasure as his cock leaves its sheath.. gets hard in mere seconds.. and then starts throbbing and shooting strings of his seed all over the floor. His orgasm is so strong.. that his legs go weak, making him collapse and lose consciousness.")

		saynn("[say=pc]Did you just.. cum his brains out?[/say]")

		_tentacles.talk("Did we? We just tugged at a few strings.. His mind is fine.")
		saynn("Seconds later, the alarms scream to life. Red lights start strobing all around you. An intercom kicks in with urgent panic.")

		saynn("[say=sci1]What the.. Containment breach, we have a containment breach at cell 5! Code red, code red. All guards, the armory is unlocked, I order you to kill the specimen now. I repeat, shoot to kill![/say]")

		saynn("Oops.. looks like you have spent too much time having fun with the guard.")

		_tentacles.talk("We must move before they seal us here.")
		saynn("You nod.. and follow the tentacles as they squeeze through the opened door.")

		addButton("Continue", "See what happens next", "friendlyfire")
	if(state == "friendlyfire"):
		aimCameraAndSetLocName("pstent_entrance")
		saynn("You step foot into the corridor and watch as the door shuts behind you. Your old cell begins to fill with some kind of gas. Luckily, you're not there anymore. Poor guy though.")

		saynn("You're not out of the woods yet though as you begin to hear boots approaching you fast.")

		saynn("Looking around, there is nothing to hide behind.")

		_tentacles.talk("Use us as cover if you have to.")
		saynn("Guards appear from behind the corner, wearing the same armors and holding the same rifles. Bolts of glowing plasma begin wheezing past.")

		saynn("But then something strange happens.")

		saynn("The lead guard stops shooting and lets out a moan. He drops his rifle, his eyes roll back, his face blushing behind the visor.")

		saynn("[sayMale]What the.. what's happening to me? Ah~..[/sayMale]")

		saynn("He stumbles into the view of his friends, grabbing onto his groin, his breathing getting all ragged.")

		saynn("The guards behind him hesitate, confused.")

		saynn("[sayMale]What the fuck is wrong with you? Get out of the way![/sayMale]")

		saynn("The guard doesn't answer, he collapses and starts humping the floor! More cute moans escape his lips.. until he cums, his cock wasting its seed by making a mess in his briefs.")

		saynn("Before anyone can react, another guard stiffens. His weapon drops. His hands fly to his helmet and tear it off, revealing a face full of desire.")

		saynn("[sayMale]I c-can't.. I wanna cum so hard.. what the..[/sayMale]")

		saynn("This same guard starts rubbing against the first, still armored up. This doesn't push him any closer to his peak so he starts undressing, dropping pieces of his armor.")

		saynn("One of the guards is a girl. She clearly got affected by this too, dropping the weapon and revealing her naked self.. before straddling one of the other horny guards.")

		saynn("[sayMale]It's in our heads! It's making us-..[/sayMale]")

		saynn("[sayFemale]Shut up and give me your cock.. now..[/sayFemale]")

		saynn("[sayMale]I want some too! Please![/sayMale]")

		saynn("You can't believe it.. the guards start fucking right in front of you. Moans fill the corridor.. along with gasps and wet sounds of plaps.. hips slamming against butts.. cocks fucking pussies and tailholes..")

		saynn("More guards arrive.. and are quick to join the giant corridor orgy, creating threesomes and foursomes. Holes begin to get pumped full of seed.. some guards crying out from powerful orgasms. Make love, not war, as they say.")

		saynn("The last guard.. the one who somehow didn't get mindcontrolled.. tries to run away. But just before he gets out of range, the tentacles cause him to stop and approach them. He drops his gun too and undresses.. allowing the tentacles to grab him and slide into his holes, fucking him right there, in front of you.")

		saynn("It doesn't take long for the guard to start squirming and moaning, his cock wasting his seed as his prostate gets smashed again and again, his throat bulging from getting stretched..")

		saynn("After that, he collapses onto the floor, into the same pile of half-naked spent bodies.. all of them breathing hard.")

		saynn("[say=pc]Wow.[/say]")

		_tentacles.talk("These won't be a problem anymore.")
		saynn("[say=pc]I believe you.[/say]")


func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
