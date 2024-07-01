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
		if (analLevel >= 3):
			addButton("Anal sex", "Fuck Rahi's butt", "do_random_sex")
			if (analLevel >= 12):
				addButton("Fisting", "Fist Rahi's ass", "fist1")
			else:
				addDisabledButton("Fisting", "Rahi needs her ass trained a lot for you to fist her")
			if (analLevel >= 14):
				addButton("Horsecock dildo", "The final challenge", "toy1")
			else:
				addDisabledButton("Horsecock dildo", "Rahi needs her ass fully trained to be able to take on this final challenge.")
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
	if(state == "sex1"):
		playAnimation(StageScene.SexStanding, "tease", {npc="rahi", bodyState={naked=true, hard=true}})
		saynn("Rahi lays on her bed, just chilling. Seeing how she seductively wiggles her rear makes you want to take her.. raw. You can feel your member getting harder just thinking about railing that ass..")

		saynn("Without warning, you grab Rahi's paw and pull her off the bed before pressing her body against the wall. You quickly expose your {pc.penis} and start prodding Rahi's shorts with it, in the area under her tail. Kitty mewls softly.")

		saynn("[say=pc]I want your ass, kitty.[/say]")

		saynn("Rahi slowly moves her paws down to her shorts and tugs them down, exposing her cute tailhole to you. Her anal ring is quite elastic which means it doesn't look that much different from a virgin hole.. for now.")

		addButton("Fuck her", "Rail that ass", "sex1_start")
	if(state == "sex1_start"):
		playAnimation(StageScene.SexStanding, "sex", {npc="rahi", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("You quickly guide your member towards Rahi's waiting asshole and get a hold of her tail before moving it out of the way. Then you use it as a leash, pulling Rahi back and making her ass take your cock.")

		var analLevel = getModule("RahiModule").getSkillScore("rahiSkillAnal")
		if (analLevel <= 8):
			saynn("She gasps, feeling a mix of pain and pleasure as you stretch her tight hole more.")

		else:
			saynn("She moans, only feeling pleasure as you stretch her trained hole to its comfortable size. You marvel at how easily she takes you in.")

		saynn("As you start thrusting into her, Rahi's body responds eagerly. Her soft inner walls slowly self-lubricate until you can feel almost no friction. More little noises of pleasure escape from your kitty, her body shaking with your every hip motion. You try to be at such an angle so your member puts pressure on a certain point, behind which would be her g-spot. There is a little visible bump on her belly each time you thrust inside.")

		if (analLevel <= 8):
			saynn("[say=rahi]Please, {rahiMaster}! It feels so good.. Having you stretching her butt..[/say]")

		else:
			saynn("[say=rahi]She is such a buttslut, {rahiMaster}!.. It feels too good..[/say]")

		saynn("You continue to fuck her, harder and faster, until Rahi feels the pleasure building inside her. During the pounding, Rahi's ass got stretched enough to fit every inch of your {pc.penis} inside her. Passionate moans escape from Rahi, her neglected pussy dripping onto the floor. You keep yanking on her tail while meeting her halfway each time, your hips slapping against her ass.")

		saynn("[say=rahi]She is so close..[/say]")

		addButton("Cum inside", "Stuff that ass full of your seed", "sex1_cum")
	if(state == "sex1_cum"):
		playAnimation(StageScene.SexStanding, "inside", {npc="rahi", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		var analLevel = getModule("RahiModule").getSkillScore("rahiSkillAnal")
		if (analLevel <= 8):
			saynn("Rahi has worked so hard to get to this point. She doesn't have the most experience and her ass isn't as trained as it could be which leads to her feeling some pain. But you keep pounding her ass, your {pc.penis} rubbing her g-spot through the inner wall that separates her pussy and anus to the point of you forcing her climax to happen.")

		else:
			saynn("Rahi's ass is so trained that she can easily focus on only the pleasure that comes from her backdoor being railed. You don't even rub her g-spot with your {pc.penis} that much through the inner wall. After gaining so much experience, your kitty has rewired her brain to be able to cum just from anal. And she does..")

		saynn("Rahi lets out a scream of ecstasy, her body convulsing as she cums hard. You hold her from falling by her tail and keep fucking her ass that clenches around your cock so well. Your own orgasm builds up until you can't hold back any longer.")

		saynn("With a final trust, you shove your {pc.penis} as deep as Rahi can take before proceeding to pump her ass full of your seed, filling her with warmth. Rahi's inner walls basically milking your member, draining your balls. Your legs shake but you manage to stand.")

		saynn("You lean towards Rahi and place your chin on her shoulder. Your kitty is purring, still with your cock up her butt.")

		if (analLevel <= 8):
			saynn("[say=pc]Such a good buttslut.[/say]")

			saynn("[say=rahi]T-thank you, {rahiMaster}..[/say]")

		else:
			saynn("[say=pc]You're a true buttslut. And I couldn't be more proud of you.[/say]")

			saynn("[say=rahi]T-Thank you, {rahiMaster}..[/say]")

		saynn("You pull your member out, leaving Rahi's gaping used hole to leak your {pc.cum} and slowly close up. She looks back at you over her shoulder and bites her lip until her anal ring closes up completely and looks all neat and tight again..")

		addButton("Enough", "That was fun", "endthescene")
		if (getModule("RahiModule").isSkillLearned("rahiSkillWatersports")):
			addButton("Piss inside", "(Watersports) Fill Rahi's ass with your piss", "sex1_pee")
	if(state == "sex1_pee"):
		saynn("After cumming inside Rahi.. you have a sudden urge to pee.. Huh.. And that ass looks quite spacious.")

		saynn("You're still hard so you have no problems pinning Rahi into the wall again and shoving your {pc.penis} inside her used fuckhole. Rahi raises a brow as her anal ring gets forced to stretch more.")

		saynn("[say=rahi]Meow!.. Again?..[/say]")

		saynn("[say=pc]No. Something much better.[/say]")

		saynn("Without explaining too much, you force the urge.. and begin pissing directly inside Rahi's ass. Your warm urine starts to quickly fill her bowels, mixing with the {pc.cum} that was there already..")

		saynn("[say=rahi]Ah.. F-feels so.. Strange.. Are you?..[/say]")

		saynn("You nod and rest your chin on her shoulder as you keep relieving yourself inside your kitty, forcing her to be your piss toilet. When Rahi realizes that, her face turns red, she tries to hide her soft moans but you can tell..")

		saynn("[say=pc]Good girl.. You're such a good piss toilet, aren't you?[/say]")

		saynn("Rahi huffs while her belly begins to look slightly inflated due to the piss enema. Her lips are trembling..")

		saynn("When you're done doing your business, you begin to slowly pull your dick out. Some of the gross fluids leak out but Rahi quickly covers her ass, preventing most of it.")

		saynn("[say=rahi]She will be right back..[/say]")

		saynn("Kitty tries to run off but you grab her hand and stop her.")

		saynn("[say=pc]No. You stay like this.[/say]")

		saynn("Rahi huffs but obeys you. She sticks a few fingers up her butt, preventing most of the leakage.")

		addButton("Enough", "That was too lewd", "endthescene")
	if(state == "sex2_strapon"):
		playAnimation(StageScene.SexStanding, "tease", {npc="rahi"})
		saynn("Rahi lays on her bed, just chilling. Seeing how she seductively wiggles her rear makes you want to take her.. and fuck her ass with something. You can feel yourself getting more aroused just thinking about railing that ass..")

		saynn("Without warning, you grab Rahi's paw and pull her off the bed before pressing her body against the wall. Your paws groping Rahi's ass and prodding her anus through the shorts. Kitty mewls softly.")

		saynn("[say=pc]I want you, kitty. I want that ass.[/say]")

		saynn("Rahi slowly moves her paws down to her shorts and tugs them down, exposing her cute tailhole to you. Her anal ring is quite elastic which means it doesn't look that much different from a virgin hole.. for now.")

		addButton("Find a strapon", "Put on a strapon", "sex2_putonstrapon")
	if(state == "sex2_putonstrapon"):
		playAnimation(StageScene.SexStanding, "tease", {npc="rahi", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("You grab the first strapon that you find inside the crate of toys and put it on. Then you return to your needy kitty and slip your new toy between her hips, letting Rahi coat it with her juices as she grinds her wet pussy against it.")

		addButton("Fuck her", "Rail that ass", "sex2_start")
	if(state == "sex2_start"):
		playAnimation(StageScene.SexStanding, "sex", {npc="rahi", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("You quickly guide your strapon towards Rahi's waiting asshole and get a hold of her tail before moving it out of the way. Then you use it as a leash, pulling Rahi back and making her ass take your rubber cock.")

		var analLevel = getModule("RahiModule").getSkillScore("rahiSkillAnal")
		if (analLevel <= 8):
			saynn("She gasps, feeling a mix of pain and pleasure as you stretch her tight hole more.")

		else:
			saynn("She moans, only feeling pleasure as you stretch her trained hole to its comfortable size. You marvel at how easily she takes the strapon in.")

		saynn("As you start thrusting into her, Rahi's body responds eagerly. Her soft inner walls slowly self-lubricate until you can feel almost no friction. More little noises of pleasure escape from your kitty, her body shaking with your every hip motion. You try to be at such an angle so your strapon dildo puts pressure on a certain point, behind which would be her g-spot. There is a little visible bump on her belly each time you thrust inside.")

		if (analLevel <= 8):
			saynn("[say=rahi]Please, {rahiMaster}! It feels so good.. Having you stretching her butt..[/say]")

		else:
			saynn("[say=rahi]She is such a buttslut, {rahiMaster}!.. It feels too good..[/say]")

		saynn("You continue to fuck her, harder and faster, until Rahi feels the pleasure building inside her. During the pounding, Rahi's ass got stretched enough to fit every inch of your shiny rubber member inside her. Passionate moans escape from Rahi, her neglected pussy dripping onto the floor. You keep yanking on her tail while meeting her halfway each time, your hips slapping against her ass.")

		saynn("[say=rahi]She is so close..[/say]")

		addButton("Cum inside", "Stuff that ass full of your seed", "sex2_cum")
	if(state == "sex2_cum"):
		playAnimation(StageScene.SexStanding, "inside", {npc="rahi", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		var analLevel = getModule("RahiModule").getSkillScore("rahiSkillAnal")
		if (analLevel <= 8):
			saynn("Rahi has worked so hard to get to this point. She doesn't have the most experience and her ass isn't as trained as it could be which leads to her feeling some pain. But you keep pounding her ass, the strapon rubbing her g-spot through the inner wall that separates her pussy and anus to the point of you forcing her climax to happen.")

		else:
			saynn("Rahi's ass is so trained that she can easily focus on only the pleasure that comes from her backdoor being railed. You don't even rub her g-spot with your rubber strapon that much through the inner wall. After gaining so much experience, your kitty has rewired her brain to be able to cum just from anal. And she does..")

		saynn("Rahi lets out a scream of ecstasy, her body convulsing as she cums hard. You hold her from falling by her tail and keep fucking her ass that clenches around your rubber shaft so well. You don't feel much direct stimulation but it's hard to explain how aroused you are..")

		saynn("With a final trust, you shove your strapon as deep as Rahi can take. The toy has received enough friction to release its contents, it proceeds to pump Rahi's ass full of thick creamy cum lube, filling her with warmth. Rahi's inner walls are basically milking your fake member.")

		saynn("You lean towards Rahi and place your chin on her shoulder. Your kitty is purring, still with your rubber strapon up her butt.")

		if (analLevel <= 8):
			saynn("[say=pc]Such a good buttslut.[/say]")

			saynn("[say=rahi]T-thank you, {rahiMaster}..[/say]")

		else:
			saynn("[say=pc]You're a true buttslut. And I couldn't be more proud of you.[/say]")

			saynn("[say=rahi]T-Thank you, {rahiMaster}..[/say]")

		saynn("You pull the strapon out, leaving Rahi's gaping used hole to leak cum lube and slowly close up. She looks back at you over her shoulder and bites her lip until her anal ring closes up completely and looks all neat and tight again..")

		addButton("Enough", "That was fun", "removestraponfrompc")
	if(state == "fist1"):
		playAnimation(StageScene.Spanking, "tease", {npc="rahi", npcBodyState={naked=true}})
		saynn("Rahi lays on the bed, just chilling. She is quite a skilled buttslut by this point. But. It's time to put her skills and her ass under a test.")

		saynn("You sit nearby and put your hand on Rahi's butt, gently rubbing it for a bit before firmly squeezing one of the buttcheeks, making kitty mewl.")

		saynn("[say=pc]Ready, kitty?[/say]")

		saynn("Rahi nods eagerly, her eyes bright with anticipation.")

		saynn("You begin by tugging on kitty's hips, urging her to get on all fours. She does so and then pulls her shorts down, exposing her fluffy butt. As she spreads her buttocks for you with her paws, her tight-looking pink asshole easily stretches open, showing how trained it is. Her being aroused triggers her butt to start self-lubricating itself. Both her holes are looking wet and needy. But you know which one you're going for today..")

		saynn("You're gonna go for some extreme stuff today so better grab some normal lube too.")

		addButton("Lube", "Lube her up", "fist1_lube")
	if(state == "fist1_lube"):
		saynn("You grab a tube of special water-based lube and pour it over your whole hand. Kitty raises a brow when you cover the whole.. palm.. in it. After that's done, you rub some into Rahi's trained tailhole, making it twitch.")

		saynn("[say=pc]Let's see how much you can handle, kitty.[/say]")

		saynn("You start with one finger, sliding it in and out, getting a feel for the tightness of her hole. Rahi's anal ring is quite elastic, obeying your touch.")

		saynn("You add another finger. And then another. Each one stretching her anus open a little further. Rahi moans softly, her body already starting to tremble a bit.")

		saynn("Fourth one goes in without much effort from your part too.. But that's when things change. Rahi whimpers as you try to insert your entire hand, her backdoor stretching wide but still struggling to accommodate the size.")

		saynn("[say=rahi]That.. meee-eow.. might be too much..[/say]")

		saynn("Her squished pussy drips more juices the more pressure you put on her tailhole. Using sheer force and lots of lube, you finally manage to work your fist inside her ass, feeling the heat of her body all around it. Rahi tenses up and moans like a slut, you can feel exactly how strong her inner walls clench around you.")

		saynn("You begin to slowly move your fist inside her, pulling it out almost fully just to shove it back inside, creating the empty space and then filling it straight after. Rahi moans in ecstasy, the pleasure overwhelming her senses.")

		saynn("[say=rahi]H-harder!..[/say]")

		saynn("You feel obliged. And so you listen, switching from slow motions to pretty much slamming your fist into her ass, pounding that stretched anus so hard that it makes wet noises. It doesn't take long for her to start feeling the pressure building inside her.")

		saynn("Suddenly, she convulses, her body shaking with the force of a crazy orgasm. A rush of transparent fluids gushes out of her pussy, soaking the bed beneath her. You can feel the walls of her hole clenching and releasing around your fist as you keep shoving it in.")

		saynn("Even though she came, you weren't finished yet. You continue to pound her ass with your fist, driving her orgasm further, corrupting her poor feline mind. Rahi squirts again and again, her body shaking and quivering as the waves of ecstasy wash over her.")

		saynn("Finally, you withdrew your hand, leaving Rahi panting and gasping for breath. The sight that opened to you is.. quite interesting.")

		saynn("Rahi's once tight and neat anus got left gaping wide open after that intense fisting session. The pink, pretty flesh of her asshole now looking stretched and irritated, with small droplets of lube and other fluids still seeping out of the opening. The walls of her anus pulsed and quivered, struggling to regain their original form and close up.. With Rahi moaning each time she tries to clench.")

		saynn("Her stretched hole is so open and exposed that you can see deep inside.. and marvel at the sigh of her soft inner walls. You can.. feel.. the heat radiating from her as she lays there, her body still trembling. Despite the intense stretching, there was no sign of pain on her face, only a look of pure bliss and satisfaction.")

		saynn("[say=rahi]She is such a buttslut..[/say]")

		saynn("The more you watch, the more you use Rahi's anus slowly starting to close up. But even after several minutes, it remains slightly stretched and gaping.")

		addButton("Enough", "That was fun", "endthescene")
		if (getModule("RahiModule").isSkillLearned("rahiSkillMasochist")):
			addButton("Double fisting", "(Masochism) Stretch her ass even more!", "fist1_double")
	if(state == "fist1_double"):
		saynn("As you watch Rahi's gaping anus struggling to close up.. You can't help but wonder.. If you could push her limits even further. With a little mean grin on your face, you slowly insert your hand back into the willing gaping hole, receiving almost no resistance. But now.. you also start to insert your second fist.. making kitty whine as you're attempting to stretch her even wider than before.")

		saynn("[say=pc]H-hey!.. Ah.. F-fuck..[/say]")

		saynn("Rahi gasps in shock and pain as you somehow manage to work both of your hands inside her. It was quite easy to do when both of them were palms. But when you clench them both into fists.. Rahi arches her back as her anus now looks stretched almost unnaturally.")

		saynn("You start moving both of your fists in and out of her, Rahi's body contorting and writhing with each thrust. It's painful for her.. but she also couldn't help but to feel an overwhelming sense of pleasure as her body was pushed to its limits.")

		saynn("As you continue to pound her ass with both fists, Rahi's pussy starts to squirt again, each orgasm more intense than the last, causing her neglected slit to gush fluids out uncontrollably. Rahi screams and moans like a buttslut, her body convulsing as wave after wave of pleasure washes over her.")

		saynn("Finally, after making her cum so many times that she can't even squirt anymore, Rahi collapses, her body spent and completely drained of all energy. You slowly withdraw your fists from her gaping hole, leaving her once tight anus stretched and sore. You can't help but to get a closer look at it again.")

		saynn("Rahi's ass is left completely gaping and stretched after the intense double fisting. The tight anal ring is now extremely loose, pulsing and not even trying to close up. The walls of her anus are red and raw from the intense pounding, the skin there is shiny with sweat and lube.")

		saynn("[say=rahi]Feels.. so.. f-fucking.. g-good..[/say]")

		saynn("Rahi is drooling onto her pillow, her legs shaking slightly. Better to leave her to rest for a bit.")

		addButton("Enough", "That was hard", "endthescene")
	if(state == "toy1"):
		playAnimation(StageScene.HorsecockDildoSex, "tease", {pc="rahi", bodyState={naked=true}})
		saynn("Time for a real test. You rummage through the crate of toys and find the biggest one.. a giant horsecock dildo. Quite a realistic one, its shaft has many bumpy veins that are sure to add extra sensations. And wow is it heavy..")

		saynn("As you place it in the middle of the cell, Rahi can't help but to open her mouth at its size. She looks at you.. with her pleading eyes. You nod.")

		saynn("Rahi quickly drops her clothes and already positions herself above the giant toy, grinding the big flared tip with her pussy and ass.")

		saynn("You decide to take a seat on her bed and just watch.")

		saynn("[say=pc]Need some lube, kitty?[/say]")

		saynn("[say=rahi]No..[/say]")

		saynn("Rahi spreads her legs more and bends slightly, making it look like she is just resting her ass on the toy.. but in fact she tries to take it in.. You can tell how aroused she is, her nipples looking incredibly stiff, her needy pussy is getting wet.. just like her ass.")

		saynn("[say=pc]Well. Show me what you learned, kitty. Do you wanna be the.. best.. anal slut?[/say]")

		saynn("Rahi moans in response.. her butt grinding into that toy harder.. her tight-looking asshole stretching.. more and more.. until..")

		addButton("Continue", "See what happens next", "toy1_ride")
	if(state == "toy1_ride"):
		playAnimation(StageScene.HorsecockDildoSex, "sex", {pc="rahi", bodyState={naked=true}})
		saynn("Rahi manages to let the flared tip of the dildo open up her trained asshole enough to slip inside, stretching her anal ring wide and making her almost fall onto the shaft from this sudden shift.")

		saynn("A deep breath escapes Rahi as she takes the horsecock's head. But now she proceeds to slowly lower herself onto it further, now stretching her inner walls too until there appears a visible bump on her belly. Surprisingly.. or not.. Rahi takes most of it.. even past the fat ring that the rubber cock has near the base. And she doesn't stop there, she starts riding the thing, raising her body just to slam back onto the toy.")

		saynn("You watch in awe while Rahi conquers that huge dildo, her hips grinding back and forth as she hungrily tries to take the entire length deep inside her ass. One of her paws rests on that bump on her belly that keeps appearing at the lowest peak of each motions. Moans already escape from her lips, her face expression looks.. incredibly lusty.")

		saynn("[say=pc]Wow. This makes me wanna call you.. an anal queen. Keep it up, kitty.[/say]")

		saynn("Kitty only makes more pleasure noises in response, her body shivers, responding to the intense pleasure of the horsecock dildo filling her up. She moves faster and harder.. her ass slamming onto the toy with each thrust..")

		saynn("Finally, Rahi lets out a scream of pleasure, her body shaking with the force of a pure anal orgasm. Her pussy squirts all over the floor. That leaking slit looks quite squished because of a huge object in her anus. Her legs give up, causing the kitty to get impaled into the rubber shaft as deep as her bowels allow.. which means.. Rahi takes the giant horsecock balls deep.")

		saynn("[say=rahi]F-Fu-u-uck-!..[/say]")

		saynn("Her pussy keeps gushing out girlcum and then just pulsing when there is nothing left. Rahi throws her head back and moans like a slut while her stretched inner walls desperately clench around that shaft.. So much has changed since that time the kitty couldn't even take a few fingers into her ass..")

		saynn("Her tongue is out.. she is drooling.. her eyes rolled up. You can't help but to smile, admiring the view.")

		saynn("[say=pc]Proud of you, kitty.[/say]")

		saynn("She weakly reacts to your words, looking up at you.. and smiling back..")

		addButton("Inspect", "Make Rahi show you her anus", "toy1_inspect")
	if(state == "toy1_inspect"):
		playAnimation(StageScene.HorsecockDildoSex, "tease", {pc="rahi", bodyState={naked=true}})
		saynn("As you help Rahi to get up, the flared tip finally leaves her ass.. with a satisfying Plop.. leaving Rahi to gasp and her ass to gape. Her anus is visibly stretched open, the muscles around the opening are still twitching and contracting ever so slightly.")

		saynn("The skin around her anus is red and raw, showing lots of signs of stretching and friction caused by that massive horsecock. Despite all of that, Rahi is smiling silly.")

		saynn("Eventually her butthole begins to close up as Rahi manages to gather enough strength to clench. And wow, after her star closes, it again looks all tight and neat.. probably because of her feline elasticity.")

		saynn("Rahi is officially.. an anal queen.")

		addButton("Enough", "That was lewd", "endthescene")

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

	if(_action == "do_random_sex"):
		var possible = []
		if(GM.pc.hasReachablePenis()):
			possible.append("sex1")
		else:
			possible.append("sex2_strapon")
		getModule("RahiModule").advanceSkill("rahiSkillAnal")
		setState(RNG.pick(possible))
		return

	if(_action == "fist1"):
		getModule("RahiModule").advanceSkill("rahiSkillAnal")

	if(_action == "toy1"):
		getModule("RahiModule").advanceSkill("rahiSkillAnal")

	if(_action == "cancelactivity"):
		increaseFlag("RahiModule.rahiTired", -1)
		endScene()
		return

	if(_action == "scene1_try"):
		processTime(5*60)

	if(_action == "scene3_bed"):
		processTime(20*60)

	if(_action == "sex1_start"):
		processTime(5*60)

	if(_action == "sex1_cum"):
		processTime(5*60)
		getCharacter("rahi").cummedInAnusBy("pc")
		GM.pc.orgasmFrom("rahi")
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "rahi_anal")
		GM.pc.addSkillExperience(Skill.CumLover, 30, "rahi_anal")

	if(_action == "sex1_pee"):
		processTime(5*60)
		getCharacter("rahi").cummedInAnusBy("pc", FluidSource.Pissing)
		getModule("RahiModule").advanceSkill("rahiSkillWatersports")

	if(_action == "sex2_putonstrapon"):
		var straponTypes = ["Strapon", "StraponCanine", "StraponDragon", "StraponFeeldoe", "StraponFeline"]
		var strapon = GlobalRegistry.createItem(RNG.pick(straponTypes))
		var fluids = strapon.getFluids()
		fluids.addFluid("CumLube", RNG.randi_range(3, 5)*100.0)
		GM.pc.getInventory().equipItem(strapon)

	if(_action == "sex2_start"):
		processTime(5*60)

	if(_action == "sex2_cum"):
		processTime(5*60)
		getCharacter("rahi").cummedInAnusBy("pc", FluidSource.Strapon)
		GM.pc.orgasmFrom("rahi")
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "rahi_anal")
		GM.pc.addSkillExperience(Skill.CumLover, 30, "rahi_anal")

	if(_action == "removestraponfrompc"):
		GM.pc.getInventory().clearSlot(InventorySlot.Strapon)
		endScene()
		return

	if(_action == "fist1_lube"):
		processTime(3*60)

	if(_action == "fist1_double"):
		getModule("RahiModule").advanceSkill("rahiSkillMasochist")
		processTime(20*60)

	if(_action == "toy1_ride"):
		processTime(10*60)

	setState(_action)
