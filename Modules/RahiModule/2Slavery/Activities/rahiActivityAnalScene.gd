extends SceneBase

func _init():
	sceneID = "rahiActivityAnalScene"

func _run():
	if(state == ""):
		addCharacter("rahi")
		saynn("What do you wanna teach Rahi about anal sex?")

		var analLevel = getModule("RahiModule").getSkillScore("rahiSkillAnal")
		if (analLevel == 0):
			addButton("Train Rahi's butt", "Start training Rahi's butt", "scene1")
		if (analLevel == 1):
			addButton("Train Rahi's butt", "Do more training", "scene2")
		if (analLevel == 2):
			addButton("Train Rahi's butt", "Do more training", "scene3")
		addButton("Never mind", "You changed your mind", "cancelactivity")
	if(state == "scene1"):
		playAnimation(StageScene.Duo, "sit", {npc="rahi"})
		saynn("Rahi is leaning against one of the walls of her cell. You decide to take a seat on her bed and then gesture to her to come close. You hold a little tube of lube that you got from the crate of toys")

		saynn("[say=pc]Come here, kitty. It's time for something new.[/say]")

		saynn("The feline approaches you hesitantly, her tail flicking nervously behind her. Seeing some strange thing in your hands makes her put her paws on her butt.")

		saynn("[say=rahi]Something new?..[/say]")

		saynn("[say=pc]I want to help you get used to anal. It's about time. Turn around for me.[/say]")

		saynn("Rahi lowers her head and gets all embarrassed and small, her ears droop.")

		saynn("[say=rahi]She never did any.. At all.. That's a lie.. She tried alone and it was too painful.. Maybe it's not the best idea?..[/say]")

		saynn("Your kitty seems to have some doubts. She doesn't turn around for you.")

		addButton("Explain", "Tell Rahi that you will be gentle and that she will enjoy it", "scene1_explain")
		addButton("Force", "Tell Rahi that you will train her until she learns to enjoy it", "scene1_force")
	if(state == "scene1_explain"):
		playAnimation(StageScene.Duo, "sit", {npc="rahi", npcBodyState={naked=true}})
		saynn("You reach your hands forward and wrap them around Rahi's waist before pulling her closer to you.")

		saynn("[say=pc]Well, you got me now. We're going to start off very slow.. Lots of lube.. Just my fingers.. No toys or anything like that. Just enough to help you relax and get comfortable with it all.[/say]")

		saynn("Rahi blinks many times while you rub your cheek against her belly and lower your hands onto her butt, gently rubbing it. Her tail still flickers randomly.. but you also hear purring coming from her.")

		saynn("[say=rahi]Okay.. Maybe you can do that, {rahiMaster}..[/say]")

		saynn("[say=pc]Be a good girl and turn around for me. Let me prepare you.[/say]")

		saynn("Rahi nods and slowly rotates 180, presenting you her back and butt. Your digits grab onto her shorts and gently pull them down, uncovering.. fluff.. and her buttcheeks of course.")

		saynn("Rahi hesitantly moves her tail out of the way presenting her.. crack. She looks over shoulder, very curious about what you're gonna do next. A deep red blush appears on her face when you put your hands on her bottocks and spread them, exposing the tight pink star that hides between them. Yep.. You can't see any signs of previous use.. or abuse. Her pucker starts to twitch and clench the more you stare at it.")

		saynn("You get some lube on your digits and begin gently rubbing them into Rahi's anal ring. She squirms slightly but lets you do it.")

		saynn("[say=rahi]A little cold..[/say]")

		saynn("[say=pc]Better than going in raw.[/say]")

		saynn("[say=rahi]That might have been her mistake.. huff..[/say]")

		saynn("After getting Rahi's anus lubed up, you dry your fingers and get up before pointing at the bed.")

		saynn("[say=pc]Get on it, kitty. Stand on all fours for me.[/say]")

		addButton("Continue", "See what happens next", "scene1_try")
	if(state == "scene1_force"):
		playAnimation(StageScene.Duo, "sit", {npc="rahi", npcBodyState={naked=true}})
		saynn("Since she doesn't wanna obey.. you make her. Your hands land on her hips and forcefully turn it 180 degrees. Kitty doesn't put up much resistance, obeying your rough touch when she sees your authoritative eyes.")

		saynn("[say=pc]Here is the deal kitty. If I wanna make a buttslut out of you.. you gotta obey. Show me your ass. Get that tail out of the way too.[/say]")

		saynn("You give her a few firm smacks on the rear until kitty's paws spring into action, pulling down her shorts and exposing her fluffy butt.")

		saynn("[say=rahi]Ow.. Of course, {rahiMaster}..[/say]")

		saynn("Rahi hesitantly moves her tail out of the way presenting her.. crack. She looks over shoulder, very curious about what you're gonna do next. A deep red blush appears on her face when you put your hands on her bottocks and spread them, exposing the tight pink star that hides between them. Yep.. You can't see any signs of previous use.. or abuse. Her pucker starts to twitch and clench the more you stare at it.")

		saynn("[say=pc]Hold it like that.[/say]")

		saynn("Rahi obeys, spreading her ass for you. You get some lube on your digits and begin gently rubbing them into Rahi's anal ring. She squirms slightly while you do that.")

		saynn("[say=rahi]A little cold..[/say]")

		saynn("[say=pc]Soon your asshole will learn to self-lubricate. Just like your pussy.[/say]")

		saynn("After getting Rahi's anus lubed up, you dry your fingers and get up before pointing at the bed.")

		saynn("[say=pc]Get on it, kitty. Stand on all fours for me.[/say]")

		addButton("Continue", "See what happens next", "scene1_try")
	if(state == "scene1_try"):
		playAnimation(StageScene.Spanking, "tease", {npc="rahi", npcBodyState={naked=true}})
		saynn("Rahi does as she's told, climbing her bed and getting on all fours, her butt perked up and her legs spread slightly, giving you full access to her careful tailhole. You sit behind her and lean over her, gently caressing her back before reaching down to her hind limbs.")

		saynn("Time for the fun part. You get some more lube on your digits and start rubbing circles around her anal opening that clenches tightly from any touch, trying to coax her muscles to relax.")

		saynn("[say=pc]Deep breathes, kitty. Let your body relax.[/say]")

		saynn("Rahi inhales deeply and exhales slowly, trying to follow your orders. But as you start working your fingers inside her. As two slip inside her pucker, Rahi tenses up and produces a hiss.")

		saynn("[say=rahi]It hurts!.. It's too much!..[/say]")

		saynn("You use your free hand to stroke the kitty's back more, your digits still stay inside her but you don't move them for now.")

		saynn("[say=pc]Shh.. just relax. You're doing good.[/say]")

		saynn("You let your kitty adjust to the weird sensations. Eventually, Rahi nods to you, and you start to move your fingers in and out, slowly stretching her out, the lube helps a lot. Even when her inner walls try to clench around your digits, you are still able to slide them in slightly deeper each time.")

		saynn("[say=pc]Good.. This is going so well. Just keep breathing.[/say]")

		saynn("Rahi starts to relax more as you continue to work your fingers inside her, gently wiggling them inside her anus to make more space. Little noises escape from her, coupled with her breathing getting slightly faster. You're almost whispering..")

		saynn("[say=pc]You're doing so well, kitty.. You're going to be such a good girl for me..[/say]")

		saynn("A moan escapes Rahi's lips, your words sending shivers down her spine. Her pussy becomes wet while you continue to gently finger her tight ass. Slowly but surely, you help her to adjust to the feeling of having her butt penetrated.")

		saynn("After some more fingering, Rahi is already panting with pleasure. You can't help but to smile.")

		saynn("[say=pc]See? Wasn't so bad, was it?[/say]")

		saynn("[say=rahi]It wasn't.. But.. Can you.. maybe.. touch her.. in the other place.. until she..[/say]")

		saynn("Rahi's neglected pussy is dripping juices down onto her bedsheets and making the whole cell smell of sex. Making her cum normally wouldn't help her with the training but it would help her get the edge off. Denying her would help her focus on becoming the perfect buttslut but she probably won't cum today then..")

		addButton("Yes", "Make Rahi cum from her pussy", "scene1_cumpussy")
		addButton("No", "Only finger Rahi's butt to make a point", "scene1_deny")
	if(state == "scene1_cumpussy"):
		saynn("You slowly withdraw your fingers from Rahi's ass and dry them against her fur.")

		saynn("[say=pc]Of course, my kitty. You deserve to feel good for how well you did.[/say]")

		saynn("Rahi spreads her legs more eagerly, inviting you to touch her needy sex. You move your hand down to it, your fingers finding her clit and proceeding to rub little circles around it, gradually increasing the pressure. Your kitty moans and arches her back, seems like the whole session did leave her heated up.")

		saynn("[say=rahi]Oh, {rahiMaster}.. Yes.. right there..[/say]")

		saynn("You smile and continue to tease her slit. Two of your digits gently spread her folds, exposing the warmth and wetness. Another two digits prod at her pussy hole.. until they slip inside.. quite easily.")

		saynn("[say=pc]You're so wet.. Do you like this?[/say]")

		saynn("Rahi nods and meows at you, her breathing becoming faster and faster as you start moving your digits inside her, fingering.. At the same time your other hand joins and rubs her sensitive clit, matching the rhythm to your other fingers.")

		saynn("You can feel that Rahi is close, she is squirming around your digits like crazy, her tail drawing shapes in the air. You decide to play with the feline some more and stop teasing her clit, instead slipping two digits inside her anus and wiggling them there. Rahi gasps but it is too late..")

		saynn("[say=pc]Cum for me, kitty. Let yourself go.[/say]")

		saynn("She whimpers and cries out, her whole body shaking from pleasure. All the while you keep fingering both of her holes, taking her to that edge and then pushing her over. Rahi cums hard, both her pussy and anus clenching around your fingers.")

		saynn("[say=rahi]Ah!.. T-Too much!..[/say]")

		saynn("Suddenly she arches her back and squirts all over your hand. Hot passionate moans escape from her while Rahi falls onto her belly and squirms actively. Her tight anus desperately tries to close around your digits but don't let it, instead working it out to stretch her.")

		saynn("Only after she is done riding her orgasm, you pull your wet digits out and let the kitty rest.")

		saynn("[say=rahi]H-huff..[/say]")

		saynn("[say=pc]What was that, kitty?[/say]")

		saynn("[say=rahi]Thank you, {rahiMaster}..[/say]")

		saynn("You pat the feline.")

		saynn("[say=pc]You're welcome, kitty. We will do this again sometime.[/say]")

		addButton("Continue", "That was cute", "endthescene")
	if(state == "scene1_deny"):
		saynn("Rahi quivers with your fingers up her butt, her body clearly aching for release. She looks over her shoulder at you with her pleading eyes. So you have to get a little mean to make her understand.")

		saynn("[say=pc]No, kitty. You and I will focus on your anal training. You need to learn to cum from anal, like a good buttslut. We're not going to let your pussy distract you from your training.[/say]")

		saynn("Rahi whimpers in frustration, her body still tingling with arousal.")

		saynn("[say=pc]You want to be a good buttslut for me, kitty?[/say]")

		saynn("Kitty nods but her eyes are still pleading.")

		saynn("[say=rahi]Yes, {rahiMaster}.. She wants to be your good buttslut..[/say]")

		saynn("[say=pc]Good girl. I'm glad you understand.[/say]")

		saynn("You return your attention to Rahi's rear, resuming the gentle anal fingering. Rahi's body continues to respond, her pussy dripping with desire. Howerer, you pay no attention to that, instead remaining focused on her anal training too.")

		saynn("Your fingers continue stretching Rahi out for a few more minutes. At some point you apply more lube onto them and slip them back inside. When you try to find space for a third finger though.. your kitty gets noisy, her tailhole struggling to stretch enough. But that's fine, two is a great start.")

		saynn("As the session comes to an end, Rahi is left panting and frustrated, her body arching for release even more than before her request. You try to present her the fingers that were inside her butt so she can clean them with her mouth but she shakes her head. Fine, you just dry them against her cheeks, humiliating the kitty slightly.")

		saynn("[say=pc]I will continue your training some other time. I won't stop until you start cumming from anal. What should you say to me?[/say]")

		saynn("Rahi lowers her head.")

		saynn("[say=rahi]Thank you, {rahiMaster}.. She will do her best..[/say]")

		saynn("You deliver an impact on Rahi butt and let her rest.")

		addButton("Continue", "That was cute", "endthescene")
	if(state == "scene2"):
		saynn("Rahi is sitting on her bed, waiting for you clearly. When you approach her, she greet you with a smile.")

		saynn("[say=pc]Good morning, kitty. Ready for another training session?[/say]")

		saynn("Rahi nods, there is a hint of excitement and determination in her eyes.")

		saynn("[say=rahi]Yes, {rahiMaster}.. She doesn't mind having her butt trained more..[/say]")

		saynn("You grab Rahi's paw and make her stand up.")

		saynn("[say=pc]Alright then. You know what to do.[/say]")

		saynn("You go ahead and grab a tube of lube while Rahi is busy preparing herself.")

		addButton("Continue", "See what happens next", "scene2_start")
	if(state == "scene2_start"):
		playAnimation(StageScene.Spanking, "tease", {npc="rahi", npcBodyState={naked=true}})
		saynn("Rahi takes off her uniform and leaves it under her pillow. Then she climbs her bed and positions herself on all four, wiggling her girly rear at you. Kitty sure is playful today.")

		saynn("You sit near and begin by gently rubbing and massaging around her buttocks, gradually moving closer to her anus. Rahi purrs, the teasing making her fur stand up.")

		saynn("[say=pc]Be a good girl and spread your butt for me.[/say]")

		saynn("Rahi flops her face into the pillow and brings her paws down to her butt. She puts them on her buttcheeks and spreads them, presenting you her moist pussy and the tight-looking pretty tailhole. You pour some lube onto your digits and begin to gently rub her clenching star with them, spreading the slick substance and getting some inside too.")

		saynn("After that is done, you begin to slowly insert your fingers into Rahi's ass, working them in and out in a gentle rhythm. This time it goes way better, Rahi already moans softly for you, her body responding to the stimulation.")

		saynn("[say=pc]Relax and let me take care of you.[/say]")

		saynn("Rahi lets out a muffled noise of agreement as you continue to stretch her out with your fingers, gradually increasing the frequency and amplitude of your motions, fingering Rahi's ass at a pretty respectable pace.")

		saynn("[say=rahi]M-more..[/say]")

		saynn("If she wants more, she will get more. You try to work the third finger inside her anus too. Kitty squirms and mewls into her pillow but eventually her anal ring stretches enough to take it. She purrs as you wiggle them all inside her. Rahi's pussy is dripping with juices.")

		saynn("[say=rahi]F-faster.. It feels so good..[/say]")

		saynn("[say=pc]Such a needy kitty.[/say]")

		saynn("You pry Rahi's paws away from her buttcheeks and then spank her firmly, forcing a moan and making her anus clench tightly around your digits.")

		saynn("[say=rahi]Ah!.. A-again..[/say]")

		saynn("Wow. You keep sliding your digits in and out of her anus, sometimes spanking her to make her get tight. Kitty is a squirming dripping mess, her toes curl up, tail brushes against your wrist. You realize that you don't even have to lube your fingers again, Rahi's ass is lubricating them.")

		saynn("[say=rahi]S-she wants to cum so badly.. But she can't!..[/say]")

		saynn("The last words sounded almost desperate.")

		saynn("[say=pc]I know, kitty. But remember that we're not focused on your pussy right now.[/say]")

		saynn("[say=rahi]No! Cum from anal!.. Can you.. another one?..[/say]")

		saynn("Her frustration slowly grows. Well, might as well test her, right?")

		saynn("You try to add in the fourth finger to the bunch. Sliding it inside proves to be different, Rahi's tight anal ring is resisting your attempts. But you don't hear any complaints from her so you push ahead and keep fingering her ass while trying to shove the other finger in.")

		saynn("[say=rahi]Ngh-h.. hh-huf-f..[/say]")

		saynn("Rahi's pussy is aching with desire, she squirms and moans, desperate for release. Her breathing becomes ragger and her noises louder. A loud moan escapes from her when the fourth digits manages to slip in, stretching Rahi's asshole the most it ever was. So much that the ring itself receives a reddish tint to it, showing that this is probably painful for her.")

		saynn("She grabs onto the bed sheets and starts to meet your fingers with the motions of her ass, making it look like you're finger-fucking her. Kitty makes all sorts of noises, lust, pleasure, pain and desperation all getting mixed up together. She can feel herself getting closer and closer to the edge.. but that feeling eventually fades.. leaving kitty frustrated.")

		saynn("[say=rahi]Hhu-uff.. It hurts now.. A lot..[/say]")

		saynn("Finally, you withdraw your fingers, leaving Rahi to whimper. Her stretched irritated butthole pulsates as Rahi clenches and tries to make it close.")

		saynn("[say=pc]Good job, kitty. You did much better this time.[/say]")

		saynn("[say=rahi]But.. she didn't..[/say]")

		saynn("You pat Rahi on her butt.")

		saynn("[say=pc]If you wanna become a buttslut - it will happen, sooner or later. But otherwise, we can just keep training your ass, making you take bigger and bigger things, maybe horsecocks even.[/say]")

		saynn("Rahi nods softly. You feel Rahi has deserved another reward. You stand up and walk over to the crate of toys before grabbing a small buttplug out of it. Rahi watches you with great interest.")

		saynn("[say=pc]I'm gonna put this into you, kitty. It will help keep you stretched and ready for our next session.[/say]")

		saynn("Kitty nods again, looking quite excited. You pour some lube onto the toy and begin slowly working it into her ass, stopping when it's fully inserted and only showing a cute red gem.")

		saynn("[say=rahi]N-nya..[/say]")

		saynn("[say=pc]There you. You will wear that until the next time.[/say]")

		saynn("Rahi wiggles her ass, feeling the weight of the plug inside her. Seems like it won't fall out. This will be a good reminder of her training.")

		addButton("Enough", "That was nice", "endthescene")
	if(state == "scene3"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcBodyState={naked=true}})
		saynn("You catch Rahi's needy gaze, her paws brushing over her clothed rear. She is clearly craving for another anal training session.")

		saynn("[say=pc]Come here, kitty. Let's do it.[/say]")

		saynn("Her perks up, Rahi springs up and approaches you, her paws already pulling down her shorts and unbuttoning the shirt. You twirl your finger and Rahi turns around before bending forward slightly, presenting her buttplug. Under it is her pussy which seems to be quite wet from excitement. Maybe you won't need lube today..")

		saynn("You reach your hand out and tug on that buttplug, causing the kitty to bite her lip.")

		saynn("[say=pc]How does it feel, kitty?[/say]")

		saynn("[say=rahi]It feels nice..[/say]")

		saynn("You smile, kitty seems to be making some progress. You carefully begin to take the buttplug out of Rahi's ass, stretching her hole until you hear a satisfying plop sound. Rahi produces a soft moan while her tailhole quickly closes up.")

		saynn("[say=pc]Alright. Bed.[/say]")

		addButton("Continue", "See what happens next", "scene3_bed")
	if(state == "scene3_bed"):
		playAnimation(StageScene.Spanking, "tease", {npc="rahi", npcBodyState={naked=true}})
		saynn("Rahi hears the word and eagerly climbs onto the bed before getting on all fours and spreading her girly buttcheeks for you, exposing her tight-looking anal entrance. Her body seems ready, her other hole wet and dripping with anticipation.")

		saynn("You sit behind her and take a moment to admire the view before moving your digits down to her pussy and rubbing them against her slick folds, catching Rahi's juices. Then you position yourself a little better and begin to slowly push your fingers inside Rahi's tight backdoor.")

		saynn("The first two go rather easy, you barely feel any resistance from Rahi's anal ring. The third one requires a little extra force but it goes in too eventually. Rahi gasps when you manage to insert the fourth one into her as well, your fingers stretching and exploring her anal walls. Her little moan can be heard pretty well, she squirms slightly, her body responding to your touch.")

		saynn("[say=pc]You can probably fit cocks now, kitty.[/say]")

		saynn("She looks over her shoulder and blushes. Your words make her anus clench around your fingers. But that doesn't stop you from proceeding to slowly finger her ass, working your digits in and out, the motions slowly getting deeper and harder. Rahi feels a sudden rush of pleasure washing over her, little shivers affect random limbs of her body.")

		saynn("[say=rahi]Ah.. P-Please.. harder..[/say]")

		saynn("You try to be rougher, even wiggling your fingers inside her to try to find that sweet spat. Kitty feels something building up inside.. but still can't quite reach the peak.. Her pussy is dripping juices like she is in heat but not getting the release starts to make your kitty frustrated again.")

		saynn("[say=rahi]S-she.. wants to.. but can't..[/say]")

		saynn("You can feel how tensed up her body is. Maybe that is the problem. Instead of applying even more pressure to her asshole, you decide to instead stop and try something else. Doing that made the kitty look back at you with confused eyes.")

		saynn("[say=rahi]M-meow?.. She failed, right?.. No more anal for her..[/say]")

		saynn("You shake your head and withdraw your digits, instead gently squeezing Rahi's butt and kneading her tensed up muscles.")

		saynn("[say=pc]You need to relax, kitty. Won't happen otherwise. When the pressure comes, the pleasure fades.[/say]")

		saynn("Kitty lowers her head onto the pillow. All the while you continue giving her a little massage, removing the tension from Rahi's legs.. back muscles.. butt..")

		saynn("One of your hands keeps stroking her fur while the second sneakily slides two fingers up her relaxed butthole. She feels it, no doubt, but this time her inner walls don't hug your digits so tightly, allowing you to reach deeper and curl them inside, trying to find Rahi's pleasure spot.")

		saynn("The more Rahi clenches and squirms.. the more you slow down. Only when Rah is completely relaxed do you begin to slowly pick up the pace, three of your digits sliding in and out of her tight butt. You curve them inside, trying to press on Rahi's g-spot through the inner wall. And it.. works.. Kitty softly moans into the pillow while her tailhole starts to tingle.")

		saynn("You easily push her past the previous barrier, Rahi's moans become more passionate while you keep hammering away at her sensitive spots inside her ass.")

		saynn("[say=rahi]Ah.. ah-h.. {rahiMaster}!.. She is so close..[/say]")

		saynn("Some pleasurable feeling is building inside her. And this time, it doesn't go away. Rahi's body starts to squirm on its own, her anal ring clenching involuntary. But you don't speed up or slow down, you just keep curling your digits and pushing at the same spot inside her butthole.. And then, finally, it happens..")

		saynn("Rahi feels a sudden burst of pleasure, her body shaking with ecstasy as she cums hard. She cries out as the orgasm makes her body convulse around you. You keep fingering her, making sure that she experiences every moment of it. And soon enough, her pussy starts pulsing and twitching before gushing out pussy juices all over the bed. After that, she just slumps onto the bed, panting heavily and moaning while her whole body wants to bend and quiver, her tailhole winking many times.")

		saynn("[say=rahi]S-s-so-o.. go-o-od..[/say]")

		saynn("You smile, seeing a happy satisfied kitty. It takes at least a few minutes for Rahi to get back to her senses. She looks at you with very lusty eyes.")

		saynn("[say=rahi]T-thank you!.. That was amazing..[/say]")

		saynn("You lean in and kiss your kitty on the lips.")

		saynn("[say=pc]This is the first time. But certainly not the last.[/say]")

		saynn("You spend the next ten minutes cuddling. Rahi tells you how good the afterglow feels.")

		addButton("Continue", "That was nice", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "scene1"):
		processTime(2*60)
		getModule("RahiModule").advanceSkill("rahiSkillAnal")

	if(_action == "scene2"):
		processTime(2*60)
		getModule("RahiModule").advanceSkill("rahiSkillAnal")

	if(_action == "scene3"):
		processTime(2*60)
		getModule("RahiModule").advanceSkill("rahiSkillAnal")

	if(_action == "cancelactivity"):
		increaseFlag("RahiModule.rahiTired", -1)
		endScene()
		return

	if(_action == "scene1_try"):
		processTime(5*60)

	if(_action == "scene3_bed"):
		processTime(20*60)

	setState(_action)
