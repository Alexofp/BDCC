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

		addButton("Sit", "Make Rahi sit on her butt", "pet1_sit")
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
	if(state == "pet1_reward"):
		saynn("How do you wanna reward your kitty?")

		addButton("Pat", "Just a simple pat will do", "reward1_pat")
		addButton("Cuddle", "Why not cuddle with your kitty", "reward1_cuddle")
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
	if(state == "pet1_punish"):
		saynn("How do you wanna punish your kitty?")

		addButton("Forgive her", "You don't wanna be harsh on your kitty", "punish1_forgive")
		addButton("Scold Rahi", "Tell Rahi that she is a bad kitty", "punish1_scold")
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
func checkSucc(chanceMin = 40.0, chanceMax = 80.0, maxLevel = 15, minLevel = 0):
	var petLevel = getModule("RahiModule").getSkillScore("rahiSkillPetplay")
	var levelProg = clamp(float(petLevel - minLevel) / maxLevel, 0.0, 1.0)
	var finalChance = chanceMin + (chanceMax - chanceMin) * levelProg
	if(RNG.chance(finalChance)):
		success = true


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "start_simple"):
		processTime(20*60)
		getModule("RahiModule").advanceSkill("rahiSkillPetplay")

	if(_action == "cancelactivity"):
		increaseFlag("RahiModule.rahiTired", -1)
		endScene()
		return

	if(_action == "pet1_sit"):
		checkSucc(50.0, 90.0)

	if(_action == "pet1_reward_check"):
		if(success):
			setState("pet1_reward")
		else:
			setState("pet1_punish")
		return

	if(_action == "reward1_cuddle"):
		processTime(10*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["success"] = success

	return data

func loadData(data):
	.loadData(data)

	success = SAVE.loadVar(data, "success", 0)
