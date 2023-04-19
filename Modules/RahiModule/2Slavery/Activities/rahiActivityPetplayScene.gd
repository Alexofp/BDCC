extends SceneBase

var success = 0

func _init():
	sceneID = "rahiActivityPetplayScene"

func _run():
	if(state == ""):
		addCharacter("rahi")
		saynn("How do you wanna train your pet?")

		#var petLevel = getModule("RahiModule").getSkillScore("rahiSkillPetplay")
		addButton("Kitty training", "A simple training session for Rahi", "start_simple")
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

	setState(_action)

func saveData():
	var data = .saveData()

	data["success"] = success

	return data

func loadData(data):
	.loadData(data)

	success = SAVE.loadVar(data, "success", 0)
