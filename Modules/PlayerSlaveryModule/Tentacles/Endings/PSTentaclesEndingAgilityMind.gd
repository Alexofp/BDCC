extends SceneBase

func _init():
	sceneID = "PSTentaclesEndingAgilityMind"

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
		saynn("The tentacles are about as good as they're gonna be. You train everything you could with them. It's time to try to put you.. and them.. to the test.")

		saynn("You look around.. The door into your cell seems impenetrable. And even the window.. the one that the scientists were looking at you from.. you're fairly certain that breaking it would take way too long.")

		saynn("[say=pc]You have a plan perhaps? Something better than just trying to break the window?[/say]")

		_tentacles.talk("We do. We assume you want to avoid bloodshed.")
		saynn("[say=pc]Of course. We're not animals.[/say]")

		saynn("The tentacles stare at you for longer than would normally be comfortable..")

		saynn("One of the armored guards starts walking past your cell, squeezing his weapon tightly.")

		_tentacles.talk("We have a plan.")
		saynn("The guard glances at the window to make sure you're still there.. but then just walking past.. a standard patrol.")

		saynn("But then he takes a different route. Rather than following the corridor, he heads towards your door.")

		saynn("[say=pc]Huh.[/say]")

		saynn("The guard approaches the control panel. He scans something.. and the door begins to unseal itself with a hiss.. and then it opens.")

		saynn("He steps inside, armored from toes to the tip of his head. You can't even see his eyes behind an advanced-looking helmet.")

		saynn("The tentacles don't move.. and don't strike. And so you do the same, curious what will happen next.")

		saynn("[say=pc]Does the camera see us?[/say]")

		_tentacles.talk("That guard is in the bathroom. We have about a minute.")
		saynn("The guard slowly approaches the fridge.. opens it.. and leaves his gun inside. After that, he starts stripping his armor and putting each piece into the fridge as well.. until he is only wearing his underwear.")

		saynn("The mind-controlled guard then gets into your bed.. and promptly falls asleep. The door into your cell.. is still opened.")

		saynn("[say=pc]That's one way.. What if another guard passes by?[/say]")

		_tentacles.talk("Please turn the shower on and set it to the hottest water you can.")
		saynn("You run to the shower.. and do as told. You realize what the plan is.. when all the windows of your cell begin fogging up.")

		saynn("While you are busy with the shower, the tentacles use their agility to reach towards the security camera. The tentacle carefully wraps around it.. and forcefully turns it left and right a few times, making the inner turning motor screech.. and then overheat and seize working. The camera is now staring at a wall.. forever.")

		_tentacles.talk("We have about five minutes before they raise the alarm.")
		saynn("You nod.. and follow the tentacles as they squeeze through the opened door.")

		addButton("Continue", "See what happens next", "corridor")
	if(state == "corridor"):
		saynn("You and {psTentacles} slip through the open door into the corridor. For a moment, the tendrils pause, admiring the new environment that they're in. It's not that different from being in the cell.. but it's still different.")

		saynn("The sound of boots approaching makes you hug the opposite wall. There is not much to hide behind so the tentacles do the same, pressing themselves against the concrete.")

		_tentacles.talk("Tshh.")
		saynn("The guard steps into view from the left corridor, looking forward. He stops and checks his plasma rifle.")

		saynn("He looks left, about to continue his patrol.. but then decides to check his right too.. His body convulsed for a split second.. before going still. His eyes calm down and just glaze over.")

		saynn("The guard blinks, looks directly at you and the tentacles.. and then just causally turns and continues his patrol in the opposite direction, the sounds of his boots fading into silence.")

		_tentacles.talk("He might remember us if he thinks about it long enough.")
		saynn("Another ticking bomb..")

		saynn("You move. Corridor after corridor, the tentacles slither ahead, their movements aren't exactly silent.. but they don't need to be. When a camera appears in sight, a tendril would already be there, wrapping around its frame and twisting with surgical precision until the motor inside it dies.")

		saynn("Any lone guards or pairs of them conveniently turn away at the last second. Maybe training them to be strong and smart was the best decision you could have made.")

		_tentacles.talk("The camera person has begun writing a report.")
		saynn("[say=pc]Can you stop him?[/say]")

		_tentacles.talk("Too far.")
		saynn("You nod.")

		saynn("During your exploration, you find more reinforced windows.. a whole row of them, each leaving into a separate containment cell.. just like yours. There are.. things.. inside them. Some have humanoid shapes.. some are just nothing but twisted forms.")

		saynn("A security door blocks your path, red light glowing. But before you start looking for other options, a guard appears. He approaches the control panel and lets it scan his face.. which opens the door. He walks away without even looking at you. Feels almost too easy.")

		saynn("[say=sci1]Hello. I'm getting a report from the monitoring team. Apparently some of the cameras are malfunctioning. I'm raising the code to code yellow, just in case. Please make sure that every specimen is secured in its cell while we wait for the maintenance team to arrive.[/say]")

		saynn("Time is running out..")

		saynn("You move faster, following the tentacles until you reach some kind of checkpoint. You peek your head to look at it from behind the corner.. and see quite a few guards. They're all alert now too, eyes sharp, hands on their weapons.")

		_tentacles.talk("Too many for us to control.")
		saynn("You start pulling back, searching for a different route.. but then..")

		saynn("Boots. Behind you. Coming fast.")

		saynn("Nowhere to run now. You only have your fists.. but you still ready yourself for a fight..")

		addButton("Continue", "See what happens next", "yoinked_vents")
	if(state == "yoinked_vents"):
		saynn("Suddenly, one of the thick tentacles wraps around you and pulls you up into a ventilation shaft that they have just discovered. As they pull you in, another tentacle puts the ventilation grate back into its place from the inside.")

		saynn("The many guards just run past you, none of them spotting anything suspicious. Phew.")

		saynn("You begin crawling through the vent. It's tight here. Very cramped. The tentacles have to spread themselves along a big distance.. and they still barely fit, really straining the metal. Having high agility helps them though.")

		saynn("[say=pc]Cozy..[/say]")

		_tentacles.talk("They're about to find the naked guard.")
		saynn("You focus and crawl in silence, only hearing the sound of your breathing now. The vent system seems to go on forever..")

		saynn("And then.. suddenly.. the metal begins screeching.")

		saynn("Moments later, the vent floor gives way.")

		saynn("The tentacles fall first, crashing into another corridor. You land onto them, the thick tentacles catching you.")

		saynn("A guard stands a few meters away. His eyes go wide, his hand instantly moves to his radio.")

		saynn("[say=pc]Stop him![/say]")

		saynn("The guard's digit presses the transmit button, causing it to beep. He opens his mouth.. and then freezes.")

		saynn("His thumb carefully releases the button.. but then a crackling voice emerges from the radio.")

		saynn("[say=sci2]Johnson? Report. What's your status? Johnson, do you copy?[/say]")

		saynn("Saying nothing now will cause an alarm.")

		saynn("The guard presses the button of the radio again and starts talking, smooth and calm.")

		saynn("[sayMale]All clear here. Just checking the corridor. No issues so far.[/sayMale]")

		saynn("A pause. The radio crackles.")

		saynn("[say=sci2]Copy that. Stay alert. We have a possible breach.[/say]")

		saynn("[sayMale]Understood.. actually.. I see something now.[/sayMale]")

		saynn("You raise a brow, a slight feeling of anxiety setting in.")

		saynn("[say=sci2]What is it?[/say]")

		saynn("[sayMale]I see a broken vent in my sector. No signs of any intruder.[/sayMale]")

		saynn("A small pause.")

		saynn("[say=sci2]Copy. We will redirect some guards and secure the perimeter. If you see anything else suspicious, report it immediately.[/say]")

		saynn("[sayMale]Copy. Out.[/sayMale]")

		saynn("The guard turns away as the tentacles slither past.. at a very fast pace. You follow behind.")

		_tentacles.talk("That has bought us some time.")
		saynn("The whole facility is hunting you. You are always one mistake away.. But it looks like you are getting close to something..")


func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
