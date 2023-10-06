extends SceneBase

var success = 0

func _init():
	sceneID = "rahiActivityPetplayScene"

func _run():
	if(state == ""):
		addCharacter("rahi")
		saynn("How do you wanna train your pet?")

		var petLevel = getModule("RahiModule").getSkillScore("rahiSkillPetplay")
		addButton("Kitty training", "A simple training session for Rahi", "start_simple")
		if (petLevel > 6):
			addButton("Puppy training", "An advanced training session for Rahi where she is made to wear puppy restraints", "puppy_training")
			if (petLevel > 9):
				addButton("Walkies", "Take Rahi out on walkies", "start_walkies")
			else:
				addDisabledButton("Walkies", "Rahi needs to be more skilled at petplay for this")
		else:
			addDisabledButton("Puppy training", "Rahi needs to be more skilled at petplay for this")
		addButton("Never mind", "You changed your mind", "cancelactivity")
	if(state == "start_simple"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="allfours"})
		var petLevel = getModule("RahiModule").getSkillScore("rahiSkillPetplay")
		if (petLevel <= 4):
			saynn("Your kitty doesn't have much experience in petplay so you decide to go easy on her. You call her to come closer while holding a leash in your hand.")

			saynn("[say=rahi]Yes, {rahiMaster}?..[/say]")

			saynn("[say=pc]I want you to pretend to be a kitty for a bit. Not the kitty that you are usually are but the.. household pet kitty.[/say]")

			saynn("Kitty blinks many times, her cheeks redding up.")

			saynn("[say=pc]I won't ask you to remove your clothes yet to make you more comfortable. But I will reward or punish you depending on how you do in the end.[/say]")

			saynn("You point down at the spot before you. Rahi sees that and slowly lowers herself to all fours.")

			saynn("[say=rahi]Yes, {rahiMaster}..[/say]")

			saynn("[say=pc]Is that how household pets talk?[/say]")

			saynn("Rahi lowers her head slightly.")

			saynn("[say=rahi]Meow..[/say]")

			saynn("This should be fun.")

		else:
			saynn("Your kitty has some experience in petplay. So as soon as you grab your leash, her eyes already light up with anticipation, her tail twitching with excitement. She walks up to you.")

			saynn("[say=pc]I want you to be my pet kitty for a bit.[/say]")

			saynn("That's all she wanted to know. Rahi slowly lowers herself to all fours before you, her back creating a nice arc.")

			saynn("[say=pc]I will reward or punish you in the end, remember that.[/say]")

			saynn("[say=rahi]Meow..[/say]")

			saynn("This should be fun.")

		saynn("What command do you wanna give to your kitty?")

		saynn("Sit. Success chance: "+str(Util.roundF(succChance(80.0, 90.0, 5), 1))+"%")

		saynn("Speak. Success chance: "+str(Util.roundF(succChance(50.0, 120.0, 4), 1))+"%")

		saynn("Roll over. Success chance: "+str(Util.roundF(succChance(30.0, 80.0, 3), 1))+"%")

		saynn("Beg. Success chance: "+str(Util.roundF(succChance(20.0, 90.0, 5), 1))+"%")

		saynn("Heel. Success chance: "+str(Util.roundF(succChance(10.0, 90.0, 5), 1))+"%")

		addButton("Sit", "Make Rahi sit on her butt", "pet1_sit")
		addButton("Speak", "Make Rahi speak", "pet1_speak")
		addButton("Roll over", "Make Rahi roll over so you can give her belly rubs", "pet1_rollover")
		addButton("Beg", "Make Rahi beg for attention", "pet1_beg")
		addButton("Heel", "Make Rahi crawl near you", "pet1_heel")
	if(state == "pet1_sit"):
		saynn("[say=pc]Kitty, sit.[/say]")

		if (success):
			playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="kneel"})
			saynn("An unusual command for a kitty. But nonetheless, Rahi hears it and obediently sits down on her haunches, her tail curling around her body. Kitty's eyes staring up at you expectantly.")

			saynn("[say=pc]That's it, kitty.[/say]")

			saynn("You nod in approval, kitty's ears perk up, her front paws reaching out and landing on your legs, letting you feel her claws gently brushing against your body.")

			saynn("Rahi smiles. It obviously wasn't the hardest command but she still deserves a reward.")

		else:
			saynn("Rahi hesitates for a moment, then turns around and curls up into a ball of fluff on the floor.")

			saynn("She looks incredibly cute. But that's not what you asked her to do. So you repeat the command.")

			saynn("[say=pc]Come on, kitty. Sit.[/say]")

			saynn("Rahi gets up on all fours again and tilts her head. You gesture what you want her to do with your hand.")

			saynn("[say=pc]Sit, kitty, sit. S-I-T.[/say]")

			saynn("Rahi finally understands the message and tries to sit on her hind legs. But then she quickly loses her balance and topples over her side, legs kicking in the air. Rahi looks rather silly.")

			saynn("[say=rahi]Me-e-e-eow..[/say]")

			saynn("Rahi bleps, sticking her tongue out.")

			saynn("[say=pc]You almost had it, I guess. What a silly kitty.[/say]")

			saynn("As cute as she might look, you still gotta punish her. Maybe just not as hard.")

		addButton("Continue", "See what happens next", "pet1_reward_check")
	if(state == "pet1_speak"):
		saynn("[say=pc]Kitty, speak.[/say]")

		if (success):
			saynn("At first, Rahi is hesitant, unsure exactly how a kitty is supposed to speak. She meows softly, testing your reaction. But then, after you scritch her behind her ears, kitty feels encouraged to meow louder.")

			saynn("[say=rahi]Meow-meow-mew..[/say]")

			saynn("And so she does, standing on all fours before you, mewling and meowing, making all sorts of feline noises, delighted by your attention.")

			saynn("[say=pc]Who's a good kitty?[/say]")

			saynn("[say=rahi]Mew! Me-e-ew!..[/say]")

			saynn("As you scritch her behind the ears and under the chin, Rahi melts in your hands, nuzzling your palms and wiggling her behind eagerly.")

			saynn("[say=pc]What would a kitty say when she is unhappy or sad?[/say]")

			saynn("[say=rahi]Mow. Moew..[/say]")

			saynn("Her ears droop, tail flopping onto the floor.")

			saynn("[say=pc]And what would a kitty say when she is angry?[/say]")

			saynn("[say=rahi]HSS-Ss-s![/say]")

			saynn("Suddenly Rahi is hissing and showing off her fangs to you. She is so convincing that you pull your hands away. All her fur stands up, her tail wagging behind her with irregular patterns.")

			saynn("[say=pc]You're not gonna bite me, are you, kitty?[/say]")

			saynn("Rahi realizes what she is doing and snaps out of it, shaking her head and calming down. She lowers her head. But feeling your scritches makes her cheer up again.")

			saynn("[say=pc]I know you wouldn't. Good job, kitty.[/say]")

		else:
			saynn("Rahi gets all confused by your sudden command. Instead of just blindly following it, she looks up at you and tilts her head.")

			saynn("[say=rahi]What should she speak about..[/say]")

			saynn("You sigh softly and boop Rahi on the nose.")

			saynn("[say=pc]You're a kitty, so speak like one. Forget normal words, silly.[/say]")

			saynn("Rahi blushes, realizing that you weren't suddenly interrogating her.")

			saynn("[say=rahi]Um.. Meow?..[/say]")

			saynn("You can't help but to chuckle when your confused kitty is being silly.")

			saynn("[say=pc]Close enough.[/say]")

			saynn("[say=rahi]Sorry for being bad at this..[/say]")

			saynn("Aw, she keeps breaking out of the kitty mindset.")

		addButton("Continue", "See what happens next", "pet1_reward_check")
	if(state == "pet1_rollover"):
		saynn("[say=pc]Come closer, kitty.[/say]")

		saynn("Rahi crawls up so close, her paws practically touching your legs.")

		saynn("[say=pc]Good girl. Now, roll over.[/say]")

		saynn("After the command, Rahi quickly flops onto her back. She holds her paws near her shoulders while you undo the lower set of buttons of her shirt, exposing her soft, fluffy belly. She can feel the cool prison air washing over her skin and can't help but to feel a little vulnerable in this position.")

		saynn("Rahi trusts you enough to not fight it. Instead, she relaxes and lets out a contented purr as you start to give her belly some good bellyrubs. She quivers slightly as your hands work their way across her fur, caressing and stroking it in just the right way.")

		if (success):
			saynn("As much as she enjoys the sensations, she also has to constantly fight the urge rising up inside her. The way Rahi acts, she is clearly trying to avoid biting and scratching your hands, she is fighting her instincts.")

			saynn("And she seems to succeed, Rahi grabs onto your hands a few times but only to nuzzle and lick them. She lets out another purr as you continue to rub her belly.")

			saynn("[say=pc]Such a good kitty.[/say]")

		else:
			saynn("The moment is cut short though. When you rub kitty in the spots particularly close to her private bits, she suddenly grabs onto your hands and sinks her claws into them, scratching and biting! And since Rahi isn't a small cat but an actual anthro feline, she easily draws your blood, probably without even realizing it.")

			saynn("[say=pc]Ow! Bad kitty![/say]")

			saynn("And now she doesn't wanna let go, holding onto your hands and kicking them with her legs at the same time. It would be cute if it wasn't kinda painful, each kick leaves a little bruise on you.")

			saynn("[say=pc]Let go![/say]")

			saynn("Finally you manage to free your scratched hands. Rahi realizes what she did and looks all sorry, reaching out to lick the wounds that she caused.")

			saynn("[say=rahi]Sorry..[/say]")

			saynn("You sigh and let Rahi treat you.")

			saynn("[say=pc]Kitty-kitty.. what should I do with you..[/say]")

		addButton("Continue", "See what happens next", "pet1_reward_check")
	if(state == "pet1_beg"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="kneel"})
		saynn("[say=pc]I want to see how well you can beg, kitty.[/say]")

		if (success):
			saynn("Rahi looks surprised. But then she sits on her butt and just looks up at you with her wide, pleading eyes.")

			saynn("It's cute.. but not enough. She raises her paws to her shoulders level and wiggles slightly, bouncing in place.")

			saynn("[say=rahi]Meow?.. Meow-mew-meew..[/say]")

			saynn("Rahi tilts her head to one side, flicking her ears. Rahi reaches one paw to your hand and lets you feel her soft fur blushing against your skin. That's.. so adorable that you can't resist her anymore. You start giving her scritches that she needs so much. Rahi purrs and nuzzles your hands, dragging her rough tongue over your palms so you can brush them against her ponytail.")

			saynn("[say=pc]Such a good girl.[/say]")

		else:
			saynn("Rahi looks up at you, unsure of what to do exactly. The more she thinks about it, the more nervous and less confident she becomes.")

			saynn("She starts to make soft, whimpering noises, hoping that it will be enough. But it sounds more pathetic than cute so you shake your head.")

			saynn("[say=pc]Beg like a proper pet, kitty.[/say]")

			saynn("Feeling embarrassed and humiliated, Rahi tries again. She starts to make louder, more urgent noises and even tries to paw at your leg with her paws. But once again, her begging doesn't make you want to spoil your kitty.")

			saynn("[say=pc]You will need some more training, kitty.[/say]")

		addButton("Continue", "See what happens next", "pet1_reward_check")
	if(state == "pet1_heel"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", flipNPC=true, npcAction="crawl", npcBodyState={leashedBy="pc"}})
		
		saynn("[say=pc]Ready for a little lesson?[/say]")

		saynn("Rahi waits patiently near your feet, her ears perk with excitement as she meows softly.")

		saynn("[say=pc]Good. We're gonna practice walking on a leash.[/say]")

		saynn("You lean down and attach a leash to Rahi's collar. She blinks many times.")

		if (success):
			saynn("You take a few steps away from Rahi and watch her follow you, crawling on the floor while the leash keeps her from getting too far.")

			saynn("[say=pc]Heel, kitty.[/say]")

			saynn("You don't explain what that command means, Rahi understands it and obediently crawls closer to you, her hips swaying seductively with every motion. You continue your step, giving leashed Rahi a few laps around her cell and sometimes giving her commands to stay or come closer. She was a quick learner, and soon she was crawling beside you like a seasoned pro.")

			saynn("She didn't just want to be good at it, she wanted to show how much she enjoys it, too. While she crawls around, she makes sure to keep her back arched down and swaying her hips more, giving you an enticing view of her curves.")

			saynn("[say=pc]You're doing very well, kitty.[/say]")

			saynn("After that, you unclip the leash from Rahi's collar and start thinking about how to reward her.")

		else:
			saynn("You take a few steps away but Rahi stays in her spot. It's only when the leash starts pulling on her collar she follows you.")

			saynn("[say=pc]Heel, kitty.[/say]")

			saynn("Rahi looks up at you with wide eyes, unsure of what to do. You not explaining what that command means really confuses kitty so you just tug on the leash more, guiding Rahi towards yourself.")

			saynn("[say=rahi]Mee-eow..[/say]")

			saynn("[say=pc]I want you to walk beside me, kitty.[/say]")

			saynn("Rahi nods enthusiastically and pretty much bumps your leg with her forehead. But as soon as you start walking, Rahi stumbles and falls. It seems she still hasn't fully got used to walking on all fours.")

			saynn("[say=pc]Come on, kitty.[/say]")

			saynn("Rahi tries her best to keep pace while you make laps around her cell but she keeps tripping and stumbling. Her tail twitches and wags nervously, a wave of embarrassment washes over her when she gets tangled in the leash and flops.")

			saynn("You can't help but to sigh.")

			saynn("[say=pc]We will have to practice more until you can walk beside me like a proper pet.[/say]")

		addButton("Continue", "See what happens next", "pet1_reward_check")
	if(state == "pet1_reward"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="allfours"})
		
		saynn("How do you wanna reward your kitty?")

		addButton("Pat", "Just a simple pat will do", "reward1_pat")
		addButton("Cuddle", "Why not cuddle with your kitty", "reward1_cuddle")
		addButton("Give treat", "Give Rahi a treat", "reward1_treat")
	if(state == "reward1_pat"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="kneel"})
		saynn("You bring your hand closer to Rahi and then plant it onto her head, delivering a great head pat. And then another few. And another.")

		saynn("[say=pc]Good kitty.[/say]")

		saynn("Rahi purrs contently and nuzzles your palm, her tail brushing against your leg.")

		addButton("Continue", "That was fun", "endthescene")
	if(state == "reward1_cuddle"):
		playAnimation(StageScene.Cuddling, "idle", {npc="rahi"})
		saynn("You pull your kitty onto the bed for some cuddles. She produces a surprised meow when you casually scoop her up like that and press against yourself. Your hands slowly brush her hair and back.")

		saynn("[say=pc]Such a good kitty.[/say]")

		saynn("Rahi purrs loudly and relaxes in your hands for some time.")

		addButton("Continue", "That was fun", "endthescene")
	if(state == "reward1_treat"):
		saynn("As you produce a small bag of kitty treats, Rahi looks up at it and starts wiggling with excitement.")

		saynn("[say=pc]Good girl, Kitty. You're doing so well.[/say]")

		saynn("You grab a few and hold them out for Rahi. Kitty sniffs the treats for a bit before taking them delicately between her teeth. She chews them slowly, savoring the taste while you continue to praise her and give her pets and scritches.")

		saynn("[say=pc]You deserve all the treats for being such a good pet.[/say]")

		saynn("Rahi purrs contentedly. Eventually she finishes her treats and licks her lips clean.")

		addButton("Continue", "That was fun", "endthescene")
	if(state == "pet1_punish"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="allfours"})
		
		saynn("How do you wanna punish your kitty?")

		addButton("Forgive her", "You don't wanna be harsh on your kitty", "punish1_forgive")
		addButton("Scold Rahi", "Tell Rahi that she is a bad kitty", "punish1_scold")
		if (getModule("RahiModule").isSkillLearned("rahiSkillMasochist")):
			addButton("Spank", "(Masochism) Give Rahi a rough punishment", "punish1_spank")
	if(state == "punish1_forgive"):
		saynn("Kitty looks up at you with her big sad feline eyes. How can you even think about punishing such a cutie..")

		saynn("[say=pc]You did your best, kitty. I won't punish you.[/say]")

		saynn("Rahi smiles and nuzzles her cheeks against your legs.")

		saynn("[say=rahi]Meow-meow..[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "punish1_scold"):
		saynn("Kitty looks up at you with her big sad feline eyes. But you gotta be firm. You put on your mean eyes and frown at Rahi.")

		saynn("[say=pc]I'm giving you only simple commands, kitty. And you're still failing at them.[/say]")

		saynn("Rahi lowers her gaze, her tail pressed between her legs. You point at her.")

		saynn("[say=pc]Bad kitty.[/say]")

		saynn("Her whiskers twitch, just like her lips. Her eyes get slightly watery. You can't quite tell if she is actually sad or still pretending to be a kitty.")

		saynn("[say=pc]Kitty..[/say]")

		saynn("You crouch near and stroke her back.")

		saynn("[say=rahi]Meeeow..[/say]")

		saynn("[say=pc]I'm not mad at you. Just trying to train you into the best kitty.[/say]")

		saynn("She nods understandable.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "punish1_spank"):
		playAnimation(StageScene.Spanking, "fast", {npc="rahi"})
		saynn("You sit behind Rahi and put your hand on her back. Rahi is still on all fours, her tail twitching nervously.")

		saynn("[say=pc]I'm giving you very simple commands. Maybe you'd rather be treated like a bad kitty? I can do that.[/say]")

		saynn("Rahi lowers her head submissively and awaits her fate.")

		saynn("You reach for Rahi's tail and lift it up, exposing her clothed backside. With your free hand, you deliver a sharp smack on Rahi's butt, causing her to gasp and let out a small whimper. After that impact, you rub Rahi's rear instead to calm her down.")

		saynn("[say=rahi]Mow..[/say]")

		saynn("You give Rahi's butt another smack. She tries to wiggle but you pulling on her tail prevents that.")

		saynn("[say=pc]You need to learn to obey me if you want to be a good pet.[/say]")

		saynn("You continue to deliver sharp, stinging spanks to Rahi's butt, making her whine and moan with each one. The free tip of her tail flicks back and forth. Strangely enough, you can feel heat and arousal building within her.")

		if (getModule("RahiModule").getSkillScore("rahiSkillMasochist") > 7):
			saynn("After some minutes of spanking, you stop and release Rahi's tail. And wow, her shorts look.. soaking with her juices. The whole cell smells of Rahi's arousal. Seems like you got your kitty really worked up.")

			saynn("She looks at you with pleading eyes while seductively swaying her hips, clearly wanting more.")

			saynn("[say=pc]This is a punishment kitty, I won't make you cum. Don't even.[/say]")

			saynn("Rahi sighs and lowers her head, having to endure the pleasurable sensations.")

		else:
			saynn("After several minutes of spanking, you stop and release Rahi's tail. She instantly covers herself with it and pants heavily, sometimes hissing when the fabric of her shorts rub against her butt too much. Still, you notice a small wet spot exactly where Rahi's pussy is.")

			saynn("[say=pc]Good kitty, at least you know how to take a punishment.[/say]")

			saynn("You run your hand over Rahi's fur, removing tension and letting kitty calm down.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "puppy_training"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcBodyState={naked=true}})
		var petLevel = getModule("RahiModule").getSkillScore("rahiSkillPetplay")
		if (petLevel <= 10):
			saynn("Rahi is pretty good at being a kitty pet, since.. she is a kitty already. So today you decide to train her to act like a puppy.")

			saynn("Rahi sits nervously on her bed, watching you approach her with a set of bulky leather restraints in hand. Although part of her is clearly excited too.")

			saynn("[say=pc]Alright kitty. Today I want you to be.. a puppy.[/say]")

			saynn("[say=rahi]Meow?..[/say]")

			saynn("You grab Rahi's collar and make her stand up before gently spanking her fluffy butt.")

			saynn("[say=pc]No meow. Undress.[/say]")

			saynn("Rahi paws begin taking off her inmate uniform, revealing her naked body to you. Then she carefully places the clothes on her bed.")

		else:
			saynn("Rahi loves petplay. As soon as you go ahead and grab the puppy restraints, she is already standing in the middle of the cell, her paws pulling off her uniform.")

			saynn("[say=pc]Alright kitty. Today..[/say]")

			saynn("[say=rahi]Ruff! Ruff-wuff![/say]")

			saynn("It seems Rahi knows what's gonna happen. And she is here for it. She wiggles her butt eagerly, letting her shorts slide down. Her feline tail wags playfully.")

		addButton("Restraints", "Put the puppy restraints on Rahi", "pup_restraints")
	if(state == "pup_restraints"):
		playAnimation(StageScene.PuppyDuo, "stand", {npc="rahi", npcBodyState={naked=true}})
		saynn("Without a word, you begin pushing Rahi's elbows into the special puppy restraints that force her arms into one specific position. Then you make her get on all fours and put a similar set of restraints on her legs, making Rahi stand on her elbows and knees.")

		var petLevel = getModule("RahiModule").getSkillScore("rahiSkillPetplay")
		if (petLevel <= 10):
			saynn("Your pet squirms and wiggles, testing the bindings. It seems they are secure enough for Rahi to be completely helpless.")

		else:
			saynn("Your pet eagerly wiggles, enjoying the feeling of tight bindings. It seems they are secure enough for Rahi to be completely helpless. And she loves it, barking and wagging her tail.")

		addButton("Circle cell", "Give Rahi some walkies around her cell", "pup_cell")
		addButton("Fetch", "Play fetch with Rahi", "pup_fetch")
		if (getModule("RahiModule").isSkillLearned("rahiSkillSex")):
			if (GM.pc.hasReachablePenis()):
				addButton("Breed Rahi", "(Sex) Fuck your pet", "pup_breed_rahi")
			if (GM.pc.canWearStrapon()):
				addButton("Strapon Rahi", "(Sex) Fuck your pet with a strapon", "pup_strapon_rahi")
			addButtonWithChecks("Face-fuck", "(Sex) Fuck Rahi's mouth", "pup_facefuck_rahi", [], [ButtonChecks.HasReachablePenis])
			addButtonWithChecks("Grind face", "(Sex) Grind your pet's face with your pussy", "pup_grind_rahi", [], [ButtonChecks.HasReachableVagina])
	if(state == "pup_cell"):
		playAnimation(StageScene.PuppyDuo, "stand", {npc="rahi", npcAction="walk", npcBodyState={naked=true}})
		saynn("Might as well let Rahi get used to her restraints. You lean down to her collar and clip a leash to it.")

		saynn("[say=pc]Follow, puppy.[/say]")

		saynn("You start to slowly walk around Rahi's cell, giving her plenty of time to catch. And time she does need, Rahi slowly moves her puppy limbs one at a time, barely keeping up with you. Her cheeks glowing red from the humiliation. But being degraded down to pup is also.. clearly quite arousing for her.")

		saynn("[say=pc]You like it, pup?[/say]")

		saynn("[say=rahi]Wuf..[/say]")

		saynn("As a circle the cell, you would occasionally tug on the chains or give Rahi a little smack on the butt, making her yelp in surprise. Such a simple activity.. but both of you begin losing track of time, having way too much fun. Rahi's mind grows fuzzy from the pleasure of submission, she playfully sways her hips and barks for you. She actually seems to be crawling faster than before, adjusting to the leather restraints.")

		saynn("Finally, after a few long laps, you stop and crouch before Rahi. Your hands stroke her hair and give her scritches while your lips whisper soft words of praise.")

		saynn("[say=pc]What a good puppy..[/say]")

		saynn("Rahi looks up at you with wide adoring eyes, probably feeling more like a pet puppy than a person, judging from the tail wagging.")

		saynn("But since so much time has passed, it was a good moment to start wrapping up. You kiss Rahi on the forehead and begin removing the restraints, helping your kitty to escape the puppy mindset.")

		addButton("Continue", "That was fun", "endthescene")
	if(state == "pup_fetch"):
		playAnimation(StageScene.PuppyDuo, "stand", {npc="rahi", npcAction="walk", npcBodyState={naked=true}})
		saynn("You produce a small rubber ball and present it to Rahi.")

		saynn("[say=pc]Watch this.[/say]")

		var petLevel = getModule("RahiModule").getSkillScore("rahiSkillPetplay")
		if (petLevel <= 10):
			saynn("Rahi tilts her head to the side but watches the ball.")

		else:
			saynn("Rahi eagerly wiggles her behind, already knowing what's about to happen.")

		saynn("You take aim and throw the ball across the cell, causing it to bounce off the walls and floor a few times before ending up not that far from you.")

		saynn("[say=pc]Fetch, puppy.[/say]")

		if (petLevel <= 10):
			saynn("Rahi blinks many times, her cheeks blushing at the thought. But eventually she begins crawling towards the ball. One paw at a time, your pup reaches the spot and picks up the ball in her mouth before bringing it back to you.")

			saynn("[say=pc]Good girl![/say]")

			saynn("Rahi is clearly embarrassed after doing this. But her eyes do track the ball in your hands as she waits patiently..")

		else:
			saynn("Rahi eagerly starts chasing the ball before it even stops rolling. One paw at a time, your pup reaches the spot and picks up the ball in her mouth before bringing it back to you, looking proud.")

			saynn("[say=pc]Good girl![/say]")

			saynn("Rahi wiggles, her lusty eyes tracking the ball in your hands while she is being all impatient and cute..")

		saynn("You throw the ball again and watch Rahi chasing after it again. With each toss, you increase the distance that Rahi has to run and the difficulty of the catch. Eventually Rahi starts to pant heavily, her tongue lolling out of her mouth as she tries to keep up.")

		saynn("Finally, you throw the ball in such a way that it lands on Rahi's bed. She crawls up to it and whines in frustration, her tail and ears drooping.")

		saynn("[say=pc]Aw, my puppy can't climb the bed? Ready to give up already?[/say]")

		saynn("Rahi huffs and starts trying to climb it, pushing off the floor and using her restraints to try to get higher. But no matter what she does, her muzzle just can't quite reach the damn ball. Kitty is huffing and puffing. Looking at her from behind.. Wow, your puppy-kitty pet is so wet down there, her pussy is practically soaking with juices.")

		addButton("Help her", "Help Rahi get the ball", "pup_helpball")
		if (getModule("RahiModule").isSkillLearned("rahiSkillSex")):
			addButton("Finger her", "(Sex) Help Rahi get the ball and get off at the same time", "pup_fingerball")
	if(state == "pup_helpball"):
		playAnimation(StageScene.PuppyDuo, "kneel", {npc="rahi", npcAction="back", npcBodyState={naked=true}})
		saynn("Watching Rahi struggle so much makes you feel sad for her. So you carefully grab her by the sides and pull her up until she grabs the ball with her muzzle. After that you let her down again.")

		saynn("Rahi proudly presents you the ball while wiggling her behind.")

		saynn("[say=pc]Good job, puppy. You deserve this.[/say]")

		saynn("Suddenly you flip Rahi upside down, making her lay on her back. And then you start giving her all the bellyrubs and scritches. Loud purring escapes from her while you do that. Rahi keeps holding the ball in her mouth, drooling actively because of that.")

		saynn("[say=pc]Such a cutie.[/say]")

		saynn("You pet your puppy a bit more before finally taking off the restraints.")

		addButton("Continue", "That was fun", "endthescene")
	if(state == "pup_fingerball"):
		playAnimation(StageScene.PuppyDuo, "kneel", {npc="rahi", npcAction="stand", npcBodyState={naked=true}})
		saynn("Frustrated, Rahi looks up at you with pleading eyes.")

		saynn("But seeing her obviously aroused state.. you decide to help her with that first. You approach Rahi and run a hand down her back, feeling the soft fur and the slight tremble of her body.")

		saynn("As you reach her wet pussy.. you can feel the heat radiating from her. With a little smile on your face, you slide two fingers into her needy opening and proceed to finger her. Rahi moans and arches her back, resting her chin on the bed as you quickly move the digits inside her, pressing at her buttons.")

		saynn("All the while, your other hand reaches out and grabs the ball off the bed before plugging Rahi's moaning mouth with it, muffling her noises and making her drool.")

		saynn("[say=pc]There you go.. there is your ball, puppy. Don't lose it now.[/say]")

		saynn("Rahi's body squirms eagerly as your other fingers rub against her slick folds, teasing them. Her restraints make it impossible for her to move out of the way in a timely fashion.. but it seems that your puppy enjoys her spot, panting heavily into the ball. You can feel her pussy becoming wetter with each thrust of your fingers.")

		saynn("Rahi closes her eyes shut and tries to focus on the pleasurable sensations of your fingers curling inside her. Her silly puppy mind is consumed by the overwhelming pleasure coursing through her body. Her hips buckle uncontrollably as you finger-fuck her slit as a fast pace, stretching her needy hole open and driving her closer to the edge.")

		saynn("Suddenly, Rahi's body tenses, and she lets out a loud muffled cry before cumming hard. Her pussy walls tightly clenching around your digits before squirting juices all over the floor. You keep wiggling your digits inside her, overstimulating the poor pup.")

		saynn("[say=pc]Good girl~.[/say]")

		saynn("After the last orgasmic wave, Rahi is just left standing on her knees and elbows, panting. Her body is still quivering with aftershocks as you withdraw your fingers. Then you grab the saliva-covered ball from Rahi's mouth and put it away.")

		saynn("[say=pc]Such a good little pet.[/say]")

		saynn("[say=rahi]Wuf-f..[/say]")

		addButton("Continue", "That was fun", "endthescene")
	if(state == "pup_breed_rahi"):
		playAnimation(StageScene.PuppySexAllFours, "tease", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("As Rahi looks up at you with pleading eyes, you reach your hand out and grab her by the collar and pull close, causing your kitty to almost fall.")

		saynn("[say=pc]Let's see how well my puppy can handle a rough touch. And a rough breeding.[/say]")

		saynn("[say=rahi]Wruff?..[/say]")

		saynn("You growl softly before taking a stop behind Rahi, your hands landing on her tail and pulling it out of the way, causing the pup's fur to stand.")

		saynn("Rahi gasps in surprise as your palms tease her exposed pussy, your fingers exploring her wetness and playing with the little sensitive clit. Puppy squirms and moan under your touch, her body quivering as much as the leather restraints allow.")

		saynn("After that small amount of teasing your pup is already all huffy and needy, her pussy producing an inviting scent of a horny feline. The scent that makes you quite aroused as well..")

		saynn("[say=pc]A bitch in heat. Let me help you with that.[/say]")

		addButton("Fuck her", "Do the thing", "pup_breed_fuck")
	if(state == "pup_breed_fuck"):
		playAnimation(StageScene.PuppySexAllFours, "sex", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("One of your hands slips off Rahi's feline tail and instead grabs onto her ponytail, pulling it tight. She knows what's coming.. but she is powerless to do anything about it..")

		saynn("With a sudden thrust, you enter Rahi, your {pc.penis} spreading her wet folds and sliding inside, causing kitty to produce a cry. You start pounding her slit, using your pup like a toy. The more you tug on her ponytail while thrusting into her wet and willing pussy, the more she begins to pant and moan.")

		saynn("[say=pc]Such a slutty little puppy. A breeding toy for me to enjoy.[/say]")

		saynn("[say=rahi]R-ruff-f..[/say]")

		addButton("Faster", "Fuck her faster", "pup_breed_faster")
	if(state == "pup_breed_faster"):
		playAnimation(StageScene.PuppySexAllFours, "fast", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("You let go of Rahi's ponytail and instead grip her tail tightly, pulling on it while slamming your hips against hers with even more force, your shaft massaging her g-spot and bringing the pup closer and closer to her peak. The slaps echo through the cell as Rahi's body trembles with each powerful thrust.")

		saynn("Her tongue lolls out of her mouth as she starts panting like a dog, her eyes rolling up from this feeling of pure ecstasy. With each passing moment, you can feel Rahi getting closer to climax, her pussy walls getting tighter around your twitching member.")

		addButton("Cum inside", "Breed Rahi", "pup_breed_cum")
	if(state == "pup_breed_cum"):
		playAnimation(StageScene.PuppySexAllFours, "inside", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("Finally, with a deep groan, you shove your {pc.penis} until its tip kisses Rahi's womb entrance and cum inside her. Rahi can feel your hot seed filling her up.. she whimpers softly from pleasure and this feeling of total submission. Her pussy gripping your throbbing shaft and squeezing every last drop of {pc.cum} out of it.")

		saynn("[say=pc]Ngh~.[/say]")

		saynn("Rahi is panting heavily, with your shaft still inside her. You savor this feeling of Rahi's pussy for a bit longer before finally pulling out, leaving her stuffed slit empty and used.")

		saynn("Seed starts dripping out of her and down her thighs, marking her as your property.")

		saynn("[say=rahi]H-huuff..[/say]")

		addButton("Enough", "that was lewd", "endthescene")
	if(state == "pup_strapon_rahi"):
		playAnimation(StageScene.PuppySexAllFours, "tease", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("As Rahi looks up at you with pleading eyes, you reach your hand out and grab her by the collar and pull close, causing your kitty to almost fall.")

		saynn("[say=pc]Let's see how well my puppy can handle a rough touch. And a rough fucking.[/say]")

		saynn("[say=rahi]Wruff?..[/say]")

		saynn("You growl softly before taking a stop behind Rahi, your hands landing on her tail and pulling it out of the way, causing the pup's fur to stand.")

		saynn("Rahi gasps in surprise as your palms tease her exposed pussy, your fingers exploring her wetness and playing with the little sensitive clit. Puppy squirms and moan under your touch, her body quivering as much as the leather restraints allow.")

		saynn("After that small amount of teasing your pup is already all huffy and needy, her pussy producing an inviting scent of a horny feline. The scent that makes you quite aroused as well..")

		saynn("[say=pc]A bitch in heat. Let me help you with that.[/say]")

		saynn("You go ahead and grab one of strapons before securing it around your waist. Kitty's eyes widen. You quickly pour some lube over it.")

		addButton("Fuck her", "Do the thing", "pup_strapon_fuck")
	if(state == "pup_strapon_fuck"):
		playAnimation(StageScene.PuppySexAllFours, "sex", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("One of your hands slips off Rahi's feline tail and instead grabs onto her ponytail, pulling it tight. She knows what's coming.. but she is powerless to do anything about it..")

		saynn("With a sudden thrust, you enter Rahi, your fake rubber member spreading her wet folds and sliding inside, causing kitty to produce a cry. You start pounding her slit, using your pup like a toy. The more you tug on her ponytail while thrusting into her wet and willing pussy, the more she begins to pant and moan.")

		saynn("[say=pc]Such a slutty little puppy. A breeding toy for me to enjoy.[/say]")

		saynn("[say=rahi]R-ruff-f..[/say]")

		addButton("Faster", "Fuck her faster", "pup_strapon_faster")
	if(state == "pup_strapon_faster"):
		playAnimation(StageScene.PuppySexAllFours, "fast", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("You let go of Rahi's ponytail and instead grip her tail tightly, pulling on it while slamming your hips against hers with even more force, your strapon massaging her g-spot and bringing the pup closer and closer to her peak. The slaps echo through the cell as Rahi's body trembles with each powerful thrust.")

		saynn("Her tongue lolls out of her mouth as she starts panting like a dog, her eyes rolling up from this feeling of pure ecstasy. With each passing moment, you can feel Rahi getting closer to climax, her pussy walls getting tighter around your shiny member. Even though it's just a strapon, the sensations that Rahi receives are quite close to a real thing, surely enough to satisfy a puppy in heat.")

		addButton("Make her cum", "Might as well", "pup_strapon_cum")
	if(state == "pup_strapon_cum"):
		playAnimation(StageScene.PuppySexAllFours, "inside", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("Finally, when you feel that Rahi is at her edge, you shove the rubber cock inside until its tip kisses Rahi's womb entrance and suddenly starts stuffing her with cum lube. Rahi can feel the slimy sticky white stuff filling her up.. she whimpers softly from pleasure and this feeling of total submission. Her pussy gripping your rubber shaft and squeezing every last drop of lube out of it.")

		saynn("[say=pc]Good~.[/say]")

		saynn("Rahi is panting heavily, with your rubber shaft still inside her. You let Rahi enjoy this toy inside her pussy for a bit longer before finally pulling out, leaving her stuffed slit empty and used.")

		saynn("Fake cum starts dripping out of her and down her thighs, marking her as your property.")

		saynn("[say=rahi]H-huuff..[/say]")

		addButton("Enough", "that was lewd", "removestraponandend")
	if(state == "pup_facefuck_rahi"):
		playAnimation(StageScene.PuppySexOral, "tease", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("Rahi being on all fours with her wrists and ankles locked firmly.. makes you quite aroused. And since she is already getting quite comfortable being your pup.. why not test her.. and use her pretty mouth.")

		saynn("You approach Rahi and expose your hard member in front of her. Rahi could just.. feel.. the heat radiating from your shaft, making her feel hot and wet between her legs. You grab Rahi's ponytail and pull on it, causing your pup to whine and raise her chin, exposing her throat.")

		saynn("[say=pc]Open up, pet.[/say]")

		saynn("You press your {pc.penis} against Rahi's lips. Your tone is quite a commanding one. The restraints block most of her available range of motion.. but it's not like she minds being helpless with you.")

		saynn("Rahi eagerly parts her lips and grabs just the tip of your member into her mouth, gently sucking on it and licking the precum off with her tongue. But you obviously want more..")

		addButton("Fuck her face", "Be rougher", "pup_facefuck_do")
	if(state == "pup_facefuck_do"):
		playAnimation(StageScene.PuppySexOral, "sex", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("You hold Rahi's head by the ponytail before thrusting your member inside, the saliva-coated tip already bumping against the back of Rahi's mouth.")

		saynn("[say=pc]Much better.[/say]")

		saynn("You start sliding your cock in and out of her wet, warm mouth, fucking the helpless Rahi. Muffled moans and whimpers escape from her as her rough feline tongue is working to pleasure you, making you more eager.")

		saynn("[say=pc]Such a slutty pet.[/say]")

		saynn("That felt good.. but with how well her lips are wrapping around your shaft.. you kinda wanna go even faster.")

		addButton("Faster", "Face-fuck Rahi for real", "pup_facefuck_cum")
	if(state == "pup_facefuck_cum"):
		playAnimation(StageScene.PuppySexOral, "fast", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("Suddenly you widen the range of your hip motions and thrust forward, pushing your {pc.penis} deep into Rahi's throat! That causes your puppy to gag and choke, saliva drooling down her chin as she tries to breathe through her nose. You keep a firm grip on Rahi's ponytail and keep face-fucking her as she desperately tries to suck and lick your shaft.")

		saynn("[say=pc]Good girls swallow. Take it all, you slutty puppy.[/say]")

		saynn("Rahi whimpers in response, her tail wagging slightly as she tries to please her owner, allowing your cock to stretch her throat out which creates a visible bulge on her neck. A moan escapes your lips, you can feel yourself getting closer to climax..")

		saynn("With a final thrust, you shove your dick as far as Rahi's mouth allows and release your load deep into her throat. Your pup swallows eagerly, her eyes seem to be rolling up on their own each time your cock throbs inside her, stuffing her belly with more and more {pc.cum}. As Rahi quickly loses all her oxygen, her throat gets more and more tight.. which drains your balls completely.")

		saynn("After that moment of.. pure bliss.. you finally pull out, allowing Rahi to catch her breath. She pants heavily, her lusty eyes admiring your wet shaft. You smile down at her and run your hand through her fur.")

		saynn("[say=pc]You did well, pet.[/say]")

		saynn("[say=rahi]R-ruff..[/say]")

		saynn("Rahi purrs and swallows the rest of your seed before showing you her empty mouth, like a good slut.")

		addButton("Enough", "That was lewd", "endthescene")
		if (getModule("RahiModule").isSkillLearned("rahiSkillWatersports")):
			addButton("Piss in mouth", "(Watersports) Might as well use your pet as a piss toilet..", "pup_facefuck_pee")
	if(state == "pup_facefuck_pee"):
		playAnimation(StageScene.PuppySexOral, "tease", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		var waterLevel = getModule("RahiModule").getSkillScore("rahiSkillWatersports")
		if (waterLevel > 5):
			saynn("After stuffing Rahi's throat full of your seed.. you can't help but to want to relieve yourself in some other way. Your bladder is quite full.. And your pet is right there..")

			saynn("[say=pc]I need to pee, puppy. You know what that means.[/say]")

			saynn("Without hesitation, Rahi opens her mouth wide, eager to please you in any way that she can. Seems like training your kitty to be a piss toilet has paid off. As soon as a stream of warm urine hits her tongue, she starts to eagerly swallow the gross, salty piss. You hold your pet's hair strands away from her lips while pissing directly into her mouth. She swallows as much as she can, feeling her belly fill up with this hot, yellow liquid, in addition to the seed that was already there.")

			saynn("With each swallow, Rahi's body tingles with pleasure, her nipples hardening and her pussy growing wet with desire. Your pup gets incredibly turned on while you treat her like a toilet.")

			saynn("As the last drops of piss trickle down her throat, Rahi swallows them and lets out a contented sigh.")

			saynn("[say=pc]Good girl.[/say]")

		else:
			saynn("After stuffing Rahi's throat full of your seed.. you can't help but to want to relieve yourself in some other way. Your bladder is quite full.. And your pet is right there..")

			saynn("[say=pc]I need to pee, puppy. And you have no choice but to help me with that.[/say]")

			saynn("Rahi eyes open wide as you shove your dick back inside her mouth and force the urge. As soon as a stream of warm urine hits her tongue, Rahi starts gagging and choking on the warm liquid, trying her best to swallow it down but failing. Rahi is still quite inexperienced at this and so she struggles a lot. Her eyes get all watery and her nose wrinkles as she tries to avoid gagging, but eventually she just can't hold it any longer and spews the piss out of her mouth in a messy spray with some coming out of her nose.")

			saynn("That wasn't nice on her part.. You slap your pet's cheek and punish her by forcing her to drink even more of your piss. Rahi whimpers softly as you hold her head and force her mouth open, your dick pouring the warm, salty liquid down her throat. She struggles and squirms but you hold her tightly, making sure she swallows every last drop.")

			saynn("By the time you finished, Rahi was a mess.. Her face covered in piss, her body trembling, her tail hiding between her legs. But still, you get a gaze from her.. A gaze that is a mix of fear.. and admiration..")

			saynn("[say=pc]Good girl. We will train you more later to make sure this doesn't repeat.[/say]")

		addButton("Enough", "That was dirty", "endthescene")
	if(state == "pup_grind_rahi"):
		playAnimation(StageScene.PuppySexOral, "grind", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true}})
		saynn("Rahi is so helpless and cute with all those puppy restraints.. it makes you want to use her face for your pleasure so much..")

		saynn("You crouch before your puppy and expose your {pc.pussyStretch} pussy slit before suddenly pushing it into Rahi's face. Your puppy opens her eyes wide while you rub your pussy against her mouth, already feeling her rough tongue peaking out and teasing you.")

		saynn("[say=pc]Good pet. I want your tongue.[/say]")

		saynn("As you become more aroused, so does Rahi, the scent of your arousal is overwhelming, driving Rahi wild with desire. She sticks her feline tongue out as begin grinding her face, your pussy juices flowing out and soaking her fur. The puppy underneath you can't help but to moan softly as she tastes your sweet nectar. And you can't help but to join her and moan too..")

		saynn("You reach down to grab Rahi's hair, using it as a handle to control her head movement. Your puppy eagerly submits, feeling your pussy grinding harder and harder against her face, marking her with your scent.")

		addButton("Cum", "Cum all over that pretty face", "pup_grind_cum")
	if(state == "pup_grind_cum"):
		playAnimation(StageScene.PuppySexOral, "tease", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true}})
		saynn("Your moans grow louder and more urgent, your peak of pleasure getting extremely close..")

		saynn("[say=pc]Swallow it all, slutty pup..[/say]")

		saynn("Suddenly, your body tenses up and starts shaking. You press that pup's face firmly against your pussy and feel her tongue working on your clit, overstimulating you to the point of your pussy twitching and squirting its juices all over that fur. A hot stream of your lewd transparent fluids coats Rahi's face and fills her mouth. She eagerly laps up your girlcum, savoring the taste of her owner's orgasm.")

		saynn("As you come down from your high, you're left to pant heavily. All the while Rahi is purring and licking her lips, most of her face is still slick with your juices.")

		saynn("[say=pc]Good girl.. such an obedient little pet..[/say]")

		addButton("Enough", "That was lewd", "endthescene")
		if (getModule("RahiModule").isSkillLearned("rahiSkillWatersports")):
			addButton("Piss in mouth", "(Watersports) Might as well use your pet as a piss toilet..", "pup_grind_pee")
	if(state == "pup_grind_pee"):
		playAnimation(StageScene.PuppySexOral, "grind", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		var waterLevel = getModule("RahiModule").getSkillScore("rahiSkillWatersports")
		if (waterLevel > 5):
			saynn("After squirting all over Rahi's face.. you can't help but to want to relieve yourself in some other way. Your bladder is quite full.. And your pet is right there..")

			saynn("[say=pc]I need to pee, puppy. You know what that means.[/say]")

			saynn("Without hesitation, Rahi opens her mouth wide, eager to please you in any way that she can. Seems like training your kitty to be a piss toilet has paid off. As soon as a stream of warm urine hits her tongue, she starts to eagerly swallow the gross, salty piss. You hold your pet's hair strands away from her lips while pissing directly into her mouth. She swallows as much as she can, feeling her belly fill up with this hot, yellow liquid, in addition to the seed that was already there.")

			saynn("With each swallow, Rahi's body tingles with pleasure, her nipples hardening and her pussy growing wet with desire. Your pup gets incredibly turned on while you treat her like a toilet.")

			saynn("As the last drops of piss trickle down her throat, Rahi swallows them and lets out a contented sigh.")

			saynn("[say=pc]Good girl.[/say]")

		else:
			saynn("After squirting all over Rahi's face.. you can't help but to want to relieve yourself in some other way. Your bladder is quite full.. And your pet is right there..")

			saynn("[say=pc]I need to pee, puppy. And you have no choice but to help me with that.[/say]")

			saynn("Rahi eyes open wide as you position your pussy above her mouth and force the urge to come. As soon as a stream of warm urine hits her tongue, Rahi starts gagging and choking on the warm liquid, trying her best to swallow it down but failing. Rahi is still quite inexperienced at this and so she struggles a lot. Her eyes get all watery and her nose wrinkles as she tries to avoid gagging, but eventually she just can't hold it any longer and spews the piss out of her mouth in a messy spray with some coming out of her nose.")

			saynn("That wasn't nice on her part.. You slap your pet's cheek and punish her by forcing her to drink even more of your piss. Rahi whimpers softly as you hold her head and force her mouth open, your pussy pouring the warm, salty liquid down her throat. She struggles and squirms but you hold her tightly, making sure she swallows every last drop.")

			saynn("By the time you finished, Rahi was a mess.. Her face covered in piss, her body trembling, her tail hiding between her legs. But still, you get a gaze from her.. A gaze that is a mix of fear.. and admiration..")

			saynn("[say=pc]Good girl. We will train you more later to make sure this doesn't repeat.[/say]")

		addButton("Enough", "That was dirty", "endthescene")
func succChance(chanceMin = 40.0, chanceMax = 80.0, maxLevel = 15, minLevel = 0):
	var petLevel = getModule("RahiModule").getSkillScore("rahiSkillPetplay")
	var levelProg = clamp(float(petLevel - minLevel) / (maxLevel - minLevel), 0.0, 1.0)
	var finalChance = chanceMin + (chanceMax - chanceMin) * levelProg
	return finalChance 

func checkSucc(chanceMin = 40.0, chanceMax = 80.0, maxLevel = 15, minLevel = 0):
	if(RNG.chance(succChance(chanceMin, chanceMax, maxLevel, minLevel))):
		success = true
		getModule("RahiModule").advanceSkill("rahiSkillPetplay")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "start_simple"):
		processTime(20*60)

	if(_action == "puppy_training"):
		processTime(10*60)
		getModule("RahiModule").advanceSkill("rahiSkillPetplay")

	if(_action == "start_walkies"):
		getModule("RahiModule").advanceSkill("rahiSkillPetplay")
		runScene("rahiActivityPetplayWalkiesScene")
		endScene()
		return

	if(_action == "cancelactivity"):
		increaseFlag("RahiModule.rahiTired", -1)
		endScene()
		return

	if(_action == "pet1_sit"):
		checkSucc(80.0, 90.0, 5)

	if(_action == "pet1_speak"):
		checkSucc(50.0, 120.0, 4)

	if(_action == "pet1_rollover"):
		checkSucc(30.0, 80.0, 3)

	if(_action == "pet1_beg"):
		checkSucc(20.0, 90.0, 5)

	if(_action == "pet1_heel"):
		checkSucc(10.0, 100.0, 5)

	if(_action == "pet1_reward_check"):
		if(success):
			setState("pet1_reward")
		else:
			setState("pet1_punish")
		return

	if(_action == "reward1_cuddle"):
		processTime(10*60)

	if(_action == "punish1_spank"):
		getModule("RahiModule").advanceSkill("rahiSkillMasochist")

	if(_action == "pup_cell"):
		processTime(30*60)

	if(_action == "pup_fetch"):
		processTime(20*60)

	if(_action == "pup_breed_rahi"):
		getModule("RahiModule").advanceSkill("rahiSkillSex")

	if(_action == "pup_strapon_rahi"):
		getModule("RahiModule").advanceSkill("rahiSkillSex")
		var straponTypes = ["Strapon", "StraponCanine", "StraponDragon", "StraponFeeldoe", "StraponFeline"]
		var strapon = GlobalRegistry.createItem(RNG.pick(straponTypes))
		var fluids = strapon.getFluids()
		fluids.addFluid("CumLube", RNG.randi_range(3, 5)*100.0)
		GM.pc.getInventory().equipItem(strapon)

	if(_action == "pup_facefuck_rahi"):
		getModule("RahiModule").advanceSkill("rahiSkillSex")

	if(_action == "pup_grind_rahi"):
		getModule("RahiModule").advanceSkill("rahiSkillSex")

	if(_action == "pup_fingerball"):
		processTime(5*60)
		getModule("RahiModule").advanceSkill("rahiSkillSex")

	if(_action == "pup_breed_fuck"):
		processTime(6*60)

	if(_action == "pup_breed_faster"):
		processTime(3*60)

	if(_action == "pup_breed_cum"):
		processTime(3*60)
		getCharacter("rahi").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("rahi")
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "rahi_breed")

	if(_action == "pup_strapon_fuck"):
		processTime(6*60)

	if(_action == "pup_strapon_faster"):
		processTime(3*60)

	if(_action == "pup_strapon_cum"):
		processTime(3*60)
		getCharacter("rahi").cummedInVaginaBy("pc", FluidSource.Strapon)
		GM.pc.orgasmFrom("rahi")
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "rahi_breed")

	if(_action == "removestraponandend"):
		GM.pc.getInventory().clearSlot(InventorySlot.Strapon)
		endScene()
		return

	if(_action == "pup_facefuck_do"):
		processTime(3*60)

	if(_action == "pup_facefuck_cum"):
		processTime(5*60)
		getCharacter("rahi").cummedInMouthBy("pc")
		GM.pc.orgasmFrom("rahi")
		GM.pc.addSkillExperience(Skill.SexSlave, 20, "rahi_facefuck")

	if(_action == "pup_facefuck_pee"):
		processTime(5*60)
		getCharacter("rahi").cummedInMouthBy("pc", FluidSource.Pissing)
		getModule("RahiModule").advanceSkill("rahiSkillWatersports")

	if(_action == "pup_grind_cum"):
		processTime(5*60)
		getCharacter("rahi").cummedInMouthBy("pc", FluidSource.Vagina)
		GM.pc.orgasmFrom("rahi")
		GM.pc.addSkillExperience(Skill.SexSlave, 20, "rahi_grind")

	if(_action == "pup_grind_pee"):
		processTime(5*60)
		getCharacter("rahi").cummedInMouthBy("pc", FluidSource.Pissing)
		getModule("RahiModule").advanceSkill("rahiSkillWatersports")

	setState(_action)

func saveData():
	var data = .saveData()

	data["success"] = success

	return data

func loadData(data):
	.loadData(data)

	success = SAVE.loadVar(data, "success", 0)
