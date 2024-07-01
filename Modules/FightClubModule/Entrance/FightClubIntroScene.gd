extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "FightClubIntroScene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "stand")
		GM.pc.setLocation("fight_entrance")
		aimCameraAndSetLocName("fight_entrance")

	if(state == ""):
		saynn("You walk through the maintenance hatch and see a dark corridor leading into a set of stairs. As you walk further you notice that all the lights are either broken or barely emitting anything. The guy closes the hatch behind you, the metal screech slightly startling you. When the outside atmosphere of a prison calms down you instead begin to hear some kind of.. white noise. You decide to take it slow and step carefully, who knows, maybe this is a trap.")

		saynn("You reach a set of gloomy stairs and begin going down them. This place is surely some kind of old abandoned area of the prison, lots of trash around suggests that many inmates have been here. You wonder if this corridor could lead to your escape. But alas, the best thing you could hope for is a hole that leads into open space. You do find the source of the white noise though, throughout the walls there is lots of plumbing, pipes that move hot air around to heat up the cell block. And some of the pipes have sharp metal rods stuck into them, causing them to leak lots of hot steam, probably the reason why you aren’t freezing here.")

		saynn("You duck under the steam and sneak past, continuing to go down the stairs. What is this place..")

		addButton("Continue", "See what happens next", "continue")

	if(state == "continue"):
		playAnimation(StageScene.Solo, "walk")
		aimCameraAndSetLocName("fight_nearentrance")
		addCharacter("announcer")
		
		saynn("The stairs end but the corridor seems to go on forever, you don’t even hear the steam noise anymore. Though you do feel that you are close to something, you hear.. cheering?")

		saynn("As you finally reach the end of the corridor you are suddenly greeted by a huge open space that is crowded with inmates, all kinds of them, reds, lilacs, general block ones. In the middle of this room you spot a fenced off platform that’s raised above the floor with the one side having some kind of balcony that has a great view over the whole thing. This place looks like some kind of arena!")

		saynn("Inside the arena there are two inmates, battling it out. Both of them look like girls with one being a high security inmate and the second one being a lilac. Punches flying left and right while the inmates are glued to the view, cheering and booing when the attacks connect.")

		saynn("You walk further and join the crowd, being curious about the state of the fight. Above you, standing on the balcony is the guy that you met near the entrance. He is holding some kind of bulky microphone that is made to look like a long cane and is also wearing a purple coat above his lilac clothes. He holds the cane near his head.")

		saynn("[say=announcer]The stakes are getting higher! Will the old champ prove that she still got it? Or will this brave lilac manage to humiliate the red?[/say]")

		saynn("Oh yeah, the guy’s low radio voice is perfect for being a commentator.")

		addButton("Watch the fight", "Now this is getting interesting", "watch_the_fight")

	if(state == "watch_the_fight"):
		playAnimation(StageScene.Duo, "stand", {pc = "kait", npc = "avy"})
		# (Avy, dark fox red with a cock)

		# (Kait, Snow leopard lilac girl)
		addCharacter("avy")
		addCharacter("kait")
		aimCameraAndSetLocName("fight_neararena")
		GM.pc.setLocation("fight_neararena")

		saynn("The red lunges forward with her fist out, aiming to hit the other girl in the face. The lilac sees it coming and ducks under it before counter-attacking and scratching the girl’s cheek, causing some blood. Who said the fights are gonna be clean.")

		saynn("The red was so infuriated by it that she lunges forward again and manages to tackle the lilac, pinning her to the floor and straddling before proceeding to pull on her hair painfully. The crowd doesn’t mind though, they only cheer louder as the girl is thrown around the arena. They love it even more when the red rips-open lilac’s shirt, exposing her cute sexy tits with pink nipples.")

		saynn("[say=announcer]Oh yeah, look at that. Girls are fighting like two cats in heat![/say]")

		saynn("[say=avy]Bitch, I will rip your fucking liver out and eat it![/say]")

		saynn("The lilac cries out from pain before finally managing to free her hair and throwing the red off of her by shoving her leg into the red’s chest, causing her to hit the metal fence behind and drop to her knees, defeated. Lilac stands up and quickly fixes her torn clothing, still panting heavily.")

		saynn("[say=kait]And stay down.[/say]")

		saynn("The crowd is divided, some are cheering her to continue and finish the girl. Some are booing about the bet they lost.")

		saynn("[say=announcer]Wow, look at the underdog! It seems that we have a winner! What is she gonna do with the red?[/say]")

		saynn("The crowd quickly forgets about any bets and starts to cheer things like “Fuck her! Rip her clothes off! Degrade her!”. The lilac shows off her fangs as she extends her claws and starts creeping towards the defeated opponent.")

		saynn("But as soon as the lilac gets close, red suddenly reaches for her and gets a firm grasp on her collar before yanking it into the fence. The situation got instantly reversed again. The leopard cries out from sudden pain as she is pinned into the fence, she trashes and manages to get some good scratches on the red but they only seem to make her more angry. The fox manages to shove her full hand under the lilac’s collar, causing it to start choking her. Desperate, the lilac sinks her claws into the other girl’s arm and causes more and more bleeding.")

		saynn("While that is happening, the crowd goes absolutely mental. The announcer spreads his arms and starts talking.")

		saynn("[say=announcer]Didn’t expect that, did you? Welcome! This is The Underground! The place where the only rule is: No rules![/say]")

		saynn("All the while the lilac clearly starts to lose her strength, she gasps for air and gives up trying to claw at the red and instead just holds onto her collar. The red waits until the girl almost loses her consciousness before smacking her head against the fence and letting her collapse onto the floor. The lilac hits the arena and starts gasping more as she finally can breathe again.")

		saynn("But red is not done yet, she puts her leg onto the lilac’s belly, preventing her from being able to curl up and then starts ripping her lilac shirt off, exposing the battered chest. Leopard’s tits are exposed for anyone to see, her pink nipples sway in the air as she is breathing very fast.")

		saynn("[say=kait]I g-give up![/say]")

		saynn("[say=avy]I know.[/say]")

		saynn("[say=announcer]And here we have it! Make some noise for Avy, the best of the best![/say]")

		saynn("While the crowd is busy cheering, Avy rips lilac’s short into a few rags. She takes one and uses it as a makeshift bandage, wrapping around her bleeding wounds. Then she straddles the defeated girl again and uses the rest of the rags to tie lilac’s hands together behind her back and then to gag her.")

		saynn("The lilac tries to resist but one slap on the cheek calms her down, she lies still while the red starts pulling down her lilac shorts too, exposing the panties underneath. Avy roughly rips the panties off and throws them over the fence, for all the horny inmates to try and catch.")

		saynn("[say=avy]Ha, the bitch thought it was a good idea to bring these![/say]")

		saynn("Behind the panties there are some quite nice pink pussy lips, they look tight and barely used. The poor lilac looks terrified. The red leans down to her face and drags her tongue over the girl’s lips. All the while a big knotted cock slips out of her shorts and flops between lilac’s thighs, all the violence seems to turn the red on a lot. Some inmates are surprised, others begin to cheer “Breed! Breed! Breed!”.")

		addButton("Stay", "(Noncon) See what happens next", "stay")
		addButton("Leave", "You don’t wanna see how this ends", "leave")

	if(state == "leave"):
		saynn("You decide that you saw enough. You turn away from the main platform and look around. This place really looks like some old technical room that was later made into some kind of arena.")

		# (scene ends)
		addButton("Continue", "What is this place", "endthescene")


	if(state == "stay"):
		addCharacter("kait", ["naked"])
		playAnimation(StageScene.SexMissionary, "fast", {
			pc = "avy",
			npc="kait",
			pcCum=true, npcCum=true,
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={exposedCrotch=true,hard=true},
		})
		
		saynn("The naked cat tries to crawl away from the fox but these attempts are quickly ended by Avy grabbing lilac’s legs and then raising and pinning them into the floor using her body, getting the girl into a mating press position. She then quickly directs her veiny cock down the girl’s cunt and thrusts inside, causing her knotted cock to spread the sensitive pink folds and slide inside the pussy balls-deep!")

		saynn("The audience goes wild, some begin to pleasure themselves while watching the scene unfold. Some cheer and yell “Fuck her harder! Break the slut!”.")

		saynn("Only some muffled moans can be heard from the lilac while the red starts fucking her, shoving her cock in and out, forcing the cunt to be stretched and make wet noises. Avy gets on all fours and quickly reaches her peak pace, probably ramming her cock so deep that it smashes the girl’s cervix each time.")

		saynn("[say=avy]That’s what you get, bitch! You get my fucking litter![/say]")

		saynn("The crowd keeps yelling “Breed her! Cum inside! Make her pregnant!”. The poor girl can only let out muffled moans and struggle against the restraints while her pink kitty gets pounded hard in the position that is designed for efficient breeding. Such hard pounding makes the girl shift around her spot, her cute breasts bounce up and down when the cock gets rammed inside again and again.")

		saynn("Avy’s knot inflates and she doesn’t think twice before shoving it inside, causing the lilac to arch her back and produce a long muffled moan while her body starts to shiver and shake. She is cumming hard, her eyes roll up, her slit is stretched beyond limits and squirts juices all over the floor.")

		saynn("And Avy still doesn’t stop, she keeps knot-fucking the girl, quickly reaching her own peak. She fully pulls out her canine cock just to ram it back inside with full force, making the tip break through the girl’s cervix and the knot to stretch her folds again. That is when Avy’s balls begin to tense up as her cock starts stuffing that womb full of her virile dickgirl cum. People around are cheering louder while the girl’s belly starts to look more cum-inflated with each second.")

		saynn("Then Avy applies extra force to pull her cock out, using the last waves of cum to cover the girl’s body, cute tits and the face, marking and humiliating her. The leopard is too busy cumming again to react, her body is making an arch, her gaping cunt gushing out cum and more juices.")

		saynn("Avy chuckles watching the girl and then pulls her cock away. She then climbs over the fence, leaving the poor lilac naked and fucked for everyone to see.")

		saynn("Seems like the show is over for now..")

		# (scene ends)
		addButton("Continue", "That was rough", "endthescene")


func _react(_action: String, _args):
	if(_action in ["continue", "watch_the_fight", "stay"]):
		processTime(RNG.randi_range(5, 10) * 60)
	
	if(_action == "stay"):
		getCharacter("kait").cummedInVaginaBy("avy")

	if(_action == "endthescene"):
		#getCharacter("kait").clearOrificeFluids()
		endScene()
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "bulldogfight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		#var wonHow = _result[1]
		
		if(battlestate == "win"):
			setState("if_won")
			addExperienceToPlayer(100)
		else:
			setState("if_lost")
			#addExperienceToPlayer(5)

func getDevCommentary():
	return "I wanted the first time you visit the underground to be special. Kinda like a reward after defeating the bulldog. So I added this scene of fighting between Avy and Kait, they weren't even full characters at that point, just random extras I came up with on the spot..\n\nProbably the first scene with NTR in it? I don't even know, Kait is not a love interest currently as I'm writing this. But she very well might be later. But I was smart enough even back then to add a way to skip the scene ^^. Kait needed to suffer a little to show that she is a strong kitty. Sorry that I made it so she gets fucked, I didn't know she would be a bigger character x3. At least that makes you hate Avy more"

func hasDevCommentary():
	return true
