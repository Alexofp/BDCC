extends SceneBase

var hasAccess = false
var knowsBull = false
var overstim = 0
var socketLust = 0
var shouldCum = false
var npcID = ""
var npc2ID = ""
var npcFuckAnim = StageScene.SexFreeStanding
var willPunish = false

func _init():
	sceneID = "SocketHelp4Scene"

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID
	if(_charID == "npc2"):
		return npc2ID

func _run():
	if(state == ""):
		addCharacter("socket")
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		saynn("You feel like helping a fennec today.")

		saynn("[say=pc]How is your tasklist looking today, Socket? Anything I can help with?[/say]")

		saynn("[say=socket]Oh! Yes, there is something. Another vent to check![/say]")

		saynn("She sounds awfully excited for something so.. boring.")

		saynn("[say=pc]You're gonna get stuck in it again?[/say]")

		saynn("Socket giggles and shrugs.")

		saynn("[say=socket]Depends on how big it is, let's go![/say]")

		saynn("It's never that easy with her, is it.")

		addButton("Follow", "See where she brings you", "socket_walks_into_gym")
	if(state == "socket_walks_into_gym"):
		playAnimation(StageScene.Duo, "walk", {npc="socket", flipNPC=true, npcAction="walk"})
		aimCameraAndSetLocName("hall_elevator")
		GM.pc.setLocation("gym_secret")
		hasAccess = getFlag("FightClubModule.BulldogBypassed", false)
		knowsBull = getFlag("FightClubModule.BulldogFirstTimeHappened", false)
		saynn("You enter the lift with Socket and ride it up to the cellblock.")

		saynn("[say=socket]Seems to be a special vent. I tried looking for it myself but couldn't find it.[/say]")

		saynn("[say=pc]Where is it?[/say]")

		saynn("[say=socket]Somewhere in the gym![/say]")

		if (knowsBull):
			saynn("You realize that you might know what vent she is talking about.")

		else:
			saynn("You think about it for a bit.. Nah, there aren't vents that you know about in the gym.")

		addButton("Follow", "Follow Socket more", "follow_socket_more")
	if(state == "follow_socket_more"):
		playAnimation(StageScene.Duo, "stand", {npc="socket", further=true, npcAction=["stand", "res://Inventory/UnriggedModels/BigWrench/BigWrench.tscn"]})
		aimCameraAndSetLocName("gym_nearbathroom")
		saynn("Socket gets a little lost while walking you through the yard.. but eventually you manage to find the gym.")

		saynn("It's as busy of a place as ever. As soon as Socket takes a single step inside, many eyes instantly get glued to her and her.. exposed forms.")

		saynn("[say=socket]Hey everyone! Don't mind us, just doing some maintenance.[/say]")

		saynn("You feel like you only have so much time before they get horny enough so you better work quickly.")

		saynn("[sayMale]How about you do some maintenance on my COCK![/sayMale]")

		saynn("The audience chuckles hearing that. Socket turns towards the source of the brave voice.")

		saynn("[say=socket]Sure! Let's do some tinkering![/say]")

		saynn("Socket whips her giant wrench out.. and the crowd goes quiet.")

		saynn("[say=socket]Where are you?[/say]")

		saynn("[sayMale]Uh.. I changed my mind.[/sayMale]")

		saynn("Socket turns towards you and shrugs. You shrug back.")

		saynn("[say=socket]Let's look for the vent.[/say]")

		if (knowsBull):
			saynn("You are pretty sure you know which one she is talking about.. but maybe there is another one nearby. Most of the walls here are made up out of greenery which obviously can not house a vent.")

			saynn("You look everywhere, near the gym equipment, under the yoga mats, in the corners. Sadly, there was nothing interesting, just sweaty inmates staring at Socket's ass as she was crawling around everywhere again.")

			saynn("[say=socket]Found anything?[/say]")

			saynn("Might as well tell her and see what happens.")

			saynn("[say=pc]I think you're looking for that one.[/say]")

			saynn("You point at the wall behind some bushes. Wall that has a hidden big hatch on it. A hatch that is protected by a certain someone.")

			saynn("[say=socket]Yes![/say]")

		else:
			saynn("Most of the walls here are made up out of greenery which obviously can not house a vent.")

			saynn("You look everywhere, near the gym equipment, under the yoga mats, in the corners. Sadly, there was nothing interesting, just sweaty inmates staring at Socket's ass as she was crawling around everywhere again.")

			saynn("[say=socket]Found anything?[/say]")

			saynn("[say=pc]Not yet.[/say]")

			saynn("Huh. You try looking behind some tall bushes.. and find something. A wall. But not just a wall. A wall that is guarded by some inmate. He is standing right in front of some hatch.")

			saynn("[say=pc]This might be what you're looking for.[/say]")

			saynn("[say=socket]Yes![/say]")

		addButton("Continue", "See what happens next", "bulldog_talk")
	if(state == "bulldog_talk"):
		addCharacter("bulldog")
		playAnimation(StageScene.Duo, ["stand", "res://Inventory/UnriggedModels/BigWrench/BigWrench.tscn"], {pc="socket", further=true, npc="bulldog"})
		saynn("You and Socket approach the guy that is blocking some maintenance hatch with his body. He reacts to you two by crossing his arms and putting on a very mean face. The maintenance door that he is protecting.. is way bigger this time.")

		saynn("[say=socket]Hi![/say]")

		saynn("No response. The guy just quickly eyes Socket's exposed bits and returns to being still.")

		saynn("[say=socket]I need to check this maintenance vent, can you please stand aside?[/say]")

		saynn("She is so nice.. but the guy just shakes his head.")

		saynn("[say=socket]Just move a little, I don't need much space![/say]")

		saynn("You know for a fact that her words are not correct.")

		if (hasAccess):
			saynn("It's your turn to try.")

			saynn("[say=pc]C'mon, you know me. Just let us past.[/say]")

			saynn("The bulldog stares you deeply into the eyes. She points at you first.")

			saynn("[say=bulldog]You can pass.[/say]")

			saynn("Then he points at Socket.")

			saynn("[say=bulldog]You can't.[/say]")

			saynn("[say=socket]Why not?[/say]")

			saynn("No answer.")

		else:
			saynn("It's your turn to try.")

			saynn("[say=pc]Staff is telling you to move. I think you should move. Otherwise, you know, who knows what will happen.[/say]")

			saynn("The bulldog stares you deeply into the eyes.")

			saynn("[say=bulldog]Uh huh.[/say]")

		saynn("You shrug and turn towards Socket.")

		saynn("[say=pc]Maybe you can let someone else do this one?[/say]")

		saynn("The fennec thinks about it for a second.")

		saynn("[say=socket]But now I'm even more curious to see what's behind![/say]")

		saynn("She walks up closer to the guy.. causing him to tense up. Watching Socket made something else of him tense up too.")

		saynn("[say=socket]C'mon, big guy! I see that you are horny! Wanna tell us what you want and we can try to meet you half-way?[/say]")

		saynn("She winks to him.")

		saynn("[say=bulldog]Fuck off while you still have all the bones in tact.[/say]")

		saynn("[say=socket]That wasn't nice![/say]")

		saynn("Suddenly, Socket whips her giant wrench out and swings it, aiming for his balls.. but stopping just fast enough for the metal tip to tap on his bulge.")

		saynn("[say=socket]Bonk?[/say]")

		saynn("His eyes.. go wide. Even though his crotch wasn't hit, he still grabs onto it, losing any kind of.. composure.. in the process.")

		saynn("[say=bulldog]What the fuck, woman?[/say]")

		saynn("[say=socket]What? You were talking about bones, not me! Also, you're being rude again![/say]")

		saynn("Socket prepares to swing again.. but the guy is quick to step away.")

		saynn("[say=bulldog]Whatever, fuck off.[/say]")

		saynn("[say=socket]Yay, good inmate, thank you.[/say]")

		saynn("[say=bulldog]Yeah, good luck leaving it.[/say]")

		saynn("Socket smiles.")

		saynn("[say=socket]I already got stuck once in these, {pc.name} here will help me if I do![/say]")

		if (hasAccess):
			saynn("You scratch behind your head. You still think that this might not be such a good idea.")

			saynn("[say=pc]You really shouldn't go there, trust me.[/say]")

			saynn("[say=socket]Why not? I have a task and I must complete it![/say]")

			saynn("Well, maybe it will be fine.")

		else:
			saynn("You scratch behind your head. You're not sure how good of an idea this is.")

			saynn("[say=pc]You're sure we should go there?[/say]")

			saynn("[say=socket]Why not? I have a task and I must complete it![/say]")

			saynn("Well, maybe it will be fine.")

		addButton("Follow", "See what happens next", "follow_socket_underground")
	if(state == "follow_socket_underground"):
		aimCameraAndSetLocName("fight_entrance")
		playAnimation(StageScene.Duo, "walk", {npc="socket", flipNPC=true, npcAction="walk"})
		removeCharacter("bulldog")
		saynn("Socket bonks the hatch.. making it open, revealing a deep dark corridor that is heading somewhere.")

		saynn("[say=socket]Oh wow, an adventure.[/say]")

		saynn("She starts following it.. while you follow behind. The hatch behind closes, putting both of you into darkness..")

		saynn("[say=socket]Tell me if you see a leaking pipe![/say]")

		saynn("[say=pc]Hard to see anything really.[/say]")

		saynn("It was hard to miss luckily, a loud hiss guided you to a pipe that had a gaping hole in it.")

		saynn("[say=socket]There it is![/say]")

		saynn("Socket grabs her wrench and starts tightening the pipe before that one, closing it up and making the pressure in it go down.. until the hot gas has stopped escaping it.")

		saynn("[say=socket]Can you hold it please?[/say]")

		saynn("You hold the wrench while Socket replaces the pipe with a new shiny one.")

		saynn("[say=socket]Thanks![/say]")

		saynn("She grabs the wrench back and opens the pipe again.")

		saynn("[say=socket]Yay, no leak. Time to cross it off the list.[/say]")

		saynn("Socket grabs her datapad and marks the task as completed. Huh, for some reason the hiss didn't go away fully though, you both hear it.")

		saynn("[say=socket]Wait. There is probably another leak.[/say]")

		saynn("And so you continue following the dark narrow maintenance corridor that looks very abandoned. The hiss gets louder.. but it also changes pitch. Sounds like.. cheering..")

		addButton("Continue", "See what happens next", "socket_in_underground")
	if(state == "socket_in_underground"):
		aimCameraAndSetLocName("fight_nearentrance")
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		saynn("The corridor ends.. revealing a big open space. It's dimly lit.. but it's easy to see a crowd of inmates standing around some kind of cage.. arena.")

		saynn("[say=socket]Wow.. This was happening underneath the station all this time?[/say]")

		saynn("There is some kind of fight happening so everyone's attention is diverted to it, inmates are cheering loudly after each punch and kick.")

		saynn("[say=socket]That is.. so cool! Should we go look at the fights?[/say]")

		saynn("[say=pc]I don't think the staff members are exactly welcome here. I think we should leave while we..[/say]")

		saynn("[say=announcer]Hey there, sweethearts.[/say]")

		addButton("Continue", "See what happens next", "announcer_talk")
	if(state == "announcer_talk"):
		addCharacter("announcer")
		playAnimation(StageScene.Duo, "stand", {pc="socket", npc="announcer"})
		aimCameraAndSetLocName("fight_neararena")
		if (hasAccess):
			saynn("You turn and see Ans, the guy who runs this place. He is holding a cane, just like always.")

		else:
			saynn("You turn and see a lilac inmate. He is holding a cane which makes him look.. important.")

		saynn("[say=socket]Hi, my name is Socket! You look fancy.[/say]")

		saynn("[say=announcer]Thanks, baby girl. Hah. Your appearance is nothing short of a miracle too. Name is Ans. Not very often do we get staffers here.[/say]")

		saynn("[say=socket]Oh, should I leave?[/say]")

		saynn("He shrugs and spreads his arms wide.")

		saynn("[say=announcer]Somehow you got here. And so, you're welcome to stay in my little paradice. What I don't want is.. other eyes and mouths. And stun batons.[/say]")

		saynn("What a kind guy.")

		saynn("[say=socket]Ohh, you want me to be hush-hush about this place.[/say]")

		saynn("He walks up closer and pats Socket on the back.")

		saynn("[say=announcer]Exactly. You're a smart bean. Would be a shame to see my little secret place gone, all our visitors like it. Just look at them.[/say]")

		saynn("The crowd cheers as one of the opponents finally hits the floor.")

		saynn("[say=avy]Hey, what the fuck is happening?[/say]")

		addButton("Continue", "See what happens next", "avy_appears")
	if(state == "avy_appears"):
		addCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {pc="socket", npc="avy"})
		saynn("A familiar dark-furred foxy jumps over the arena fence and lands on her feet a few meters away from you, the relief of her tensed-up muscles backlit by the bright lighting of the arena.")

		saynn("Her furious eyes glaring at you and Socket.")

		saynn("[say=avy]Why the fuck did you bring a staffer here, you dumb fuck?[/say]")

		saynn("The lilac inmate blocks her path with his cane, preventing the angry foxy from reaching you.")

		saynn("[say=announcer]Calm down, Avy. No one is reporting on us, an agreement was made.[/say]")

		saynn("[say=avy]And you believed her? The bitch will say anything to not get her skull caved in. We're screwed if she walks out of here. Alive.[/say]")

		saynn("Avy points at you.")

		saynn("[say=avy]And you're even more of an idiot than I thought.[/say]")

		saynn("Socket frowns and blinks many times. The whole space smells of.. hostility. Many eyes are now watching you. She starts reaching for her wrench.. just in case.")

		saynn("Ans rubs his chin.")

		saynn("[say=announcer]You think there is a good solution here?[/say]")

		saynn("The foxy cracks her knuckles.")

		saynn("[say=avy]You know the solution. We have to solve her.[/say]")

		saynn("[say=announcer]That's not how we do things.[/say]")

		saynn("[say=avy]Throw her onto the arena. No rules there.[/say]")

		saynn("The guy hums and scratches his chin more, his eyes watching you and Socket slowly back away.. but the crowd is now creating a wall around you.")

		saynn("Seconds feel like minutes. With each passing moment, the air becomes intoxicating.. Just can't get enough of it.")

		saynn("[say=announcer]Is that a VR headset on your head, Socket?[/say]")

		saynn("[say=socket]Um.. Yeah? VR, AR, NR, CyberSpace, everything! It's the best of the best, bleeding edge tech.[/say]")

		saynn("[say=announcer]Have you ever seen hypnovisors that everyone here is using?[/say]")

		saynn("Socket nods many times.")

		saynn("[say=socket]I did! Mine has that program. And more! Do you want it? I'm not sure if I can give it away for free..[/say]")

		saynn("[say=avy]Why are we talking about a useless toy, a single blow to the head will make her forget everything.[/say]")

		saynn("The lilac guy keeps Avy in place, his gaze now directed towards you.")

		saynn("[say=announcer]May you please run that program on Socket's visor? I'm very curious.[/say]")

		saynn("You turn towards Socket. Socket turns towards you.")

		saynn("[say=socket]It has buttons, you will figure it out![/say]")

		saynn("Huh, you didn't even have to convince her.")

		addButton("Headset", "Put the headset on Socket's face", "put_headset_on_socket")
	if(state == "put_headset_on_socket"):
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		saynn("It's worth a shot. You lower Socket's headset so it covers her eyes. Then you find a button to start it..")

		saynn("[sayOther]Initializing.. Success.[/sayOther]")

		saynn("Wow, the headset can talk.")

		saynn("[sayOther]Detected user: Socket. Cyberspace link missing, netrunning module disabled. Ready to receive commands.[/sayOther]")

		saynn("[say=pc]Launch a hypnosis program.[/say]")

		saynn("[sayOther]Access denied.[/sayOther]")

		saynn("Aw.")

		saynn("[say=socket]You have to say 'sudo' before it.[/say]")

		saynn("[say=pc]What? Why?[/say]")

		saynn("[say=socket]Just say it! It's gonna be very cool![/say]")

		saynn("Might as well.")

		saynn("[say=pc]Sudo launch a hypnosis program?[/say]")

		saynn("[sayOther]Launching 'hypnotic_trance.exe'.[/sayOther]")

		saynn("The headset lights up, its cooling system kicking in.")

		saynn("[sayOther]Pausing user's thought process..[/sayOther]")

		saynn("Almost immediately, Socket.. stopped moving. No, she is still standing. So still that she might as well be a mannequin, her breathing is slow and barely noticeable too.")

		saynn("[sayOther]Success. Warning: overstimulation of the wearer's senses while in a paused state might lead to short-term memory loss or corruption. Current chance of memory loss is 0%.[/sayOther]")

		saynn("Wow. You poke Socket's hand.. and it moves a little before freezing up again. You grab her forearm.. and realize that you can now pose her like she is some kind of doll, the fennec will always keep the pose that you are putting her in.")

		saynn("[say=announcer]Interesting. Now we just have to overstimulate her and she should forget about this place.[/say]")

		saynn("Avy cracks her knuckles more.")

		saynn("[say=avy]I can overstimulate her alright.[/say]")

		saynn("[say=announcer]Hold on, babe. I think we can let {pc.him} decide.[/say]")

		addButton("Pinch", "Pinch Socket's skin", "dop_pinch")
		addButton("Tickle", "Tickle Socket a bit", "dop_tickle")
		addButton("Rub", "Rub Socket between the legs", "dop_rub")
	if(state == "dop_pinch"):
		removeCharacter("announcer")
		removeCharacter("avy")
		saynn("Might as well try something simple. You move your hand to her belly and dig your digits into her fur.. before pinching her. Zero reaction from Socket, she is standing completely still.")

		saynn("[sayOther]Current chance of memory loss is 1%.[/sayOther]")

		saynn("Huh. You will have to do way more than that.")

		addButton("Continue", "See what happens next", "ov_menu")
	if(state == "dop_tickle"):
		removeCharacter("announcer")
		removeCharacter("avy")
		saynn("Might as well try something simple. You move your hands to her sides.. and tickle her a bit. You get zero reaction back, Socket looks completely unaffected by the tickling.")

		saynn("[sayOther]Current chance of memory loss is 1%.[/sayOther]")

		saynn("Huh. It did something. But you will have to do way more than that.")

		addButton("Continue", "See what happens next", "ov_menu")
	if(state == "dop_rub"):
		removeCharacter("announcer")
		removeCharacter("avy")
		saynn("Might as well try something simple. You put your hand on Socket's crotch and rub her there a little bit. She gets a little wet down there.. but otherwise, there is no reaction.")

		saynn("[sayOther]Current chance of memory loss is 1%.[/sayOther]")

		saynn("Huh. It did something. But you will have to do way more than that.")

		addButton("Continue", "See what happens next", "ov_menu")
	if(state == "ov_menu"):
		aimCameraAndSetLocName("fight_neararena")
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		if (overstim < 60):
			saynn("[sayOther]Current chance of memory loss is "+str(overstim)+"%.[/sayOther]")

		elif (overstim < 100):
			saynn("[sayOther]Current chance of memory loss is "+str(overstim)+"%. Warning: Socket's memory might get corrupted.[/sayOther]")

		else:
			saynn("[sayOther]Current chance of memory loss is "+str(overstim)+"%. Warning! Socket's memory has been corrupted![/sayOther]")

		saynn("Socket's lust is at "+str(socketLust)+".")

		var socketVagina = getCharacter("socket").getBodypart(BodypartSlot.Vagina)
		var womb = socketVagina.getOrifice()
		#var stuffedContents = Util.humanReadableList(womb.getFluidList())
		var uniqueUsers = womb.getUniqueCharactersAmount()
		if (uniqueUsers > 1):
			saynn("Socket's used pussy is leaking seed profusely, she got stuffed by "+str(uniqueUsers)+" people!")

		elif (uniqueUsers > 0):
			saynn("Socket's used pussy is leaking seed.")

		saynn("What do you want to do?")

		addButton("Tickle", "Really tickle Socket", "do_tickle")
		addButton("Grope and rub", "Grope Socket's breasts and rub her pussy", "do_grope_and_rub")
		if (socketLust >= 30):
			addButton("Sex", "Have sex with Socket!", "do_sex")
		else:
			addDisabledButton("Sex", "Socket is not lusty enough for this")
		addButton("Share", "Let someone else play with Socket", "do_share_play")
		if (socketLust >= 30):
			addButton("Share (sex)", "Let someone else fuck Socket", "do_share_sex")
		else:
			addDisabledButton("Share (sex)", "Socket is too dry for this")
		addButton("Slutwall", "Put Socket into the slutwall", "do_put_into_slutwall")
		if (overstim >= 100):
			addButton("Enough", "Socket probably forgot about this place by now", "do_enough")
		else:
			addDisabledButton("Enough", "Socket didn't forget about this place yet")
	if(state == "do_grope_and_rub"):
		playAnimation(StageScene.Grope, "grope", {pc="socket", npc="pc"})
		if (RNG.chance(33)):
			saynn("You get real close to Socket and put your hands on your private bits, hungrily kneading her tits with one while the second is rubbing her pussy. Not a single sound escapes from her, even when you slip two digits inside and start fingering her.")

		elif (RNG.chance(33)):
			saynn("You put your hands on Socket and start to grope and rub her. Your left hand lands on her {socket.breasts} and squeezes them tightly while the other one reaches down to her clit and starts to play with it. As you spread her folds, there is a visible string of juices hanging between them.")

		else:
			saynn("Two of your digits spread Socket's pussy and slide inside, fingering her while the thumb is rubbing her clit. Your free hand cups her modest tits and gropes them a little. There is no audible reaction from the fennec, her paused mind doesn't react to the stimulation at all.")

		if (socketLust >= 100):
			saynn("Socket looks like she is about to cum!")

			addButton("Cum!", "See what happens next", "do_grope_cum")
		else:
			saynn("Socket is gonna cum if you're gonna keep doing this.")

			addButton("Continue", "See what happens next", "ov_menu")
	if(state == "do_grope_cum"):
		playAnimation(StageScene.Grope, "gropefast", {pc="socket", npc="pc"})
		saynn("Socket is not reacting but her body sure is, her pussy is pulsing and making wet noises as you finger her faster, trying to angle your hand so that your digits are hammering away at her g-spot.")

		saynn("And soon enough, Socket's pussy releases a current of fluids! So much that she creased a little puddle on the floor. The crowd is cheering while Socket is squirting.. completely emotionless..")

		saynn("The unprocessed sensation of this strong orgasm gets stored inside her paused mind.")

		addButton("Continue", "See what happens next", "ov_menu")
	if(state == "do_tickle"):
		saynn("You put your hands on Socket's sides and begin to tickle her, moving your digits wildly over her short fur. Her body reflex makes her breathing hitch a little.. while zero noises escape her mouth.")

		saynn("It's probably quite stimulating. But you also notice her body becoming less aroused from the tickling. Probably because she is not into it.")

		addButton("Continue", "See what happens next", "ov_menu")
	if(state == "do_sex"):
		saynn("How do you want to fuck Socket?")

		addButtonWithChecks("Cowgirl", "Make Socket ride your cock", "do_sex_pussy1", [], [[ButtonChecks.HasReachablePenis]])
		addButtonWithChecks("Standing", "Bend Socket over", "do_sex_pussy2", [], [[ButtonChecks.HasReachablePenis]])
		addButtonWithChecks("Rub pussies", "Rub pussies with Socket", "do_sex_trib", [], [[ButtonChecks.HasReachableVagina]])
		addButton("Back", "Never mind", "ov_menu")
	if(state == "do_sex_pussy1"):
		playAnimation(StageScene.SexCowgirl, "sex", {pc="pc", npc="socket", bodyState={naked=true, hard=true}})
		saynn("The crowd is watching you lie down and position Socket just above your waist, her body is obediently listening to your touches as you guide her down to your {pc.penis}, its tip spreading her wet, willing folds with ease.")

		saynn("You make her put her hands on your chest.. and then just start guiding her up and down along your length, fucking her like the emotionless fuckdoll that she is currently is. Her pussy feels way better than any doll though, the warm love tunnel hugging your dick quite well.")

		saynn("One of the inmates is asking if they can fuck her other hole at the same time.")

		addButton("Ignore", "You'd rather fuck her alone", "do_sex_pussy1_fast")
		addButton("Let them", "Let some other inmate fuck her ass at the same time", "do_sex_pussy1_dp")
	if(state == "do_sex_pussy1_fast"):
		playAnimation(StageScene.SexCowgirl, "fast", {pc="pc", npc="socket", bodyState={naked=true, hard=true}})
		saynn("You ignore that inmate's offer and just keep fucking Socket, your hands pulling her down as you thrust your lower body up to meet her arc, shoving your cock deep inside that obedient pussy.")

		saynn("She is not saying anything.. but she doesn't need to, her body does all the talking. The way her hot slick walls are gripping your dick makes it obvious how close she is.. So you increase the pace, literally trying to fuck her memories out.")

		saynn("After some intense thrusts, her body starts to shiver a little, her pussy pulsing hard. Better not to leave any mess..")

		addButton("Cum inside", "Shove a full load into Socket", "do_sex_pussy1_cum")
	if(state == "do_sex_pussy1_cum"):
		playAnimation(StageScene.SexCowgirl, "inside", {pc="pc", npc="socket", bodyState={naked=true, hard=true}})
		saynn("Socket's slit is good at making your cock throb even while her mind is paused, your balls are tensing up as you unload inside her, your thick {pc.cum} flooding her pussy, waves of waves of it.")

		saynn("You make sure to pull her as low as possible, your cock creating a small bump on her belly as you're both orgasming.")

		addButton("Continue", "See what happens next", "ov_menu")
	if(state == "do_sex_pussy1_dp"):
		playAnimation(StageScene.SexDP, "sex", {npc="pc", pc="socket", npc2=npcID, npc2BodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You nod, allowing the inmate to take a spot behind the fuckdoll. {npc.He} grabs Socket's arms and brings them behind her back as {npc.he} spits on {npc.his} {npc.penis} and quickly aligns it with her tight asshole.")

		saynn("There is zero resistance from the engineer as the inmate stretches her anal ring and starts fucking her at the same time as you keep fucking her pussy!")

		addButton("Faster", "Increase the pace", "do_sex_pussy1_dp_fast")
	if(state == "do_sex_pussy1_dp_fast"):
		playAnimation(StageScene.SexDP, "fast", {npc="pc", pc="socket", npc2=npcID, npc2BodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You and the inmate synchronize your thrusts over time, stuffing Socket's holes at the same time. It doesn't take long for her body to start shivering ever so slightly. Not a single moan leaves her body while her pussy and ass start clenching around the intruding cocks.. while you push through.")

		saynn("All the overwhelming pleasure gets stored in her paused mind, hopefully pushing some of the short-term memories out of it.")

		saynn("The way her inner walls squeeze your cocks.. brings both of you close too. And you're not planning to make a mess..")

		addButton("Cum inside", "Stuff Socket's holes full!", "do_sex_pussy1_dp_cum")
	if(state == "do_sex_pussy1_dp_cum"):
		playAnimation(StageScene.SexDP, "inside", {npc="pc", pc="socket", npc2=npcID, npc2BodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You and a random inmate grunt as you shove your cocks deep inside Socket pretty much at the same time, both of you throbbing inside you, stuffing her holes full of thick seed! Not a single drop goes wasted.")

		saynn("After double-penetrating Socket, you carefully pull out, making sure all the {pc.cum} stays inside.")

		addButton("Continue", "See what happens next", "ov_menu")
	if(state == "do_sex_pussy2"):
		playAnimation(StageScene.SexFreeStanding, "sex", {pc="pc", npc="socket", bodyState={naked=true, hard=true}})
		saynn("You bend Socket forward.. And she just obeys your touch. You move her tail out of the way and move her hands behind her. You pull her close as you align your cock with her wet pussy.. before just thrusting inside!")

		saynn("That slick flower welcomes your {pc.penis} by spreading wide and kneading it as you start to fuck her, in front of a full crowd of inmates. No moans leave Socket's mouth as all the sensations get stored in her paused mind.")

		saynn("One of the inmates is offering to spitroast-fuck Socket together.")

		addButton("Ignore", "You'd rather fuck her alone", "do_sex_pussy2_fast")
		addButton("Accept", "Let some other inmate fuck her throat while you fuck her pussy", "do_sex_pussy2_spitroast")
	if(state == "do_sex_pussy2_fast"):
		playAnimation(StageScene.SexFreeStanding, "fast", {pc="pc", npc="socket", bodyState={naked=true, hard=true}})
		saynn("You ignore their offer and just keep fucking Socket, increasing the pace so much that her pussy is now making wet noises each time you ram your cock deep inside, pounding her raw.")

		saynn("Socket's modest tits are bouncing up and down in clear view of everyone, her body eventually starts to shiver a little, her slit gripping your length a little harder, muscles tensing up.")

		saynn("Her orgasm brings you close too. Pulling out would lead to less stimulation.. which is what you want to avoid.")

		addButton("Cum inside", "Stuff Socket's pussy full of cum", "do_sex_pussy2_cum")
	if(state == "do_sex_pussy2_cum"):
		playAnimation(StageScene.SexFreeStanding, "inside", {pc="pc", npc="socket", bodyState={naked=true, hard=true}})
		saynn("You let the ecstatic wave take over, shoving your cock as deep as Socket's pussy allows and letting it throb and shoot strings of {pc.cum} inside, stuffing the fennec full!")

		saynn("Feels so good, her used pussy is providing so much warmth to you.. but eventually you pull out.")

		addButton("Continue", "See what happens next", "ov_menu")
	if(state == "do_sex_pussy2_spitroast"):
		playAnimation(StageScene.SexSpitroast, "sex", {npc="pc", pc="socket", npc2=npcID, npc2BodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Why not, you agree to the offer. The inmate puts {npc.his} hands on Socket's arm and neck, supporting her, while you grab her hips and lift her off the floor.")

		saynn("You slide your cock inside Socket's pussy again and start pounding her while the inmate uses {npc.his} to carefully part her lips and start fucking her mouth instead.")

		saynn("Yeah, that's a much more efficient way to stimulate the fennec, her paused mind gets flooded with waves of stimulation, her slick inner walls kneading your cocks nicely.")

		addButton("Faster", "Fuck her faster", "do_sex_pussy2_spitroast_fast")
	if(state == "do_sex_pussy2_spitroast_fast"):
		playAnimation(StageScene.SexSpitroast, "fast", {npc="pc", pc="socket", npc2=npcID, npc2BodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You synchronize over time, allowing you and the inmate to fuck Socket faster and more efficiently, cocks stretching her pussy and throat. Even though the inmate is pretty much face-fucking Socket, there are zero complains from her, only wet slurps of her throat as she is forced to deepthroat {npc.him}.")

		saynn("Very soon, her inner walls start clenching tightly around the intruding cocks, the slight shivering shows that the fennec is cumming hard, her orgasm is pushing you to your peaks as well..")

		addButton("Cum inside", "Stuff Socket full of seed", "do_sex_pussy2_spitroast_cum")
	if(state == "do_sex_pussy2_spitroast_cum"):
		playAnimation(StageScene.SexSpitroast, "inside", {npc="pc", pc="socket", npc2=npcID, npc2BodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You ram your throbbing cocks as deep as Socket's holes allow.. before proceeding to pump her full of your {pc.cum}! That pussy is clenching around your length so hard that you feel your balls tensing up as they get milked dry.")

		saynn("Socket is holding her breath no problem, her throat blocked by a {npc.penis}. And yet, it's probably best to let her breathe. You pull out and carefully set her back on her feet, the inmate giving her a small pat on the head before going away.")

		addButton("Continue", "See what happens next", "ov_menu")
	if(state == "do_sex_trib"):
		playAnimation(StageScene.SexTribadism, "sex", {pc="pc", npc="socket", bodyState={naked=true}})
		saynn("You know exactly how to please a girl. So it's time to put up a show for the crowd.")

		saynn("Carefully, you bring Socket down, making her lie on her back. The fennec is fully obedient to your touch.. while also holding any pose that you put her into.")

		saynn("After settling her down, you sit down and interlock legs with her, your wet pussies kissing each other.")

		saynn("Inmates cheer as you start to grind slits with Sockets, your clits rubbing together, your sensitive folds exchanging juices.")

		addButton("Faster", "Scissor Socket faster", "do_sex_trib_faster")
	if(state == "do_sex_trib_faster"):
		playAnimation(StageScene.SexTribadism, "fast", {pc="pc", npc="socket", bodyState={naked=true}})
		saynn("Moans escape your lips while Socket is completely silent and emotionless.. and yet, her twitching wet pussy is making you eager to grind slits faster. Warmness spreads throughout your whole body, irradiating from between your legs. Feels so good, you can't stop..")

		saynn("Inmates are cheering watching you scissor with a girl, this amount of stimulation is sure to mess with Socket's mind.. because it does with yours.")

		saynn("Your stifled love noises become louder, your body shivering..")

		addButton("Cum", "The orgasm draws near", "do_sex_trib_cum")
	if(state == "do_sex_trib_cum"):
		playAnimation(StageScene.SexTribadism, "tease", {pc="pc", npc="socket", bodyState={naked=true}})
		saynn("The orgasm finally catches up with you and Socket, your pussies are twitching and dripping transparent juices while you throw your head back and moan passionately. The fennec is quiet but you just.. feel.. that her orgasm is just as strong, her body is shivering ever so slightly.")

		saynn("You rest like that together, warming each other's slits.. before you pull away and help her to get up again.")

		addButton("Continue", "See what happens next", "ov_menu")
	if(state == "npc_grope"):
		playAnimation(StageScene.Grope, "grope", {pc="socket", npc=npcID})
		saynn("One of the inmates steps out of the crowd that has surrounded you and then puts {npc.his} hands on a motionless Socket, rubbing and groping her. {npc.His} digits quickly slide down her round fluffy curves and find her pussy that {npc.he} blatantly starts to play with.")

		saynn("The fennec doesn't react much but her pussy does get more wet from her clit being rubbed, her nips looking quite hard.")

		if (shouldCum):
			saynn("Soon enough, Socket's legs start to shiver a bit. Without producing a noise, she cums, her pussy muscles tensing up.")

		else:
			saynn("If they keep it up, soon enough Socket will cum from it.")

		addButton("Continue", "See what happens next", "ov_menu")
	if(state == "npc_gropefast"):
		playAnimation(StageScene.Grope, "gropefast", {pc="socket", npc=npcID})
		saynn("A brave inmate approaches Socket and goes straight for her pussy! Without much shame, {npc.he} spreads her folds and penetrates them with {npc.his} digits before wiggling them inside a bit.")

		saynn("{npc.He} then proceeds to finger Socket in front of the whole crowd, at a pace that makes her slit produce wet noises.")

		if (shouldCum):
			saynn("{npc.His} digits find Socket's g-spot and hammer away at it.. until the fennec finally squirts, her pussy releasing a stream of transparent juices.. followed by her legs shaking a little. That sure was a nice orgasm.")

		else:
			saynn("The fur on the inner side of Socket's thighs looks wet.. she is getting quite horny even if her body language doesn't exactly portray it.")

		addButton("Continue", "See what happens next", "ov_menu")
	if(state == "npc_gropebreasts"):
		playAnimation(StageScene.BreastGroping, "grope", {pc=npcID, npc="socket"})
		saynn("One of the {npc.girl}s puts the willing Socket on her knees before putting {npc.his} hands on her breasts and proceeding to play with them! The palms fondle and squeeze the soft orbs while the digits rub and pinch her nips that only get harder from the stimulation.")

		if (getCharacter("socket").canBeMilked()):
			saynn("{npc.He} finds soon enough that Socket is actually lactating, her {socket.breasts} leaking some breast milk while getting squeezed.")

		else:
			saynn("Socket is not lactating, her breasts do not produce any milk.. but it is still quite pleasurable for her for sure, her pussy looks wet!")

		if (shouldCum):
			saynn("And, somehow, Socket cums, her pussy is twitching a little and clenching around a cock that's not there.")

		else:
			saynn("Keep it up and she must just cum from this.")

		addButton("Continue", "See what happens next", "ov_menu")
	if(state == "npc_grindface"):
		playAnimation(StageScene.SexOral, "lick", {pc=npcID, npc="socket", bodyState={naked=true, hard=true}})
		saynn("One of the {npc.girl}s grabs Socket by the hair and pulls her down until she is on her knees. Then {npc.he} exposes {npc.his} own pussy slit and presses Socket's face against it.")

		saynn("The fennec doesn't complain at all while the inmate starts pulling her face along that pussy, spreading the juices over Socket's short fur.")

		if (RNG.chance(50)):
			saynn("And soon enough, the inmate cums, {npc.his} pussy twitching visible while {npc.he} is moaning cutely.")

		else:
			saynn("The inmate tries to cum from it but Socket doesn't use her tongue, meaning there is not enough stimulation for {npc.him}.")

		addButton("Continue", "See what happens next", "ov_menu")
	if(state == "npc_balls"):
		playAnimation(StageScene.SexOral, "tease", {pc=npcID, npc="socket", bodyState={naked=true, hard=true}})
		saynn("One of the inmates puts Socket on her knees and presses her face against {npc.his} crotch, smiling a little while {npc.his} {npc.penis} is quickly getting hard from feeling her warm breath.")

		saynn("{npc.He} is enjoying dragging Socket's face along {npc.his} length and pressing her nose into {npc.his} balls.")

		saynn("Not exactly stimulating Socket's pussy.. but sniffing and feeling that inmate's cock is sure stimulating her senses.")

		addButton("Continue", "See what happens next", "ov_menu")
	if(state == "npc_fuck"):
		if (RNG.chance(33)):
			npcFuckAnim = StageScene.SexFreeStanding
			playAnimation(npcFuckAnim, RNG.pick(["sex", "fast"]), {pc=npcID, npc="socket", bodyState={naked=true, hard=true}})
			saynn("One of the inmates grabs Socket's hands and pulls her onto {npc.his} hard {npc.penis}, which spreads her slit wide and gets shoved inside.")

			saynn("The whole crowd is watching Socket being fucked.")

		elif (RNG.chance(33)):
			npcFuckAnim = StageScene.SexAllFours
			playAnimation(npcFuckAnim, RNG.pick(["sex", "fast"]), {pc=npcID, npc="socket", bodyState={naked=true, hard=true}})
			saynn("Socket is being put on all fours by one of the inmates that then takes a spot behind her. {npc.He} quickly whips {npc.his} {npc.penis} out and quickly aligns it with that fennec's pussy. One rough thrust and {npc.he} is inside, already railing her cunt.")

			saynn("The whole crowd is watching Socket being fucked. All the while she doesn't even moan, just obediently taking the rough pounding.")

		else:
			npcFuckAnim = StageScene.SexBehind
			playAnimation(npcFuckAnim, RNG.pick(["sex", "fast"]), {pc=npcID, npc="socket", bodyState={naked=true, hard=true}})
			saynn("One of the inmates pulls Socket down and pins her against the floor, already aligning {npc.his} {npc.penis} against her pussy and ramming it deep inside, stretching her wet willing slit wide.")

			saynn("Crowd is cheering while {npc.he} is fucking the emotionless Socket fast while she doesn't produce a noise, just obediently taking the pounding.")

		addButton("Continue", "See what happens next", "npc_fuck_cum")
	if(state == "npc_fuck_cum"):
		playAnimation(npcFuckAnim, "inside", {pc=npcID, npc="socket", bodyState={naked=true, hard=true}})
		if (RNG.chance(50)):
			saynn("The inmate grunts as {npc.he} stuffs Socket's pussy full of {npc.his} thick {npc.cum}! The engineer's legs are only shaking a little while she is being pumped full of spunk.")

		else:
			saynn("Socket's pussy gets stuffed full of that inmate's seed as they both reach their peaks, the fennec pretty much ignoring it, only her legs shaking a little.")

		addButton("Continue", "See what happens next", "ov_menu")
	if(state == "npc_bj"):
		playAnimation(StageScene.SexOral, RNG.pick(["sex", "fast"]), {pc=npcID, npc="socket", bodyState={naked=true, hard=true}})
		saynn("One of the inmates is feeling risky. {npc.He} puts Socket on her knees and slides {npc.his} {npc.penis} past her lips, making her open her mouth.")

		saynn("The inmates puts {npc.his} hand on Socket's head and starts to guide it along {npc.his} length, making her suck {npc.him} off! Even when the inmate is being a little rough and forces Socket to deepthroat, the girl is taking it without a problem, her throat bulging a little on each thrust.")

		addButton("Continue", "See what happens next", "npc_bj_cum")
	if(state == "npc_bj_cum"):
		saynn("The inmate grunts as {npc.his} cock is throbbing inside Socket's throat and sending waves after waves of thick {npc.cum} down it, no swallowing required.")

		saynn("Socket doesn't close her lips even after {npc.he} pulls out, instead presenting her empty mouth to everyone. Such a good girl.")

		addButton("Continue", "See what happens next", "ov_menu")
	if(state == "npc_dp"):
		if (RNG.chance(50)):
			npcFuckAnim = StageScene.SexSpitroast
			playAnimation(npcFuckAnim, RNG.pick(["sex", "fast"]), {pc="socket", npc=npcID, npc2=npc2ID, npcBodyState={naked=true, hard=true}, npc2BodyState={naked=true, hard=true}})
			saynn("One inmate steps out to play with Socket.. but then another one does it too. Rather than fighting for it, they decide to share the girl, one of them takes her by the hips and starts fucking her pussy raw while the second one is using her throat instead.")

			saynn("The crowd is cheering while watching the two inmates spitroast Socket.")

		else:
			npcFuckAnim = StageScene.SexDP
			playAnimation(npcFuckAnim, RNG.pick(["sex", "fast"]), {pc="socket", npc=npcID, npc2=npc2ID, npcBodyState={naked=true, hard=true}, npc2BodyState={naked=true, hard=true}})
			saynn("Two horny inmates step out of the crowd.. and put Socket on her knees. One of them lies under her and makes her ride {npc.his} cock while the second inmate aligns {npc2.his} member with her {anus} instead.")

			saynn("The crowd is cheering while watching Socket being double-penetrated.")

		addButton("Continue", "See what happens next", "npc_dp_cum")
	if(state == "npc_dp_cum"):
		playAnimation(npcFuckAnim, "inside", {pc="socket", npc=npcID, npc2=npc2ID, npcBodyState={naked=true, hard=true}, npc2BodyState={naked=true, hard=true}})
		if (npcFuckAnim == StageScene.SexDP):
			saynn("It doesn't take long for Socket to cum, the two cocks fucking her holes make her start clenching, her stretched cunt pulsing, her legs shivering. In turn, the extreme tightness makes the inmates grunt, they shove their cocks deep inside and stuff her ass and pussy full of thick spunk.")

			saynn("After that, they carefully pull out and get Socket up on her feet. She stands still like nothing happened.. just with her used fuckholes dripping.")

		else:
			saynn("After having her pussy and throat fucked for some time, Socket cums, her arms and legs shivering ever so slightly, slit clenching hard. The extreme tightness makes the inmates grunt, they shove their cocks deep inside and stuff her belly and pussy full of virile seed.")

			saynn("After that, they carefully pull out and get Socket up on her feet. She stands still like nothing happened.. just with her used pussy dripping.")

		addButton("Continue", "See what happens next", "ov_menu")
	if(state == "npc_trib"):
		playAnimation(StageScene.SexTribadism, RNG.pick(["sex", "fast"]), {pc=npcID, npc="socket", bodyState={naked=true}})
		saynn("One of the inmates pulls Socket down and interlocks legs with her. After that, {npc.she} proceeds to grind pussies with the fennec, offering a nice show to other inmates.")

		saynn("Their lady bits are kissing each other, exchanging juices and stimulation that makes the inmate moan cutely.")

		addButton("Continue", "See what happens next", "npc_trib_cum")
	if(state == "npc_trib_cum"):
		playAnimation(StageScene.SexTribadism, "tease", {pc=npcID, npc="socket", bodyState={naked=true}})
		saynn("Soon, the dual orgasm overwhelmes them both. Socket's and inmate's pussies are pulsing and rubbing against each other hard, their bodies shivering, passionate moans escaping the inmate's mouth while the fennec is being emotionless about it.")

		saynn("After that, the inmate makes Socket stand up again, the fur on her inner thighs looking quite wet.")

		addButton("Continue", "See what happens next", "ov_menu")
	if(state == "do_put_into_slutwall"):
		playAnimation(StageScene.Duo, "stand", {npc="socket", npcBodyState={leashedBy="pc"}})
		saynn("You notice that in one of the corners of this space there is a wall.. a special kind of wall. One that has holes big enough to fit a person. The make-shift plate above it calls it a 'slutwall'.")

		saynn("Some spaces are vacant in it. So why not use this opportunity and let others have fun with Socket while also helping her forget about this place.")

		saynn("You find a chain leash in Socket's backpack and click it to her 'armor'. After that, you carefully maneuver through the thick crowd of the inmates, some are already excited about where you are heading with her.")

		saynn("Socket follows you even though her mind is somewhere else entirely, her body reflexes are not letting her fall.")

		addButton("Slutwall", "Put Socket into it", "secure_socket_in_slutwall")
	if(state == "secure_socket_in_slutwall"):
		aimCameraAndSetLocName("fight_slutwall")
		playAnimation(StageScene.Slutwall, "idle", {pc="socket"})
		saynn("You bring Socket to the slutwall and begin to carefully secure her into one of the unoccupied holes. The chains help to keep her legs spread, putting her pussy out on full display.")

		saynn("After doing that, you grab a marker and write 'Free Use!' on a piece of cardboard that's near the hole, taking credits for fucking a spaced out girl doesn't seem fair..")

		addButton("Continue", "See what happens next", "ov_slut_menu")
	if(state == "ov_slut_menu"):
		aimCameraAndSetLocName("fight_slutwall")
		playAnimation(StageScene.Slutwall, "idle", {pc="socket"})
		if (overstim < 60):
			saynn("[sayOther]Current chance of memory loss is "+str(overstim)+"%.[/sayOther]")

		elif (overstim < 100):
			saynn("[sayOther]Current chance of memory loss is "+str(overstim)+"%. Warning: Socket's memory might get corrupted.[/sayOther]")

		else:
			saynn("[sayOther]Current chance of memory loss is "+str(overstim)+"%. Warning! Socket's memory has been corrupted![/sayOther]")

		var socketVagina = getCharacter("socket").getBodypart(BodypartSlot.Vagina)
		var womb = socketVagina.getOrifice()
		#var stuffedContents = Util.humanReadableList(womb.getFluidList())
		var uniqueUsers = womb.getUniqueCharactersAmount()
		if (uniqueUsers > 1):
			saynn("Socket's used pussy is leaking seed profusely, she got stuffed by "+str(uniqueUsers)+" people!")

		elif (uniqueUsers > 0):
			saynn("Socket's used pussy is leaking seed.")

		saynn("Socket is stuck in the slutwall. There is a queue of inmates that wouldn't mind using her. What do you want to do?")

		addButton("Watch", "Watch someone fuck Socket", "slutwall_watch")
		addButton("Use", "Fuck Socket yourself", "slutwall_fuck")
		addButton("Pull her out", "Enough slutwalls", "pull_socket_out_of_slutwall")
	if(state == "pull_socket_out_of_slutwall"):
		playAnimation(StageScene.Duo, "stand", {npc="socket", npcBodyState={leashedBy="pc"}})
		saynn("You carefully pull Socket out of the slutwall and use a leash to bring her closer to the arena.")

		addButton("Continue", "See what happens next", "ov_menu")
	if(state == "do_enough"):
		addCharacter("announcer")
		playAnimation(StageScene.Duo, "stand", {npc="announcer"})
		saynn("Socket's VR headset says that her short-term memory is corrupted. Which means.. you succeeded. You go ahead and find Ans to let him know.")

		saynn("[say=pc]I think we're done. Socket now should forget about this place.[/say]")

		saynn("He gives Socket a quick glance and then nods.")

		saynn("[say=announcer]You're pretty good at this, babe. Thanks for helping keep us safe. Don't let me hold you a second longer then.[/say]")

		saynn("But just when you were about to leave this place..")

		saynn("[say=avy]Hold on a fucking second.[/say]")

		saynn("That bitch again..")

		addButton("Continue", "See what happens next", "avy_blocks_last")
	if(state == "avy_blocks_last"):
		removeCharacter("announcer")
		addCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		saynn("Avy catches up with you.")

		saynn("[say=pc]What else?[/say]")

		saynn("She inspects Socket and crosses her arms.")

		saynn("[say=avy]The bitch got brainwashed?[/say]")

		saynn("[say=pc]She did, we're leaving.[/say]")

		saynn("Avy's mean eyes shine brightly. She blocks your path and shoves you back.")

		saynn("[say=avy]I want to make sure. I'm not gonna let someone's stupidity ruin this place.[/say]")

		saynn("[say=pc]And how are you gonna do that?[/say]")

		saynn("You notice Avy's shorts bulging in the crotch area..")

		saynn("[say=avy]With my cock. Unlike all these limp dick losers, I can actually fuck someone's brains out.[/say]")

		addButton("Fuck off", "Tell Avy to fuck off", "tell_avy_fuckoff")
		addButton("Allow it", "Allow Avy to 'make sure' Socket is brainwashed", "avy_fucks_socket")
	if(state == "tell_avy_fuckoff"):
		saynn("[say=pc]Fuck off, you're not touching Socket.[/say]")

		saynn("Avy hums. And then raises her fists.")

		saynn("[say=avy]You think so?[/say]")

		saynn("Looks like it's a fight..")

		addButton("Fight", "Start the fight", "start_avy_fight")
	if(state == "won_avy"):
		playAnimation(StageScene.Duo, "stand", {npc="avy", npcAction="defeat"})
		saynn("Avy hits the floor, unable to continue fighting.")

		saynn("[say=avy]Argh.. You lucky slut.[/say]")

		saynn("The crowd is a little disappointed that they won't be able to see a good show.. but then they turn their gazes towards the weak-looking Avy..")

		saynn("[sayMale]Slutwall?[/sayMale]")

		saynn("[say=avy]The fuck are you saying, help me to get up.[/say]")

		saynn("[sayMale]Slut.. wall.. Slut.. Wall. Slutwall. Slutwall![/sayMale]")

		saynn("[say=avy]HEY![/say]")

		saynn("The crowd collectively grabs Avy.. and starts pulling her towards the slutwall.")

		saynn("[say=avy]STOP IT! I WILL RIP YOUR DICKS OUT![/say]")

		saynn("Huh. Looks like you're free to go.")

		addButton("Leave", "Time to go", "socket_pc_leave")
	if(state == "lost_avy"):
		playAnimation(StageScene.Duo, "defeat", {npc="avy"})
		saynn("Defeated, you hit the floor.")

		saynn("[say=avy]Pathetic.[/say]")

		saynn("Looks like Avy is gonna have it her way with Socket..")

		addButton("Watch", "See what happens next", "avy_fucks_socket")
		addButton("Tell Ans", "Maybe he can stop Avy", "avy_gets_cockblocked")
	if(state == "avy_gets_cockblocked"):
		addCharacter("announcer")
		playAnimation(StageScene.SexFullNelson, "tease", {pc="avy", npc="socket", bodyState={naked=true, hard=true}})
		saynn("You rush to Ans and ask him if he can maybe help.")

		saynn("All the while, Avy grabs Socket and lifts her off the floor.")

		saynn("[say=announcer]Avy? What are you doing?[/say]")

		saynn("[say=avy]Can't you see? Fucking this whore's brains out.[/say]")

		saynn("Ans crosses his arms.")

		saynn("[say=announcer]Put her down, babe.[/say]")

		saynn("Avy turns towards you and Ans, presenting her cock and Socket's holes.")

		saynn("[say=avy]And why would I do that? I won a fight, I can do whatever I want, those are the rules here![/say]")

		saynn("[say=announcer]Tell me, was that fight inside the arena?[/say]")

		saynn("Avy stays quiet for some time.. and then starts growling.")

		saynn("[say=announcer]If you don't want to play by the rules, you will not be welcome here, Avy.[/say]")

		saynn("The foxy rolls her eyes.. and starts putting Socket down onto her feet.")

		saynn("[say=avy]Whatever..[/say]")

		saynn("You thank Ans.")

		saynn("[say=announcer]Don't mention it, babe.[/say]")

		saynn("Time to go.")

		addButton("Leave", "Time to go", "socket_pc_leave")
	if(state == "avy_fucks_socket"):
		playAnimation(StageScene.SexFullNelson, "tease", {pc="avy", npc="socket", bodyState={naked=true, hard=true}})
		saynn("You just watch as Avy grabs Socket.. and lifts her off the floor, using her raw strength to bring her knees up to her shoulders and locking hands behind her neck, a very exposed position for the girl.")

		saynn("The dark foxy shakes her shorts off, exposing her {avy.penis} that she already aligns Socket's pussy with. The crowd is watching this performance with great interest.")

		addButton("Continue", "See what happens next", "avy_starts_fucking_socket")
	if(state == "avy_starts_fucking_socket"):
		playAnimation(StageScene.SexFullNelson, "sex", {pc="avy", npc="socket", bodyState={naked=true, hard=true}})
		saynn("[say=avy]Watch and learn, you weak ass betas.[/say]")

		saynn("Avy lowers Socket onto her cock.. while thrusting her hips high, shoving her canine dick down the fennec's slit, stretching her wide.")

		saynn("The engineer is emotionless with that headset on.. but even then you can notice her toes curling in her boots already, the angle that Avy is fucking her at is perfect to hit the pleasure spot.")

		saynn("[sayOther]Warning, high levels of stimulation detected.[/sayOther]")

		saynn("The crowd is cheering and enjoying the show.")

		addButton("Continue", "See what happens next", "avy_fucks_socket_fast")
	if(state == "avy_fucks_socket_fast"):
		playAnimation(StageScene.SexFullNelson, "fast", {pc="avy", npc="socket", bodyState={naked=true, hard=true}})
		saynn("Avy increases the onslaught on Socket's pussy, pounding it so hard that there is now a visible bump on the girl's belly appearing. The knot on the foxy's cock begins to inflate with blood..")

		saynn("[say=avy]Take it, whore![/say]")

		saynn("One rough thrust and Avy rams her whole member down that slit, stretching it with the knot.. until it slips inside. Such an act causes Socket's pussy to clench hard around the cock and release a shower of juices, overstimulation making her squirt.")

		saynn("[sayOther]Warning, overstimulation reached "+str(overstim)+"%![/sayOther]")

		saynn("[say=avy]Shut up, I'm not done.[/say]")

		saynn("Avy grunt as she pulls the knot out.. just to ram it in again.. and again.. Each thrust is making Socket's pussy release more transparent fluids.")

		saynn("But even while Socket is being knot-fucked, not a single noise leaves her mouth, the fennec is taking that dick while staying completely silent.")

		saynn("Avy is grunting more and more though, her dick is visibly twitching..")

		addButton("Continue", "See what happens next", "avy_fucks_socket_cum")
	if(state == "avy_fucks_socket_cum"):
		playAnimation(StageScene.SexFullNelson, "inside", {pc="avy", npc="socket", bodyState={naked=true, hard=true}})
		saynn("Avy shoves her full length inside again and lets it stay there, her cock starts to throb inside and stuff Socket's pulsing pussy with waves of seed, gradually making her belly bigger with each throb, Avy's balls tensing up.")

		saynn("[sayOther]Warning, overstimulation reached "+str(overstim)+"%! Short-term memory is corrupted.[/sayOther]")

		saynn("[say=avy]Ngh.. There we fucking go. This should be enough.[/say]")

		saynn("The crowd is cheering even harder.")

		saynn("Avy yanks the knot out and displays Socket's gaping leaking pussy to everyone around. After that, she puts her onto the floor.")

		saynn("[say=avy]Now get the fuck out of here.[/say]")

		saynn("Time to go.")

		addButton("Leave", "Time to go", "socket_pc_leave")
	if(state == "socket_pc_leave"):
		removeCharacter("avy")
		removeCharacter("announcer")
		aimCameraAndSetLocName("gym_secret")
		GM.pc.setLocation("gym_secret")
		playAnimation(StageScene.Duo, "stand", {npc="socket", npcBodyState={leashedBy="pc"}})
		saynn("You leash Socket and leave the arena, bringing her back to the gym area. You make sure to close the maintenance hatch behind you and step away from it.")

		saynn("Now, your hands reach for her vr headset..")

		addButton("VR headset", "Pull up Socket's headset", "socket_reaction_to_escape")
	if(state == "socket_reaction_to_escape"):
		playAnimation(StageScene.Duo, "stand", {npc="socket", npcAction="struggle", npcBodyState={leashedBy="pc"}})
		saynn("You turn off and carefully pull up Socket's vr headset, revealing her spaced out eyes..")

		saynn("After about ten seconds, the fennec starts to slowly blink.")

		saynn("[say=socket]A..[/say]")

		saynn("She arches her back suddenly.")

		saynn("[say=socket]..h.. ah.. Ah-h-h~..[/say]")

		saynn("Socket lets out a long cute passionate moan, she puts her hands on her crotch, goes cross-eyed and starts panting heavily, her tongue out and drooling.")

		saynn("She stays in this state for a.. while.. moaning and squirming..")

		saynn("[say=pc]Socket?[/say]")

		if (willPunish):
			saynn("[say=socket]..h-hh~.. Yes?.. Where am I.. Why does my butt hurt..[/say]")

		else:
			saynn("[say=socket]..h-hh~.. Yes?.. Where am I..[/say]")

		saynn("Looks like she snapped out of it finally.")

		saynn("[say=pc]We fixed a pipe together.. and then..[/say]")

		saynn("Socket pulls her datapad out and checks the tasklist.")

		saynn("[say=socket]Oh! Wow, cool. I don't remember doing it.[/say]")

		saynn("You shrug.")

		saynn("[say=pc]Well..[/say]")

		if (willPunish):
			saynn("[say=socket]Thank you! I just have to figure out why my butt hurts now..[/say]")

			saynn("Hopefully you will get away with that..")

		else:
			saynn("[say=socket]Thank you! See you around![/say]")

		saynn("Socket waves to you and leaves. She seems to be struggling to walk straight..")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "socket_walks_into_gym"):
		processTime(5*60)

	if(_action == "follow_socket_more"):
		processTime(5*60)

	if(_action == "bulldog_talk"):
		processTime(5*60)

	if(_action == "follow_socket_underground"):
		processTime(5*60)

	if(_action == "socket_in_underground"):
		processTime(5*60)

	if(_action == "announcer_talk"):
		processTime(3*60)

	if(_action == "avy_appears"):
		processTime(3*60)

	if(_action == "put_headset_on_socket"):
		processTime(3*60)
		getCharacter("socket").getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("SocketVisor"))

	if(_action == "dop_pinch"):
		overstim += 1
		getCharacter("socket").clearOrificeFluids()

	if(_action == "dop_tickle"):
		overstim += 1
		getCharacter("socket").clearOrificeFluids()

	if(_action == "dop_rub"):
		overstim += 1
		socketLust += 5
		getCharacter("socket").clearOrificeFluids()

	if(_action == "do_tickle"):
		socketLust -= 5
		if(socketLust<0):
			socketLust = 0
		overstim += RNG.randi_range(3, 6)

	if(_action == "do_grope_and_rub"):
		processTime(10*60)
		socketLust += 30
		overstim += RNG.randi_range(3, 6)

	if(_action == "do_share_play"):
		npcID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [], InmateGenerator.new())
		if(npcID == null || npcID == ""):
			setState("ov_menu")
			return
		addCharacter(npcID)
		var theChar = getCharacter(npcID)
		var possible = ["npc_grope", "npc_gropefast", "npc_gropebreasts"]
		if(theChar.hasReachableVagina()):
			possible.append("npc_grindface")
		if(theChar.hasReachablePenis()):
			possible.append("npc_balls")
		var selectedRand = RNG.pick(possible)
		if(selectedRand in ["npc_grope", "npc_gropefast", "npc_gropebreasts"]):
			overstim += RNG.randi_range(5, 10)
			socketLust += 30
			shouldCum = false
			if(socketLust >= 100):
				socketLust = 0
				shouldCum = true
				overstim += 10
		else:
			overstim += RNG.randi_range(5, 10)
			socketLust += 15
			if(socketLust > 100):
				socketLust = 100
		setState(selectedRand)
		return

	if(_action == "do_share_sex"):
		if(RNG.chance(40)):
			npcID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [[NpcCon.HasPenis], [NpcCon.NoChastity]], InmateGenerator.new(), {NpcGen.HasPenis: true, NpcGen.NoChastity: true})
		else:
			npcID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [], InmateGenerator.new())
		if(npcID == null || npcID == ""):
			setState("ov_menu")
			return
		addCharacter(npcID)
		var theChar = getCharacter(npcID)
		var possible = []
		if(theChar.hasReachablePenis()):
			possible.append("npc_fuck")
			possible.append("npc_fuck")
			possible.append("npc_bj")
			if(RNG.chance(33)):
				npc2ID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [[NpcCon.HasPenis], [NpcCon.NoChastity], [NpcCon.AvoidIDs, [npcID]]], InmateGenerator.new(), {NpcGen.HasPenis: true, NpcGen.NoChastity: true})
				if(npc2ID != null && npc2ID != "" && npc2ID != npcID):
					addCharacter(npc2ID)
					setState("npc_dp")
					return
		
		if(theChar.hasReachableVagina()):
			possible.append("npc_trib")
		
		if(possible.size() == 0):
			setState("npc_grope")
			overstim += RNG.randi_range(5, 10)
			socketLust += 30
			shouldCum = false
			if(socketLust >= 100):
				socketLust = 0
				shouldCum = true
				overstim += 10
			return
		var selectedRand = RNG.pick(possible)
		setState(selectedRand)
		return

	if(_action == "do_put_into_slutwall"):
		processTime(5*60)

	if(_action == "do_grope_cum"):
		socketLust = 0
		overstim += 20

	if(_action == "do_sex_pussy1_fast"):
		processTime(6*60)

	if(_action == "do_sex_pussy1_dp"):
		npcID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [[NpcCon.HasPenis], [NpcCon.NoChastity]], InmateGenerator.new(), {NpcGen.HasPenis: true, NpcGen.NoChastity: true})
		if(npcID == null || npcID == ""):
			setState("ov_menu")
			return
		addCharacter(npcID)

	if(_action == "do_sex_pussy1_cum"):
		processTime(5*60)
		getCharacter("socket").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("socket")
		overstim += RNG.randi_range(10, 25)
		socketLust = 0

	if(_action == "do_sex_pussy1_dp_fast"):
		processTime(5*60)

	if(_action == "do_sex_pussy1_dp_cum"):
		processTime(5*60)
		getCharacter("socket").cummedInVaginaBy("pc")
		getCharacter("socket").cummedInAnusBy(npcID)
		GM.pc.orgasmFrom("socket")
		overstim += RNG.randi_range(15, 25)
		socketLust = 0

	if(_action == "ov_menu"):
		if(npcID != ""):
			removeCharacter(npcID)
			npcID = ""
		if(npc2ID != ""):
			removeCharacter(npc2ID)
			npc2ID = ""

	if(_action == "do_sex_pussy2_fast"):
		processTime(6*60)

	if(_action == "do_sex_pussy2_spitroast"):
		npcID = NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [[NpcCon.HasPenis], [NpcCon.NoChastity]], InmateGenerator.new(), {NpcGen.HasPenis: true, NpcGen.NoChastity: true})
		if(npcID == null || npcID == ""):
			setState("ov_menu")
			return
		addCharacter(npcID)

	if(_action == "do_sex_pussy2_cum"):
		processTime(5*60)
		getCharacter("socket").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("socket")
		overstim += RNG.randi_range(10, 25)
		socketLust = 0

	if(_action == "do_sex_pussy2_spitroast_fast"):
		processTime(5*60)

	if(_action == "do_sex_pussy2_spitroast_cum"):
		processTime(5*60)
		getCharacter("socket").cummedInVaginaBy("pc")
		getCharacter("socket").cummedInMouthBy(npcID)
		GM.pc.orgasmFrom("socket")
		overstim += RNG.randi_range(15, 25)
		socketLust = 0

	if(_action == "do_sex_trib_faster"):
		processTime(3*60)
		GM.pc.rubsVaginasWith("socket")

	if(_action == "do_sex_trib_cum"):
		processTime(5*60)
		GM.pc.orgasmFrom("socket")
		overstim += RNG.randi_range(10, 25)
		socketLust = 0

	if(_action == "npc_fuck_cum"):
		processTime(8*60)
		getCharacter("socket").cummedInVaginaBy(npcID)
		overstim += RNG.randi_range(15, 25)
		socketLust = 0

	if(_action == "npc_bj_cum"):
		processTime(8*60)
		getCharacter("socket").cummedInMouthBy(npcID)
		overstim += RNG.randi_range(5, 15)

	if(_action == "npc_dp_cum"):
		processTime(8*60)
		getCharacter("socket").cummedInVaginaBy(npcID)
		if(npcFuckAnim == StageScene.SexDP):
			getCharacter("socket").cummedInAnusBy(npc2ID)
		else:
			getCharacter("socket").cummedInMouthBy(npc2ID)
		overstim += RNG.randi_range(20, 25)
		socketLust = 0

	if(_action == "npc_trib_cum"):
		processTime(8*60)
		overstim += RNG.randi_range(10, 25)
		socketLust = 0
		getCharacter(npcID).rubsVaginasWith("socket")

	if(_action == "secure_socket_in_slutwall"):
		processTime(6*60)

	if(_action == "slutwall_watch"):
		runScene("GenericSexScene", [NpcFinder.grabNpcIDFromPoolOrGenerate(CharacterPool.Inmates, [], InmateGenerator.new()), "socket", SexType.SlutwallSex], "socket_slutwall")
		getCharacter("socket").addEffect("SexSpacedOut")
		return

	if(_action == "slutwall_fuck"):
		runScene("GenericSexScene", ["pc", "socket", SexType.SlutwallSex], "socket_slutwall")
		getCharacter("socket").addEffect("SexSpacedOut")
		return

	if(_action == "pull_socket_out_of_slutwall"):
		processTime(6*60)

	if(_action == "avy_blocks_last"):
		if(getCharacter("socket").hasEffect(StatusEffect.HasCumInsideAnus)):
			willPunish = true
			setFlag("SocketModule.socketWillPunish", true)
			setFlag("SocketModule.punishReason", "hadcumafterbrainwash")

	if(_action == "start_avy_fight"):
		runScene("FightScene", ["avy"], "avyFight")
		getCharacter("avy").addEffect(StatusEffect.DrugStrong, [3])
		return

	if(_action == "avy_starts_fucking_socket"):
		processTime(5*60)

	if(_action == "avy_fucks_socket_fast"):
		processTime(5*60)
		overstim += 50

	if(_action == "avy_fucks_socket_cum"):
		processTime(5*60)
		getCharacter("socket").cummedInVaginaBy("avy")
		overstim += 50

	if(_action == "socket_pc_leave"):
		processTime(5*60)

	if(_action == "socket_reaction_to_escape"):
		processTime(3*60)
		getCharacter("socket").resetEquipment()

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "socket_slutwall"):
		if(_result.size() < 1):
			return
		var sexresult = _result[0]
		
		if(sexresult.has("subs") && sexresult["subs"].has("socket")):
			var timesCame = sexresult["subs"]["socket"]["timesCame"]
			if(timesCame > 0):
				socketLust = 0
				overstim += 10 * timesCame

	if(_tag == "avyFight"):
		processTime(10 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("won_avy")
			addExperienceToPlayer(50)
		else:
			setState("lost_avy")
			addExperienceToPlayer(5)

func saveData():
	var data = .saveData()

	data["hasAccess"] = hasAccess
	data["knowsBull"] = knowsBull
	data["overstim"] = overstim
	data["socketLust"] = socketLust
	data["shouldCum"] = shouldCum
	data["npcID"] = npcID
	data["npc2ID"] = npc2ID
	data["npcFuckAnim"] = npcFuckAnim
	data["willPunish"] = willPunish

	return data

func loadData(data):
	.loadData(data)

	hasAccess = SAVE.loadVar(data, "hasAccess", false)
	knowsBull = SAVE.loadVar(data, "knowsBull", false)
	overstim = SAVE.loadVar(data, "overstim", 0)
	socketLust = SAVE.loadVar(data, "socketLust", 0)
	shouldCum = SAVE.loadVar(data, "shouldCum", false)
	npcID = SAVE.loadVar(data, "npcID", "")
	npc2ID = SAVE.loadVar(data, "npc2ID", "")
	npcFuckAnim = SAVE.loadVar(data, "npcFuckAnim", StageScene.SexFreeStanding)
	willPunish = SAVE.loadVar(data, "willPunish", false)
