extends SceneBase

var deserved = true

func _init():
	sceneID = "rahiPunishmentForcedPetplayScene"

func _initScene(_args = []):
	if(_args.size() > 0):
		deserved = _args[0]

func _reactInit():
	processTime(5*60)
	getModule("RahiModule").advanceSkill("rahiSkillPetplay")
	#getCharacter("rahi").getInventory().equipItem(GlobalRegistry.createItem("ZiptiesWrist"))
	#getCharacter("rahi").getInventory().equipItem(GlobalRegistry.createItem("ZiptiesAnkle"))

func _run():
	if(state == ""):
		addCharacter("rahi")
		playAnimation(StageScene.SexStart, "start", {npc="rahi", npcBodyState={naked=true}})
		saynn("Rahi's body tenses up when you suddenly produce a leash and a few restraints before approaching her. She can tell that you have no good intentions.")

		if (deserved):
			saynn("[say=pc]Undress, pet.[/say]")

			saynn("Rahi nods, clearly feeling guilty for a failed task.")

			saynn("[say=rahi]Of course, {rahiMaster}..[/say]")

			saynn("Rahi drops her shirt and steps out of her shorts, exposing naked self to you. Her heart is clearly racing as she is completely at your mercy.")

		else:
			saynn("[say=pc]Undress, pet.[/say]")

			saynn("Rahi tilts her head, looking confused at your firm voice.")

			saynn("[say=rahi]Did she do something wrong, {rahiMaster}..[/say]")

			saynn("She is not eager to obey so you forcefully unbutton her shirt before tugging it off, barely avoiding ripping it to shreds. She huffs but tugs down her shorts herself, presenting a naked self to you.")

		saynn("She will need some more things on her if you want this to be a good lesson. And more things is exactly what you're holding.")

		addButton("Tie her up", "Make Rahi into a bondage pet", "tie_rahi")
	if(state == "tie_rahi"):
		playAnimation(StageScene.PuppyDuo, "stand", {npc="rahi", npcBodyState={naked=true}})
		saynn("You start simple, shoving a metal ring into Rahi's mouth that forces her mouth wide open and makes her drool. Without a word, you fastened the rest of the head harness tightly around your kitty's head.")

		if (deserved):
			saynn("[say=rahi]She is sorry, {rahiMaster}..[/say]")

		else:
			saynn("[say=rahi]She is sorry for anything wrong that she did, {rahiMaster}..[/say]")

		saynn("[say=pc]That's not how pets talk.[/say]")

		saynn("Then you produce a tight leather corset that you put on Rahi and tighten it behind her back, making her curves look even more elegant. At the expense of making breathing for her harder of course.")

		saynn("Then you grab some.. puppy restraints.. just a bunch of special leather arm and leg restraints that force your limbs into one specific pose. You put the arm ones on Rahi first, causing her paws to touch her shoulders.")

		saynn("[say=rahi]Meeeow..[/say]")

		saynn("[say=pc]Get down, silly pup.[/say]")

		saynn("She lowers her head and slowly gets on all fours. Well, not quite all fours. You put the leg restraints on her too, forcing your kitty to stand on her elbows and knees.")

		saynn("And since this is a punishment.. you finish off by blindfolding Rahi, stealing her main sense and disorienting her.")

		saynn("[say=pc]Now.. Let's go for a walk.[/say]")

		saynn("You clip the leash to Rahi's collar and begin guiding her out of the cell. Each time she tries to resist, a few tugs is enough to make her comply.")

		addButton("Walkies", "See what happens next", "walkies")
	if(state == "walkies"):
		playAnimation(StageScene.PuppyDuo, "stand", {npc="rahi", npcAction="walk", npcBodyState={naked=true}})
		saynn("As you lead Rahi out of her cell, she keeps stumbling and bumping into the walls already, all restraints make her so vulnerable. She has to rely on your leash now. At least she doesn't see all the other inmates staring at her. But Rahi can guess, her body is shivering with a mixture of fear.. and arousal.")

		saynn("You tug on the leash, pulling her closer, as you begin walking around the general pop block.")

		saynn("[say=pc]You need to learn to be a good kitty. But being a good puppy is fine too.[/say]")

		saynn("Rahi is still mostly naked, except for the restraints and the corset. All her privates are out on display and catching the refreshing cold air. It seems your kitty is being quite submissive despite being so vulnerable.")

		saynn("You lead Rahi out into a large open area with a bunch of chairs and a tv that spews out some AlphaCorp propaganda all day. A few of these chairs are occupied and Rahi can feel that.. a wave of humiliation washes over her as the inmates comment on your leashed pet, calling her a cutie.")

		saynn("This seems to be a good spot to display your kitty.")

		addButton("Rest", "Just spend some time with Rahi", "spend_time")
	if(state == "spend_time"):
		playAnimation(StageScene.PuppyDuo, "sit", {npc="rahi", npcAction="sad", npcBodyState={naked=true}})
		saynn("You tie the leash to one of the chairs and take a seat.")

		saynn("[say=pc]Down, puppy.[/say]")

		saynn("Rahi blushes deeply, everyone else has just heard you calling your kitty a different name. But she obeys, awkwardly lowering herself down to the floor. She can feel the cold floor against her fur. You put your hand on her back and idly stroke it while inmates continue to show lots of interest in your pet. All the while the blindfolded Rahi is just drooling..")

		saynn("[say=pc]So cute and helpless.[/say]")

		saynn("One of the inmates approaches you and your pet, wondering if he can give Rahi some pets.")

		addButton("Sure", "Let them pet Rahi", "rahi_gets_pet")
		addButton("Nah", "Only you can pet Rahi", "you_pet_rahi")
	if(state == "you_pet_rahi"):
		playAnimation(StageScene.PuppyDuo, "stand", {npc="rahi", npcAction="walk", npcBodyState={naked=true}})
		saynn("You decline their offer and just pet Rahi yourself, making your kitty purr. Her butt is sticked up while her tail wags and baps your chair eagerly like a dog's tail would. It's still a very embarrassing experience for her but at least she got some headpats out of it.")

		saynn("[say=pc]You got your lesson, puppy?[/say]")

		saynn("[say=rahi]W-wuff.. huff.. ruff..[/say]")

		saynn("You chuckle and grab the leash, proceeding to lead Rahi back towards her cell. Poor blind puppy still keeps bumping into things.")

		addButton("Continue", "See what happens next", "end_punish")
	if(state == "rahi_gets_pet"):
		playAnimation(StageScene.PuppyDuo, "sit", {npc="rahi", npcAction="sit", npcBodyState={naked=true}})
		saynn("You give him a nod of approval. The inmate reaches his hand out and gently pets Rahi on the head before stroking her hair a bit. Your kitty shivers a bit when some unknown person touches her at first but then calms down, allowing herself to be pet. It's not like she has any choice..")

		saynn("[say=pc]Sit, puppy.[/say]")

		saynn("Rahi awkwardly gets on her elbows and knees again before lowering her lower part of the body and sitting down on her butt. Having these puppy restraints makes every action that much harder.. But at least the reward is worth it, receiving more pets from the inmate makes Rahi purr and drool more actively.")

		saynn("Other inmates begin gathering around Rahi, all of them eager to have a turn at petting the submissive little kitty. Some of them pet her while others give her scritches and stroke her hair.")

		saynn("The inmates want to go further and give Rahi some bellyrubs. You get a feeling that it might go further than just some rubs on her belly.")

		addButton("Allow it", "Let them play with Rahi some more", "rahi_gets_bellyrubs")
		addButton("Nah", "That's enough pets and rubs for one punishment", "no_bellyrubs")
	if(state == "no_bellyrubs"):
		playAnimation(StageScene.PuppyDuo, "stand", {npc="rahi", npcAction="walk", npcBodyState={naked=true}})
		saynn("You tell inmates that they gave your puppy enough pets. Luckily, since most of them are wearing orange colors, they're mostly harmless, allowing you to grab your pet's leash and head back towards her cell.")

		saynn("Rahi purrs quietly until she bumps into some wall again. Ow. Poor blind puppy is still quite clumsy.")

		saynn("[say=pc]You got your lesson, puppy?[/say]")

		saynn("[say=rahi]W-wuff.. huff.. ruff..[/say]")

		saynn("That seems good enough for you.")

		addButton("Continue", "See what happens next", "end_punish")
	if(state == "rahi_gets_bellyrubs"):
		playAnimation(StageScene.PuppyDuo, "sit", {npc="rahi", npcAction="back", npcBodyState={naked=true}})
		saynn("You decide to allow them all to play with Rahi.")

		saynn("[say=pc]Present your belly, puppy.[/say]")

		saynn("Rahi hesitates a bit but she does lay on her back, presenting her corset and exposed crotch and breasts. Immediately the inmates prove to Rahi that she had nothing to worry about by rubbing her belly in slow, gentle circles. As you join and give her belly some rubs of your own, your puppy lets out a soft purr of pleasure.")

		saynn("Feeling bolder, one of the inmates then moved his hand lower, stroking Rahi's pussy and rubbing her clit with his fingers until she was squirming on the ground, lost in a haze of pleasure. Someone else reaches up to fondle her breasts, pinching her nipples until they get all stiff and perky. Rahi produces muffled moans as she is being played with, her body responding to the many touches.")

		saynn("As the inmates bring Rahi to the brink of her orgasm, you decide to intervene and stop everyone.")

		saynn("[say=pc]No. The pet doesn't cum today.[/say]")

		saynn("Rahi is mewling and huffing on the floor, her needy pussy dripping juices, creating a little puddle. And there is nothing she can do with her binds on, she can only desperately squirm around while her body slowly cools down.")

		saynn("After that, the crowd began to disperse, leaving you and Rahi alone.")

		saynn("[say=pc]You got your lesson, puppy?[/say]")

		saynn("[say=rahi]W-wuff.. huff.. ruff..[/say]")

		saynn("She nods slowly, still huffing and drooling.")

		saynn("[say=pc]Well. Let's go back then.[/say]")

		addButton("Continue", "See what happens next", "after_bellyrubs")
	if(state == "after_bellyrubs"):
		playAnimation(StageScene.PuppyDuo, "stand", {npc="rahi", npcAction="walk", npcBodyState={naked=true}})
		saynn("You tug on the leash, helping kitty to get back on her paws. She does manage to do that eventually and proceeds to walk behind you, holding her chin low.")

		saynn("After you return back to Rahi's cell, you begin undoing the binds..")

		addButton("Continue", "See what happens next", "end_punish")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "tie_rahi"):
		processTime(5*60)
		getCharacter("rahi").getInventory().forceEquipStoreOther(GlobalRegistry.createItem("blindfold"))
		getCharacter("rahi").getInventory().forceEquipStoreOther(GlobalRegistry.createItem("ringgag"))
		getCharacter("rahi").getInventory().forceEquipStoreOther(GlobalRegistry.createItem("PuppyCorset"))

	if(_action == "walkies"):
		processTime(10*60)

	if(_action == "spend_time"):
		processTime(30*60)

	if(_action == "end_punish"):
		getCharacter("rahi").resetEquipment()
		endScene()
		return

	if(_action == "rahi_gets_bellyrubs"):
		processTime(10*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["deserved"] = deserved

	return data

func loadData(data):
	.loadData(data)

	deserved = SAVE.loadVar(data, "deserved", true)
