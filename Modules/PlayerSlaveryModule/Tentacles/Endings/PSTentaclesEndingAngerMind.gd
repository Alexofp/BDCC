extends SceneBase

func _init():
	sceneID = "PSTentaclesEndingAngerMind"

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

		_tentacles.talk("We do. Are you okay with murder?")
		saynn("They sure don't lack enthusiasm. Makes sense, you got these tentacles extremely riled up and angry.")

		saynn("[say=pc]If I have to.[/say]")

		saynn("You see one of the tentacle tips nodding. The others switch their direction to someone else.")

		saynn("One of the armored guards starts walking past your cell, squeezing his weapon tightly. He glances at the window to make sure you're still there.. but then just walking past.. a standard patrol.")

		saynn("But then he takes a different route. Rather than following the corridor, he heads towards your door.")

		saynn("[say=pc]Huh.[/say]")

		saynn("The guard approaches the control panel. He scans something.. and the door begins to unseal itself with a hiss.. and then it opens.")

		saynn("He steps inside, armored from toes to the tip of his head. You can't even see his eyes behind an advanced-looking helmet.")

		saynn("The tentacles don't move.. and don't strike. And so you do the same, seeing what will happen next.")

		saynn("The guard slowly approaches you.. and then offers you his plasma rifle, holding it out with both hands.")

		saynn("Why not, you take it. It's a bit heavy for your liking but what can you do?")

		saynn("[say=pc]Thanks.[/say]")

		saynn("The guard then reaches up with slow, deliberate movement and removes his helmet. His face is emotionless. You hold the handle of your rifle tighter when he suddenly draws his side-arm ballistic pistol from his holster.")

		saynn("But instead of aiming it at you or the tentacles, he presses the barrel to his head.. and pulls the trigger.")

		saynn("The gunshot echoes through the cell and the corridor. He crumples instantly, his body lifeless.")

		saynn("For one heartbeat, there is silence. You expected something like this.. but you didn't expect.. this.")

		saynn("Then the alarms scream to life. Red lights start strobing all around you. An intercom kicks in with urgent panic.")

		saynn("[say=sci1]What the.. Containment breach, we have a containment breach at cell 5! Code red, code red. All guards, the armory is unlocked, I order you to kill the specimen now. I repeat, shoot to kill![/say]")

		_tentacles.talk("We must move before they seal us here.")
		saynn("You nod.. and follow the tentacles as they squeeze through the opened door.")

		addButton("Continue", "See what happens next", "friendlyfire")
	if(state == "friendlyfire"):
		aimCameraAndSetLocName("pstent_entrance")
		saynn("You step foot into the corridor.. and watch as the door shuts behind you, the room begins to get filled with some kind of gas.. Luckily, you're not there anymore.")

		saynn("You're not out of the woods yet though as you begin to hear boots pounding against the floor.")

		saynn("Looking around.. there is nothing to hide behind.")

		_tentacles.talk("Use us as cover if you have to.")
		saynn("Guards appear from behind the corner, wearing the same armors and holding the same rifles. Bolts of glowing plasma begin wheezing past.")

		saynn("Suddenly, one of the guards dashes into the line of fire of his friends. They stop firing immediately.")

		saynn("[sayMale]What the fuck are you doing?! Get out of the way![/sayMale]")

		saynn("That same guard then raises his weapon on his comrades.. and pulls the trigger. The struck guard gasps as the plasma melts his chest plate, creating a hole deep into his flesh.")

		saynn("[sayMale]He is a traitor![/sayMale]")

		saynn("The rebellious guard gets gunned down fast.. leaving four out of six alive.")

		saynn("But before they finish pumping one of his own with plasma, another guard suddenly turns and starts firing at his own squad. Guns turn towards him.. but not all of them.. You can hear more shots.")

		saynn("[sayMale]WHO IS COMPROMISED?! AVOID FRIENDLY FIRE! a-AGH![/sayMale]")

		saynn("Panic erupts. The formation shatters. Nobody knows who is who anymore, guards shooting randomly at each other, leaving gaping burning holes in their armor.. and bodies.")

		saynn("A second wave of guards approaches from another corridor. They get utterly confused, seeing friendlies firing at friendlies.")

		saynn("[sayMale]Hold fire, hold fire, what the fuck is happening here?[/sayMale]")

		saynn("A fresh guard that was standing near him suddenly turns and shoots him. The self-inflicted cycle of carnage continues.")

		saynn("The corridor became a violent disco show.. with plasma shots flying everywhere.. guards screaming. The ones who try to run are quick to change their mind and start killing each other again.")

		saynn("[sayMale]IT'S IN OUR HEADS! IT'S IN OUR-[/sayMale]")

		_tentacles.talk("Silence.")
		saynn("A plasma shot takes him from behind, his head turning into an ugly charcoal.")

		saynn("Some of the shots hit the tentacles, making them spasm wildly. The impacts are leaving nasty sizzling wounds on the slick green surface.. You can feel the pain.. you share every emotion with them.")

		saynn("A single guard is left alive. He sprints away from the slaughter.. away from you two.")

		saynn("He makes it a few meters before stopping in his tracks. His body turns and faces you. He walks forward, step by step, until he stands amid all the bodies again. He looks at you.. raises his rifle to his own chin.. and melts his brains out.")

		saynn("The last guard has joined the pile.")

		saynn("[say=pc]That was.. brutal. Can you keep going?[/say]")

		_tentacles.talk("We have to.")
		saynn("You nod and let them take the lead.")

		addButton("Continue", "See what happens next", "show_stuff")
	if(state == "show_stuff"):
		aimCameraAndSetLocName("pstent_scientist_2")
		saynn("The tentacles proceed to explore the bio-lab on their own.. while you stay behind.")

		_tentacles.talk("We can feel the scientists trying to escape. They're in the docks, we can't reach them in time.")
		saynn("[say=pc]Okay. Continue clearing the lab, I will catch them.[/say]")

		saynn("You notice small colorful signs that are placed on the walls of each intersection. The ones that you were interested in.. say 'docks'.")

		saynn("You run. The tentacles were right.. As soon as you arrive, you see quick glimpses of the two scientists who were trying to board the escape pods.")

		saynn("A few shots from your plasma rifle has made them quickly reconsider. They stop trying to pry the airlocks open.. and instead run somewhere deeper into the bio-lab. Good enough for the first time using this rifle.")

		saynn("After that, you trace your steps back and find the monster. It's not hard to find.. You just have to follow the path of blood and destruction.")

		saynn("During your exploration, you find more reinforced windows.. a whole row of them, each leaving into a separate containment cell.. just like yours. There are.. things.. inside them. Some have humanoid shapes.. some are just nothing but twisted forms.")

		saynn("Security doors close in front of you.. but not for long. The tentacles are quick to reverse any obstacle that the guards try to create..")

		saynn("All the corridors look the same.. but eventually you do reach some kind of checkpoint.. with more guards defending it. You hide behind the corner and take blind shots with your rifle, distracting them.")

		saynn("[say=pc]Kill them all.[/say]")

		_tentacles.talk("With pleasure.")
		saynn("You hear more plasma shots, screams and loud thuds as the tentacles deal with the threats in a similar way.")

		saynn("Feeling a bit curious, you peek your head out and watch as the three last guards do a final standoff, aiming their guns at each other. And then.. after a single moment.. they're all dead.")

		_tentacles.talk("We're gaining on them.")
		saynn("[say=pc]Don't mindcontrol them unless they attack us.[/say]")

		_tentacles.talk("What would be the reason?")
		saynn("[say=pc]I wanna hear their begging.[/say]")

		_tentacles.talk("We will entertain your request.")
		addButton("Continue", "See what happens next", "pleading")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
