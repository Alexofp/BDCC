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
		saynn("You don't even need to point anymore, the tentacles just proceed to ravage through the bio-lab on its own.. while you stay behind.")

		saynn("During your exploration, you find more reinforced windows.. a whole row of them, each leaving into a separate containment cell.. just like yours. There are.. things.. inside them. Some have humanoid shapes.. some are just nothing but twisted forms.")

		saynn("Security doors close in front of you.. but the tentacles just smash through them, their rage can only be matched by their raw strength.")

		saynn("All the corridors look the same.. but eventually you do reach some kind of checkpoint.. with more guards defending it. You hide behind the corner and take blind shots with your rifle while the tentacles do the messy work and charge forward.")

		saynn("[say=pc]Kill them all.[/say]")

		saynn("You hear screams and loud thuds as the monster deals with the threats in a similar way.")

		saynn("Feeling a bit curious, you peek your head out and watch as the tentacles literally slither over one of the downed screaming guards, the sheer weight of the tentacles is enough to break every weak bone in his body.. and then some.")

		saynn("You feel like you're getting close to something.")

		addButton("Continue", "See what happens next", "pleading")
	if(state == "pleading"):
		saynn("At last, you reach some kind of room.. a room that has gone full lockdown mode a long time ago already, all of its doors and windows are sealed shut.")

		saynn("This.. certainly piques your interest. The tentacles are waiting for you to show the next target. They might not be the smartest.. but it looks like they do understand that they won't be able to get out of here without your help.")

		saynn("You knock on the metal and nod towards the enraged tentacles.")

		saynn("And that's all the convincing they need.")

		saynn("The monster starts smashing into the reinforced blast shutters, trying to break through.")

		saynn("Suddenly, a voice cries through an intercom.")

		saynn("[say=sci1]Wait! Wait-wait-wait! We can make a deal! There is no need for any more bloodshed![/say]")

		saynn("Looks like you have struck gold. You look around and see that one of the security cameras is nearby. It's watching you and your little friend trying to get inside their shelter.")

		saynn("The initiative is on your side.. so you just stare at the camera silently, your head tilted ever so slightly to the side, your plasma rifle resting on your shoulder.")

		saynn("[say=sci1]A ship! We have a spaceship! An escape pod! We will let you take it! Just.. Just call them off![/say]")

		saynn("You continue to say nothing. The banging that's happening behind you is enough of a statement.")

		saynn("The metal barrier starts to bend from the crazy onslaught. The tentacles manage to break it enough to slip one of the tentacles under it and start trying to pull it up instead.")

		saynn("[say=sci2]Please.. I didn't.. I never wanted to.. I was just doing my.. please..[/say]")

		saynn("The girl's pleading.. It makes you sigh.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
