extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "RebelWonScene"

func _run():
	if(state == ""):
		addCharacter("rebel")
		playAnimation(StageScene.Duo, "stand", {npc="rebel", npcAction="kneel"})

	if(state == ""):
		saynn("Rebel grunts and drops down to her knee while panting heavily. Her weight is now working against her, pulling her body down.")

		saynn("[say=rebel]Fuck. You fight well, I will give you that one.[/say]")

		saynn("The crowd goes wild and yells at you to take advantage of Rebel’s situation. Seems like the audience doesn’t really have loyalty to anyone, they just want a show. The mare smirks and rubs her nose.")

		saynn("[say=rebel]So, what is it gonna be, sweetheart?[/say]")

		addButton("Just leave", "She fought well, no need to humiliate her", "just_leave")
		addButton("Fisting", "She wanted to fist you. Might as well repay her the favor", "fisting")
		GM.ES.triggerRun("ArenaFighterPCWon", ["rebel"])


	if(state == "just_leave"):
		saynn("[say=pc]I won’t humiliate you. But I’m curious. Why are you doing that?[/say]")

		saynn("She chuckles and looks at you.")

		saynn("[say=rebel]Why do I fight? Our whole life is a struggle, sweetie. I’m not here to suck dick for experience, I wanna take things into my own hands.[/say]")

		saynn("The way she worded it was quite strange to you. Something to think about. The crowd starts to boo as you climb over the fence but you don’t care, you got what you wanted.")

		addButton("Continue", "Time to leave", "endthescene")

	if(state == "fisting"):
		playAnimation(StageScene.SexFisting, "sex", {
			npc="rebel", pc="pc",
			npcBodyState={exposedCrotch=true,}
		})
		
		saynn("The crowd cheers louder as you put on your mean eyes and step towards the defeated opponent. Rebel’s face expression shows acceptance, she tries to cover herself but you take a running start and shove her down to the floor.")

		saynn("[say=rebel]Ugh. Gonna be a rough ride, huh?[/say]")

		saynn("She is huge which is probably why she has a sporty top and shorts instead of a normal uniform. Your hands reach for her top and pull it up, exposing her giant tits with bright red nipples each one having the size of a small apple. Then your hands slide down her powerful six-pack and get a hold of her short’s ribbon. With no resistance from Rebel, you tug them down, exposing her red juicy pussy lips, just about what you would expect from a mare. She even spreads her legs for you, offering you a great view of her slit and a massive anal ring.")

		saynn("[say=pc]Yeah, I need to teach you a lesson.[/say]")

		saynn("[say=rebel]Oh, I’m excited already, sweetie.[/say]")

		saynn("Well she shouldn’t be, you take a hold of her inmate collar and push it into the floor before unceremoniously penetrating her pussy with two of your digits and already pushing them in and out, creating pleasurable friction. The mare parts her lips and starts producing quiet moans for you, she is so warm inside. Her inner walls quickly become wet with her juices, the more you finger her the more eager her eyes look. Then you add another finger. And another. Now the entire palm is sliding in and out, except for the thumb. And the girl is taking it very well, she moans and starts to knead her own milkers in clear view of the whole crowd.")

		saynn("As she gets close to her orgasm, you decide to steal it and pull out your palm, leaving Rebel’s pussy to pulsate and leak juices but without the climax. The mare quivers and lets out desperate moans while her body slowly cools down.")

		saynn("[say=rebel]Ah.. mhh-h.. You made your point.[/say]")

		saynn("[say=pc]Not yet.[/sat]")

		saynn("You move your wet palm back to her pussy but this time you turn your hand into a fist and begin trying to shove it inside. Rebel quickly realizes what you are doing and braces, she spreads her legs more for you and produces more moans as her sensitive petals are forced to stretch to accomodate an entire fist. With the help of her juices, your fist eventually slips inside with a satisfying ‘plop’.")

		saynn("[say=rebel]So filling!..[/say]")

		saynn("The mare seems to be really enjoying herself, she even starts shifting her hips back and forth, causing your fist to explore her deeper. You pick up her pace and begin thrusting your hand deeper inside.")

		saynn("[say=pc]You act like such a slut.[/say]")

		saynn("[say=rebel]Why would I deny myself this pleasure.. ah..[/say]")

		saynn("Your whole hand now fits inside her, wrist and everything. And you don’t stop there, you fist-fuck her fat pussy hard while trying to shove move of your arm each time. Eventually you hit the natural blockage inside the mare, her cervix. You begin pounding at it, causing the girl to start arching her back and moan louder. You both are panting heavily, Rebel’s slick inner walls close in around your arm but the juices make it easy to keep thrusting inside, there is a visible outline of your arm on her lower belly that shows how deep you are.")

		saynn("[say=rebel]Gonna c-cu..m..[/say]")

		saynn("And indeed, her body soon begins to shiver, her legs shake and try to kick while her pussy pulsates and suddenly starts squirting all over your arm and the floor. Her orgasm is so powerful you are nearly thrown back a few meters, it’s like trying to tame an angry bull. But you keep her pussy stuffed even while she is quivering so much.")

		saynn("When the orgasmic waves end, you both are left panting and messy.")

		saynn("[say=rebel]H-huh.. Another round?[/say]")

		saynn("Wow, this mare is really something.")

		addButton("Leave", "Nah, this is enough", "leave")
		addButton("Double trouble", "The mare has a second fuckable hole. You wonder how well she would take your fists in both at the same time", "double_trouble")


	if(state == "leave"):
		playAnimation(StageScene.SexFisting, "tease", {
			npc="rebel", pc="pc",
			npcBodyState={exposedCrotch=true,}
		})
		
		saynn("You gently remove your fist out of her vagina and rub it dry against her thighs")

		saynn("[say=pc]That was enough to humiliate you.[/say]")

		saynn("[say=rebel]Oh, baby, there was nothing humiliating about it. Losing to you was worth every credit, I loved it.[/say]")

		saynn("Of course she did, her pussy was made to be fucked by giant horse cocks. You chuckle and leave her alone in all the mess she created.")

		# (scene ends)
		addButton("Continue", "Time to leave", "endthescene")

	if(state == "double_trouble"):
		playAnimation(StageScene.SexFisting, "fast", {
			npc="rebel", pc="pc",
			npcBodyState={exposedCrotch=true,}
		})
		
		saynn("[say=pc]You want more, huh? I can get you more. Don’t cry about it later.[/say]")

		saynn("You forcefully turn the mare around, making her lay on her belly with her buff ass sticking out. She seems intrigued more than anything but when you spread her buttcheeks open she gasps.")

		saynn("[say=rebel]Are you gonna?..[/say]")

		saynn("One of your fists is still wet with Rebel’s arousal, you move it to her round puffy tailhole and begin trying to shove it in. The sensations instantly make her struggle and clench her butt.")

		saynn("[say=rebel]That’s too much, sweetie![/say]")

		saynn("You don’t listen to her, instead you apply more and more pressure on her star. Rebel’s legs shake but eventually her pucker starts to give in, allowing the knuckles in. You take some of her arousal onto your other hand and start rubbing it around your fist, using it as lube. Then you begin forcefully pushing your arm forward. The mare produces some passionate moans, her stretched pussy squirts again before you finally manage to stretch her anal ring enough to slide the whole hand in, causing the girl to start squirming uncontrollably.")

		saynn("[say=rebel]Ah-h.. ah… fuck.. My ass..[/say]")

		saynn("You start sliding your fist in and out, leaving her tailhole gaping before stuffing it full again. Then you start properly fucking it, thrusting deeper each time, using her own juices to make the soft inner walls nice and slick. Surprisingly, it goes way easier, you already reach the same depth as with her pussy but you feel like there is plenty more depth to her butt. Rebel is whining at first but gradually her discomfort goes away, replaced with a new kind of pleasure.")

		saynn("[say=pc]That’s right, I’m fisting your ass. And you seem to enjoy it, what a butt whore.[/say]")

		saynn("After the mare gets used to having a fist up her butt, you decide to go further. Your second arm joins the first but is directed towards the girl’s neglected pussy. You clench your hand into a fist and start trying to slide it inside. It goes in way more easily, the folds were already half-spread because of the pressure on her ass. Eventually you manage to stuff both her holes at the same time. Even just having your fists inside makes the girl drip and moan softly.")

		saynn("[say=rebel]F-fuck..[/say]")

		saynn("There is a serious lack of free space now, the inner walls wrap around your arms so tight. You start thrusting inside the mare at a slow pace, her ass follows your movements with a slight delay. Long passionate noises escape from her mouth, her own hands holding tightly against the floor, her eyes rolling up from the sure amount of pleasure. Crowd cheers loudly seeing the girl being double-fisted, they live for these moments.")

		saynn("As you ramp up the pace, the mare's body shivers more and more, her pussy gets tight around your hand and squirts again from too much stimulation. That is when you shove your arms as deep as you can and increase the onslaught on both her stretched holes. Desperate moans escape from the girl as the arm in her butt is in way past the elbow, you pound her hard through her orgasm like a pair of horse cocks would, she keeps squirting and squirting while her body is thrashing around. You feel every muscle tensing up inside her holes, you don’t pull out until her climax is completely over.")

		saynn("[say=rebel]F-ffu-.. ah-h…[/say]")

		saynn("Even after retracting your arms, the mare is left with both her fuckholes stretched and gaping open. She tries to clench but that doesn’t help, she is on full display with her insides visible to any curious inmate. The whole arena smells of her.")

		saynn("You stand up and look at the moaning mare, her face doesn’t show much but the satisfaction, seems like you broke her. That’s what she gets for talking so boldly.")

		saynn("You are sure that she will be fine. Even if not, that’s another toy for inmates to play with, win-win for everyone. You climb over the fence and go get your reward.")

		# (scene ends)

		addButton("Continue", "Time to leave", "endthescene")


func _react(_action: String, _args):
	if(_action == "fisting"):
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "rebel_fisther")
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

