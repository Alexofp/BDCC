extends SceneBase

func _init():
	sceneID = "rahiActivityDominanceScene"

func _run():
	if(state == ""):
		addCharacter("rahi")
		saynn("What do you wanna teach Rahi about dominance?")

		var domLevel = getModule("RahiModule").getSkillScore("rahiSkillDominance")
		if (domLevel == 0):
			addButton("First steps", "Start teaching Rahi the basics", "scene1")
		if (domLevel == 1):
			addButton("First steps", "Teach Rahi more of the basics", "scene2")
		if (domLevel == 2):
			addButton("First steps", "Teach Rahi even more of the basics", "scene3")
		addButton("Never mind", "You changed your mind", "cancelactivity")
	if(state == "scene1"):
		saynn("You approach your kitty and gently pat her on the head.")

		saynn("[say=rahi]She was thinking about something..[/say]")

		saynn("[say=pc]About what, kitty?[/say]")

		saynn("Rahi strokes her tail that is wrapped around her waist.")

		saynn("[say=rahi]Other inmates were giving her a lot of trouble before.. She.. she needs to become more.. assertive.. dominant.[/say]")

		saynn("Her voice sounds so soft. How could you not offer help to such a submissive cutie?")

		saynn("[say=pc]You have me. I can teach you a thing or two. Anything in particular you wanna learn?[/say]")

		saynn("[say=rahi]Um.. You could pretend to be one of the other inmates.. So she can.. give you some commands?..[/say]")

		saynn("You scritch Rahi behind her ears.")

		saynn("[say=pc]You don't have to make me pretend. I'm fine with you giving me commands. You obviously won't do it out of malice.[/say]")

		saynn("Rahi blushes. Feels like she makes it harder for herself for no reason.")

		saynn("[say=rahi]Yeah, but.. She kinda.. belongs to you, {rahiMaster}.. It would be.. strange for her..[/say]")

		saynn("[say=pc]Do what makes you feel better, kitty. You won't hurt me no matter what.[/say]")

		saynn("Kitty nods and gently escapes your touch by taking a few steps back. She then takes a deep breath, her tail unwinding from her waist.")

		saynn("[say=rahi]Okay.. here goes. That chair.. bring it closer to her..[/say]")

		saynn("She points at the metal chair that every cell has in one of the corners. It's chained to the floor but the chain should be long enough for this.")

		addButton("Obey", "Do what kitty tells you to do", "scene1_obey")
		addButton("Disobey", "Try to be bratty with Rahi", "scene1_disobey")
	if(state == "scene1_disobey"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi"})
		saynn("You look at Rahi and cross your arms.")

		saynn("[say=pc]And what if I won't do that?[/say]")

		saynn("Rahi opens her mouth, about to say something. But then she gets very confused and small.")

		saynn("[say=rahi]Uh.. um.. t-that's.. that's okay..[/say]")

		saynn("Her ears droop, eyes getting all watery. Her tail wraps around her waist again and gets glued to her body.")

		saynn("[say=pc]Aw, my bad kitty.[/say]")

		saynn("She is clearly lacking all the experience. You walk up to Rahi and hug her, trying to make her feel better.")

		saynn("[say=rahi]No.. not your.. me-eow..[/say]")

		saynn("Maybe that was a little too harsh on your part.")

		addButton("Continue", "Aww", "endthescene")
	if(state == "scene1_obey"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="sit"})
		saynn("You nod and go grab the chair before placing it before Rahi.")

		saynn("[say=pc]Here.[/say]")

		saynn("[say=rahi]Um.. t-thanks.[/say]")

		saynn("Kitty turns it around so it faces you and then sits on it.")

		saynn("[say=pc]You don't have to be polite, just so you know. You make the rules.[/say]")

		saynn("Rahi nods and looks up at you, standing near. Her lips tremble a little.")

		saynn("[say=rahi]Okay.. She wants you to.. kneel down and bow your head to her..[/say]")

		saynn("That's a way bigger ask.")

		addButton("Kneel", "Might as well do it", "scene1_kneel")
		addButton("Disobey", "Try to be bratty with Rahi", "scene1_disobey")
	if(state == "scene1_kneel"):
		playAnimation(StageScene.Duo, "kneel", {npc="rahi", npcAction="sit"})
		saynn("You raise an eyebrow but comply with Rahi's command, getting on your knees before her and lowering your head, bowing.")

		saynn("As soon as you do that, Rahi feels a wave of shyness wash over her.")

		saynn("[say=rahi]Um.. nevermind.. You can stand up now..[/say]")

		saynn("[say=pc]Something wrong, kitty?[/say]")

		saynn("[say=rahi]No, no.. It's just.. She doesn't know how to react when you obey her..[/say]")

		saynn("You place a hand on her lap and ruffle the fur of her thighs.")

		saynn("[say=pc]It's okay, kitty. It takes time. You did very well. What we're doing here.. it's for fun, you know? Test your limits, test my limits, see what works.[/say]")

		saynn("Rahi nods softly, her eyes still show some embarrassment.")

		saynn("[say=rahi]Okay..[/say]")

		saynn("[say=pc]You rest now, kitty.[/say]")

		saynn("You get up and kiss Rahi on the forehead.")

		saynn("Hopefully your words had an effect on her.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "scene2"):
		saynn("You approach your kitty to give her some headpats.")

		saynn("[say=pc]Wanna do a little roleplay? With you in charge?[/say]")

		saynn("[say=rahi]Meow?..[/say]")

		saynn("Kitty purrs and nuzzles your hand.")

		saynn("[say=pc]For example, you ordered me to bring you some milk. But, oh no, I spilled some of it while walking to you.[/say]")

		saynn("You hold an imaginary glass in your hand that you purposefully tilt to the side, spilling the imaginary milk on the floor.")

		saynn("Rahi's ears perk as she sees you do that. And she is.. pouting. Such a waste of a perfectly fine imaginary milk makes her frown.")

		addButton("Continue", "See what happens next", "scene2_conflict")
	if(state == "scene2_conflict"):
		playAnimation(StageScene.Duo, "defeat", {npc="rahi", npcAction="shove"})
		saynn("Suddenly Rahi grabs you by the collar and yanks you down to your knees. She was so fast that you didn't even get a chance to resist.")

		saynn("[say=rahi]Look what you did!.. You.. stupid slut![/say]")

		saynn("She went from zero to a hundred in seconds. Kitty growls as she holds your collar so low that you can almost kiss the cold floor.")

		saynn("[say=rahi]She can't drink that![/say]")

		saynn("You don't even know what words to pick to not make Rahi even angrier, you rarely see her like this. But you're not sure if you're regretting this.")

		saynn("[say=pc]My bad?[/say]")

		saynn("She yanks on your hair, bringing you all the pain, before slapping your cheek and placing her paw on your neck. She applies a fair amount of strength, making breathing hard. Rahi's angry gaze drills you.")

		saynn("[say=rahi]Excuses won't help you.. bitch! You're gonna lick it all up with your tongue. Or.. You're gonna lick my paws![/say]")

		saynn("[say=pc]Kh-h..[/say]")

		saynn("That paw on your throat doesn't really leave you much of a choice. But it's still.. a.. choice.")

		addButton("Lick floor", "Lap up the imaginary spilled milk", "scene2_lickfloor")
		addButton("Lick paws", "Lick Rahi's hind paws instead", "scene2_lickpaws")
	if(state == "scene2_lickfloor"):
		saynn("You nod a few times towards the floor. Rahi sees it and pulls your head down again, making you lower yourself so much your face touches the cold floor. You cough after being choked while your kitty places her hind leg on your back, taking away your right to slack.")

		saynn("Even though the milk was imaginary, the punishment feels quite real. You stick your tongue out and pretend to lick the floor. But each time you try to lick just the air, Rahi puts more pressure on your back with her leg.")

		saynn("[say=rahi]Lick properly![/say]")

		saynn("She is being serious, isn't she.. Okay, you stop trying to resist and let your tongue touch the cold dirty surface. So.. humiliating.. But you have no choice but to start dragging your tongue in little circles around Rahi.")

		saynn("[say=rahi]Much.. better.. meow.. oh..[/say]")

		saynn("Her voice softens up as she realizes something. She takes her leg off of your back while you continue to obey her command, licking the floor.")

		saynn("[say=rahi]Sorry.. You're.. okay?[/say]")

		saynn("You slowly raise yourself until you're kneeling again and look up at Rahi. You clean your tongue with your hands, trying to avoid swallowing all the dirt.")

		saynn("[say=pc]Yeff?[/say]")

		addButton("Continue", "See what happens next", "scene2_outcome")
	if(state == "scene2_lickpaws"):
		playAnimation(StageScene.SexFeetPlay, "head", {pc="rahi", npc="pc"})
		saynn("You nod a few times towards Rahi's paws. She sees it and pushes you on the floor before placing her hind leg on your face, her paw pads brushing against your cheeks. You cough after being choked while kitty lets you feel the claws of her paws gently scratching you.")

		saynn("Even though the milk was imaginary, the punishment feels quite real. You slowly stick your tongue out and pretend to lick her toes. But that wasn't enough for Rahi, she shoves her foot into your mouth and growls.")

		saynn("[say=rahi]Lick properly![/say]")

		saynn("She is being serious, isn't she.. Okay, you stop trying to resist and start dragging your tongue over her paw pads that she so eagerly offers you. Slowly you begin to get into it yourself, thrusting your tongue between her toes and licking there too, causing Rahi to wiggle them in your mouth.")

		saynn("[say=rahi]Much.. better.. meow.. oh..[/say]")

		saynn("Her voice softens up as she realizes something. She pulls away her hind paw.")

		saynn("[say=rahi]Sorry.. You're.. okay?[/say]")

		saynn("You slowly raise yourself until you're kneeling again and look up at Rahi. You clean your tongue with your hands, trying to avoid swallowing all the dirt and dust.")

		saynn("[say=pc]Yeff?[/say]")

		addButton("Continue", "See what happens next", "scene2_outcome")
	if(state == "scene2_outcome"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi"})
		saynn("Kitty swipes the dust off you and helps you to get up before placing her paws on your cheeks.")

		saynn("[say=rahi]She doesn't know what happened.. She just.. She doesn't know..[/say]")

		saynn("[say=pc]You did.. good. It would be nice to consider me a little bit more.. You know, just avoid choking me to death. Doms are allowed to be kind too.[/say]")

		saynn("Rahi tilts her head down and pulls her paws away. Her shy posture tells you everything.")

		saynn("[say=rahi]Sorry.. She will never be a good dominant..[/say]")

		saynn("Now it's your turn to put your hands on her cheeks and caress them.")

		saynn("[say=pc]Don't say that, kitty. You try and you learn. I certainly enjoyed.. some of it.[/say]")

		saynn("She offers you a soft but nervous smile.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "scene3"):
		saynn("You approach your kitty and offer her a playful smile.")

		saynn("[say=pc]Wanna practice your domming skills a little bit, kitty?[/say]")

		saynn("Rahi tilts her head down.")

		saynn("[say=rahi]She.. she doesn't know..[/say]")

		saynn("You give your kitty a tight hug and gently rub her back.")

		saynn("[say=pc]Aw. C'mon, it's gonna be fun. I can take anything you throw at me.[/say]")

		saynn("Kitty deliberates for a few seconds. Then she finally nods softly.")

		saynn("[say=rahi]Yeah, okay.. But she will try to avoid.. getting aggressive again..[/say]")

		saynn("[say=pc]I mean.. your choice, kitty. Do what's fun for you.[/say]")

		saynn("The feline escapes your grasp and takes a few steps back. She takes a deep breath and rubs her face with her paws.")

		saynn("[say=rahi]Alright.. She wants to sit. Bring the chair.[/say]")

		saynn("That's a simple enough task.")

		addButton("Obey", "Bring the chair for Rahi", "scene3_bringchair")
	if(state == "scene3_bringchair"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="sit"})
		saynn("You go ahead and grab the familiar chair before placing it near Rahi. She gives you.. the silent look. Oh. Right. You remember to rotate the chair for her so it faces you.")

		saynn("Rahi plops her fluffy butt onto the chair and looks up at you, towering over her.")

		saynn("[say=rahi]Get on your knees before her.[/say]")

		saynn("Oh wow, her voice doesn't even sound that shy. Maybe because she already gave you that order before.")

		addButton("Obey", "Do as she says", "scene3_kneel")
		addButton("Disobey", "Try to test the kitty", "scene3_notkneel")
	if(state == "scene3_notkneel"):
		saynn("You decide to test the kitty a little. You begin kneeling but instead of fully committing, you stop half-way and get up again. That makes your kitty.. pout.. but she quickly catches herself.")

		saynn("[say=pc]What if.. what if I don't?[/say]")

		saynn("Rahi sighs deeply.")

		saynn("[say=rahi]If you don't - nothing is gonna happen. No fun for you. But.. If you kneel before her.. you might get to enjoy yourself. And make her proud too. Mhm?[/say]")

		saynn("That's.. you can't say that you expected that answer. The idea of obeying suddenly seems more enticing.")

		addButton("Obey", "Do as she says", "scene3_kneel")
	if(state == "scene3_kneel"):
		playAnimation(StageScene.Duo, "kneel", {npc="rahi", npcAction="sit"})
		saynn("You slowly get on your knees before Rahi. She nods after you do that and rests in her chair, crossing her legs.")

		saynn("[say=rahi]From now on.. She wants you to call her.. Miss.. Miss Rahi.[/say]")

		saynn("She tilts her head slightly.")

		saynn("[say=rahi]Do you understand?[/say]")

		saynn("You eagerly agree.")

		saynn("[say=pc]Yes, Miss Rahi. I'm yours to command.[/say]")

		saynn("She points at her leg.")

		saynn("[say=rahi]She could use a little massage.[/say]")

		saynn("Sure. You reach your hands out and begin kneading Rahi's foot and shin. You make sure to rub her toes and all the paw pads before brushing your palms over her fur and removing any tension there by massaging her muscles.")

		saynn("Kitty throws her head back and produces.. a muffled noise of satisfaction.")

		saynn("[say=rahi]Stop.[/say]")

		saynn("You pull your hands away from her leg and continue kneeling.")

		saynn("[say=rahi]Get on all fours. Your Miss wants you to crawl around her three times.[/say]")

		saynn("That's.. a somewhat random request. But do you wanna question it?")

		addButton("Obey", "Do as she says", "scene3_crawlaround")
		addButton("Be a brat", "You won't do it unless she makes you do it", "scene3_brat")
	if(state == "scene3_brat"):
		playAnimation(StageScene.Duo, "crawl", {npc="rahi", npcAction="sit"})
		saynn("Instead of just blindly following Rahi's command, you stick your tongue out at her.")

		saynn("[say=pc]How about you make me, Miss Rahi?[/say]")

		saynn("Kitty leans forward and extends her claws before gently scratching your tongue. Ow.")

		saynn("[say=rahi]She won't force you.. little.. silly.. pet.[/say]")

		saynn("Somehow her almost emotionless delivery of that sentence makes you want to obey her so much. You get on all fours and start crawling around her chair, three circles, just like she ordered.")

		saynn("[say=rahi]Bark for her.[/say]")

		saynn("[say=pc]Bark?..[/say]")

		saynn("Either way, you comply, barking a few times for Rahi. That makes you feel both aroused and humiliated.")

		addButton("Continue", "See what happens next", "scene3_outcome")
	if(state == "scene3_crawlaround"):
		playAnimation(StageScene.Duo, "crawl", {npc="rahi", npcAction="sit"})
		saynn("You don't brat at Rahi and instead get on all fours before proceeding to crawl around her chair, three circles, just like she ordered.")

		saynn("[say=rahi]Bark for her.[/say]")

		saynn("[say=pc]Bark?..[/say]")

		saynn("Either way, you comply, barking a few times for Rahi. That makes you feel both aroused and humiliated.")

		saynn("[say=rahi]Such a little.. silly.. pet.[/say]")

		addButton("Continue", "See what happens next", "scene3_outcome")
	if(state == "scene3_outcome"):
		playAnimation(StageScene.Duo, "kneel", {npc="rahi", npcAction="sit"})
		saynn("After the scene is over you are left kneeling before your kitty. Everything went alright. But something is clearly.. troubling her. She stops crossing her legs and instead leans closer to you.")

		saynn("[say=rahi]That went.. better. But.. It was also kinda.. boring?.. Don't you agree?[/say]")

		saynn("[say=pc]You don't have to push your limits each time, kitty. I mean.. Miss Rahi.[/say]")

		saynn("She smiles softly.")

		saynn("[say=rahi]Yeah.. But last time she went too far.. Couldn't even control herself.. It's not fun to injure you and not even remember it..[/say]")

		saynn("[say=pc]I trust you to push me as far as you want.[/say]")

		saynn("Kitty sighs.")

		saynn("[say=pc]I guess the real answer is.. balance. You should try to balance between anger and kindness.. I think that's where the most fun is.[/say]")

		saynn("Rahi tilts her head slightly, watching the ceiling for a bit.")

		saynn("[say=rahi]Meow.. You're probably right.[/say]")

		saynn("You reach your hand out to pat the kitty. She smiles more and purrs even.")

		saynn("[say=pc]You are doing great, Miss Rahi.[/say]")

		saynn("Positive reinforcement is important. But you do begin to get that strange feeling about Rahi. That she might just have a dominant side hidden behind all the layers of shyness and mental problems.")

		addButton("Continue", "That was nice", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "scene1"):
		processTime(10*60)

	if(_action == "scene2"):
		getModule("RahiModule").advanceSkill("rahiSkillDominance")
		processTime(20*60)

	if(_action == "scene3"):
		getModule("RahiModule").advanceSkill("rahiSkillDominance")
		processTime(10*60)

	if(_action == "cancelactivity"):
		increaseFlag("RahiModule.rahiTired", -1)
		endScene()
		return

	if(_action == "scene1_kneel"):
		getModule("RahiModule").advanceSkill("rahiSkillDominance")

	setState(_action)
