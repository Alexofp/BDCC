extends SceneBase

func _init():
	sceneID = "DomM1OptionalSkarFight"

func _run():
	if(state == ""):
		addCharacter("skar")
		playAnimation(StageScene.Duo, "stand", {npc="skar"})
		saynn("You boldly walk towards the guard who is protecting the big office.")

		saynn("It doesn't take long before he takes note of you. His prosthetic arm is quick to reach for his weapon.")

		saynn("[say=skar]You're not supposed to be here.[/say]")

		saynn("[say=pc]You look bored. Thought I'd offer you some company.[/say]")

		saynn("You spread your arms, a gesture of peace. The guy lowers his gaze a bit, his mechanical jaw moving as he speaks, sprinkling noises of servos into his speech.")

		saynn("[say=skar]Do I look like I need company?[/say]")

		saynn("[say=pc]Yeah, you look bored.[/say]")

		saynn("He raises a brow.")

		saynn("[say=skar]Why shouldn't I just fry your neck right now?[/say]")

		saynn("[say=pc]Because that would be the boring option.[/say]")

		saynn("He stays quiet for some time.")

		saynn("[say=skar]Alright, let's have some fun then.[/say]")

		saynn("Looks like it's a fight!")

		addButton("Fight", "Start the fight", "dom_start_fight")
	if(state == "lost_fight"):
		playAnimation(StageScene.GivingBirth, "idle")
		aimCameraAndSetLocName("solitary_cell")
		saynn("You've lost the fight!")

		saynn("[say=skar]You might have to work on your technique more.[/say]")

		saynn("And so the guy just throws you into solitary after that.")

		saynn("You didn't get any records printed. Looks like you will have to do it all again.")

		saynn("At least you entertained the guard for a bit.")

		saynn("Mission failed!")

		addButton("Continue", "Stop the mission", "stopthemission")
		addButton("Restart", "Try the mission again", "trymissionagain")
	if(state == "won_fight"):
		playAnimation(StageScene.GivingBirth, "idle", {pc="skar"})
		saynn("Miraculously, you've won the fight! The guard is down on the floor, unable to continue fighting.")

		saynn("[say=skar]Ugh.. You won't be able to get to the captain anyway, you know?[/say]")

		saynn("Yeah, looks like this guy is protecting the captain's office. That's nice. But the doors are indeed closed. That's not as nice.")

		addButton("Just leave", "Leave the guard be", "just_leave")
		addButton("Ride (vaginal)", "Might as well ride his cock now!", "start_vag_ride")
	if(state == "just_leave"):
		playAnimation(StageScene.Solo, "stand")
		saynn("[say=pc]Oh well, enjoy your boring life then.[/say]")

		saynn("He tilts his head slightly, watching as you step out of the room.")

		addButton("Continue", "See what happens next", "endsceneposourselves")
	if(state == "start_vag_ride"):
		playAnimation(StageScene.SexCowgirlAmazon, "tease", {pc="skar", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("[say=pc]Who said I wanted to get to the captain? I just wanted to have some fun with you.[/say]")

		saynn("You straddle the guy before he can ever get up, pinning him into the cold floor again. Your hands begin stripping the pieces of his armor. At some point it becomes hard to distinguish them from his mechanical bodyparts.")

		saynn("[say=skar]You're getting yourself into some big trouble.[/say]")

		saynn("[say=pc]What? You're gonna abandon your post and come find me later? Sounds fun.[/say]")

		saynn("[say=skar]Mh.[/say]")

		saynn("After some time, you finally got to his briefs! Pulling them off reveals his sheath. At least his cock isn't made out of cold metal.")

		saynn("[say=skar]Just go grab a lilac, I'm not a fucktoy.[/say]")

		saynn("[say=pc]Shush, fucktoy.[/say]")

		saynn("You rub his sheath, causing his member to slowly start sliding out. The red pointy tip is first, a lonely drop of his pre already shining at the top.")

		saynn("The guy doesn't seem to resist as you get him nice and hard, gently stroking his cock until you see the full length of his red rocket.")

		saynn("Then.. you position yourself over him, your slick pussy lips already brushing against the tip of his cock. He sucks in a sharp breath.. the servos whirring softly. You're just teasing him at first, letting his tip prod your entrance.. before eventually pulling away. His hips twitch involuntarily.")

		saynn("[say=skar]Rubber?[/say]")

		saynn("[say=pc]Shut the fuck up.[/say]")

		addButton("Continue", "See what happens next", "sex_ride")
	if(state == "sex_ride"):
		playAnimation(StageScene.SexCowgirlAmazon, "sex", {pc="skar", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Slowly, you begin to sink down along his length, inch by inch. His cock feels hot.. the tip stretching you perfectly, his veins brushing against your sensitive walls.")

		saynn("[say=skar]Nnh..[/say]")

		saynn("He is twitching inside you, kinda cute. The base of his member isn't as fat at the moment so you manage to get most of his length inside. That's when you start riding him, bringing yourself up and down, his pre coating your pussy while your juices are coating his dick in return.")

		saynn("Now that you're moving, it gives you some time to check his body out. Anywhere you look.. there are old unhealed wounds.. scars if you will. His arms and his jaw are the obvious exceptions.. but even they got quite scratched up.")

		saynn("[say=pc]You have a nice cock.[/say]")

		saynn("[say=skar]Thanks..[/say]")

		saynn("He grunts as your pussy clenches around him. You keep rocking your hips back and forth , letting him feel every part of it. The shaft stimulates your pleasure spot while the tip gives your organic barricade an occasional kiss.")

		saynn("He's getting harder. Thicker. The base of his cock begins to swell.. his knot growing as you ride him.")

		addButton("Faster", "Ride him faster", "ride_faster")
	if(state == "ride_faster"):
		playAnimation(StageScene.SexCowgirlAmazon, "fast", {pc="skar", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You pick up the pace, your thighs smacking against his hips, the sound echoing off the walls.")

		saynn("[say=skar]Nhh.. fuck.[/say]")

		saynn("He tilts his head back, the mechanical jaw hangs slightly open, a low pant escaping him.")

		saynn("Now you're bouncing on him! His cock slides in and out, slick with your juices. The knot is fully formed now.. a thick orb that slaps against your entrance, too fat to fit inside.")

		saynn("[say=skar]You're not gonna fit it..[/say]")

		addButton("Get knotted", "Make him cum inside you!", "get_knotted")
		addButton("Pull out", "Make him cum outside", "pull_out")
	if(state == "get_knotted"):
		playAnimation(StageScene.SexCowgirlAmazon, "inside", {pc="skar", npc="pc", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("[say=pc]Watch me.[/say]")

		saynn("You slam down.. hard.")

		saynn("The knot puts more and more pressure on your pussy entrance.. until it suddenly pops past your folds and gets lodged inside you! Both of you groan at the same time.. him from the sudden tightness.. and you from the feeling of getting stretched so much.")

		saynn("[say=skar]Agh..[/say]")

		saynn("[say=pc]Oh fuck..[/say]")

		saynn("His hips buck upward, driving himself deeper. The knot isn't letting either of you pull away now. His whole body tenses.. his cock pulsing inside you..")

		saynn("And then.. it happens. Thick, hot spurts of cum flood your pussy, pumping your womb full of it. He grunts hard, his hips jerking with each spasm, his mechanical arms scratching the floor.")

		saynn("[say=pc]Yes.. breed me, you fuck..[/say]")

		saynn("Your own orgasm overwhelms you, passionate moans escaping you while your pussy walls are clenching hard around his knotted cock, milking his twitching balls dry..")

		saynn("You keep riding him through it all.. going after every last drop..")

		saynn("When he finally stops twitching, you're both left panting. He starts up at you, his prosthetic eyes are half-shut.")

		saynn("[say=skar]You're insane..[/say]")

		saynn("[say=pc]And you're a good fucktoy.[/say]")

		saynn("You try to lift yourself.. but the knot is still swollen. You're stuck.")

		saynn("[say=skar]Told you.[/say]")

		saynn("He doesn't sound too annoyed even. Almost amused.")

		saynn("[say=pc]We're just gonna wait until you deflate.[/say]")

		saynn("[say=skar]Or until someone spots us.[/say]")

		saynn("Wait, you realize that you don't have a lot of time actually. Failing your mission because you got stuck on some guard's cock.. that sounds kinda funny.. but it's not something that you want to happen.")

		addButton("Continue", "See what happens next", "try_get_off_knot")
	if(state == "try_get_off_knot"):
		playAnimation(StageScene.SexCowgirlAmazon, "tease", {pc="skar", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You give him a few minutes.. but he is still hard. So you go for the other option.")

		saynn("You start trying to get up.. putting more and more strength into it.")

		saynn("[say=skar]Nhh.. too soon.[/say]")

		saynn("[say=pc]Shush. I got places to be.[/say]")

		saynn("Your whole body shivers as that knot is stretching you out again..")

		saynn("And eventually, the thing manages to slide out with a satisfying wet pop.")

		saynn("[say=pc]Ah.. there we fucking go.[/say]")

		saynn("Your pussy stays gaping for a bit longer.. some of his seed gushing out.")

		saynn("[say=pc]So messy. You will clean it up, got it?[/say]")

		saynn("[say=skar]What am I, some kind of maid?[/say]")

		saynn("[say=pc]No, you're a fucktoy.[/say]")

		saynn("[say=skar]That answers your question.[/say]")

		saynn("He's looking a bit more.. lively.. now. Good for him.")

		saynn("You get up and prepare to leave.")

		addButton("Continue", "See what happens next", "endsceneposourselves")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "dom_start_fight"):
		runScene("FightScene", ["skar"], "skarFight")
		return

	if(_action == "stopthemission"):
		processTime(60*60*3)
		endScene()
		GM.pc.setLocation(GM.pc.getCellLocation())
		GM.main.MS.failCurrentMission()

	if(_action == "trymissionagain"):
		endScene()
		GM.main.MS.restartCurrentMission()
		return

	if(_action == "start_vag_ride"):
		GM.main.MS.setFlag("skarOutcome", "ridevag")

	if(_action == "endsceneposourselves"):
		GM.pc.setLocation("cd_last_intersection")
		endScene()
		return

	if(_action == "sex_ride"):
		processTime(5*60)

	if(_action == "ride_faster"):
		processTime(3*60)

	if(_action == "try_get_off_knot"):
		processTime(3*60)

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "skarFight"):
		processTime(10 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			GM.main.MS.setFlag("skarOutcome", "won")
			setFlag("SlaveAuctionModule.firstTimeDom", true)
			setState("won_fight")
			addExperienceToPlayer(50)
		else:
			GM.main.MS.setFlag("skarOutcome", "lost")
			setState("lost_fight")
			addExperienceToPlayer(5)
