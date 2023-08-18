extends SceneBase

var isCorrupt = false
var isPure = false
var isNormal = false
var isVirgin = false
var petSkill = 0

func _init():
	sceneID = "Ch6TaviPetplaySkillScene"

func _run():
	if(state == ""):
		addCharacter("tavi")
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("You tell Tavi that you want to train her to be a better pet. Because.. It will be very useful in the future. Totally.")

		saynn("Tavi tilts her head slightly. It seems it will be quite a challenge.")

		isCorrupt = getModule("TaviModule").isCorrupt()
		isPure = getModule("TaviModule").isPure()
		isNormal = (!isCorrupt && !isPure)
		isVirgin = getModule("TaviModule").isVirgin()
		petSkill = getModule("TaviModule").getSkillScore("taviSkillPetplay")
		addButton("Lesson 1", "Introduce Tavi to the idea of petplay", "intro")
		if (petSkill > 0):
			addButton("Lesson 2", "Give Tavi a lesson again pride", "lesson2")
		if (petSkill > 1):
			addButton("Lesson 3", "See if Tavi learned anything", "lesson3")
		addButton("Cancel", "You changed your mind", "cancel_lesson")
	if(state == "intro"):
		saynn("You call Tavi and tell her to stand in the middle of the cell.")

		saynn("[say=tavi]What's up?[/say]")

		saynn("[say=pc]I'd like to try something new with you. Petplay.[/say]")

		saynn("A moment of silence. She raises a brow, her voice low.")

		saynn("[say=tavi]Petplay? Gonna make me bark?[/say]")

		saynn("Her face reflects a blend of skepticism.. and curiosity. Her posture is somewhat dominant, her arms crossed. Since her heat is satisfied, she is not as eager to obey as usual.")

		saynn("[say=pc]You don't like that, pet?[/say]")

		saynn("Being called like that makes her lower her gaze for a second.")

		saynn("[say=tavi]I'm not a dog..[/say]")

		saynn("[say=pc]So if I order you to bark, what will you do?[/say]")

		saynn("Tavi thinks about it. And then shrugs.")

		saynn("[say=pc]Bark for me, Tavi.[/say]")

		saynn("She squints and hesitates, struggling to get over her pride. Maybe she needs some.. incentive?")

		addButton("Offer pats", "Tell Tavi that you will give her some pats if she barks", "intro_offerpats")
		addButton("Threats", "Intimidate Tavi until she submits", "intro_force")
	if(state == "intro_offerpats"):
		saynn("You reach your hand out and make it hover just above Tavi's head. A bit confusing for the grumpy feline.")

		saynn("[say=pc]Want some pats?[/say]")

		saynn("Tavi shrugs and nods, her cheeks blushing softly.")

		saynn("[say=pc]Then bark. Just once. And you will get all of the pats.[/say]")

		saynn("Tavi establishes eye contact with you. Her gaze is basically drilling you, trying to make you lower that hand.")

		saynn("[say=tavi]I'm not a puppy.[/say]")

		saynn("You sigh and pat the air above Tavi.")

		saynn("[say=pc]You're not. You're Tavi. But I'm asking you to pretend to be a puppy.[/say]")

		saynn("The feline hesitates for a moment. Her usual smirk is nowhere to be seen.")

		saynn("[say=pc]Bark, bark. Not hard, see?[/say]")

		saynn("Even though your noises were kinda funny, Tavi is still completely serious. Only her cheeks blush slightly more.")

		saynn("[say=pc]Well. No pats for you I'm afraid.[/say]")

		saynn("As you start pulling your hand away from her, Tavi frowns, her chin shaking a little.")

		saynn("[say=tavi]Wait..[/say]")

		saynn("That is a good sign. You stop and wait patiently while Tavi tries to gather her thoughts together.")

		saynn("[say=tavi]Actually, never mind.[/say]")

		saynn("Aw. You can tell that there is something here. Tavi didn't outright say no. She just doesn't want to say yes.. willingly? Maybe you need to help her with her pride.")

		saynn("At least you planted a seed in her mind.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "intro_force"):
		saynn("You cross your arms as well, mirroring Tavi's pose.")

		saynn("[say=pc]Fine.[/say]")

		saynn("Such a short answer makes Tavi.. curious. She is shaking slightly until finally giving up.")

		saynn("[say=tavi]What do you mean?..[/say]")

		saynn("[say=pc]I will just order you next time you're in heat. You're way more likely to do it when your orgasm is on the line.[/say]")

		saynn("A mix of emotions travels through Tavi's body. She squints and parts her lips ever so slightly, exposing her fangs.")

		saynn("[say=tavi]You wouldn't..[/say]")

		saynn("You smile and show off your own teeth, your arms spread slightly to make you appear bigger.")

		saynn("[say=pc]Try me, pet. Or just.. bark once. Like a good puppy.[/say]")

		saynn("She is hesitating hard. Her cheeks are blushing brightly. Her lips tremble as she tries to make a sound.")

		saynn("[say=tavi]..make me.[/say]")

		saynn("But she doesn't commit and instead locks up again. Her posture is still stiff. That's the best she is gonna give you. Seems her pride is preventing her from humiliating herself. Maybe you indeed just have to.. make her.")

		saynn("At least you planted a seed in her mind.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "lesson2"):
		saynn("Time for a second lesson. A great idea came into your mind about how you can fight Tavi's pride so you came prepared. You invite Tavi to the middle of her cell.")

		saynn("[say=pc]Wanna bark for me? It's your last chance.[/say]")

		saynn("Tavi tilts her head, her tail wags annoyed. She instantly slips back into her prideful mindset.")

		saynn("[say=tavi]Or what? You will walk away again?..[/say]")

		saynn("Well, you did give her a chance.")

		addButton("Muzzle Tavi", "Force a muzzle on Tavi's head", "les2_muzzle_tavi")
	if(state == "les2_muzzle_tavi"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="struggle_gag"})
		saynn("You walk up to Tavi.. and begin circling her.. just like she likes to do. The feline instantly realizes that something is gonna happen.")

		saynn("[say=tavi]I'm not a dog or a puppy..[/say]")

		saynn("And she was right. As soon as you end up behind her, you yank on her hair to stun her, giving you enough time to put a muzzle on her face and secure it tightly.")

		saynn("[say=tavi]Argh!.. H-hey![/say]")

		saynn("[say=pc]What about now?[/say]")

		saynn("[say=tavi]Grr-r-r..[/say]")

		saynn("Tavi growls but then blushes realizing how she looks. Her paws reach for her muzzle and try to pull it off.")

		saynn("[say=tavi]I'm not..[/say]")

		saynn("It seems she wants more. And since she is busy with the restraint, you can strike again freely.")

		addButton("Bitchsuit", "Force puppy restraints on Tavi", "les2_bitchsuit")
	if(state == "les2_bitchsuit"):
		playAnimation(StageScene.PuppyDuo, "stand", {npc="tavi"})
		saynn("You produce some other things that you prepared. And while Tavi is busy, you suddenly grab one of her arms and force a leather restraint on it that forces her forearm to be touching her shoulder.")

		saynn("[say=tavi]H-hey!..[/say]")

		saynn("You do the same to her other arm and then bring her down, forcefully pinning the feline against the floor while you put similar restraints on her legs, forcing her feet to be touching her butt.")

		saynn("Tavi didn't want to bark.. so now she is forced to stand on all fours. When you finally let go of her, she starts trying to thrash against her new bitchsuit.. but no matter what, the leather sits too tight, constraining her motions hard.")

		saynn("[say=tavi]What is this..[/say]")

		saynn("[say=pc]Consequences.[/say]")

		saynn("Tavi huffs and awkwardly crawls to her bed, trying to make the restraints slip off against the metal frame. Nope, Tavi is helpless.. And she knows it.")

		saynn("[say=tavi]I will bark, okay? If you let me out.. of these..[/say]")

		saynn("Nah, that would be way too easy. Now you want more.")

		saynn("[say=pc]Nu-uh. That ship has warped.[/say]")

		saynn("Tavi squints and looks up at you. But from your spot, she looks kinda cute.")

		saynn("[say=pc]We will see how quickly you can pick up tricks. Then I will think about freeing you. Let's start with 'give paw'.[/say]")

		saynn("Tavi's gaze tries to drill yours yet again. But right now you have full control over her. She decides to shake her head anyway.")

		saynn("[say=tavi]I'm not a puppy..[/say]")

		saynn("Looks like she won't do it. You crouch before her and grab her by the muzzle. Tavi's ears droop, her tail stops wagging.")

		saynn("[say=pc]Are you sure? Because I swear that you look like one right now.[/say]")

		saynn("Tavi boops your leg with her elbow.. which is her new paw.")

		saynn("[say=pc]You think I'm lying? Let's go ask others~.[/say]")

		saynn("You produce a leash and clip it to Tavi's collar. She realizes what you want to do with her and tries to resist, pulling back on the leash. She is a tall kitty.. but luckily.. not that strong.")

		saynn("[say=pc]What~? You wanted to be let out, didn't you?[/say]")

		saynn("Tavi huffs.")

		addButton("Walkies", "Take Tavi out on walkies", "les2_walkies")
	if(state == "les2_walkies"):
		aimCameraAndSetLocName("cellblock_nearcells")
		playAnimation(StageScene.PuppyDuo, "stand", {npc="tavi", npcAction="sad"})
		saynn("Tavi tags on the leash, unwilling to go out like this. But the collar keeps putting more and more pressure on her neck until she finally succumbs to it and crawls out into the cellblock.")

		saynn("Lots of reds around. Obviously you and your pet get some curious gazes, some are giggling even, causing Tavi's cheeks to flush. She lowers herself, trying to keep a lowest possible profile.. but her green spots glow in the dark, giving her away.")

		saynn("[say=tavi]Everyone is watching.. That's enough..[/say]")

		saynn("[say=pc]Nah, we're not in the park yet.[/say]")

		saynn("[say=tavi]That's very far..[/say]")

		saynn("You nod and offer her a smile. Tavi isn't happy about it. But being exposed to your fears is one of the best ways to overcome them.")

		addButton("Yard", "Go visit the yard area", "les2_yard")
	if(state == "les2_yard"):
		aimCameraAndSetLocName("yard_northCorridor")
		playAnimation(StageScene.PuppyDuo, "stand", {npc="tavi", npcAction="walk"})
		saynn("Tavi holds her chin low as you walk through the prison's corridors. Any inmate's gaze makes her hide inside herself even more. Even you begin to question if this was a good idea.")

		saynn("Eventually you reach the big open area that's divided into lots of little pathways with tall trimmed bushes, the green yard.")

		saynn("[say=pc]Look, isn't the air nice here?[/say]")

		saynn("Tavi looks around and nods subtly, her tail is still motionless, her ears glued to her head. She just follows you around while you hold the leash.")

		saynn("Suddenly, a voice.")

		saynn("[say=nova]Ooh~. What an adorable puppy![/say]")

		addButton("Voice?", "See who it is", "les2_nova")
	if(state == "les2_nova"):
		addCharacter("nova")
		playAnimation(StageScene.PuppySexOral, "tease", {pc="nova", npc="tavi"})
		saynn("You turn around and see.. Nova. She doesn't seem to be hostile."+str(" Even though you did a lot of bad things to her.. She is mostly focussed on Tavi though." if getFlag("TaviModule.Ch5BlackmailedNova") else "")+"")

		saynn("The husky approaches you and crouches before your pet, her paws begin giving Tavi scritches and headpats.")

		saynn("[say=nova]You've been naughty lately, weren't you~. But you're still such a cutie. How can I be mad at you?[/say]")

		saynn("Tavi doesn't know how to react. She wants to stay quiet but her senses are being overstimulated, resulting in her making various cute feline noises.")

		saynn("[say=tavi]Hu.. huff.. a.. h.. meo.. w..[/say]")

		saynn("[say=nova]Yes-s~. I wasn't able to train you into a proper puppy but maybe this inmate will succeed.[/say]")

		saynn("Tavi shakes her head and receives more pats and scritches. Her cheeks are blushing bright green.")

		saynn("[say=nova]You're enjoying it~. You just don't wanna admit it. What a silly puppy, denying the fun.[/say]")

		saynn("Nova looks up at you.")

		saynn("[say=nova]C'mon. Let's pet her together~.[/say]")

		addButton("Pat Tavi", "Praise the puppy", "les2_praise")
	if(state == "les2_praise"):
		playAnimation(StageScene.PuppySexOral, "tease", {pc="pc", npc="tavi"})
		saynn("You join in on the fun and begin patting Tavi into submission together. Double trouble.")

		saynn("Tavi can only endure it for so long before she starts squirming actively. Nova stops patting the girl and instead gives her some bellyrubs, making Tavi arch her back. Loud purring finally starts escaping from her.")

		saynn("[say=nova]Good girl~. Listen to your owner and everything will be alright.[/say]")

		saynn("Nova gets up and pats you on the shoulder before whispering something into your ear.")

		saynn("[say=nova]You're doing great~.[/say]")

		saynn("Huh. And just like that, she returns on her patrol. Seems like she wanted to give a boost of confidence.. to both of you.")

		saynn("Tavi blinks often while looking up at you.")

		saynn("[say=pc]Wanna say something, puppy?[/say]")

		saynn("The feline opens her mouth.. but doesn't say anything. Aw. She shakes her head.")

		saynn("Well, it was worth a try. When you get up and turn away, you hear something.")

		saynn("[say=tavi]..w-..f..[/say]")

		saynn("Huh? You look at Tavi again.")

		saynn("[say=pc]You said something?[/say]")

		saynn("Tavi doesn't respond and blinks many times again. Oh well.")

		saynn("You hold Tavi's leash firmly while returning back to her cell. At least you got to experience the fresh air.")

		addButton("Continue", "See what happens next", "endthescene_resetequip")
	if(state == "lesson3"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="allfours"})
		saynn("Well. Time for another lesson in petplay. Tavi is probably won't be eager again so you go ahead and grab some restraints.")

		saynn("But, when you turn around, you notice Tavi crawling on all fours to you..")

		saynn("[say=tavi]Woof..[/say]")

		saynn("She stops by you and nuzzles your legs softly.")

		saynn("[say=pc]Oh wow. What a good girl.[/say]")

		saynn("Tavi purrs again while you pat her between the ears. You put the restraints away for now. Seems she doesn't need them. You grab a leash though.")

		saynn("[say=pc]Hm. Here is a question for you. Do pets usually wear clothes?[/say]")

		saynn("Tavi looks at herself.. and then shakes her head.")

		saynn("[say=pc]Let's fix that?[/say]")

		saynn("The feline hesitates for a second while watching the exit.")

		saynn("[say=tavi]Woof..[/say]")

		saynn("Maybe you can go easy on her and not pull her out today.")

		addButton("Undress her", "Make Tavi look more like a proper pet", "les3_undress")
	if(state == "les3_undress"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="allfours", npcBodyState={naked=true}})
		saynn("You begin unbuttoning her shirt and pulling it off. Tavi doesn't seem to resist, helping you even by pulling her paws out of the sleeves. Then you pull down her shorts, exposing all of Tavi's private bits: her {tavi.breasts}, cute "+str("virgin " if getModule("TaviModule").isVirgin() else "")+"pussy and a tight-looking asshole.")

		saynn("You walk around her, admiring your pet from all angles.")

		saynn("[say=pc]Who is a good girl?[/say]")

		saynn("[say=tavi]Woof..[/say]")

		saynn("[say=pc]Yes, you are.[/say]")

		saynn("You give her a pat, making her ears go flat again.")

		saynn("As you present her the item in your hand, Tavi presents you her collar, allowing you to leash her.")

		saynn("[say=pc]Let's just walk around the cell.[/say]")

		saynn("You could force her out again but that didn't work so well last time. Better to be safe and start slow.")

		addButton("Walkies", "Do some walkies around Tavi's cell", "les3_walkies")
	if(state == "les3_walkies"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="crawl", npcBodyState={naked=true}})
		saynn("You begin doing laps around Tavi's cell, following the walls while holding the leash. Tavi crawls by your side. She is quiet but you can notice her swaying her backside quite a bit.")

		saynn("[say=pc]Very good. Aren't you a good puppy?[/say]")

		saynn("Tavi's tail twitches after you say that.")

		saynn("[say=pc]Who's a good puppy?[/say]")

		saynn("Her tail twitches more and more.")

		saynn("[say=tavi]Woof.[/say]")

		saynn("[say=pc]Yes, you are.[/say]")

		saynn("That tail can't keep still and starts wagging while Tavi crawls by your side.")

		saynn("After a few laps, she starts whining softly at you.")

		saynn("[say=pc]What's the problem?[/say]")

		saynn("Tavi doesn't know how to show it to you. So she flops onto the floor and flips onto her back, showing you her forearms and knees that are now glowing green near the irritated areas. Seems like it's enough crawling for now.")

		saynn("[say=pc]You did well, pup.[/say]")

		saynn("You give her some belly rubs, causing Tavi to start purring and wiggling around. You also notice her fur near the crotch getting all wet.")

		saynn("[say=pc]You can stop pretending, Tavi.[/say]")

		saynn("She looks up at you and blinks-blinks.")

		saynn("[say=tavi]Oh.. okay. Thank you..[/say]")

		saynn("Such a cutie. Maybe you have to use the puppy restraints, they seem to have padding that helps against bruises and irritation.")

		saynn("But you feel like you made a lot of progress either way.")

		addButton("Continue", "See what happens next", "endthescene")
