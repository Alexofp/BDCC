extends SceneBase

func _init():
	sceneID = "rahiActivityAnalScene"

func _run():
	if(state == ""):
		addCharacter("rahi")
		saynn("What do you wanna teach Rahi about anal sex?")

		var analLevel = getModule("RahiModule").getSkillScore("rahiSkillAnal")
		if (analLevel == 0):
			addButton("First steps", "Start training Rahi's butt", "scene1")
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

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "scene1"):
		processTime(2*60)
		getModule("RahiModule").advanceSkill("rahiSkillAnal")

	if(_action == "cancelactivity"):
		increaseFlag("RahiModule.rahiTired", -1)
		endScene()
		return

	if(_action == "scene1_try"):
		processTime(5*60)

	setState(_action)
