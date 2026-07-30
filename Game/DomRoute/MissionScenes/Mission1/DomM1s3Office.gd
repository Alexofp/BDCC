extends SceneBase

func _init():
	sceneID = "DomM1s3Office"

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "stand")
		saynn("You step inside another office. A quick glance tells you that there is a console here.. and it looks like it has a printer attached!")

		saynn("This doesn't mean you're golden yet though. You press a 'power on' button on that console and start waiting.")

		saynn("Some kind of shuffling starts happening outside.. you crouch behind the office desk, hoping you wouldn't get spotted.")

		saynn("The console beeps. Moment of truth.")

		saynn("Yes! You're greeted with a user-friendly-looking menu made out of glowing green letters on top of a black background.")

		addButton("Print!", "Print the records", "do_print")
	if(state == "do_print"):
		saynn("You navigate the menu mostly by typing corresponding numbers of its entries followed by pressing enter..")

		saynn("Personal staff records.. This looks interesting. Too much to print them all.. there are at least a thousand records. This was expected. How to sort them though? Staffers don't exactly have a criminal record.. but they do seem to have a level of access attached to them. That will do.")

		saynn("You sort the list and then send the first two pages to be printed. That's about all you can do with them. This console doesn't have editing rights.")

		saynn("The shuffling gets louder. You hear steps outside.. so you duck and wait it out. The printing takes an agonizingly huge amount of time. This thing was probably never serviced before.. its screeching manages to drown out even the sound of your heartbeat.")

		saynn("[say=pc]C'mon..[/say]")

		saynn("Inmate records are next.. Oh.. there are way more of them. Several thousands. You sort them by the amount of crimes they have committed and skim through the list.. Avy is nowhere to be found. Of course.")

		saynn("You print the first two pages of that as well. Should be enough, you can only spare so much time.")

		saynn("After acquiring everything that you need, you turn off the console, put the papers away and prepare to leave..")

		addButton("Continue", "See what happens next", "risha_encounter")
	if(state == "risha_encounter"):
		addCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {npc="risha"})
		saynn("[say=risha]Tsk, tsk, tsk. What do we have here?[/say]")

		saynn("A guard is standing in the doorframe, leaning against the metal, stun baton in her hands. This is not the first time you see this lynx.")

		saynn("[say=risha]I thought I heard a noise. A rat or something. Turns out I wasn't wrong.[/say]")

		saynn("Her giggle illuminates the boring room, her red eyes focused on you. No point in hiding behind the console, you step out and approach the cat.")

		saynn("[say=risha]Didn't I tell you to go hit rocks with a pickaxe?[/say]")

		saynn("[say=pc]I got lost.[/say]")

		saynn("Her mean eyes are drilling you.")

		saynn("[say=risha]Lost, huh? Well, I'm about to lose this stun baton in your ass.[/say]")

		saynn("[say=pc]You're about to make a huge mistake.[/say]")

		saynn("[say=risha]True. Why use a stun baton when I can just use my dick. It's just as painful, haha~.[/say]")

		saynn("She gestures for you to come closer.")

		saynn("Looks like it's a fight.")

		addButton("Fight", "Start the fight", "start_fight")
	if(state == "fight_lost"):
		playAnimation(StageScene.GivingBirth, "idle")
		aimCameraAndSetLocName("solitary_cell")
		saynn("You've lost the fight!")

		saynn("Other guards manage to catch up before Risha has a chance to do anything mean to you. So instead of doing that, she just throws you into solitary.")

		saynn("[say=risha]Nice try. Just kidding. Slut.[/say]")

		saynn("Those papers that you had.. gone.. Looks like you will have to do it all again.")

		saynn("Mission failed!")

		addButton("Continue", "Stop the mission", "stopthemission")
		addButton("Restart", "Try the mission again", "trymissionagain")
	if(state == "fight_won"):
		playAnimation(StageScene.Duo, "stand", {npc="risha", npcAction="defeat"})
		saynn("Risha got defeated! She collapses, unable to continue fighting any longer.")

		saynn("[say=risha]Agh! You bitch![/say]")

		saynn("You're looming over her. The cat reaches for her weapon again but you kick it aside.")

		saynn("[say=risha]Fuck you.. stupid slut..[/say]")

		saynn("You can leave.. or punish her first.. You don't have time for a whole intercouse but you don't have to do much to make that cat regret it.")

		addButton("Just leave", "You don't have punish Risha", "just_leave")
		addButton("E-Stim Penis", "(Rough) Put Risha's stun stick against her prickly stick and see what happens", "estim_pp")
		addButton("E-Stim Vagina", "(Rough) Put Risha's stun stick into her pussy and see what happens", "estim_vag")
	if(state == "just_leave"):
		playAnimation(StageScene.Solo, "stand")
		saynn("You step over the defeated cat and just prepare to leave.")

		saynn("[say=risha]Wow.. just gonna leave me?[/say]")

		saynn("[say=pc]You'd rather get your balls shocked?[/say]")

		saynn("[say=risha]No obviously, duh. But.. Not even a kiss?[/say]")

		addButton("Just leave", "She is not getting anything", "just_leave_actually")
		addButton("Kiss her", "Kiss Risha on the cheek", "kiss_cheek")
		addButton("Bite her neck", "Give that slut some pain", "bite_neck")
	if(state == "just_leave_actually"):
		saynn("You just continue on your way.")

		saynn("[say=risha]Fuck you too then..[/say]")

		saynn("Time to go back to your team.")

		addButton("Continue", "See what happens next", "go_back")
	if(state == "kiss_cheek"):
		saynn("You grab that cat by her armor, pull her closer and give her a little smooch on her cheek.")

		saynn("[say=risha]Oh.. wow.. holy shit, you actually did it. Hah.[/say]")

		saynn("[say=pc]If you want more, you will have to obey me.[/say]")

		saynn("[say=risha]Pfff~. Go fuck yourself.[/say]")

		saynn("Right. Time to go back to your team.")

		addButton("Continue", "See what happens next", "go_back")
	if(state == "bite_neck"):
		saynn("You grab that cat by her armor, pull her closer.. and sink your fangs into the exposed area around her neck.")

		saynn("[say=risha]Ahh-![/say]")

		saynn("The lynx shivers, her whole body squirming as a painful cry leaves her throat.")

		saynn("[say=risha]Enough, you fuck, don't tear the fucking.. ah.. artery.[/say]")

		saynn("You spit her blood.")

		saynn("[say=pc]Here is your kiss, whore.[/say]")

		saynn("Risha puts her paw over the new wound, still panting painfully.")

		saynn("[say=risha]Mmh.. shit, that felt weird.[/say]")

		saynn("Right. Time to go back to your team.")

		addButton("Continue", "See what happens next", "go_back")
	if(state == "estim_pp"):
		playAnimation(StageScene.Zonked, "cum", {pc="risha", npc="pc", bodyState={naked=true, hard=true}, pcCum=true})
		saynn("You lean down and snatch the stun baton from where you kicked it. Risha's red eyes widen slightly as she watches you examine the weapon, your thumb hovering over the button that would activate it.")

		saynn("[say=risha]What are you.. No, don't you fucking dare steal my shit. I will pound you senseless then, I swear.[/say]")

		saynn("You grab her by the armor and throw her back to the ground, forcing another groan out of her. While she is stunned, you take off some pieces.. revealing her half-hard feline cock.")

		saynn("[say=risha]Gonna ride me, huh? Go ahead, slut.[/say]")

		saynn("Instead, you press the rod against the shaft.. and press the button.")

		saynn("[say=risha]AAGH-!..[/say]")

		saynn("Her whole body convulses, back arching off the cold floor. The stun baton crackles and sends electricity through that poor member. You watch as Risha's barbed cock goes from semi-soft to painfully erect in seconds.")

		saynn("[say=risha]Fuck![/say]")

		saynn("Her balls start tensing up too. You've pulled the weapon away already but that impulse was enough.. Thick, ropey cum blasts from the tip of her cock, splattering across her stomach. Then another.. and another.. Her ballsack visibly contracts with each pulse, draining completely as the electricity quickly tired her muscles out.")

		saynn("[say=risha]S-stop.. I'm.. I can't.. F-fuck.. ahh..[/say]")

		saynn("The poor lynx is squirming, her hips bucking uncontrollably. Her cock goes soft soon after.. but it's still shooting weak spurts of her seed. Behind it, her slit is spasming too.. transparent juices gushing from her cunt.")

		saynn("[say=pc]If you want more, just ask.[/say]")

		saynn("[say=risha]..fuck.. you..[/say]")

		saynn("She can barely get the words out.")

		saynn("The stun baton is spent.. so you throw it to the side.")

		saynn("Time to go back to your team.")

		addButton("Continue", "See what happens next", "go_back")
	if(state == "estim_vag"):
		playAnimation(StageScene.Zonked, "cum", {pc="risha", npc="pc", bodyState={naked=true, hard=true}, pcCum=true})
		saynn("You lean down and grab the stun baton. Risha's red eyes follow your movements, watching as you wrap your fingers around the rubber grip.")

		saynn("[say=risha]What are you.. Don't you fucking dare steal my shit.[/say]")

		saynn("Instead of answering, you grab her by the armor and throw her again, forcing another groan out of her. While she is stunned, you strip some of her armor pieces, exposing her package.. as well as the pussy slit that's hiding behind it.")

		saynn("[say=risha]What are you doing, slut..[/say]")

		saynn("You press the fat tip of the stun baton against her vaginal entrance. Risha hisses as you try to work the first part in.")

		saynn("[say=risha]You're not gonna turn it on, are you? Don't you fucking dare, I'm serious, I will fucking kill you.[/say]")

		saynn("You don't say anything and just keep going, gradually stretching her slit with the weapon.. and then proceeding to thrust it in and out of her. Risha's hips begin to rock back to meet each push, greedy little sounds escaping her throat.")

		saynn("[say=risha]Why aren't you saying anything, you fuck.. ah.. s-shit.[/say]")

		saynn("You slam the baton into her cunt with more force. Her claws scrape against the concrete floor, her cock leaving its sheath fully and is now bobbing back and forth and as you fuck her with the stun baton, using it as a dildo.")

		saynn("Her breathing gets ragged, her whole body starts tensing up. She is right on the edge.")

		saynn("That's when you press the button.")

		saynn("[say=risha]AAGh-! F-FUCK![/say]")

		saynn("You press it right as her orgasm peaks. The electricity crackles through the metal.. straight into her most sensitive flesh. Risha screams.. her cry is half-agony, half-ecstasy. Her back is arching hard.")

		saynn("[say=risha]STOP STOP STOP F-FUCK-![/say]")

		saynn("Her cunt spasms violently around the baton, gushing fluids down its length. Waves of electricity and pleasure crash through her, making her shake uncontrollably, her cock wasting its load, her balls getting milked dry. Her eyes are wide, tears begin streaming down her face.")

		saynn("When you finally pull the thing out, she arches her back again and then collapses flat. Her pussy is still twitching.")

		saynn("[say=risha]..you're.. fucking insane.[/say]")

		saynn("Her voice is barely a whisper. She can't seem to even lift her head.")

		saynn("[say=pc]Slut.[/say]")

		saynn("You toss the spent baton aside.")

		saynn("Time to go back to your team.")

		addButton("Continue", "See what happens next", "go_back")
	if(state == "go_back"):
		setCharacters([])
		playAnimation(StageScene.Solo, "stand")
		aimCameraAndSetLocName("hall_elevator")
		saynn("You rush back through the many command deck's corridors and get into the elevator.")

		saynn("The badge seems to still work.. so you use it to make the lift go down to the cellblock.")

		addButton("Continue", "See what happens next", "kait_nova")
	if(state == "kait_nova"):
		setCharacters(["avy", "kait", "nova", "rahi"])
		aimCameraAndSetLocName("main_bench2")
		playAnimation(StageScene.Duo, "stand", {pc="kait", npc="nova"})
		GM.pc.setLocation("main_bench2")
		saynn("[say=nova]What's your problem, inmate?[/say]")

		saynn("[say=kait]You really should stay here for now.[/say]")

		saynn("[say=nova]Why? That kitty cat is doing well, I made sure.[/say]")

		saynn("Nova tries to walk past Kait, heading towards the checkpoint.. but the snow leopard keeps getting in the way.")

		saynn("[say=nova]Now you're being kinda annoying, you know that?[/say]")

		saynn("She pulls her stun baton out.. while her other paw is hovering just above the shock remote.")

		saynn("[say=nova]Step aside, at once.[/say]")

		saynn("The tension is rising fast.")

		saynn("That's when Avy nudges your side.")

		addButton("Continue", "See what happens next", "avy_offer")
	if(state == "avy_offer"):
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		saynn("[say=avy]You got the papers?[/say]")

		saynn("[say=pc]Yeah. Here is the badge, tell Rahi to put it back onto that guard. I will tell Kait she can stop blocking the path.[/say]")

		saynn("[say=avy]Well.. What if you.. don't?[/say]")

		saynn("Kait stands her ground, her claws extended.")

		saynn("[say=pc]That guard is about to drop Kait.[/say]")

		saynn("Avy chuckles softly.")

		saynn("[say=avy]You know.. is that such a bad thing though?[/say]")

		saynn("You tilt your head.")

		saynn("[say=pc]Would you want that to happen to you?[/say]")

		saynn("[say=avy]No, duh. But here is a difference. I'm not as annoying as she is.[/say]")

		saynn("You don't say anything, just looking at her instead.")

		saynn("[say=avy]C'mon, it will be funny. Maybe she likes pain, who knows, maybe she is a total painslut.[/say]")

		saynn("Avy seems to have a different definition for 'funny'.")

		saynn("[say=avy]We both know you're the leader here, not her~. That cat needs her wings to be clipped every once in a while.[/say]")

		saynn("[say=nova]Last warning, inmate.[/say]")

		saynn("Hm.")

		addButton("Just watch", "(Avy's love +) Just stand and watch what happens", "kait_gets_rekt")
		addButton("Intervene", "(Kait's love +) Go and tell Kait to stop before Nova drops her", "kait_gets_saved")
	if(state == "kait_gets_saved"):
		playAnimation(StageScene.Duo, "stand", {npc="nova"})
		saynn("[say=pc]No, you're wrong, Avy.[/say]")

		saynn("[say=avy]Whatever then..[/say]")

		saynn("You rush to the pair and position yourself in front of Kait.")

		saynn("[say=nova]Huh?[/say]")

		saynn("[say=pc]If you have a problem with her, you also have a problem with me.[/say]")

		saynn("[say=nova]I don't wanna have problems with either of you, you know? I just wanna go do my stuff.[/say]")

		saynn("You stay quiet for a bit. Your ears pick up a subtle fox giggle.")

		saynn("[say=pc]Go do your stuff then.[/say]")

		saynn("You step aside.. and grab Kait's hand to make her do so as well.")

		saynn("[say=nova]Well thank you. Finally.[/say]")

		saynn("Nova walks past you two. You nod towards the smug Avy and then towards Rahi. She seems to understand the assignment.")

		addButton("Continue", "See what happens next", "kait_talk_after_save")
	if(state == "kait_talk_after_save"):
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		saynn("You turn towards Kait who is blushing a bit.")

		saynn("[say=pc]You're good?[/say]")

		saynn("[say=kait]Yep! Thank you. The guard, though, is getting away![/say]")

		saynn("[say=pc]We got this, don't worry.[/say]")

		saynn("You watch Rahi getting the badge from Avy.")

		addButton("Continue", "See what happens next", "nova_gets_hugged")
	if(state == "kait_gets_rekt"):
		playAnimation(StageScene.Duo, "punch", {pc="kait", npc="nova", npcAction="hurt"})
		saynn("You decide to just watch.")

		saynn("[say=avy]Good choice~.[/say]")

		saynn("Kait doesn't back down. Her claws are out, swiping at the air between her and Nova.")

		saynn("[say=kait]You're not going anywhere unless I allow it! Do you hear me, dog?[/say]")

		saynn("Kait scratches Nova's armor and then shoves her hard in the chest. The husky stumbles back a step but doesn't fall, her armor softening the blow. She tightens her grip on the stun baton and starts slowly approaching the feline.")

		saynn("[say=kait]You're really asking for me? All of you staffers are gonna serve me soon![/say]")

		addButton("Continue", "See what happens next", "kait_dodges_nova")
	if(state == "kait_dodges_nova"):
		playAnimation(StageScene.Duo, "dodge", {pc="kait", npc="nova", npcAction="stunbaton"})
		saynn("Sparks fly off of the stun baton as Nova switches it on. The little scary blue lines of electricity keep bouncing on its tip.")

		saynn("[say=nova]I don't think so.[/say]")

		saynn("Nova swings at the cat.. but Kait manages to dodge it at the last moment!")

		saynn("This makes the husky growl.")

		saynn("Another swing.. Kait dodges to the side and swipes at the guard's armor again.")

		saynn("[say=kait]I'm too fast, you can't hit me. Just submit![/say]")

		addButton("Continue", "See what unexpected things happen next", "kait_gets_dropped")
	if(state == "kait_gets_dropped"):
		playAnimation(StageScene.Duo, "defeat", {pc="kait", npc="nova"})
		saynn("A sudden impulse of electricity hits Kait like a brick. Her legs give out instantly and she drops to her knees, claws scraping uselessly against the floor as her whole body seizes up.")

		saynn("[say=kait]AAGH-![/say]")

		saynn("She grips her collar and cries out from immense pain. Even her tail is spazzing out erratically.")

		saynn("Nova puts away her weapon.. and then pulls her hand away from the remote.")

		saynn("[say=nova]There. I hate doing that, you know?[/say]")

		saynn("Kait can only whimper back.")

		saynn("[say=avy]Told you. All bark and zero bite. Great view though~.[/say]")

		saynn("The guard begins walking away, still without her badge.")

		saynn("[say=avy]I will go give Rahi the badge.[/say]")

		addButton("Kait", "Go approach her", "kait_rekt_talk")
	if(state == "kait_rekt_talk"):
		playAnimation(StageScene.SexStart, "start", {pc="pc", npc="kait"})
		saynn("You run up to Kait to check on her.")

		saynn("[say=pc]You okay?[/say]")

		saynn("[say=kait]Ugh.. I'm fine. What took you so long, the guard is getting away.[/say]")

		saynn("[say=pc]We got it, don't worry.[/say]")

		saynn("You watch Rahi getting the badge from Avy.")

		addButton("Continue", "See what happens next", "nova_gets_hugged")
	if(state == "nova_gets_hugged"):
		playAnimation(StageScene.Hug, "hug", {pc="nova", npc="rahi"})
		saynn("Rahi sprints towards the guard and gives her a sudden tight hug! It really startles the husky.")

		saynn("[say=nova]Oh.. It's you again.[/say]")

		saynn("[say=rahi]She just wanted to say thank you-u-u-u-u..[/say]")

		saynn("The feline puts her paws all over the guard.. until the badge finds its old spot.")

		saynn("[say=nova]Aw.. you're so sweet.[/say]")

		saynn("Rahi purrs as she receives a few pats from the husky.")

		saynn("[say=rahi]Meow meow meow..[/say]")

		saynn("After giving the guard that proper hug, she takes a step back.")

		saynn("[say=nova]Is your ankle okay?[/say]")

		saynn("[say=rahi]Ankle? Oh.. yeah.. Uh.. it's fine now..[/say]")

		saynn("[say=nova]I'm glad. See you around, kitty~.[/say]")

		saynn("Rahi nods softly and leaves Nova's company.")

		addButton("Continue", "See what happens next", "mission_completed")
	if(state == "mission_completed"):
		removeCharacter("nova")
		playAnimation(StageScene.Duo, "stand", {npc="rahi", pc="kait"})
		saynn("Rahi makes sure Nova isn't watching anymore.. and then approaches you all.")

		saynn("[say=rahi]All good?..[/say]")

		saynn("[say=kait]Yeah, good job kitty. {pc.name}? Did you get the records?[/say]")

		saynn("You hand Kait the papers. She gives them a quick glance.")

		saynn("[say=kait]Perfect! Were there any problems?[/say]")

		saynn("[say=pc]There was a mean guard. But I handled it.[/say]")

		saynn("[say=kait]Good job! I think we can call this mission.. completed~.[/say]")

		saynn("Avy's face expression distorts slightly.")

		saynn("[say=avy]Oh my god. I will just go now.[/say]")

		saynn("[say=kait]Sure, you do that. I will go over the records with Ans, see what we can dig up. I will be in the hideout.[/say]")

		saynn("And just like that.. Everyone disperses.")

		saynn("Feels good.. to accomplish something.")

		addButton("Continue", "Mission completed!", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_print"):
		processTime(10*60)

	if(_action == "risha_encounter"):
		processTime(3*60)

	if(_action == "start_fight"):
		runScene("FightScene", ["risha"], "risha_fight")
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

	if(_action == "just_leave"):
		GM.main.MS.setFlag("risha", "no")

	if(_action == "estim_pp"):
		GM.main.MS.setFlag("risha", "pp")

	if(_action == "estim_vag"):
		GM.main.MS.setFlag("risha", "vag")

	if(_action == "kiss_cheek"):
		GM.main.MS.setFlag("risha", "kiss")

	if(_action == "bite_neck"):
		GM.main.MS.setFlag("risha", "bite")

	if(_action == "go_back"):
		processTime(5*60)

	if(_action == "kait_nova"):
		processTime(3*60)

	if(_action == "kait_gets_rekt"):
		#GM.main.MS.setFlag("helped", "avy")
		GM.main.MS.setDecision("helped", "avy")

	if(_action == "kait_gets_saved"):
		#GM.main.MS.setFlag("helped", "kait")
		GM.main.MS.setDecision("helped", "kait")

	if(_action == "kait_dodges_nova"):
		processTime(3*60)

	if(_action == "mission_completed"):
		GM.main.MS.completeMission()

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "risha_fight"):
		processTime(10 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("fight_won")
			addExperienceToPlayer(50)
		else:
			setState("fight_lost")
			addExperienceToPlayer(5)
