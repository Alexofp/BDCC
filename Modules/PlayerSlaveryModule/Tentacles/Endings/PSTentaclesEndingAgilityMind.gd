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

		saynn("The tentacles don't move.. and don't strike. And so you do the same, seeing what will happen next.")

		saynn("[say=pc]Does the camera see us?[/say]")

		_tentacles.talk("That guard is in the bathroom. We have about a minute.")
		saynn("The guard slowly approaches the fridge.. opens it.. and leaves his gun inside. After that, he starts stripping his armor and putting each piece into the fridge as well.. until he is only wearing his underwear.")

		saynn("The mind-controlled guard then gets into your bed.. and promptly falls asleep. The door into your cell.. is still opened.")

		saynn("[say=pc]That's one way.. What if another guard passes by?[/say]")

		_tentacles.talk("Please turn the shower on and set it to the hottest water you can.")
		saynn("You run to the shower.. and do as told. You realize what the plan is.. when all the windows of your cell begin fogging up.")

		saynn("While you are busy with the shower, the tentacles use their agility to reach towards the security camera. The tentacle carefully wraps around it.. and forcefully turns it left and right a few times, making the inner turning motor screech.. and then overheat and seize working. The camera is now staring at a wall.. forever.")

		_tentacles.talk("This will give us about five minutes before the alarm happens.")
		saynn("You nod.. and follow the tentacles as they squeeze through the opened door.")

		addButton("Continue", "See what happens next", "corridor")
	if(state == "corridor"):
		saynn("You and {psTentacles} step into the corridor. The tendrils admire the different environment that they're not in.. but not for long.")

		saynn("The sound of boots approaching makes you hug the opposite wall.")

		_tentacles.talk("Tshh.")
		saynn("The guard steps into view from the left corridor.")

		saynn("In a sudden motion, he turns his head to the right, his whole body doing an ever so visible spasm.. before the tentacles take over.")

		saynn("The guard just looks at you for a bit.. and then casually walks the other way, continuing his patrol.")

		_tentacles.talk("He might remember us if he thinks about it long enough.")
		saynn("Another ticking bomb..")

		saynn("After the guard has walked out of view, the tentacles start slithering forward. You follow their steps closely.")

		saynn("Corridor after corridor, the tentacles are careful about avoiding the gazes of all the cameras.. occasionally stopping to break their turning motors. Any lone guards or pairs of them conveniently turn away when you approach.")

		_tentacles.talk("The camera person has begun writing a report.")
		saynn("[say=pc]Can't you stop him?[/say]")

		_tentacles.talk("Too far.")
		saynn("You nod.")

		saynn("During your exploration, you find more reinforced windows.. a whole row of them, each leaving into a separate containment cell.. just like yours. There are.. things.. inside them. Some have humanoid shapes.. some are just nothing but twisted forms.")

		saynn("You find closed security doors in front of you. But one of the guards is nice enough to open them for you before turning away. Feels almost too easy.")

		saynn("[say=sci1]Hello. I'm getting a report from the monitoring team. Apparently some of the cameras are malfunctioning. I'm raising the code to code yellow, just in case. Please make sure that every specimen is secured in its cell while we wait for the maintenance team to arrive.[/say]")

		saynn("Time is running out..")

		saynn("You follow the tentacles until you reach some kind of checkpoint. You peek your head to look at it from behind the corner.. and see quite a few guards.")

		_tentacles.talk("Too many for us to control.")
		saynn("Well.. gotta try a different route then.")

		saynn("But before you can leave.. you begin to hear more boots coming your way..")


func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
