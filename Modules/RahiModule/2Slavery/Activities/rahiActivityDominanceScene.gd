extends SceneBase

func _init():
	sceneID = "rahiActivityDominanceScene"

func _run():
	if(state == ""):
		addCharacter("rahi")
		saynn("What do you wanna teach Rahi about dominance?")

		var domLevel = getModule("RahiModule").getSkillScore("rahiSkillDominance")
		if (domLevel >= 14):
			saynn("Rahi can just feel when you are feeling submissive. She smiles and assumes a confident pose, paws on her sides, ears perking up, eyes already drilling you. Is it time to kneel yet?..")

		elif (domLevel >= 10):
			saynn("Rahi is more and more confident each time you see her. Your kitty is not afraid to look you in the eyes anymore. She bites her lip, imagining what lewd things she can do with you and your body.")

		elif (domLevel >= 6):
			saynn("Rahi has gained more confidence since the last time. She can hold eye contact with you for a few seconds now. And almost doesn't resort to stroking her tail nervously. Your kitty clearly wants to play with you.")

		elif (domLevel >= 3):
			saynn("Rahi looks slightly more confident after all the training you gave her. She sneakily checks you out, ideas forming in her head. But each time your gazes collide Rahi still tilts her head down and blushes.")

		if (domLevel == 0):
			addButton("First steps", "Start teaching Rahi the basics", "scene1")
		if (domLevel == 1):
			addButton("First steps", "Teach Rahi more of the basics", "scene2")
		if (domLevel == 2):
			addButton("First steps", "Teach Rahi even more of the basics", "scene3")
		if (domLevel >= 3):
			addButton("Play", "Let Rahi play with you", "random_play_scene")
			if (domLevel >= 6):
				addButton("Sex", "Let Rahi have sex with you", "random_sex_scene")
				addButton("Pegging", "Let Rahi fuck you in the ass", "random_pegging_scene")
			else:
				addDisabledButton("Sex", "Rahi is not confident enough yet")
				addDisabledButton("Pegging", "Rahi is not confident enough yet")
			if (domLevel >= 14):
				addButton("Submit to", "Submit to Rahi completely for one scene", "submit_scene")
			elif (domLevel >= 6):
				addDisabledButton("Submit to", "Rahi needs to be fully confident in her domming abilities for you to submit to her")
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
	if(state == "play1_lickpussy"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="sit"})
		saynn("Time for some fun. Depending on what mood Rahi is in. She goes ahead and sits on the chair in the opposite corner away from you.")

		saynn("[say=rahi]Get on your knees and crawl here.[/say]")

		saynn("You're at least a few meters away from Rahi. And she is waiting..")

		addButton("Obey", "Get on all fours and crawl to Rahi", "play1_obey")
		addButton("Brat", "Be a brat about it", "play1_brat")
	if(state == "play1_brat"):
		playAnimation(StageScene.Duo, "allfours", {npc="rahi", npcAction="sit"})
		saynn("You spread your arms aside and put on a cheeky smile.")

		saynn("[say=pc]Make me~.[/say]")

		saynn("Suddenly Rahi gets up and starts walking towards you. She is a small cute kitty but right now her posture is quite intimidating. Her claws are out. You're not sure if you're gonna regret this yet.")

		saynn("[say=rahi]You made her stand up.. slut.[/say]")

		saynn("Rahi raises her clawed paw, seemingly about to scratch your face. But instead she delivers a firm spank on your {pc.thick} butt with the palm. And then another. And another, making your butt receive a soft red glow. Each impact makes you yelp from pain.")

		saynn("After that Rahi grabs you by the collar and pulls you behind her. Trying to resist only makes your collar choke you harder. Your kitty sits on the chair and yanks you down to your knees and even lower still, until you're panting on all fours. Yep, this was totally worth it.")

		saynn("[say=rahi]Such a bad.. pet. Now lick.[/say]")

		saynn("She gets a hold on your hair instead and pulls you towards her crotch. Rahi smells.. needy.. down there.")

		addButton("Lick", "Do what the orders you to do", "play1_lick")
	if(state == "play1_obey"):
		playAnimation(StageScene.Duo, "crawl", {npc="rahi", npcAction="sit"})
		saynn("[say=pc]Yes, Miss Rahi..[/say]")

		saynn("You slowly lower yourself to all fours and begin crawling towards Rahi. It takes a while but Rahi enjoys seeing your blushy cheeks while you degrade yourself to a level of a pet.")

		saynn("You crawl on your hands and knees until you're in front of Rahi. She sinks her clawed digits into your hair and scritches your head, her fingers dividing the hair strands.")

		saynn("[say=rahi]Good pet. Now she wants you to pleasure her. Use your tongue to make her cum.[/say]")

		saynn("Her voice is soft and yet filled with authority. She spreads her legs for you, showing off her clothed crotch. You bring your head closer to it.. Her scent.. So needy.")

		addButton("Lick", "Do what the orders you to do", "play1_lick")
	if(state == "play1_lick"):
		playAnimation(StageScene.Duo, "allfours", {npc="rahi", npcAction="sit", npcBodyState={naked=true}})
		saynn("Since you're standing on all fours, you can't really use your hands. And that would be against the spirit of it. So you just press your face against Rahi's shorts and begin nuzzling her there, rubbing your nose and lips against her sensitive spots. The more you do it, the more Rahi spreads her legs for you.")

		saynn("Her own paws land on your head and gently scritch you behind the ears.")

		saynn("[say=rahi]Take off the shorts, pet. No paws.[/say]")

		saynn("Huh. That's a tricky task. You open your mouth and gently bite into the cloth before proceeding to try to pull the shorts off. It's.. hard.. your teeth really like to slip off. Rahi has a cheeky smile on her face. Then she finally gets her butt off the chair slightly, allowing you to make progress.")

		saynn("As you finally get the shorts off, a great view is presented to you. Rahi's gorgeous pink pussy. You don't get to look at it from so close usually. The petals are all tight and neat, enclosing the little sensitive bean at the top. And she is already slightly moist.")

		saynn("Without much hesitation, you stick your tongue out and begin to eagerly lick Rahi's pussy, your motions slow and careful. You circle around her clit a few times and then gently squeeze it between your teeth, sucking. Rahi gets more needy, a few little moans escape from her that she tries to hide.")

		saynn("She suddenly growls at you.")

		saynn("[say=rahi]Faster. She wants you to make her cum hard and fast.[/say]")

		saynn("You pick the pace, your tongue moving faster and more urgently against Rahi's clit and her pussy lips. Every chance you get, you swallow all the wetness that you collect  before returning to lapping up her juices. Your kitty moans in pleasure around your tongue, her paws gripping your hair as she slowly approaches her orgasm..")

		saynn("[say=rahi]Stop.[/say]")

		saynn("She pushes you away. Rahi is not satisfied. Yet.")

		addButton("Continue", "See what happens next", "play1_cum")
	if(state == "play1_cum"):
		playAnimation(StageScene.SexFaceSitting, "grind", {pc="rahi", npc="pc", bodyState={naked=true}, npcBodyState={hard=true}})
		saynn("[say=rahi]Now it's her turn.[/say]")

		saynn("She pushes you onto your back before suddenly straddling your face, forcing you to start eating her out again. This time she is much rougher with you, grinding her crotch against your face and moaning loudly as she uses you for her pleasure.")

		saynn("She forces her scent onto you. But you don't mind, you're happily sticking your tongue out, dragging it over her sensitive parts and lapping up the juices. You can't see much from your position but Rahi has unbuttoned her shirt and is now also squeezing her perky tits, her face shows a very lusty expression.")

		saynn("She can only grind you for so long before she finally cums, her body starts shaking and shivering. Her thighs lock up around your head while her pussy twitches and squirts girlcum all over you. Loud passionate moans escape from her while you are busy swallowing as much of her juices as you can. The rest lands on your hair, face and neck.")

		saynn("After she rides the rest of her pleasure waves, Rahi is left to pant heavily. She raises her crotch off your face, allowing you to breathe, her paws gently stroke your wet cheeks.")

		saynn("[say=rahi]You were a good pet.[/say]")

		saynn("You nod, a satisfied smile on your face.")

		addButton("Enough", "That was fun", "endthescene")
		if (getModule("RahiModule").isSkillLearned("rahiSkillWatersports")):
			addButton("Pee on me?", "(Watersports) Ask Rahi to maybe pee on you", "play1_watersports")
		if (getModule("RahiModule").getSkillScore("rahiSkillAnal") >= 5):
			addButton("Rim Rahi", "(Anal) Ask to lick Rahi's asshole", "play1_rimming")
	if(state == "play1_watersports"):
		playAnimation(StageScene.SexFaceSitting, "sit", {pc="rahi", npc="pc", bodyState={naked=true}, npcBodyState={hard=true}})
		saynn("Even just thinking about it makes you feel embarrassed. Rahi notices your puzzled expression and raises a brow. She is still hovering just above your face.")

		saynn("[say=pc]Maybe.. you wanna.. pee.. Miss Rahi?..[/say]")

		saynn("Rahi tilts her head.")

		saynn("[say=rahi]You want her to.. pee on you?[/say]")

		saynn("You nod, your wet cheeks blushing red. Rahi chuckles softly and then bites her lip. After her orgasm Rahi wouldn't mind relieving herself indeed. And since you're offering..")

		saynn("The kitty starts to pant softly, her paw gently tickling her pussy hole, the small one that's just below the clit.")

		saynn("Very soon the little brown kitty arches her back and lets out a gasp as a stream of piss emerges from that hole. The golden shower quickly washes away any girlcum that you had on you.. replacing the lewd scent.. with a much more gross one. During scene moments you realize that it was so worth it to train your kitty to like pee.")

		saynn("Kitty pisses all over your face, some of her pee lands on your tongue. Tastes awful.. but realizing that your own kitty is marking you.. is so hot. You eagerly swallow the urine and keep your mouth opened for more.")

		saynn("[say=rahi]Such a good.. piss slut.. huff..[/say]")

		saynn("Eventually her piss stream dies down, leaving you with the salty aftertaste. Both you and Rahi are left panting.")

		addButton("Continue", "That was lewd", "endthescene")
	if(state == "play1_rimming"):
		playAnimation(StageScene.SexFaceSitting, "sit", {pc="rahi", npc="pc", bodyState={naked=true}, npcBodyState={hard=true}})
		saynn("You pleased Rahi's pussy with your tongue. But she still has another hole.. Rahi is hovering her crotch above your face, showing you that hole.. A neat little star.. That was neglected so far.")

		saynn("[say=pc]Can I.. can your pet.. maybe..[/say]")

		saynn("Rahi tilts her head.")

		saynn("[say=rahi]Use words, pet.[/say]")

		saynn("[say=pc]Your.. other hole?[/say]")

		saynn("Rahi raises a brow, already mostly recovered from her orgasm. Her juices do still drip onto your face though.")

		saynn("[say=rahi]Meow. Sure.[/say]")

		saynn("She suddenly plops her butt onto your face again. But this time she is shifted forward more, your lips already brushing against her tight tailhole. Her tail suddenly springs into action, wrapping around your neck, becoming a second collar.")

		saynn("[say=rahi]Lick her ass, pet.[/say]")

		saynn("That was said in a very commanding tone. Combined with the tail tightening around your neck, you quickly begin to lick and suck at Rahi's anus, dragging your tongue around it in little circles. So humiliating.. But at the same time, it feels so good.. Rahi lets out a soft purr as she feels your tongue penetrating her star and thrusting deeper into her. Her paw lands on her pussy and begins rubbing the clit for that extra pleasure.")

		saynn("[say=rahi]Good pet.. You're doing such a good job, licking her dirty little hole..[/say]")

		saynn("Her words send shivers of excitement down your spine. Something about being under Rahi's control.. doing such humiliating things for her.. something about that makes you incredibly aroused. You eagerly thrust your tongue deeper into your kitty, exploring every inch of that asshole.")

		saynn("Rahi moans passionately as she feels your tongue teasing her inner walls and making them slick with your saliva. She reaches her other paw to grab your hair and pull you even close, grinding your lips with her anus.")

		saynn("Finally, Rahi leans back and lets out a satisfied sigh.")

		saynn("[say=rahi]That's enough.. little butt slut.. Time for your reward.[/say]")

		if (GM.pc.isWearingChastityCage()):
			saynn("Rahi gets up and then lifts her leg, moving it closer to your chastity cage. It only takes a few strokes with her feet before your locked up dick suddenly bursts with multiple strings of thick ropey {pc.cum} through the little hole in the cage, leaving quite a mess on Rahi's feet.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Rahi gets up and then lifts her leg, moving it closer to your {pc.penis}. It only takes a few strokes with her feet before your member suddenly bursts with multiple strings of thick ropey {pc.cum}, leaving quite a mess on Rahi's feet.")

		elif (GM.pc.hasReachableVagina()):
			saynn("Rahi gets up and then lifts her leg, moving it closer to your wet pussy. She only rubs your clit a few times with her feet before you suddenly cum, your cunt squirting juices all over Rahi's foot, leaving quite a wet mess.")

		else:
			saynn("Rahi gets up and then lifts her leg, moving it closer to your crotch. She only rubs it a few times with her feet before you suddenly cum, your body squirming and shivering under Rahi.")

		saynn("Kitty chuckles seeing that.")

		saynn("[say=rahi]Wow.. She didn't know you like this so much.. good to know..[/say]")

		addButton("Continue", "That was lewd", "endthescene")
	if(state == "play2_toys"):
		saynn("You decide to let Rahi have some fun with you. She has a playful smirk on her face.")

		saynn("[say=rahi]Are you ready for her?[/say]")

		saynn("You nod eagerly while Rahi searches for some.. toys.. and restraints. It seems she found what she wanted.")

		if (!GM.pc.isFullyNaked()):
			saynn("[say=rahi]Undress then.[/say]")

			addButton("Undress", "See what happens next", "play2_getcuffed")
		else:
			addButton("Continue", "See what happens next", "play2_getcuffed")
	if(state == "play2_getcuffed"):
		playAnimation(StageScene.Sybian, "idle", {nosybian=true, bodyState={naked=true}})
		if (!GM.pc.isFullyNaked()):
			saynn("You take off any clothes and present yourself to your kitty.")

		saynn("[say=rahi]On your knees, pet.[/say]")

		saynn("Her authoritative voice is cute and yet somewhat intimidating. You do as she says, dropping down to your knees. Rahi pulls out two sets of metal cuffs and quickly secures them around your wrists and ankles. Now you're completely immobilized, your body vulnerable to Rahi's touch.")

		saynn("[say=rahi]Good.. You're all hers now..[/say]")

		saynn("Your kitty begins teasing you, running her paws all over your {pc.masc} body and taunting, getting close to your sensitive spots but never quite reaching or touching them. She extends her claws and begins to gently drag them over your skin, causing you to squirm and moan softly already.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your caged up dick desperately tries to get hard but the metal constrains it, leaving you so needy.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your {pc.penis} is hard and ready, leaking precum. But Rahi has her plans for it. You feel so needy..")

		else:
			saynn("Your pussy and wet and ready, dripping juices. But Rahi has her plans for it. You feel so needy..")

		saynn("That's when Rahi leaves for a bit, grabbing something else..")

		addButton("Continue", "See what happens next", "play2_cum")
	if(state == "play2_cum"):
		playAnimation(StageScene.Sybian, "ride", {nosybian=true, bodyState={naked=true, hard=true}})
		saynn("Rahi retrieves a little pink vibro bullet and returns. You can already guess what she will do to you.")

		saynn("[say=rahi]Stay like that.[/say]")

		if (GM.pc.isWearingChastityCage()):
			saynn("Kitty presses the pink toy against the tip of your chastity cage before turning it on to a high setting. You can't help but to gasp and moan as your locked up member suddenly begins to receive stimulation, already dripping precum onto Rahi's digits.")

			saynn("The toy buzzes with a high pitch. You're squirming and making various noises of love while Rahi stares you into the eyes. She bites her lip seeing how much pleasure you're receiving from such a small toy. Her paw holds both it and your cage. Your orgasm draws near.. already..")

			saynn("[say=pc]I.. I'm.. I'm gonna..[/say]")

			saynn("When Rahi hears that, she pulls the toy away, stealing the source of great sensations. Your {pc.penis} putting some real pressure onto that cage.")

			saynn("[say=pc]H-hey.. No..[/say]")

			saynn("[say=rahi]Who is she?[/say]")

			saynn("She got you where she wanted, cuffed up and incredibly aroused. You're ready to say anything.")

			saynn("[say=pc]Miss Rahi.. You're Miss Rahi.. Please.. Let your pet cum..[/say]")

			saynn("After what feels like eternity of teasing, your kitty finally presses the vibrating toy against your chastity cage again. Your moans return and this time Rahi lets you cum. Your body writhing in pleasure, your dick shooting weak spurts of {pc.cum} through the cage while Rahi continues to stimulate it.")

			saynn("[say=rahi]Yeah, she wants you to remember that.[/say]")

			saynn("[say=pc]Thank you! Ah! Miss Rahi![/say]")

			saynn("You leave a mess on your kitty's paws. After you're done orgasming, she brings her paw to her mouth and playfully licks the {pc.cum} off it. You almost feel like you're hard again..")

			saynn("[say=rahi]You were a good little pet.[/say]")

		elif (GM.pc.hasReachablePenis()):
			saynn("Kitty presses the pink toy against the tip of your {pc.penis} before turning it on to a high setting. You can't help but to gasp and moan as your hard member suddenly begins to receive stimulation, already dripping precum onto Rahi's digits.")

			saynn("The toy buzzes with a high pitch. You're squirming and making various noises of love while Rahi stares you into the eyes. She bites her lip seeing how much pleasure you're receiving from such a small toy. Her paw holds both it and your dick. Your orgasm draws near.. already..")

			saynn("[say=pc]I.. I'm.. I'm gonna..[/say]")

			saynn("When Rahi hears that, she pulls the toy away, stealing the source of great sensations. Your {pc.penis} throbbing, wanting to burst so much..")

			saynn("[say=pc]H-hey.. No..[/say]")

			saynn("[say=rahi]Who is she?[/say]")

			saynn("She got you where she wanted, cuffed up and incredibly aroused. You're ready to say anything.")

			saynn("[say=pc]Miss Rahi.. You're Miss Rahi.. Please.. Let your pet cum..[/say]")

			saynn("After what feels like eternity of teasing, your kitty finally presses the vibrating toy against your member again. Your moans return and this time Rahi lets you cum. Your body writhing in pleasure, your dick shooting strong spurts of {pc.cum} while Rahi continues to stimulate it.")

			saynn("[say=rahi]Yeah, she wants you to remember that.[/say]")

			saynn("[say=pc]Thank you! Ah! Miss Rahi![/say]")

			saynn("You leave a mess on your kitty's paws. After you're done orgasming, she brings her paw to her mouth and playfully licks the {pc.cum} off it. You almost feel like you're hard again..")

			saynn("[say=rahi]You were a good little pet.[/say]")

		else:
			saynn("Kitty presses the pink toy against your sensitive clit before turning it on to a high setting. You can't help but to gasp and moan as your wet pussy slit suddenly begins to receive stimulation. You are already dripping juices onto Rahi's digits.")

			saynn("The toy buzzes with a high pitch. You're squirming and making various noises of love while Rahi stares you into the eyes. She bites her lip seeing how much pleasure you're receiving from such a small toy. Her paw holds it firmly against your clit. Your orgasm draws near.. already..")

			saynn("[say=pc]I.. I'm.. I'm gonna..[/say]")

			saynn("When Rahi hears that, she pulls the toy away, stealing the source of great sensations. Your pussy is twitching and pulsating slightly.. You need to cum.. Now..")

			saynn("[say=pc]H-hey.. No..[/say]")

			saynn("[say=rahi]Who is she?[/say]")

			saynn("She got you where she wanted, cuffed up and incredibly aroused. You're ready to say anything.")

			saynn("[say=pc]Miss Rahi.. You're Miss Rahi.. Please.. Let your pet cum..[/say]")

			saynn("After what feels like eternity of teasing, your kitty finally presses the vibrating toy against your pussy again. Your moans return and this time Rahi lets you cum. Your body writhing in pleasure, your slit gushing out girlcum while Rahi continues to stimulate it.")

			saynn("[say=rahi]Yeah, she wants you to remember that.[/say]")

			saynn("[say=pc]Thank you! Ah! Miss Rahi![/say]")

			saynn("You leave a mess on your kitty's paws. After you're done orgasming, she brings her paw to her mouth and playfully licks the juices off it. You almost feel like you can go through all of that again..")

			saynn("[say=rahi]You were a good little pet.[/say]")

		saynn("Kitty begins to remove the cuffs.")

		addButton("Continue", "See what happens next", "play2_end")
	if(state == "play3_pain"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", bodyState={naked=true}})
		saynn("You let Rahi know that you want her to play with you. She crosses her arms and gets into her other mindset.")

		saynn("[say=rahi]Stand in the middle of the room for her.[/say]")

		saynn("Simple enough.. You do as she says, walking to the center of her cell and just standing still. Rahi purrs seeing you obey.")

		saynn("[say=rahi]Good pet.. She will do things to you.. And you're gonna let her do them, mhm?..[/say]")

		saynn("She is slowly circling around you. Like a predator sizing up its prey. Her feline tail swishing behind her. She stops for a second, placing her paw under your chin, lifting your head up to look her in the eyes. She waits for an answer. Her stare makes you feel somewhat nervous.")

		saynn("[say=pc]Yes, Miss Rahi.[/say]")

		saynn("She smiles and scritches you under your chin before continuing to circle you. This time she stops behind you.")

		if (!GM.pc.isFullyNaked()):
			saynn("Rahi begins to slowly undress you, taking off your clothes one by one, exposing all your private bits. And you just let her do it..")

		else:
			saynn("[say=rahi]Already naked.. good..[/say]")

			saynn("Rahi just drags her paws over your {pc.masc} back.")

		saynn("Then she leans closer to your ear, whispering.")

		saynn("[say=rahi]She wants to see how much pain you can handle.. How much pleasure you can endure..[/say]")

		saynn("She almost growls into your ear at the end, her hot breath making you shiver.")

		saynn("Ow. Kitty has extended her claws and began gently clawing at your back. She scratches your skin, bringing some discomfort and making you squirm.")

		saynn("[say=rahi]Start.. touching yourself..[/say]")

		saynn("Each second you don't obey, Rahi sinks her claws deeper into you, threatening to pierce the skin..")

		addButton("Comply", "Do what Rahi tells you to do", "play3_comply")
	if(state == "play3_comply"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcBodyState={naked=true}, bodyState={naked=true, hard=true}})
		if (GM.pc.isWearingChastityCage() && !GM.pc.hasReachableVagina()):
			saynn("You comply.. the best way you can.. Rubbing your chastity cage with your hands. Sadly, that provides very little physical stimulation.. You quickly find that rubbing your taint area brings you the most pleasure.. And coupled with everything else.. It feels good..")

		elif (GM.pc.hasReachablePenis()):
			saynn("You comply and begin stroking your own member. Your {pc.penis} hardens in your hand and already leaks precum. It feels good.. To be doing this because Rahi ordered you to..")

		elif (GM.pc.hasReachableVagina()):
			saynn("You comply and place your hand on your pussy. Your digits begin rubbing your clit in little circular motions, making the sensitive folds.. moist.. It feels good.. To be doing this because Rahi ordered you to..")

		else:
			saynn("You comply and place your hand on your sensitive crotch. Your digits begin rubbing that area with little circular motions.. To be doing this because Rahi ordered you to..")

		saynn("You moan, feeling the pleasure building inside.. At the same time, Rahi has dropped her clothes. She reveals her naked body by walking in your view, her claws leaving little scratch marks on your shoulder.")

		saynn("She watches you, pleasuring yourself and smiles. Her paws land on your chest, teasing your {pc.breasts}. Her claws find the nipples and squeeze them, bringing more pain. You produce a groan while Rahi continues to teasingly scratch you everywhere. Your orgasm.. you feel it nearing you..")

		saynn("[say=pc]Can I.. Can I cum?[/say]")

		saynn("[say=rahi]Say please and she might..[/say]")

		saynn("[say=pc]Please?..[/say]")

		saynn("Kitty painfully scratches your inner thigh, dangerously close to your bits. It is obviously what she wants..")

		addButton("Beg", "Beg Rahi to let you cum", "play3_begcum")
	if(state == "play3_begcum"):
		saynn("You're slowly becoming desperate from Rahi's painful teasing and your own hands.")

		saynn("[say=pc]Please.. let your pet cum..[/say]")

		saynn("Rahi purrs deeply into your ear. Your kitty whispers..")

		saynn("[say=rahi]Sure..[/say]")

		saynn("And then suddenly bares her fangs and bites into your neck. She doesn't damage anything but it's still quite painful, some blood is drawn. All the while her claws land on your back and continue gently scratching it. So many sensations.. But you can't hold back anymore.. Your body shivers as you get sent into a spiral of pleasure from this crazy mix of pain and pleasure..")

		if (GM.pc.isWearingChastityCage() && !GM.pc.hasReachableVagina()):
			saynn("You suddenly feel pressure rising in your chastity cage.. Your dick inside throbs and fights the metal before bursting with a few weak strings of {pc.cum}. All that seed lands on Rahi's thigh. Wasteful. But lewd.")

		elif (GM.pc.hasReachablePenis()):
			saynn("You feel pressure rising in your {pc.penis}.. You member throbs and suddenly bursts with a few strong strings of {pc.cum}. They all land on Rahi's thighs, creating a mess. Wasteful. But lewd.")

		elif (GM.pc.hasReachableVagina()):
			saynn("The orgasm overwhelms you. Your hand rubs your clit extremely fast to the point of your pussy suddenly squirting out lots of juices. Some of them land on Rahi's thigh, creating quite a wet mess. Lewd.")

		else:
			saynn("The orgasm overwhelms you. Your hand rubs your crotch area to the point of you shaking and squirming. Lewd.")

		saynn("Rahi leaves a few shallow bite marks on your neck and pulls away, letting you ride the rest of your orgasmic waves on your own.")

		saynn("[say=rahi]Good.. She can probably train you into a little pain toy..[/say]")

		saynn("After that Rahi walks behind you again and hugs you this time. She starts licking all the wounds that she caused. It stings.. But it stings so good..")

		saynn("[say=pc]T-thank you..[/say]")

		saynn("Rahi giggles and spends some more time with you to make sure you feel alright after all that.")

		addButton("Enough", "That was painful!", "endthescene")
	if(state == "sex1_ride"):
		saynn("As soon as you assume a submissive posture, lowering your head in front of Rahi, her ears perk up as she already knows what's up.")

		saynn("[say=rahi]Welcome.. pet.[/say]")

		saynn("Your kitty purrs, circling around you like a predator stalking its prey.")

		saynn("[say=rahi]You're eager to submit.. aren't you..[/say]")

		saynn("She bites lip and drags her paw over your {pc.masc} curves, getting dangerously close to your crotch, her fluffy tail bumping into your {pc.thick} thighs.")

		saynn("[say=rahi]You're lucky she wants this..[/say]")

		if (!GM.pc.isFullyNaked()):
			saynn("Kitty slides her paws under your clothes and begins taking them off, one by one. You know better than to say no to that.. Eventually kitty reveals your dick too..")

		saynn("Seeing your kitty like this.. after her being a shy submissive cutie for so long.. It makes you feel aroused already.")

		addButton("Continue", "See what happens next", "sex1_start")
	if(state == "sex1_start"):
		playAnimation(StageScene.SexCowgirl, "tease", {npc="rahi", pc="pc", bodyState={naked=true, hard=true}})
		saynn("Without much warning, Rahi pushes you onto her bed and then straddles you, pressing herself against you. She is still wearing her shorts as she starts grinding her crotch against your {pc.penis} through the cloth. You can't help but to produce a little gasp at the sudden contact, feeling the heat and wetness of her sex.")

		saynn("[say=rahi]You will give her what she desires.. And you will do it well..[/say]")

		saynn("Rahi pulls away and begins to undress, revealing her fluffy agile body and firm perky breasts. Then she quickly disposes of her shorts too, revealing her tight wet"+str(" pierced" if getFlag("RahiModule.rahiMile8Pierced") else "")+" pussy, the needy scent of which is already filling the room and making you more horny too."+str(" Her taking off her shorts also reveals that she was branded by you, there are words just above her pussy that tell you that Rahi is your property." if getFlag("RahiModule.rahiMile8Branded") else "")+"")

		saynn("Then she lowers herself onto you again, trapping your member between her pussy and your lower part of the belly. She starts grinding you yet again but this time you feel her sensitive folds coating your member with her juices.")

		if (getCharacter("rahi").isVisiblyPregnant()):
			saynn("[say=rahi]You will obey her.. You.. will breed her. Doesn't matter that she is pregnant.. You will do it again and again..[/say]")

		else:
			if (getCharacter("rahi").isInHeat()):
				saynn("[say=rahi]She is in heat.. You will obey her.. You.. will breed her.[/say]")

			else:
				saynn("[say=rahi]You will obey her.. You.. will breed her.[/say]")

		saynn("With that, Rahi takes a hold of your cock. She rubs it against her wetness, teasing you a bit more before finally letting it slide inside her..")

		addButton("Continue", "See what happens next", "sex1_doride")
	if(state == "sex1_doride"):
		playAnimation(StageScene.SexCowgirl, "sex", {npc="rahi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("Rahi lets out a moan, her claws digging into your shoulder as she lets the tip of your dick to stretch her out. She is in complete control.. And you love it. She lowers herself onto you until a good part of your member is inside her kitty. The soft inner walls gently clenching around your shaft, all the juices help to lower the painful friction and amplify the pleasure.")

		saynn("Rahi bites her lip, wiggling her butt for a bit to get used to your length. She forces eye contact with you before proceeding to ride you, raising her body before bringing it down onto your dick. All the while you just hold your hands on her hips and produce a few moans of your own, your member leaking precum inside your kitty.")

		saynn("You try to thrust your hips up to meet Rahi's movements but she quickly pins you into the bed and slaps your hands away before producing a needy growl.")

		saynn("[say=rahi]She is in charge here.[/say]")

		saynn("Wow, your kitty got teeth. Her pace has quickened, she starts riding you so fast that her breasts bounce clearly in your view. All of that is too much for you, you already feel your orgasm building up. Kitty seems to be edging herself too, her motions becoming more shaky and less defined.")

		saynn("[say=pc]I'm gonna..[/say]")

		saynn("She cuts her off, almost screaming.")

		saynn("[say=rahi]Shut up and do it..[/say]")

		addButton("Cum inside", "Breed the kitty", "sex1_cum")
	if(state == "sex1_cum"):
		playAnimation(StageScene.SexCowgirl, "inside", {npc="rahi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("With the final motion, Rahi brings herself down onto your {pc.penis} hard until the tip kisses her cervix. She only has time to produce a feral growl before cumming hard, her muscles clenching around your member, sending you over the peak in an instant.")

		saynn("Your member throbbing and pulsating inside Rahi as it starts shooting strings of thick {pc.cum} directly inside her inviting womb.")

		saynn("After you're done emptying yourself inside your kitty, she lays on top of you, panting heavily. She reaches out to lick your lips.")

		saynn("[say=rahi]You.. have pleased her..[/say]")

		addButton("Enough", "That was fun", "endthescene")
		if (getModule("RahiModule").isSkillLearned("rahiSkillSex")):
			addButton("Sloppy seconds", "(Sex) Rahi wants more!", "sex1_more")
	if(state == "sex1_more"):
		playAnimation(StageScene.SexCowgirl, "fast", {npc="rahi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("As Rahi lays on top of you, she can't help but to feel.. excitement run through her body.. As she thought about something. By this she has mostly recovered her breathing.")

		saynn("[say=rahi]Are you ready to breed her again, pet?[/say]")

		saynn("Her lusty eyes glow with anticipation. Even if you say no she will probably take it her way. You nod as your member begins to get hard again, just from hearing Rahi's words.")

		saynn("She wastes no time, already grinding your crotch with her dripping stuffed pussy until you're fully ready. This time, she starts to ride you with even more eagerness, her hips slamming down onto your shaft with each thrust.")

		saynn("As you two fuck, Rahi's moans become louder and more passionate, her eyes rolling up in ecstasy. She leans forward, pressing her perky breasts against your chest and biting your shoulder gently, drawing some blood, while her claws are raking across your back.")

		saynn("You can't help but to groan from this mix of pleasure and pain, kitty growls into your ear as she rides you harder and faster. You wrap your hands around her and help to bring her down onto your cock, bringing you both to your second orgasms..")

		saynn("With a wild cry, Rahi cums again, her stuffed pussy clenching tightly around your {pc.penis} as she coats it with her juices. You follow soon, grunting as your shaft stuffs that babymaker for the second time in a row until your balls are drained. So much hot {pc.cum} is stuffed into Rahi that her used pussy is already leaking some out.")

		saynn("As Rahi lays on you, spent and exhausted, she can't help but to grin. Purring escapes from her as she slips out of character and starts nuzzling your cheek.")

		saynn("[say=rahi]She can't wait to breed with you again.. meow-meow..[/say]")

		addButton("Continue", "That was very lewd", "endthescene")
	if(state == "sex2_ridestrapon"):
		saynn("As soon as you assume a submissive posture, lowering your head in front of Rahi, her ears perk up as she already knows what's up.")

		saynn("[say=rahi]Welcome.. pet.[/say]")

		saynn("Your kitty purrs, circling around you like a predator stalking its prey.")

		saynn("[say=rahi]You're eager to submit.. aren't you..[/say]")

		saynn("She bites lip and drags her paw over your {pc.masc} curves, getting dangerously close to your crotch, her fluffy tail bumping into your {pc.thick} thighs. Then Kitty goes ahead and grabs something from the crate of fun toys.")

		saynn("[say=rahi]You're lucky she wants this..[/say]")

		saynn("She holds a canine-dick-shaped strapon, complete with a large knot at the base.")

		if (!GM.pc.isFullyNaked()):
			saynn("Kitty slides her paws under your clothes and begins taking them off, one by one. You know better than to say no to that.. She then begins to put the strapon harness on you, making sure to tighten each belt.")

		else:
			saynn("She then begins to put the strapon harness on you, making sure to tighten each belt.")

		saynn("Seeing your kitty like this.. after her being a shy submissive cutie for so long.. It makes you feel aroused already.")

		addButton("Continue", "See what happens next", "sex2_start")
	if(state == "sex2_start"):
		playAnimation(StageScene.SexCowgirl, "tease", {npc="rahi", pc="pc", bodyState={naked=true, hard=true}})
		saynn("Without much warning, Rahi pushes you onto her bed and then straddles you, pressing herself against you. She is still wearing her shorts as she starts grinding her crotch against your strapon through the cloth. You don't feel much but Rahi does produce a little noise of pleasure from that, her sex probably getting wet.")

		saynn("[say=rahi]You will give her what she desires.. And you will do it well..[/say]")

		saynn("Rahi pulls away and begins to undress, revealing her fluffy agile body and firm perky breasts. Then she quickly disposes of her shorts too, revealing her tight wet"+str(" pierced" if getFlag("RahiModule.rahiMile8Pierced") else "")+" pussy, the needy scent of which is already filling the room and making you more horny too."+str(" Her taking off her shorts also reveals that she was branded by you, there are words just above her pussy that tell you that Rahi is your property." if getFlag("RahiModule.rahiMile8Branded") else "")+"")

		saynn("Then she lowers herself onto you again, trapping your fake rubber member between her pussy and your lower part of the belly. She starts grinding it, her sensitive folds coating the toy with her juices, making the surface slick.")

		if (getCharacter("rahi").isInHeat()):
			saynn("[say=rahi]She is in heat.. You will obey her.. You.. will satisfy her needs.[/say]")

		else:
			saynn("[say=rahi]You will obey her.. You.. will satisfy her needs.[/say]")

		saynn("With that, Rahi takes hold of the strapon. She rubs it against her wetness, teasing herself a bit more before finally letting it slide inside her..")

		addButton("Continue", "See what happens next", "sex2_doride")
	if(state == "sex2_doride"):
		playAnimation(StageScene.SexCowgirl, "sex", {npc="rahi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("Rahi lets out a moan, her claws digging into your shoulder as she lets the pointy tip of the rubber canine cock to stretch her out. She is in complete control.. And you love it. She lowers herself onto you until a good part of the strapon is inside her kitty. The soft inner walls gently clenching around the shaft, all the juices help to lower the painful friction and amplify the pleasure.")

		saynn("Rahi bites her lip, wiggling her butt for a bit to get used to the toy. She forces eye contact with you before proceeding to ride you, raising her body before bringing it down onto your artificial dick. All the while you just hold your hands on her hips and produce a few desperate soft moans, feeling some of it but not enough to get off physically. Mentally, though, this is the best thing ever..")

		saynn("You try to thrust your hips up to meet Rahi's movements and shove that rubber knot inside but she quickly pins you into the bed and slaps your hands away before producing a needy growl.")

		saynn("[say=rahi]She is in charge here.[/say]")

		saynn("Wow, your kitty got teeth. Her pace has quickened, she starts riding you so fast that her breasts bounce clearly in your view. Kitty's orgasm seems to be building up fast, she is edging herself, her motions becoming more shaky and less defined.")

		saynn("[say=rahi]She is gonna..[/say]")

		saynn("She starts trying to squeeze that orb inside her. But her pussy struggles to stretch that much. Kitty is getting desperate.")

		saynn("[say=pc]It won't..[/say]")

		saynn("Kitty cuts you off, almost screaming.")

		saynn("[say=rahi]Shut up and.. Ah!..[/say]")

		saynn("With the final motion, Rahi brings herself down onto the strapon hard until its tip kisses her cervix. She only has time to produce a feral growl before cumming hard, her muscles clenching around the rubber shaft. She suddenly manages to fit the whole thing inside her pussy, the knot and everything.")

		saynn("It seems the strapon has something inside it.. And squeezing the knot made it start unloading it all.")

		addButton("Cum inside?", "Breed the kitty?", "sex2_cum")
	if(state == "sex2_cum"):
		playAnimation(StageScene.SexCowgirl, "inside", {npc="rahi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("The strapon throbs and pulsates inside Rahi as it starts shooting strings of thick white stuff directly inside her inviting womb. Your guess is that the strapon was loaded with cum lube. Hopefully..")

		saynn("After the strapon has done emptying itself inside the kitty, she lays on top of you, panting heavily. She reaches out to lick your lips.")

		saynn("[say=rahi]You.. have pleased her..[/say]")

		saynn("And that is all that matters..")

		addButton("Enough", "That was fun", "removestrapon")
		if (getModule("RahiModule").isSkillLearned("rahiSkillSex")):
			addButton("Go again", "(Sex) Rahi wants more!", "sex2_more")
	if(state == "sex2_more"):
		playAnimation(StageScene.SexCowgirl, "fast", {npc="rahi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("As Rahi lays on top of you, she can't help but to feel.. excitement run through her body.. As she thought about something. By this she has mostly recovered her breathing.")

		saynn("[say=rahi]Are you ready to be her toy again, pet?[/say]")

		saynn("Her lusty eyes glow with anticipation. Even if you say no she will probably do it her way. You nod.")

		saynn("She wastes no time, already grinding your crotch with her dripping stuffed pussy until she does the opposite, pulling away and escaping the knot. This time, she starts to ride you with even more eagerness, her hips slamming down onto your rubber shaft with each thrust.")

		saynn("As you two fuck, Rahi's moans become louder and more passionate, her eyes rolling up in ecstasy. She leans forward, pressing her perky breasts against your chest and biting your shoulder gently, drawing some blood, while her claws are raking across your back.")

		saynn("You can't help but to groan from this mix of strange pleasure and pain, kitty growls into your ear as she rides you harder and faster. You wrap your hands around her and help to bring her down onto the strapon, quickly bringing Rahi to her second orgasm..")

		saynn("With a wild cry, Rahi cums again, her stuffed pussy stretches around the knot, accepting it inside, before clenching tightly around the toy as she coats it with her juices. Sadly, this time there is nothing to stuff the kitty with. But she already had enough, her used pussy is actively leaking cum lube.")

		saynn("As Rahi lays on you, spent and exhausted, she can't help but to grin. Purring escapes from her as she slips out of character and starts nuzzling your cheek.")

		saynn("[say=rahi]She can't wait to play with you again.. meow-meow..[/say]")

		addButton("Continue", "That was very lewd", "removestrapon")
	if(state == "sex3_rahistraponspussy"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcBodyState={naked=true}})
		saynn("You're in the submissive mood today and could maybe use Rahi's rough touch.. But instead of asking for it outright, you lean against one of the walls and just watch your kitty while your hands slowly trace the {pc.masc} curves of your body, occasionally reaching to brush over your crotch.")

		saynn("It doesn't take long for Rahi to spot that, the anticipation radiating off of you in waves. Kitty's tail flicks back and forth while she approaches you and grabs your chin, tilting her head slightly before looking you in the eyes.")

		saynn("[say=rahi]You are hers today. And she is going to make sure you know it.[/say]")

		saynn("And with that, Rahi steps back and begins to undress, unbuttoning her shirt and pulling down her shorts. You bite your lip and reach to touch Rahi's {rahi.breasts} but she catches your hand and puts the digits in her mouth, sucking on them and leaving a saliva coating before bringing them down to her pussy and making you rub her exposed clit. Kitty moans softly, her pussy gets all wet and ready. But that's the only weakness that she allowed for herself.")

		saynn("Suddenly kitty goes ahead and grabs something. Something long.. You can't quite see it because she is turned away.")

		addButton("Continue", "See what happens next", "sex3_rahiputsonstrapon")
	if(state == "sex3_rahiputsonstrapon"):
		playAnimation(StageScene.SexStanding, "tease", {npc="pc", pc="rahi", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("You hear another cute noise of love coming from Rahi as she.. inserts something into her pussy, the slickness makes it easier. Then she turns around, revealing.. a knotted strapon between her legs. It's double-sided with the short end being inside Rahi. She is.. smiling.")

		if (!GM.pc.isFullyNaked()):
			saynn("You don't even get a good look at it before Rahi runs up to you, grabs you by the collar and pins against the reinforced glass of her cell. Her paws quickly undress you, revealing your own {pc.pussyStretch} pussy and {pc.breasts}. You can't hide the excitement..")

		else:
			saynn("You don't even get a good look at it before Rahi runs up to you, grabs you by the collar and pins against the reinforced glass of her cell. Her paws tracing over your naked curves, your {pc.pussyStretch} pussy and {pc.breasts}. You can't hide the excitement..")

		saynn("[say=pc]H-hey..[/say]")

		saynn("Rahi shushes you, her digits reaching your mouth and sliding past the lips, landing on your tongue. You instinctively suck on them, your tongue licking and coating them with your saliva.")

		saynn("[say=rahi]You're so easy to control.. She can tell you're getting off on the humiliation.. you dirty little slut..[/say]")

		saynn("After you're done licking her digits, she pulls them out and instead slides them down to your pussy, spreading it with two of them while another two prod at the entrance, catching juices. All the while Rahi's strapon just brushes against your {pc.thick} thighs.")

		saynn("[say=rahi]Yeah.. All wet down there.. So eager to be fucked.[/say]")

		saynn("Rahi spreads all the accumulated fluids on her rubber toy, making it look very shiny. All the while you're still pinned against the window, your stiff nipples feel the cold glass, you really hope people outside won't stare.. too much..")

		addButton("Get fucked", "See what happens next", "sex3_rahiinserts")
	if(state == "sex3_rahiinserts"):
		playAnimation(StageScene.SexStanding, "sex", {npc="pc", pc="rahi", bodyState={naked=true}, npcBodyState={naked=true, hard=true}})
		saynn("You let out a cute noise when Rahi smacks your ass, making it bounce. She holds one paw on your collar while another quickly aligns the toy with your dripping sex. One rough thrust and Rahi spreads open your cunt enough to shove the strapon inside. A moan escapes your lips.")

		saynn("[say=rahi]Hope you can take it rough.. Because that's how she likes it. Now take it like a good "+str("girl" if GM.pc.getGender() != Gender.Male else "boy")+".[/say]")

		saynn("You can't help but to gasp and arch your back as Rahi begins to pound your slit, sliding it in and out, using her hips to generate powerful slams that rock your body each time. Your moans fill the room as Rahi continues to stretch you out from the inside, fucking you with increasing intensity. The friction is pleasurable for her too, little noises of love escape from Rahi but she tries to hide them, putting all the focus on you and your drippy cunt.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your poor caged up dick desperately tries to get hard but is unable to. All it can do is sway back and forth while leaking a lot of precum.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your {pc.penis} is hard, swaying back and forth from Rahi's thrusts. You're leaking so much precum..")

		saynn("Your kitty has reached a steady rhythm, the tip of her rubber dick reaching your firm cervix each time she rams it inside you. Your orgasm slowly builds up.. kitty feels it and.. keeps it like that. Instead, Rahi puts more strength into each thrust, the rubber knot of her toy slams against your petals, trying to stretch them even wider. You're not sure it will even fit.. But you're also so close now..")

		saynn("[say=pc]I-It w-won't..[/say]")

		saynn("[say=rahi]Your pussy belongs to her![/say]")

		saynn("With that, Rahi throws her hips forward for one last time, putting all her feline strength into this one.")

		addButton("Get knotted", "See what happens next", "sex3_cum")
	if(state == "sex3_cum"):
		playAnimation(StageScene.SexStanding, "inside", {npc="pc", pc="rahi", bodyState={naked=true}, npcBodyState={naked=true, hard=true}})
		saynn("The rubber knot puts an immense amount of pressure on your {pc.pussyStretch} pussy, stretching your slit to the limit.. until the orb just slips in, tying you and Rahi together.. With one swift motion Rahi drives the knot even deeper, breaking into your womb.")

		saynn("You cry out in pleasure and pain as Rahi has her whole strapon inside you. Squeezing the knot so much caused the toy to suddenly start filling you with some thick, creamy fluid.. seems like the strapon had some cum lube stored just for this occasion..")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your caged up dick bursts with multiple weak waves of seed. The pressure is immense but the flow is barely enough to reach the wall and leave some sticky stains on it..")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your cock, twitching and unable to endure this immense pressure anymore, bursts with many waves of seed, leaving lots of sticky stains on the wall.")

		saynn("You're licking the cold grass, your body shivering around your kitty's rubber cock.. She can't pull it out anymore even if she wanted to, you're forced to endure her strapon inside you.. not that you mind..")

		saynn("It seems like you're not the only one who came though, while being busy moaning and having your pussy extremely stretched, you missed Rahi's cute moans and her body squirming behind you, her legs shaking, barely keeping her from falling. She leans into your back, letting you feel her breasts brushing against your skin.")

		saynn("[say=rahi]Such a.. such.. little.. s-slutty..[/say]")

		saynn("She is panting heavily, just like you. The whole room smells of sex. Cum lube sloshing inside your womb.. You press your cheek against the cold glass and try to cool down..")

		saynn("After some time, Rahi has gathered enough courage to yank the knot out, letting some of the cum lube out.")

		addButton("Enough", "That was something", "removerahistrapon")
		if (getModule("RahiModule").isSkillLearned("rahiSkillMasochist")):
			addButton("Knot-fucking", "(Masochist) Knot goes in and out..", "sex3_knotfuck")
	if(state == "sex3_knotfuck"):
		playAnimation(StageScene.SexStanding, "fast", {npc="pc", pc="rahi", bodyState={naked=true}, npcBodyState={naked=true, hard=true}})
		saynn("After the knot got pulled out, it left a lot of empty space inside you.. Empty space that you so eagerly want to be filled.. again..")

		saynn("[say=pc]More, Miss Rahi, please!..[/say]")

		saynn("Rahi was about to stop when she heard that. Your words.. they make her.. so eager. She growls as she pins you against the window again and ramming her strapon inside your used fuckhole that didn't even close yet. A loud cry escapes from you as the rubber knot slips inside your cunt, plugging that empty space.. Just so she can yank it out again, making your legs weak and your pussy aching.")

		saynn("[say=rahi]You like that, don't you? Little.. insatiable.. whore.[/say]")

		saynn("Rahi repeats this motion.. over and over again, each time yanking the knot out before shoving it back in, making your pussy stretch beyond its limit. The sensations are so intense that your pussy squirts all over the rubber toy and tries to clench around it, making Rahi moan too in the process.")

		saynn("[say=rahi]Such a slutty little thing..[/say]")

		saynn("Rahi snarls as she continues to knot-fuck your pussy at an increasing pace, not giving your cunt even a moment to try to close, leaving it gaping wide open so much that it starts to hurt.. The thick sticky cum lube leaks out around the edges, creating quite the mess on your legs.")

		saynn("It was too much for your poor little pussy.. But instead of begging for Rahi to stop, you moan and gasp for more, lost in this crazy mix of pleasure and pain. Your body starts to tense up as you approach another orgasm.. Rahi's thrusts became faster and more erratic..")

		saynn("With a final, forceful thrust, Rahi slams the knot back inside your pussy, triggering an explosive orgasm for both of you. Cries of pain and pleasure can be probably heard across the whole general pop block. You desperately hold onto that window just so you wouldn't fall, your pussy tightening around that knot and the whole shaft, your pussy juices gushing for a while. Rahi bites into your shoulder, growling, as her own orgasm makes her squirt too, her pussy spasming and pulsating around her end of the toy.")

		saynn("Kitty drags this intimate moment for a bit.. Before suddenly yanking her rubber toy out, finally letting you slump down onto the floor, your ruined cunt gaping wide and leaking cum lube profusely.")

		saynn("Both of you are left to pant heavily.")

		saynn("[say=rahi]You.. satisfied her.. for the moment..[/say]")

		addButton("Enough", "Wow", "removerahistrapon")
	if(state == "sex4_scissoring"):
		playAnimation(StageScene.SexTribadism, "tease", {pc="rahi", npc="pc", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("You only have to give Rahi a short submissive look for her to already start approaching you. Oh no..")

		saynn("Without a word, Rahi pounces on you, pinning you to the ground. She leans in close, her hot breath caressing your ear.")

		saynn("[say=rahi]Where are you going now, little prey?[/say]")

		if (!GM.pc.isFullyNaked()):
			saynn("After whispering that, she also growls into your ear, sending a shudder running through your body. Her paws slowly take off your clothes, revealing your {pc.breasts} and, more importantly, your {pc.pussyStretch} pussy. After that she takes off her own shorts and shirt too, presenting herself completely naked. But still very threatening..")

		else:
			saynn("After whispering that, she also growls into your ear, sending a shudder running through your body. After that she takes off her own shorts and shirt, presenting herself completely naked. But still very threatening..")

		saynn("With a mean grin, Rahi shifts her body and interlocking legs with you before pressing her slick pussy against yours.")

		saynn("[say=rahi]Let's see how much you can take.[/say]")

		addButton("Continue", "See what happens next", "sex4_start")
	if(state == "sex4_start"):
		playAnimation(StageScene.SexTribadism, "sex", {pc="rahi", npc="pc", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("And with that, Rahi grabs your hand and begins moving her hips, scissoring with you. You can't hold the moans back as your clits start rubbing together in a torturous rhythm. Rahi has full control, setting a pace that makes you pant.")

		saynn("[say=rahi]So helpless.. Nothing but a toy for her to use..[/say]")

		saynn("You moan while your body is squirming beneath Rahi's. As she continues to grind pussies with you, exchanging pussy juices, your pleasure grows more intense. She still holds hands with you, her fingers firmly planting themselves between yours as she keeps eye contact with you.")

		saynn("Eventually you join her, doing small hip motions of your own, meeting Rahi's. You can feel the ecstatic sensation building up within you. Rahi can probably feel it too, her movements becoming more desperate. So much clit rubbing makes your eyes roll up.. You feel like you might cum first..")

		addButton("Faster", "You wanna cum!", "sex4_cum")
	if(state == "sex4_cum"):
		playAnimation(StageScene.SexTribadism, "fast", {pc="rahi", npc="pc", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("You can't stop rubbing pussies with Rahi, your clit already receiving a slight red tint of irritation but you don't give a damn, you just keep holding her paw while furiously grinding against Rahi.")

		saynn("Finally, with a cry of pleasure, you both cum! Your bodies shake and squirm, causing more torturous overstimulation, your juices blend into a wet, sticky mess. Rahi throws her head back and produces some passionate noises, riding her pleasure waves, just like you. And after that, she just collapses onto the floor, panting heavily.")

		addButton("Continue", "See what happens next", "sex4_after")
	if(state == "sex4_after"):
		playAnimation(StageScene.SexTribadism, "tease", {pc="rahi", npc="pc", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("For a moment, you lay there.. the only sounds in the room.. your breathing.. The only scent.. is a scent of sex..")

		saynn("As the orgasmic waves subside, Rahi slowly disengages from the scissor hold, her wet and glistening pussy leaving a trail of juices on your thigh. She looks at you with a predatory gaze and runs her digits through her own slick folds before bringing them to your face.")

		saynn("[say=rahi]You are hers.. little pet..[/say]")

		saynn("She smears her juices across your cheek, forcing her scent into you.")

		saynn("Rahi trails her fingers down your body, tracing lazy circles around your nipples before pinching them roughly, forcing a gasp of pleasure out of you.")

		saynn("Time to rest.. maybe..")

		addButton("Enough", "That was fun", "endthescene")
		if (getModule("RahiModule").isSkillLearned("rahiSkillWatersports")):
			addButton("Pee on pussy", "(Watersports) You kinda have an urge to pee now..", "sex4_watersports")
	if(state == "sex4_watersports"):
		saynn("After that powerful orgasm.. you kinda wanna go to the toilet now.. But also.. You really don't wanna stop this beautiful interaction..")

		saynn("[say=pc]I kinda wanna.. pee..[/say]")

		saynn("[say=rahi]Oh.. She has the same urge actually..[/say]")

		saynn("Your slick pussies are still pressed against each other while you.. stare.. at each other. No need for words, you both understand it.. Your gazes.. become so lusty..")

		saynn("Rahi is first, she throws her head back again and produces a cute moan while a stream of gross yellow urine comes out of her piss hole and hits you directly, washing over your crotch and pussy. That stream is like a golden shower.. the friction is enough to force a moan out of you as well..")

		saynn("You don't wanna admit it but Rahi's piss is stimulating you and tickling your slit.. So much so that you join her and begin peeing too, your yellow streams cross and make you both drenched. At least it feels really good to relieve yourself, you can hear your kitty purring while she marks you and you mark her..")

		saynn("Your legs are pressed against each other firmly, allowing a little.. piss pond.. to form between your crotches. After you both are done, Rahi dips her digits into it and then licks them playfully.")

		saynn("[say=rahi]Cute..[/say]")

		saynn("Eventually you do have to break away though, causing that stored piss to splash onto the floor. Someone will clean that.. for sure.. Maybe you even.")

		addButton("Continue", "Lewd", "endthescene")
	if(state == "peg1_rahistraponsbutt"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcBodyState={naked=true}})
		saynn("You're in the submissive mood today and could maybe use Rahi's rough touch.. But instead of asking for it outright, you lean to look through the reinforced window while your hands slowly trace the {pc.masc} curves of your body, occasionally reaching to squeeze your {pc.thick} butt.")

		saynn("It doesn't take long for Rahi to spot that, the anticipation radiating off of you in waves. Kitty's tail flicks back and forth while she approaches you and grabs by the collar. She then pulls you back to her, tilting her head slightly before looking you in the eyes.")

		saynn("[say=rahi]You are hers today. And she is going to make sure you know it.[/say]")

		saynn("And with that, Rahi steps back and begins to undress, unbuttoning her shirt and pulling down her shorts. You bite your lip and reach to touch Rahi's {rahi.breasts} but she catches your hand and puts the digits in her mouth, sucking on them and leaving a saliva coating before bringing them down to her pussy and making you rub her exposed clit. Kitty moans softly, her pussy gets all wet and ready. But that's the only weakness that she allowed for herself.")

		saynn("Suddenly kitty goes ahead and grabs something. Something long.. You can't quite see it because she is turned away.")

		addButton("Continue", "See what happens next", "peg1_rahiputsonstrapon")
	if(state == "peg1_rahiputsonstrapon"):
		playAnimation(StageScene.SexStanding, "tease", {npc="pc", pc="rahi", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("You hear another cute noise of love coming from Rahi as she.. inserts something into her pussy, the slickness makes it easier. Then she turns around, revealing.. a knotted strapon between her legs. It's double-sided with the short end being inside Rahi. She is.. smiling.")

		if (!GM.pc.isFullyNaked()):
			saynn("You don't even get a good look at it before Rahi runs up to you and pins against the reinforced glass of her cell. Her paws quickly undress you, revealing your {pc.analStretch} ass and {pc.breasts}. You can't hide the excitement..")

		else:
			saynn("You don't even get a good look at it before Rahi runs up to you, grabs you by the collar and pins against the reinforced glass of her cell. Her paws tracing over your naked curves, your {pc.analStretch} ass and {pc.breasts}. You can't hide the excitement..")

		saynn("[say=pc]H-hey..[/say]")

		saynn("Rahi shushes you, her digits reaching your mouth and sliding past the lips, landing on your tongue. You instinctively suck on them, your tongue licking and coating them with your saliva.")

		saynn("[say=rahi]You're so easy to control.. She can tell you're getting off on the humiliation.. you dirty little slut..[/say]")

		saynn("After you're done licking her digits, she pulls them out and instead slides them down to your butt, spreading your tailhole with two of them while another two prod at it, forcing saliva in. All the while Rahi's strapon just brushes against your {pc.thick} thighs.")

		saynn("[say=rahi]Yeah.. Like that.. All wet down there.. So eager to be fucked.[/say]")

		saynn("Rahi then catches her own pussy juices and spreads them along her rubber toy, making it look very shiny. All the while you're still pinned against the window, your stiff nipples feel the cold glass, you really hope people outside won't stare.. too much..")

		addButton("Get fucked", "See what happens next", "peg1_rahiinserts")
	if(state == "peg1_rahiinserts"):
		playAnimation(StageScene.SexStanding, "sex", {npc="pc", pc="rahi", bodyState={naked=true}, npcBodyState={naked=true, hard=true}})
		saynn("You let out a cute noise when Rahi smacks your ass, making it bounce. She holds one paw on your neck while another quickly aligns the toy with your needy asshole. One rough thrust and Rahi spreads open your star enough to shove the strapon inside. A moan escapes your lips.")

		saynn("[say=rahi]Hope you can take it rough.. Because that's how she likes it. Now take it like a good "+str("girl" if GM.pc.getGender() != Gender.Male else "boy")+".[/say]")

		saynn("You can't help but to gasp and arch your back as Rahi begins to pound your butt, sliding it in and out, using her hips to generate powerful slams that rock your body each time. Your moans fill the room as Rahi continues to stretch you out from the inside, fucking you with increasing intensity. The friction is pleasurable for her too, little noises of love escape from Rahi but she tries to hide them, putting all the focus on you and your needy tailhole.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your poor caged up dick desperately tries to get hard but is unable to. All it can do is sway back and forth while leaking a lot of precum from Rahi hammering at your pleasure spot.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your {pc.penis} is hard, swaying back and forth from Rahi's thrusts. You're leaking so much precum from Rahi hammering at your pleasure spot..")

		if (GM.pc.hasReachableVagina()):
			saynn("Even though you're being buttfucked, your {pc.vaginaStretch} pussy is dripping juices profusely. The toy is stimulating your g-spot through the inner wall so well.. Your slit looks small and slightly open, sharing some of the stretching with your ass.")

		saynn("Your kitty has reached a steady rhythm, the tip of her rubber dick reaching deep inside you each time she rams it in. Your orgasm slowly builds up.. kitty feels it and.. keeps it like that. Instead, Rahi puts more strength into each thrust, the rubber knot of her toy slams against your anus, trying to stretch it even wider. You're not sure it will even fit.. But you're also so close now..")

		saynn("[say=pc]I-It w-won't..[/say]")

		saynn("[say=rahi]Your ass belongs to her![/say]")

		saynn("With that, Rahi throws her hips forward for one last time, putting all her feline strength into this one.")

		addButton("Get knotted", "See what happens next", "peg1_cum")
	if(state == "peg1_cum"):
		playAnimation(StageScene.SexStanding, "inside", {npc="pc", pc="rahi", bodyState={naked=true}, npcBodyState={naked=true, hard=true}})
		saynn("The rubber knot puts an immense amount of pressure on your {pc.analStretch} anal ring, stretching it to the limit.. until the orb just slips in, tying you and Rahi together.. With one swift motion Rahi drives the knot even deeper inside your bowels.")

		saynn("You cry out in pleasure and pain as Rahi has her whole strapon in you. Squeezing the knot so much caused the toy to suddenly start filling you with some thick, creamy fluid.. seems like the strapon had some cum lube stored just for this occasion..")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your prostate got destroyed, causing your caged up dick to burst with multiple weak waves of seed. The pressure is immense but the flow is barely enough to reach the wall and leave some sticky stains on it..")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your cock, twitching and unable to endure this immense pressure anymore coming from within your prostate, bursts with many waves of seed, leaving lots of sticky stains on the wall.")

		if (GM.pc.hasReachableVagina()):
			saynn("Your moist pussy pulsates and gushes out plenty of girlcum. Even though it wasn't directly stimulated, your g-spot got rubber through the inner wall enough for you to cum hard!")

		saynn("You're licking the cold grass, your body shivering around your kitty's rubber cock.. She can't pull it out anymore even if she wanted to, you're forced to endure her strapon inside you.. not that you mind..")

		saynn("It seems like you're not the only one who came though, while being busy moaning and having your ass extremely stretched, you missed Rahi's cute moans and her body squirming behind you, her legs shaking, barely keeping her from falling. She leans into your back, letting you feel her breasts brushing against your skin.")

		saynn("[say=rahi]Such a.. such.. little.. s-slutty..[/say]")

		saynn("She is panting heavily, just like you. The whole room smells of sex. Cum lube sloshing inside your butt.. You press your cheek against the cold glass and try to cool down..")

		saynn("After some time, Rahi has gathered enough courage to yank the knot out, letting some of the cum lube out.")

		addButton("Enough", "That was something", "removerahistrapon")
		if (getModule("RahiModule").isSkillLearned("rahiSkillMasochist")):
			addButton("Knot-fucking", "(Masochist) Knot goes in and out..", "peg1_knotfuck")
	if(state == "peg1_knotfuck"):
		playAnimation(StageScene.SexStanding, "fast", {npc="pc", pc="rahi", bodyState={naked=true}, npcBodyState={naked=true, hard=true}})
		saynn("After the knot got pulled out, it left a lot of empty space inside you.. Empty space that you so eagerly want to be filled.. again..")

		saynn("[say=pc]More, Miss Rahi, please!..[/say]")

		saynn("Rahi was about to stop when she heard that. Your words.. they make her.. so eager. She growls as she pins you against the window again and ramming her strapon inside your used fuckhole that didn't even close yet. A loud cry escapes from you as the rubber knot slips inside your ass, plugging that empty space.. Just so she can yank it out again, making your legs weak and your anus aching.")

		saynn("[say=rahi]You like that, don't you? Little.. insatiable.. whore.[/say]")

		saynn("Rahi repeats this motion.. over and over again, each time yanking the knot out before shoving it back in, making your anal star stretch beyond its limit. The sensations are so intense that your tailhole tries to clench around it, increasing friction and making Rahi moan too in the process.")

		saynn("[say=rahi]Such a slutty little thing..[/say]")

		saynn("Rahi snarls as she continues to knot-fuck your butt at an increasing pace, not giving your anus even a moment to try to close, leaving it gaping wide open so much that it starts to hurt.. The thick sticky cum lube leaks out around the edges, creating quite the mess on your legs.")

		saynn("It was too much for your poor little tailhole.. But instead of begging for Rahi to stop, you moan and gasp for more, lost in this crazy mix of pleasure and pain. Your body starts to tense up as you approach another orgasm.. Rahi's thrusts became faster and more erratic..")

		saynn("With a final, forceful thrust, Rahi slams the knot back inside your fuckhole, triggering an explosive orgasm for both of you. Cries of pain and pleasure can be probably heard across the whole general pop block. You desperately hold onto that window just so you wouldn't fall, your anus tightening around that knot and the whole shaft and spasming for a while. Rahi bites into your shoulder, growling, as her own orgasm makes her squirt, her pussy pulsating around her end of the toy.")

		saynn("Kitty drags this intimate moment for a bit.. Before suddenly yanking her rubber toy out, finally letting you slump down onto the floor, your ruined ass gaping wide and leaking cum lube profusely.")

		saynn("Both of you are left to pant heavily.")

		saynn("[say=rahi]You.. satisfied her.. for the moment..[/say]")

		addButton("Enough", "Wow", "removerahistrapon")

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

	if(_action == "random_play_scene"):
		var possible = ["play1_lickpussy", "play3_pain"]
		if(GM.pc.hasReachablePenis() || GM.pc.hasReachableVagina() || GM.pc.isWearingChastityCage()):
			possible.append("play2_toys")
		setState(RNG.pick(possible))
		getModule("RahiModule").advanceSkill("rahiSkillDominance")
		return

	if(_action == "random_sex_scene"):
		var possible = []
		if(GM.pc.hasReachablePenis()):
			possible.append("sex1_ride")
		else:
			possible.append("sex2_ridestrapon")
		if(GM.pc.hasReachableVagina()):
			possible.append("sex3_rahistraponspussy")
			possible.append("sex4_scissoring")
		
		setState(RNG.pick(possible))
		getModule("RahiModule").advanceSkill("rahiSkillDominance")
		return

	if(_action == "random_pegging_scene"):
		var possible = ["peg1_rahistraponsbutt"]
		
		setState(RNG.pick(possible))
		getModule("RahiModule").advanceSkill("rahiSkillDominance")
		return

	if(_action == "cancelactivity"):
		increaseFlag("RahiModule.rahiTired", -1)
		endScene()
		return

	if(_action == "scene1_kneel"):
		getModule("RahiModule").advanceSkill("rahiSkillDominance")

	if(_action == "play1_lick"):
		GM.pc.addLust(30)

	if(_action == "play1_cum"):
		processTime(5*60)
		GM.pc.cummedInMouthBy("rahi", FluidSource.Vagina, 0.5)
		GM.pc.cummedOnBy("rahi")
		GM.pc.addLust(50)

	if(_action == "play1_watersports"):
		processTime(5*60)
		GM.pc.afterTakingAShower()
		GM.pc.pissedOnBy("rahi")
		GM.pc.cummedInMouthBy("rahi", FluidSource.Pissing, 0.5)
		getModule("RahiModule").advanceSkill("rahiSkillWatersports")

	if(_action == "play1_rimming"):
		processTime(5*60)
		getModule("RahiModule").advanceSkill("rahiSkillAnal")
		GM.pc.orgasmFrom("rahi")

	if(_action == "play2_getcuffed"):
		processTime(5*60)
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmatewristcuffs"))
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmateanklecuffs"))

	if(_action == "play2_cum"):
		processTime(10*60)
		GM.pc.orgasmFrom("rahi")

	if(_action == "play2_end"):
		GM.pc.getInventory().clearSlot(InventorySlot.Wrists)
		GM.pc.getInventory().clearSlot(InventorySlot.Ankles)
		endScene()
		return

	if(_action == "play3_begcum"):
		processTime(3*60)
		GM.pc.orgasmFrom("rahi")
		if(GM.pc.getPain() < 80):
			GM.pc.addPain(20)

	if(_action == "sex1_cum"):
		processTime(5*60)
		getCharacter("rahi").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("rahi")
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "rahi_riding")

	if(_action == "sex1_more"):
		getModule("RahiModule").advanceSkill("rahiSkillSex")
		processTime(10*60)
		getCharacter("rahi").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("rahi")

	if(_action == "sex2_start"):
		var strapon = GlobalRegistry.createItem("StraponCanine")
		var fluids = strapon.getFluids()
		fluids.addFluid("CumLube", RNG.randi_range(3, 5)*100.0)
		GM.pc.getInventory().equipItem(strapon)

	if(_action == "sex2_cum"):
		processTime(5*60)
		getCharacter("rahi").cummedInVaginaBy("pc", FluidSource.Strapon)
		#GM.pc.orgasmFrom("rahi")
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "rahi_riding")
		GM.pc.addSkillExperience(Skill.CumLover, 30, "rahi_riding")

	if(_action == "removestrapon"):
		GM.pc.getInventory().clearSlot(InventorySlot.Strapon)
		endScene()
		return

	if(_action == "sex2_more"):
		getModule("RahiModule").advanceSkill("rahiSkillSex")
		processTime(10*60)
		#getCharacter("rahi").cummedInVaginaBy("pc")
		#GM.pc.orgasmFrom("rahi")

	if(_action == "sex3_rahiputsonstrapon"):
		processTime(2*60)
		var strapon = GlobalRegistry.createItem("StraponFeeldoe")
		var fluids = strapon.getFluids()
		fluids.addFluid("CumLube", RNG.randi_range(3, 5)*100.0)
		getCharacter("rahi").getInventory().equipItem(strapon)

	if(_action == "sex3_rahiinserts"):
		processTime(2*60)

	if(_action == "sex3_cum"):
		processTime(5*60)
		GM.pc.gotVaginaFuckedBy("rahi")
		GM.pc.cummedInVaginaBy("rahi", FluidSource.Strapon)
		GM.pc.orgasmFrom("rahi")
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "rahi_strapon")
		GM.pc.addSkillExperience(Skill.CumLover, 30, "rahi_strapon")

	if(_action == "removerahistrapon"):
		getCharacter("rahi").resetEquipment()
		endScene()
		return

	if(_action == "sex3_knotfuck"):
		processTime(5*60)
		GM.pc.gotVaginaFuckedBy("rahi")
		GM.pc.gotVaginaFuckedBy("rahi")
		GM.pc.orgasmFrom("rahi")
		getModule("RahiModule").advanceSkill("rahiSkillMasochist")

	if(_action == "sex4_start"):
		processTime(3*60)

	if(_action == "sex4_cum"):
		processTime(5*60)
		GM.pc.rubsVaginasWith("rahi")
		GM.pc.orgasmFrom("rahi")
		GM.pc.cummedOnBy("rahi", FluidSource.Vagina)
		getCharacter("rahi").cummedOnBy("pc", FluidSource.Vagina)
		GM.pc.addSkillExperience(Skill.SexSlave, 30)

	if(_action == "sex4_watersports"):
		GM.pc.pissedOnBy("rahi", 0.5)
		getCharacter("rahi").pissedOnBy("pc", 0.5)
		getModule("RahiModule").advanceSkill("rahiSkillWatersports")

	if(_action == "peg1_rahiputsonstrapon"):
		processTime(2*60)
		var strapon = GlobalRegistry.createItem("StraponFeeldoe")
		var fluids = strapon.getFluids()
		fluids.addFluid("CumLube", RNG.randi_range(3, 5)*100.0)
		getCharacter("rahi").getInventory().equipItem(strapon)

	if(_action == "peg1_rahiinserts"):
		processTime(2*60)

	if(_action == "peg1_cum"):
		processTime(5*60)
		GM.pc.gotAnusFuckedBy("rahi")
		GM.pc.cummedInAnusBy("rahi", FluidSource.Strapon)
		GM.pc.orgasmFrom("rahi")
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "rahi_strapon")
		GM.pc.addSkillExperience(Skill.CumLover, 30, "rahi_strapon")

	if(_action == "peg1_knotfuck"):
		processTime(5*60)
		GM.pc.gotAnusFuckedBy("rahi")
		GM.pc.gotAnusFuckedBy("rahi")
		GM.pc.orgasmFrom("rahi")
		getModule("RahiModule").advanceSkill("rahiSkillMasochist")

	setState(_action)
