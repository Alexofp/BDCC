extends SceneBase

var hasAccess = false
var knowsBull = false
var overstim = 0
var socketLust = 0

func _init():
	sceneID = "SocketHelp4Scene"

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
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
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
		playAnimation(StageScene.Duo, "stand", {pc="socket", npc="bulldog"})
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

		saynn("What do you want to do?")

		addButton("Tickle", "Really tickle Socket", "do_tickle")
		addButton("Grope and rub", "Grope Socket's breasts and rub her pussy", "do_grope_and_rub")
		if (socketLust >= 30):
			addButton("Sex", "Have sex with Socket!", "do_sex")
		else:
			addDisabledButton("Sex", "Socket is too dry for this")
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
		playAnimation(StageScene.Grope, "tease", {pc="socket", npc="pc"})
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

	if(_action == "dop_tickle"):
		overstim += 1

	if(_action == "dop_rub"):
		overstim += 1
		socketLust += 5

	if(_action == "do_tickle"):
		socketLust -= 5
		if(socketLust<0):
			socketLust = 0
		overstim += RNG.randi_range(3, 6)

	if(_action == "do_grope_and_rub"):
		processTime(10*60)
		socketLust += 30
		overstim += RNG.randi_range(3, 6)

	if(_action == "do_grope_cum"):
		socketLust = 0
		overstim += 20

	setState(_action)

func saveData():
	var data = .saveData()

	data["hasAccess"] = hasAccess
	data["knowsBull"] = knowsBull
	data["overstim"] = overstim
	data["socketLust"] = socketLust

	return data

func loadData(data):
	.loadData(data)

	hasAccess = SAVE.loadVar(data, "hasAccess", false)
	knowsBull = SAVE.loadVar(data, "knowsBull", false)
	overstim = SAVE.loadVar(data, "overstim", 0)
	socketLust = SAVE.loadVar(data, "socketLust", 0)
