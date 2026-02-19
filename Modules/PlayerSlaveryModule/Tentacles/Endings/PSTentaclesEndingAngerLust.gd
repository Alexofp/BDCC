extends SceneBase

func _init():
	sceneID = "PSTentaclesEndingAngerLust"

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
		aimCameraAndSetLocName("pstent_fridge")
		saynn("They made a huge mistake, trapping you here with those tentacles. And it's time to make them regret that decision.")

		saynn("You look around.. The door into your cell is probably too strong. Breaking it would take way too long. And even the reinforced windows.. your tentacles aren't strong enough to just bust through those.")

		saynn("Think.. you gotta think.. A thin tentacles presses against your thighs, trembling with barely contained need. Another one wraps loosely around your waist, pulling you closer. They certainly are quite needy.")

		saynn("All you need.. is to get out of this cell.. The tentacles will do the rest.")

		saynn("Hm.. An idea sparks in your mind.")

		saynn("You pull away from the tentacles and open the fridge. Yes.. perfect.")

		saynn("You grab the old chicken.. and then use the injector on it, stuffing it with that weird drug. You don't need the chicken anymore.. but the empty injector could be very useful.")

		saynn("The tentacles are getting horny again.. and slightly annoyed with your shuffling. Their tips are oozing juices everywhere.")

		saynn("[say=pc]You're gonna get a lot of.. hole. I promise you. But right now you need to pretend that you're just a dumb plant, okay?[/say]")

		saynn("They're a little dumb already.. maybe it will work. You pull them back into the nest and do your best gesture of a sleeping person to try to get them to understand.")

		addButton("Continue", "See what happens next", "window")
	if(state == "window"):
		_tentacles.doAnim("sleep")
		aimCameraAndSetLocName("pstent_important")
		saynn("You walk up to the window that has the corridor behind it and wait until one of the guards walks past. You show him the empty injector and point at it, your expression stern.")

		saynn("The guard looks at you.. at the injector.. and at the sleepy tentacles behind you.. and then he says something over his headset.")

		saynn("Seconds later.. the intercom kicks in.")

		saynn("[say=sci1]Oh, already? We're still a little busy with our coffee break. I will send a few guards to bring you here. They will cuff and blindfold you, don't be stupid and obey them.[/say]")

		saynn("You will obey alright.")

		saynn("The door behind you hisses, it begins to unseal itself. Three guards enter the cell, all of them with plasma rifles.. but with a relaxed posture. One approaches you with cuffs, another holds a blindfold.")

		saynn("[say=pc]Finally. Get me out of here, {psTentacles}.[/say]")

		saynn("All the guards look at you with confused expressions behind their helmets. All the while you watch the tentacles rise behind them..")

		addButton("Continue", "See what happens next", "first_group")
	if(state == "first_group"):
		_tentacles.doAnim("glare")
		saynn("The first guard doesn't even have time to scream. A thick, slick tentacle wraps around his helmet and yanks it off.. before stuffing itself into his open mouth. His eyes go wide as his throat bulges, the tendril pushing itself deep, using him like a warm, wet sleeve.")

		saynn("The second guard raises his rifle.. but the tentacles are quick to smack it out of his hands and wrap around him. One particularly horny tentacle would rip some of his armor pieces off and force itself between his legs, down his clenched tailhole. He gasps as the wet tentacle suddenly begins to pump into him.")

		saynn("The third guard.. a girl.. tries to run.. but a tendril catches her ankle and drags her back. She is flipped onto her stomach, her armor torn away like paper.. Before two thick tips find her holes and stretch them wide, fucking her right there.")

		saynn("All of the tentacles are now busy with all the guards.. It certainly is a view. And the sounds.. hearing all of the wet, rhythmic pumping mixed together with muffled moans and groans.. It's cute.")

		saynn("[say=pc]Told. You'd get a lot of hole.[/say]")

		saynn("Suddenly, the alarm kicks in! Someone actually bothered to check the camera.")

		saynn("[say=sci1]What the.. Containment breach, we have a containment breach at cell 5! Code red, code red. All guards, the armory is unlocked, I order you to kill the specimen now. I repeat, shoot to kill![/say]")

		saynn("Time to move.. At least the tentacles seem to be done with their new sextoys.")

		addButton("Continue", "See what happens next", "corridor")
	if(state == "corridor"):
		aimCameraAndSetLocName("pstent_entrance")
		saynn("You step out into the corridor. The tentacles follow you, squeezing through the tight doorframe just in time for the door to begin sealing itself.")

		saynn("More boots are pounding against the concrete flooring..")

		saynn("[say=pc]Get ready.[/say]")

		saynn("You've never shot anything like what you're holding.. but you don't need to be accurate with it anyway.")

		saynn("Guards appear from behind the corner, wearing some kind of advanced armor and with plasma rifles in their hands. You catch their attention and pin them down by shooting plasma bolts in their rough direction.")

		saynn("This gives the tentacles enough time to leap at them, smack their guns away and grab them! They would then proceed to do a similar.. activity.. with them, stripping them naked and stuffing all of their holes!")

		saynn("Many moans and plaps echo around the corridor, the ones who try to crawl away get pulled back into the action, now with an extra tentacle getting shoved down their throats.")

		saynn("[say=pc]Some of you seem to enjoy it. Aw. So many sluts here.[/say]")

		saynn("The pounding continues until the tentacles start pumping each of the guards full of some kind of nectar, their bellies getting visibly bumpier from the sheer amount of it.")

		saynn("[say=pc]Perfect.[/say]")

		saynn("The tentacles leave the panting guards on the floor.. You don't see the reason to kill them, they're clearly not threats anymore.")

		saynn("Time to move on.")

		addButton("Continue", "See what happens next", "show_stuff")
	if(state == "show_stuff"):
		aimCameraAndSetLocName("pstent_scientist_2")
		saynn("You don't even need to point anymore, the tentacles just proceed to ravage through the bio-lab on their own, destroying any equipment in the process, showing their anger.. while you stay behind.")

		saynn("Actually, you decide to split when you notice small colorful signs that are placed on the walls of each intersection. The ones that you were interested in.. say 'docks'.")

		saynn("You run. And you were right.. As soon as you arrive, you see quick glimpses of the two scientists who were trying to board the escape pods.")

		saynn("A few shots from your plasma rifle has made them quickly reconsider. They stop trying to pry the airlocks open.. and instead run somewhere deeper into the bio-lab. Perfect.")

		saynn("After that, you trace your steps back and find the tentacles. It's not hard to find.. You just have to follow the path of.. cum.. nectar.. and fucked-silly guards.")

		saynn("During your exploration, you find more reinforced windows.. a whole row of them, each leaving into a separate containment cell.. just like yours. There are.. things.. inside them. Some have humanoid shapes.. some are just nothing but twisted forms.")

		saynn("Security doors close in front of you.. but the tentacles just smash through them. It takes them a few tries.. but eventually the metal caves.")

		saynn("All the corridors look the same.. but eventually you do reach some kind of checkpoint.. with more guards defending it. You hide behind the corner and take blind shots with your rifle while the tentacles do the.. messy.. work and charge forward.")

		saynn("[say=pc]Neutralize them.[/say]")

		saynn("You hear screams.. followed by thumps.. followed by moans. Makes you smile almost.")

		saynn("Feeling a bit curious, you peek your head out and watch as the tentacles penetrate all of the holes of a poor guard.. before stuffing them full of nectar. The rest are already fucked into submission.")

		saynn("You feel like you're getting close to something.")

		addButton("Continue", "See what happens next", "pleading")
	if(state == "pleading"):
		addCharacter(GM.main.PS.getScientist1CharID())
		addCharacter(GM.main.PS.getScientist2CharID())
		aimCameraAndSetLocName("pstent_near_lastroom")
		saynn("At last, you reach some kind of room.. a room that has gone full lockdown mode, all of its doors and windows are sealed shut.")

		saynn("This.. certainly piques your interest. The tentacles are waiting for you to show the next target. They might not be the smartest.. but it looks like they do understand that they won't be able to get out of here without your help.")

		saynn("You knock on the metal and nod towards the enraged tentacles.")

		saynn("And that's all the convincing they need.")

		saynn("The monster starts smashing into the reinforced blast shutters, trying to break through.")

		saynn("Suddenly, a voice cries through an intercom.")

		saynn("[say=sci1]Wait! Wait-wait-wait! We can make a deal! There is no need for any more bloodshed![/say]")

		saynn("Bloodshed.. they don't know the half of it.")

		saynn("Looks like you have struck gold. You look around and see that one of the security cameras is nearby. It's watching you and your little friend trying to get inside their shelter.")

		saynn("The initiative is on your side.. so you just stare at the camera silently, your head tilted ever so slightly to the side, your plasma rifle resting on your shoulder.")

		saynn("[say=sci1]There is a way out! An escape pod! We will let you take it! Just.. Just call them off![/say]")

		saynn("You continue to say nothing. The banging that's happening behind you is enough of a statement.")

		saynn("The metal barrier starts to bend from the crazy onslaught. The tentacles manage to break it enough to slip one of the tentacles under it and start trying to pull it up instead.")

		saynn("[say=sci2]Please.. I didn't.. I never wanted to.. I was just doing my.. please..[/say]")

		saynn("The girl's pleading.. It makes you smile a bit. She thinks you're coming to kill them.")

		saynn("The doors finally get torn open.")

		addButton("Continue", "See what happens next", "theTalk")

func _react(_action: String, _args):
	var _tentacles:PlayerSlaveryTentacles = GM.main.PS

	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
