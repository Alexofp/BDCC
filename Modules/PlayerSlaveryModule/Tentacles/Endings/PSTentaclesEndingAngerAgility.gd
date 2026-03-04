extends SceneBase

func _init():
	sceneID = "PSTentaclesEndingAngerAgility"

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
		_tentacles.setMonsterLoc("pstent_important")
		_tentacles.setScientistsLoc("pstent_lastroom")
		saynn("They made a huge mistake, trapping you here with that monster. And it's time to make them regret that decision.")

		saynn("You look around.. The door into your cell is probably too strong. Breaking it would take way too long. But the window.. the one that the scientists were looking at you from.. that one seems like a good target.")

		saynn("You approach one of the tentacles and slap its thick, strong surface to get its attention. The tentacle was about to slam you.. but you're quick to redirect their anger somewhere else.")

		saynn("[say=pc]They wanted me to turn you into a mindless plant. They, these fuckers behind the glass of this cell.[/say]")

		saynn("You smack the tentacle again but your hand just bounces off. It does make the tentacles sway like hissy combras though.")

		saynn("[say=pc]Instead, I made you powerful. I made you into a monster they feared you'd become.[/say]")

		saynn("Time to do this.. You point at the window.")

		saynn("[say=pc]Go! Let's make them pay.[/say]")

		saynn("The tentacles understand you without knowing what you said. They slither up to the window that leads into some kind of corridor and prepare. The thickest one of them gets pulled back.. and then slams into the glass with full force, sending a huge wave of vibrations through the rest of the windows! Boom!")

		saynn("The glass manages to withstand the impact.. but the tentacle does leave a small spiderwebs of cracks on it.")

		saynn("[say=pc]More.[/say]")

		saynn("You say it calmly.. and soon.. another thunderous impact shakes the whole cell. The tentacles are coiling with barely contained rage, the tendrils are pulsing wildly.")

		saynn("More of the glass cracks.. the plan is working. You're getting closer and closer.")

		saynn("Suddenly, alarms begin to blare. Red lights start strobing through the corridor, the intercom starts yelling at you.")

		saynn("[say=sci1]What the.. Containment breach, we have a containment breach at cell 5! Code red, code red. All guards, the armory is unlocked, I order you to kill the specimen now. I repeat, shoot to kill![/say]")

		saynn("There is no going back now. You show the curious security cam a middle finger as the tentacles continue to smash into the glass.")

		saynn("Ohh.. Suddenly all the air vents of your cell open.. and some kind of gas starts pouring in. Something tells you that you shouldn't breathe that in.. and so you cover your mouth with your hand, holding your breath.")

		saynn("Something starts happening with the windows too. Some kind of thick metal panels start sliding down behind all of them, blocking more and more of the corridor, gradually sealing your cell away from the rest of the lab.")

		saynn("It feels like your little rebellious act was about to be cut short..")

		saynn("But then.. the glass explodes! The tentacles manage to break through and prop up the metal panel, before proceeding to forcefully push it back up. You can hear the hydraulic system whining and screaming in agony.. until the overheated motors give up completely.")

		addButton("Continue", "See what happens next", "in_corridor")
	if(state == "in_corridor"):
		aimCameraAndSetLocName("pstent_scientists")
		_tentacles.setMonsterLoc("pstent_scientists")
		saynn("You and tentacles get through the broken window, out into the corridor. Finally, you can breathe again.")

		saynn("The surprises don't end here as you begin to hear boots pounding against the concrete flooring..")

		saynn("[say=pc]Get ready.[/say]")

		saynn("Guards appear from behind the corner, wearing some kind of advanced armor and with plasma rifles in their hands.")

		saynn("The first poor soul doesn't even have time to scream as a thick, angry tendril whips out towards him, wrapping around his torso and squeezing hard. The first blood is spilled..")

		saynn("All that armor is kinda pointless when the tentacle can just crush whatever is inside with ease.. like a tin can. The nasty sounds of all his bones cracking and snapping are audible even over the loud alarms. His rifle clatters to the floor, his lifeless body crumpling into a little mess of a person.")

		saynn("Plasma starts searing through the air, hitting the monster in multiple places at once. The tentacles recoil at first from the sudden pain, their new burn marks sizzling.. but then they attack again. Two guards are snatched off their feet, lifted high.. and then slammed into the ceiling with loud, painful thuds. A third is pinned against the wall by three separate tendrils, each one slowly tightening around his throat, chest and skull.. until the armor just caves in on itself with a pop.")

		saynn("A lone guard appears from the other end of the corridor, behind you. His posture is shaky.. but he finds enough strength to aim his rifle directly at you.. and take a sneaky shot.")

		saynn("A bright flash of ignited plasma flies towards you.. and then gets blocked by another tentacle at the last moment. That same tentacle darts towards him and hits his armor's chest plate, crashing ribs.. and probably rearranging the internal organs.")

		saynn("[say=pc]Fucker.[/say]")

		saynn("The first wave seems to be defeated. No doubt there are many more of them.")

		saynn("You walk through the carnage, stepping over bodies, your expression unreadable. Being able to defend yourself seems like a good idea.. so you pick up one of the plasma rifles and take it with you.")

		addButton("Continue", "See what happens next", "show_stuff")
	if(state == "show_stuff"):
		aimCameraAndSetLocName("pstent_scientist_1")
		_tentacles.setMonsterLoc("pstent_scientist_1")
		saynn("You don't even need to point anymore, the tentacles just proceed to ravage through the bio-lab on its own.. while you stay behind.")

		saynn("Actually, you decide to split when you notice small colorful signs that are placed on the walls of each intersection. The ones that you were interested in.. say 'docks'.")

		saynn("You run. And you were right.. As soon as you arrive, you see quick glimpses of the two scientists who were trying to board the escape pods.")

		saynn("A few shots from your plasma rifle has made them quickly reconsider. They stop trying to pry the airlocks open.. and instead run somewhere deeper into the bio-lab. Perfect.")

		saynn("After that, you trace your steps back and find the monster. It's not hard to find.. You just have to follow the path of blood and destruction.")

		saynn("During your exploration, you find more reinforced windows.. a whole row of them, each leaving into a separate containment cell.. just like yours. There are.. things.. inside them. Some have humanoid shapes.. some are just nothing but twisted forms.")

		saynn("Security doors close in front of you.. but the tentacles just smash through them, their rage can only be matched by their raw strength.")

		saynn("All the corridors look the same.. but eventually you do reach some kind of checkpoint.. with more guards defending it. You hide behind the corner and take blind shots with your rifle while the tentacles do the messy work and charge forward.")

		saynn("[say=pc]Kill them all.[/say]")

		saynn("You hear screams and loud thuds as the monster deals with the threats in a similar way.")

		saynn("Feeling a bit curious, you peek your head out and watch as the tentacles literally slither over one of the downed screaming guards, the sheer weight of the tentacles is enough to break every weak bone in his body.. and then some.")

		saynn("You feel like you're getting close to something.")

		addButton("Continue", "See what happens next", "pleading")
	if(state == "pleading"):
		addCharacter(GM.main.PS.getScientist1CharID())
		addCharacter(GM.main.PS.getScientist2CharID())
		aimCameraAndSetLocName("pstent_near_lastroom")
		_tentacles.setMonsterLoc("pstent_near_lastroom")
		_tentacles.setScientistsLoc("pstent_lastroom")
		saynn("At last, you reach some kind of room.. a room that has gone full lockdown mode, all of its doors and windows are sealed shut.")

		saynn("This.. certainly piques your interest. The tentacles are waiting for you to show the next target. They might not be the smartest.. but it looks like they do understand that they won't be able to get out of here without your help now.")

		saynn("You knock on the metal and nod towards the enraged tentacles.")

		saynn("And that's all the convincing they need.")

		saynn("The monster starts smashing into the reinforced blast shutters, trying to break through.")

		saynn("Suddenly, a voice cries through an intercom.")

		saynn("[say=sci1]Wait! Wait-wait-wait! We can make a deal! There is no need for any more bloodshed![/say]")

		saynn("Looks like you have struck gold. You look around and see that one of the security cameras is nearby. It's watching you and your little friend trying to get inside their shelter.")

		saynn("The initiative is on your side.. so you just stare at the camera silently, your head tilted ever so slightly to the side, your plasma rifle resting on your shoulder.")

		saynn("[say=sci1]There is a way out! An escape pod! We will let you take it! Just.. Just call them off![/say]")

		saynn("You continue to say nothing. The banging that's happening behind you is enough of a statement.")

		saynn("The metal barrier starts to bend from the crazy onslaught. The tentacles manage to break it enough to slip one of the tentacles under it and start trying to pull it up instead.")

		saynn("[say=sci2]Please.. I didn't.. I never wanted to.. I was just doing my.. please..[/say]")

		saynn("The girl's pleading.. It makes you sigh. Are you really gonna have to kill her too? Technically, it'd be the monster who will do it..")

		saynn("The doors finally get torn open.")

		addButton("Continue", "See what happens next", "theTalk")
	if(state == "theTalk"):
		aimCameraAndSetLocName("pstent_lastroom")
		_tentacles.setMonsterLoc("pstent_lastroom")
		_tentacles.setScientistsLoc("pstent_lastroom")
		playAnimation(StageScene.Duo, "stand", {pc=GM.main.PS.getScientist1CharID(), npc=GM.main.PS.getScientist2CharID()})
		saynn("You and the tentacles step inside some kind of lab. There is lots of expensive-looking science equipment around.. a fridge.. a separate compartment with beds.. a bathroom.. and also a few computers. The sight reminded you of your own cell that you had here for some reason.")

		saynn("[say=pc]So that's how you live. Pretty miserable.[/say]")

		saynn("Both scientists are hiding under one of the tables. Pathetic really. Your tentacle monster sees them too.. but you gesture to them to stay still and guard the only way out of this room.")

		saynn("Slowly, you approach the table, making each step echo in their ears. You can hear them shuffling around in there. You are still holding your rifle.. just in case they try to do something stupid.")

		saynn("You knock on the table.")

		saynn("[say=pc]Up.[/say]")

		saynn("[say=sci1]Listen..[/say]")

		saynn("[say=pc]Up, I said.[/say]")

		saynn("The scientists scramble to get from under the table. The guy is holding something in your view.. a piece of paper.")

		saynn("[say=sci1]These are codes.. To launch the escape pod.. Let's talk about it, please.[/say]")

		saynn("The wolf looks.. scared. Even the girl is not shivering as much.")

		saynn("[say=pc]Leave them on the table.[/say]")

		saynn("He starts lowering the codes onto a flat surface of the table.. but then stops.")

		saynn("[say=sci1]Please.. Spare me at least.[/say]")

		saynn("[say=sci2]Hey.. uh-h.. um-m.. wait-t..[/say]")

		saynn("Ohh. Makes your blood boil, your hand tensing up around the handle of your weapon.")

		saynn("[say=sci1]If I destroy these, you will be stuck here forever.[/say]")

		saynn("[say=pc]And you will be dead.[/say]")

		saynn("The way you said it.. leaves some rome for interpretation. But sparing him was never a thing that you even considered. You share that knowledge.")

		saynn("Suddenly, he rips the paper into many pieces.")

		saynn("[say=sci1]Only I know the codes now! I will input them myself if you spare me! Only I can control the pod! If your.. thing.. wants blood, kill her! She is just as responsible as me![/say]")

		saynn("The other scientist looks frozen from shock.")

		saynn("The whole room becomes almost silent.. only the heavy breathing and the shuffling of the tentacles can be heard.")

		saynn("[say=pc]No.[/say]")

		addButton("Continue", "See what happens next", "guy_dead")
	if(state == "guy_dead"):
		removeCharacter(GM.main.PS.getScientist1CharID())
		_tentacles.doAnim("idle", {pc=GM.main.PS.getScientist2CharID()})
		saynn("Hearing your response.. and seeing you raise the rifle, the wolf dashes towards the exit out of pure desperation.")

		saynn("A thick tentacle catches him mid-sprint, wrapping around his legs and lifting him into the air.")

		saynn("He dangles, kicking, growling, squirming.. as another tendril wraps around his chest. The squeeze is slow.. and very painful. His ribs crack one by one, piercing his own internal organs.. until his struggling stops.. and his body goes limp.")

		saynn("The tentacles then just toss what's left to the side.")

		saynn("The female's eyes are full of horror, she takes a few steps back, away from the madness. Sadly, there is a wall behind her. She hugs it for her dear life.")

		saynn("[say=sci2]Wh-h.. wha..[/say]")

		saynn("You sit your butt on the very corner of the table, rifle in your lap.")

		saynn("Murdering her in cold blood doesn't seem right.. It'd be nice if she would at least give you a reason first.")

		saynn("[say=pc]Why did you decide to do this?[/say]")

		saynn("[say=sci2]Hh.. uh.. someone had to..[/say]")

		saynn("[say=pc]Why was that 'someone' you?[/say]")

		saynn("[say=sci2]I was good with numbers.. I loved biology.. I loved science..[/say]")

		saynn("She looks like a smart girl. And yet, she is one of the biggest fools around.")

		saynn("[say=pc]Why this bio-lab?[/say]")

		saynn("[say=sci2]I wanted to help people..[/say]")

		saynn("[say=pc]Why. This. Bio-lab? Why not something else?[/say]")

		saynn("[say=sci2]I didn't know about..[/say]")

		saynn("[say=pc]Bullshit.[/say]")

		saynn("She lowers her gaze. You realize now that you don't know her name. But that actually makes things easier. Less memories leads to better sleep.")

		saynn("[say=sci2]I wanted to help people.. I thought this would be the best way..[/say]")

		saynn("[say=pc]But you ended up creating monsters. You knew about all the unethical shit that was happening here. Why didn't you stop while you could?[/say]")

		saynn("[say=sci2]I.. I guess I did know.. I.. just.. I couldn't..[/say]")

		saynn("[say=pc]Why?[/say]")

		saynn("[say=sci2]I.. I needed credits.. I got talked into this.. He was very.. persuasive.[/say]")

		saynn("Fresh out-of-college girls. It's so easy to mold them into anything.")

		saynn("[say=pc]Greed and cock? That can't be all of it, there is no way. Tell me that isn't all of it. Tell me that you got blackmailed.. Tell me that you got forced to do this. Please, just say..[/say]")

		saynn("She cuts you off.")

		saynn("[say=sci2]I ended up really liking this job..[/say]")

		saynn("Tears start streaming down her cheeks.")

		saynn("You stay quiet. Shooting her right now would be a weird kind of mercy.")

		saynn("[say=pc]Was he telling the truth? About the codes?[/say]")

		saynn("[say=sci2]No.. The escape pods automatically become available during code red.. But sadly.. the airlock got.. a little stuck.[/say]")

		saynn("Ain't karma a bitch.")

		saynn("[say=pc]I see.[/say]")

		saynn("Time to stop this.")

		saynn("You look behind you and get the tentacles' attention. You point at all the computers and equipment in the lab. The tentacles are quick to start smashing it all to pieces.")

		saynn("[say=sci2]Wait.. You're not gonna destroy all of it, are you?[/say]")

		saynn("Suddenly, she dashes towards one of the computers, protecting it with herself.")

		saynn("[say=pc]If you wanna help us, be my guest. Otherwise, get the fuck out of the way.[/say]")

		saynn("[say=sci2]This is all precious information. This is how you can rule the world.. This knowledge can give you power over anything and everything.. If lost.. It might not ever be recovered.[/say]")

		saynn("[say=pc]I'm sure there will be enough evil people to re-discover it. Get out of the way, this is your last chance.[/say]")

		saynn("The cat steps away from the computer.. but as soon as the monster approaches it.. she suddenly whips out an injector and pounces at it!")

		saynn("You pull the trigger.")

		addButton("Continue", "See what happens next", "girl_injured")
	if(state == "girl_injured"):
		_tentacles.doAnim("idle")
		saynn("The injector shatters as it hits the floor, some kind of yellow fluid spilling out of it.")

		saynn("A sharp feline scream echoes in your ears. She grabs onto her right paw.. what's left of it anyway.")

		saynn("[say=sci2]AHH![/say]")

		saynn("You pull her back by her labcoat as the tentacles smash the last computer, turning it into a bunch of scrap metal. You weren't aiming for her hand.. just a case of blind luck.")

		saynn("The feline is rolling around on the floor, screaming, unable to contain the pain. Her stump isn't bleeding.. The molten plasma has neatly cauterized everything.")

		saynn("[say=sci2]IT HURTS! MY PAW![/say]")

		saynn("There was a medkit attached to one of the walls. You grab the strongest painkiller that it has.. and inject the girl with it. The effect is immediate.")

		saynn("[say=sci2]HHh.. hkhhh.. khh.. You.. destroyed.. my hand..[/say]")

		saynn("[say=pc]Get a prosthetic. And stop doing dumb shit. You only have one paw left.[/say]")

		saynn("And with that.. you head out of this room.. being careful as to not to step into any mess.. organic or not.")

		addButton("Continue", "See what happens next", "docks")
	if(state == "docks"):
		removeCharacter(GM.main.PS.getScientist2CharID())
		aimCameraAndSetLocName("pstent_scientist_2")
		_tentacles.setMonsterLoc("pstent_scientist_2")
		saynn("You head back into the docks.. but now with the tentacles.")

		saynn("Looks like there is only one escape pod left.. the one that has gotten stuck.")

		saynn("The tentacles help you by forcibly spreading the doors open.")

		saynn("The pod.. is clearly too small for the tentacles. There is only space for two normal-sized people.")

		saynn("[say=pc]Well..[/say]")

		saynn("They might not be the smartest.. but they seem to understand.")

		saynn("Suddenly, bolts of plasma start flying past you. The rest of the guards are here.")

		saynn("The tentacles roar into the fight, leaving you be.")

		saynn("Looks like you won't get to say your goodbyes. Oh well.. what can you do..")

		saynn("You let the tentacles have their fun.. as you board the escape pod and press a button that would launch it..")

		addButton("Continue", "See what happens next", "in_space")
	if(state == "in_space"):
		removeCharacter(GM.main.PS.getTentaclesCharID())
		aimCameraAndSetLocName("pstent_escapepod")
		playAnimation(StageScene.Solo, "sit")
		saynn("You're drifting through space.. the fuel has long run-out. Your pod has a way of sending an SOS signal.. but that's about it.")

		saynn("Suddenly, your collar starts beeping.. faster and faster.. until it suddenly sends a shock so strong that you black out.")

		addButton("Continue", "See what happens next", "near_detective")
	if(state == "near_detective"):
		removeCharacter(GM.main.PS.getScientist1CharID())
		removeCharacter(GM.main.PS.getScientist2CharID())
		removeCharacter(_tentacles.getTentaclesCharID())
		addCharacter("intro_detective")
		playAnimation(StageScene.Solo, "sit")
		aimCameraAndSetLocName("intro_interogation")
		saynn("You wake up.. what feels like seconds later.. cuffed to a chair.")

		saynn("It's not the first time you've been in this place.")

		saynn("[say=intro_detective]Name is Jake, IIPF, threat assessment division.[/say]")

		saynn("[say=pc]Yeah, I remember you.[/say]")

		saynn("He raises a brow at you.")

		saynn("[say=pc]I've been naughty, I know.[/say]")

		saynn("He puts his glasses on and reads something off of an old-school wooden tablet.")

		saynn("[say=intro_detective]Let's see. You have a single case of felony escape. Hm. But it's a big one. Help me understand, how and why did it happen? You can start with the how.[/say]")

		saynn("Jake looks over his glasses at you, awaiting.")

		saynn("[say=pc]Do you wanna hear my story? How I was used as a test subject in an illegal bio-lab? And what happened next?[/say]")

		saynn("[say=intro_detective]My job is not to listen to fan fiction. It's to assess the level of risk. How likely is it that you're gonna try to pull this stunt again. So help me help you, will you?[/say]")

		saynn("You're not really sure what to say anymore. You can try to explain that you were held in a cell.. but he will probably not care. And telling him about what you did with the lab will probably put a few extra charges on you. Might as well try to play his game then.")

		saynn("[say=pc]This won't happen again, I can assure you.[/say]")

		saynn("Jake tilts his head ever slightly.. while you put your most innocent eyes.")

		saynn("[say=intro_detective]I see.[/say]")

		addButton("Continue", "See what happens next", "fastforward")
	if(state == "fastforward"):
		removeCharacter("intro_detective")
		GM.pc.setLocation(GM.pc.getCellLocation())
		aimCameraAndSetLocName(GM.pc.getCellLocation())
		addCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {npc="risha"})
		saynn("Next moment you know it.. you're being flown back to your concrete home.. first class, as usual.")

		saynn("The BDCC guards meet you and walk you to your cell.. where Risha is already waiting for you.")

		saynn("[say=risha]Here is your stupid crap.[/say]")

		saynn("[say=pc]What a warm welcome.[/say]")

		saynn("[say=risha]You know what's warm? My cock. Wanna welcome it?[/say]")

		saynn("Looks like you weren't gone long enough for her to start missing you.")

		saynn("[say=pc]I'm good.[/say]")

		saynn("[say=risha]No. You're a slut. C'mon, I ain't got all day.[/say]")

		saynn("You fetch your stupid crap off of her hands.. and watch her leave.")

		saynn("From one paradise to another.")

		addButton("Continue", "You had your fun", "doEndSlavery")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "fastforward"):
		processTime(60*42)
	
	if(_action == "near_detective"):
		_tentacles.strippedByDetective()
	
	if(_action == "doEndSlavery"):
		endScene()
		GM.main.endCurrentScene()
		GM.main.stopPlayerSlavery()
		GM.pc.setLocation(GM.pc.getCellLocation())
		return

	setState(_action)