func taviSpeak(normalSpeak, corruptSpeak, pureSpeak):
	if(isCorrupt):
		return corruptSpeak
	if(isPure):
		return pureSpeak
	return normalSpeak


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "intro"):
		processTime(5*60)
		getModule("TaviModule").advanceSkill("taviSkillPetplay")

	if(_action == "lesson2"):
		getModule("TaviModule").advanceSkill("taviSkillPetplay")

	if(_action == "lesson3"):
		getModule("TaviModule").advanceSkill("taviSkillPetplay")

	if(_action == "cancel_lesson"):
		increaseFlag("TaviModule.Ch6Tiredness", -1)
		endScene()
		return

	if(_action == "les2_muzzle_tavi"):
		processTime(10*60)
		getCharacter("tavi").getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("basketmuzzle"))

	if(_action == "les2_bitchsuit"):
		processTime(3*60)

	if(_action == "les2_walkies"):
		processTime(2*60)

	if(_action == "les2_yard"):
		processTime(5*60)

	if(_action == "les2_nova"):
		processTime(2*60)

	if(_action == "les2_praise"):
		processTime(2*60)

	if(_action == "endthescene_resetequip"):
		getCharacter("tavi").resetEquipment()
		endScene()
		return

	if(_action == "les3_undress"):
		processTime(3*60)

	if(_action == "les3_walkies"):
		processTime(10*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["isCorrupt"] = isCorrupt
	data["isPure"] = isPure
	data["isNormal"] = isNormal
	data["isVirgin"] = isVirgin
	data["petSkill"] = petSkill

	return data

func loadData(data):
	.loadData(data)

	isCorrupt = SAVE.loadVar(data, "isCorrupt", false)
	isPure = SAVE.loadVar(data, "isPure", false)
	isNormal = SAVE.loadVar(data, "isNormal", false)
	isVirgin = SAVE.loadVar(data, "isVirgin", false)
	petSkill = SAVE.loadVar(data, "petSkill", 0)