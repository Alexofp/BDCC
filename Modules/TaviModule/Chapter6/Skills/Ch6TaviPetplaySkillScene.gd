extends SceneBase

var isCorrupt = false
var isPure = false
var isNormal = false
var isVirgin = false
var petSkill = 0
var isGagged = false
var didFetch = false
var didVoice = false
var condomBroke = false
var tookVirginity = false

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
		if (petSkill > 2):
			addButton("Tricks", "Teach puppy Tavi some tricks", "tricks")
			if (petSkill > 3):
				addButton("Walkies", "Give Tavi some walkies", "walkies")
			else:
				addDisabledButton("Walkies", "Tavi need more petplay experience")
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
	if(state == "tricks"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="allfours", npcBodyState={naked=true}})
		saynn("Tavi's eyes sparkle with curiosity when you call her closer and then point down at the spot just before you.")

		saynn("[say=pc]"+str(RNG.pick(["Good girls get belly rubs.", "I wanna see a good puppy before me.", "I wanna teach you some tricks.", "Ready for some training, puppy?"]))+"[/say]")

		saynn("Tall kitty hesitates for a second. But then she gets on her knees before her.")

		saynn("[say=tavi]Pets don't wear clothes..[/say]")

		saynn("Her paws unbutton her shirt and then pull down her shorts before she leans forward and stands on all fours, completely naked.")

		saynn("You don't wanna hurt her arms and knees so you grab some puppy restraints that have padded inner sides and begin securing it around Tavi's limbs, one by one.. While she patiently awaits, her tail wagging ever so slightly.")

		addButton("Bitchsuit", "Tie Tavi up", "tricks_bitch")
	if(state == "tricks_bitch"):
		playAnimation(StageScene.PuppyDuo, "stand", {npc="tavi", npcBodyState={naked=true}})
		saynn("It took some time.. but you manage to secure the bitchsuit tightly on Tavi, turning her into such an adorable puppy.")

		saynn("Well, time to train her some tricks.")

		addButton("Fetch", "Order Tavi to bring a ball", "trick_fetch")
		addButton("Lie down", "Order Tavi to lie down", "trick_liedown")
		addButton("Sit", "Order Tavi to sit", "trick_sit")
	if(state == "trick_fetch"):
		playAnimation(StageScene.PuppyDuo, "throw", {npc="tavi", npcBodyState={naked=true}})
		saynn("There aren't really any rubber balls in this prison.. But there are ballgags. You take one from Tavi's stash and disassemble it quickly, removing the leather straps until you're left with just the rubber sphere.")

		saynn("[say=pc]See this?[/say]")

		saynn("Tavi tilts her head and raises a brow, looking cute and silly. You make sure Tavi sees the ball as you throw it in the corner of the cell.")

		saynn("[say=pc]Go-get-the-ball![/say]")

		saynn("Tavi tilts her head even more.")

		saynn("[say=pc]Bring the ball and you will get something.[/say]")

		saynn("That's when Tavi finally begins to see the point. She turns around awkwardly and begins searching for the ball until her ears perk towards a certain direction.")

		addButton("Continue", "See what happens next", "trick_fetch_walk")
	if(state == "trick_fetch_walk"):
		playAnimation(StageScene.PuppyDuo, "stand", {npc="tavi", npcAction="walk", npcBodyState={naked=true}})
		saynn("Tavi crawls towards the ball on all fours, her motions are a little stiff and unnatural as she is trying to get used to the puppy restraints.")

		saynn("Still, she manages to grab the ball with her mouth before bringing it back to you.")

		saynn("[say=pc]Good girl. Again.[/say]")

		saynn("You throw the ball in a different corner. This time, Tavi's eyes are tracking it somewhat.")

		saynn("[say=pc]Go get it.[/say]")

		saynn("And Tavi takes off again, crawling towards the ball before bringing it to you. Her tail is wagging happily each time you praise her.")

		saynn("[say=pc]Very good. Let's do some more.[/say]")

		saynn("After a few throws, Tavi begins to sway her hips more while crawling around her cell, her motions becoming more fluid and playful. Even if still heavily limited.")

		saynn("After the last throw, Tavi returns the ball back to you and drops it by your feet, panting softly. Her tongue is out and drooling.")

		saynn("[say=pc]Adorable. Now. For your reward..[/say]")

		addButton("Headpats", "Just pat Tavi and continue training her", "tricks_fetch_pat")
		addButton("Ballgag", "Make sure she never loses her ball..", "tricks_fetch_ballgag")
	if(state == "tricks_fetch_pat"):
		playAnimation(StageScene.PuppySexOral, "tease", {pc="pc", npc="tavi", npcBodyState={naked=true}})
		saynn("You grab Tavi by the cheeks and nuzzle her face.")

		saynn("[say=pc]Who's a good girl?[/say]")

		saynn("Tavi blinks many times and purrs while brushing her face against yours. Your hands give her plenty of headpats and then land behind her ears, scritching and scratching.")

		saynn("[say=pc]You are.[/say]")

		saynn("Tavi wiggles happily, her tail wags a lot.")

		saynn("[say=tavi]Woof![/say]")

		addButton("Continue", "See what happens next", "tricks_stand")
	if(state == "tricks_fetch_ballgag"):
		playAnimation(StageScene.PuppySexOral, "tease", {pc="pc", npc="tavi", npcBodyState={naked=true}})
		saynn("You grab the ball that Tavi dropped and put it back into her mouth.")

		saynn("[say=pc]Let's fix this little problem.[/say]")

		saynn("Tavi lets out a confused puppy noise as you begin attaching the leather straps back to that ball. Then you secure them tightly around her head, so tight that it makes Tavi drool.")

		saynn("[say=pc]See? Now you will never lose your ball.[/say]")

		saynn("Tavi tries to drop the ball but can't. It is indeed now in her mouth forever.. or until you decide to take it out.")

		addButton("Continue", "See what happens next", "tricks_stand")
	if(state == "tricks_stand"):
		playAnimation(StageScene.PuppyDuo, "stand", {npc="tavi", npcBodyState={naked=true}})
		saynn("Tavi stands on all fours before you, awaiting your next command patiently.")

		if (isGagged):
			saynn("She also can't stop drooling.")

		if (!didFetch):
			addButton("Fetch", "Order Tavi to bring a ball", "trick_fetch")
		else:
			addDisabledButton("Fetch", "You already played fetch with Tavi")
		addButton("Lie down", "Order Tavi to lie down", "trick_liedown")
		addButton("Sit", "Order Tavi to sit", "trick_sit")
	if(state == "trick_liedown"):
		playAnimation(StageScene.PuppyDuo, "stand", {npc="tavi", npcAction="sad", npcBodyState={naked=true}})
		saynn("You point down, inviting Tavi to get even lower.")

		saynn("[say=pc]Lie down.[/say]")

		saynn("Her bitchsuit restricts her actions quite a bit but she just about manages to lie down. Her tail is wagging though")

		addButton("Stand", "Order Tavi to get up again", "tricks_stand")
		addButton("Roll over", "Order Tavi to roll over", "tricks_rollover")
	if(state == "tricks_rollover"):
		saynn("You twirl your finger, trying to tell Tavi to roll over without using words. But she just tilts her head, confused.")

		saynn("[say=pc]Roll over, puppy.[/say]")

		saynn("That's clearly not an easy task with all those restraints. Tavi hesitates. But your twil your finger again.")

		saynn("[say=pc]C'mon, puppy. Try it.[/say]")

		saynn("Tavi gathers her strength for a few seconds.. and then commits. She purposefully topples herself over, flopping on her side. Then she rolls over to her other side and tries to get up again. That's where the problem arises.")

		if (petSkill < 6):
			saynn("Tavi struggles to get enough support. Her limbs just don't bend enough to be able to do this. All she can do is awkwardly flail. At some point she gives up and starts whining.")

			saynn("[say=pc]Aww.[/say]")

			saynn("You're not a monster. Obviously you help her to get up. And then give her some pats for trying.")

		else:
			saynn("Tavi struggles for a bit but then she rests and lets the gravity turn her onto her belly. That's when she can start getting up, one limb at a time.")

			saynn("[say=pc]Good job![/say]")

			saynn("Even though she is working with a lot of restrictions, Tavi still managed to roll over!")

		addButton("Continue", "See what happens next", "tricks_stand")
	if(state == "trick_sit"):
		playAnimation(StageScene.PuppyDuo, "stand", {npc="tavi", npcAction="sit", npcBodyState={naked=true}})
		saynn("You gesture to your pup, trying to make her sit down.")

		saynn("[say=pc]Sit![/say]")

		saynn("Tavi hears the command and lowers her butt. It looks awkward so she pushes her top part of the body off the floor, sitting straight now, her {tavi.breasts} out on display.")

		if (isGagged):
			saynn("Her gag makes her drool onto her chest.")

		else:
			saynn("She pants softly after accomplishing such a trick.")

		saynn("[say=pc]Nice, good job.[/say]")

		addButton("Continue", "See what happens next", "tricks_sitting")
	if(state == "tricks_sitting"):
		playAnimation(StageScene.PuppyDuo, "stand", {npc="tavi", npcAction="sit", npcBodyState={naked=true}})
		saynn("Tavi is sitting on her butt before you, eagerly awaiting commands.")

		addButton("Voice", "Order Tavi to bark", "trick_sit_bark")
		addButton("Give paw", "Order Tavi to give paw", "trick_sit_givepaw")
		addButton("Sit", "Tell Tavi to sit", "trick_sit_sitdown")
		addButton("Belly rubs!", "Give Tavi the bellyrubs that she deserves", "trick_order_back")
	if(state == "trick_sit_bark"):
		saynn("You decide to test Tavi's vocal activities.")

		saynn("[say=pc]Voice.[/say]")

		saynn("Tavi tilts her head at that command.")

		saynn("[say=tavi]Uh..[/say]")

		saynn("You shake your head and tap on Tavi's lips.")

		saynn("[say=pc]Show me how a puppy sounds. Voice.[/say]")

		if (isGagged):
			saynn("Since she is gagged, all she can do is try to imitate the noises to the best of her ability. While also drooling actively..")

			saynn("[say=tavi]Uh.. Arf.. Arhf.. Woof.. Woff-f..[/say]")

			saynn("Well, at least she is trying. You give her some pats.")

		else:
			saynn("[say=tavi]Woof?[/say]")

			saynn("You nod and ask her to be louder.")

			saynn("[say=tavi]Woof! Woooof! Awooo![/say]")

			saynn("The last bit was unnecessary. But at least she is trying. You give her some pats.")

		addButton("Continue", "See what happens next", "tricks_sitting")
	if(state == "trick_sit_givepaw"):
		playAnimation(StageScene.PuppyDuo, "stand", {npc="tavi", npcAction="paw", npcBodyState={naked=true}})
		saynn("You reach your hand out.")

		saynn("[say=pc]Give paw, puppy.[/say]")

		saynn("Tavi lets out a confused noise, trying to figure out how she can do that command if her hands are tied up firmly.")

		saynn("[say=pc]C'mon, be a good puppy.[/say]")

		saynn("Tavi gets all flustered and whiny, struggling to understand what you mean. But then she realizes that her elbow is actually her paw now and raises it.")

		saynn("[say=tavi]Woof?..[/say]")

		saynn("You shake it and give your puppy some scritches. She seems to be getting into her role now quite well.")

		addButton("Continue", "See what happens next", "tricks_sitting")
	if(state == "trick_sit_sitdown"):
		playAnimation(StageScene.PuppyDuo, "stand", {npc="tavi", npcBodyState={naked=true}})
		saynn("[say=pc]Sit, puppy.[/say]")

		saynn("Tavi tilts her head, trying to figure out what exactly you mean by sitting.")

		saynn("[say=pc]On all fours, Tavi.[/say]")

		saynn("She gasps and drops down before raising her butt off the floor, her tail wiggling happily.")

		addButton("Continue", "See what happens next", "tricks_stand")
	if(state == "trick_order_back"):
		playAnimation(StageScene.PuppyDuo, "stand", {npc="tavi", npcAction="back", npcBodyState={naked=true}})
		saynn("You push Tavi onto her back and begin giving her bellyrubs, all of them! Tavi squirms and huffs from so much stimulation.")

		saynn("[say=tavi]Woo-of!..[/say]")

		saynn("[say=pc]Such a good girl.[/say]")

		saynn("She seems extremely happy, her cheeks glowing green.. just like her wet needy slit between her hind legs.")

		saynn("[say=pc]The best girl.[/say]")

		saynn("Tavi purrs and moans softly even while you continue to rub her belly, your hands occasionally slipping towards her cute breasts and pussy, giving them some rubs too.")

		saynn("[say=tavi]Woof..[/say]")

		saynn("After giving Tavi all the praise, you start taking off her restraints.")

		saynn("[say=pc]You can snap out of it now, Tavi.[/say]")

		saynn("[say=tavi]Woof~?[/say]")

		saynn("Tavi is smiling. Now it's your turn to tilt your head. She baps your nose with her paw.")

		saynn("[say=tavi]Thought I forgot how to talk~? This felt really good though~..[/say]")

		if (isGagged):
			saynn("Hard to understand what she is saying with that gag. But at least she is saying actual words.. probably.")

		saynn("You sigh and hug your puppy.")

		addButton("Continue", "That was nice", "endthescene_resetequip")
	if(state == "walkies"):
		addCharacter("tavi", ["naked"])
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="allfours", npcBodyState={naked=true}})
		saynn("Time for walkies. As soon as you fetch a leash, Tavi's eyes widen. She takes off her clothes and already stands on all fours near you, her tail wagging playfully.")

		saynn("[say=pc]Let's get you prepared, puppy.[/say]")

		saynn("After grabbing the leash, you also find the puppy restraints and begin putting them on your pet. She went through quite a journey, didn't she.")

		addButton("Bitchsuit", "Put the puppy restraints on Tavi", "walkies_bitchsuit")
	if(state == "walkies_bitchsuit"):
		playAnimation(StageScene.PuppyDuo, "stand", {npc="tavi", npcBodyState={naked=true}})
		saynn("You crouch near Tavi and begin putting cone-shaped restraints on her limbs that make her always crawl on her elbows and knees. Apart from that.. Tavi is not gonna wear anything today.")

		saynn("[say=pc]We're going on walkies around the prison today.[/say]")

		if (petSkill < 6):
			saynn("Tavi is a little hesitant, her tail stops wagging for a bit.")

			saynn("[say=pc]You're not comfortable with that, puppy? It's gonna be fun.[/say]")

			saynn("Tavi listens to your words and nods before presenting her collar, allowing you to clip a leash to it.")

		else:
			saynn("Tavi bounces happily, she doesn't seem to mind being naked in public anymore.")

			saynn("[say=pc]So cute.[/say]")

			saynn("She purrs and gives you access to her collar, allowing you to clip a leash.")

		saynn("Where do you wanna go?")

		addButton("Main hall", "Play catch with Tavi in the main hall", "walkies_mainhall")
		addButton("Yard", "Take Tavi on a walk around the green yard", "walkies_yard")
		addButton("Meet Nova", "Show your pet to Nova", "walkies_meetnova")
	if(state == "walkies_mainhall"):
		playAnimation(StageScene.PuppyDuo, "stand", {npc="tavi", npcAction="walk", npcBodyState={naked=true}})
		aimCameraAndSetLocName("main_stairs_n")
		saynn("And so you walk out of the cell and proceed to walk towards the stairs that will get you up into the main hall. By your side is Tavi, her eyes fixed on you. You get lots of random gazes from others but the feline doesn't seem to mind, her tail wags excitedly.")

		saynn("Getting your pet up the stairs is tricky but you help her with that, one stair at the time.")

		saynn("As you reach the main platform, you find a relatively empty spot for you and Tavi where you have enough space for what you are about to do.")

		saynn("Tavi's ears perk as you produce a red rubber ball, clearly taken from one of the ballgags. Then you crouch and quickly unclip the leash, letting Tavi wander further than usual.")

		saynn("[say=pc]Ready?[/say]")

		saynn("[say=tavi]Woof![/say]")

		addButton("Throw the ball", "Play fetch with Tavi", "walkies_mainhall_fetch")
	if(state == "walkies_mainhall_fetch"):
		playAnimation(StageScene.PuppyDuo, "throw", {npc="tavi", npcAction="walk", npcBodyState={naked=true}})
		saynn("You aim somewhere not that far and toss the ball. At the same time, Tavi springs into action, her movements constrained and yet full of enthusiasm and agility as she chases after the ball. A few inmates notice the scene and chuckle.")

		saynn("Tavi grabs the ball with her mouth and brings it back to you, her eyes looking proud. You grab it and throw it again.")

		saynn("[say=pc]Go get it, puppy.[/say]")

		saynn("Tavi takes off after it, her tail wagging in sheer delight. More and more inmates join the crowd, watching Tavi retrieve the ball after you throw it, again and again. It seems, Tavi's flashy form combined with her commitment to the role are captivating the audience.")

		saynn("Should you let the audience give your pup commands too?")

		addButton("Yes", "Let other give some orders to Tavi", "walkies_mainhall_yes")
		addButton("Nah", "Just play more fetch with Tavi", "walkies_mainhall_no")
	if(state == "walkies_mainhall_no"):
		playAnimation(StageScene.PuppyDuo, "throw", {npc="tavi", npcAction="walk", npcBodyState={naked=true}})
		saynn("You decide against the idea of inmates giving commands to Tavi. She should listen only to you, she is your pet after all.")

		saynn("Tavi brings the ball back to you a few more times until she starts panting heavily, clearly tired. Still, she did really well so you give her some pats and bellyrubs, making her purr too now.")

		saynn("[say=pc]Let's go back.[/say]")

		saynn("After such a good walkies session, Tavi is left satisfied. Who knew she would become such a good puppy.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "walkies_mainhall_yes"):
		playAnimation(StageScene.PuppyDuo, "stand", {npc="tavi", npcAction="paw", npcBodyState={naked=true}})
		saynn("You decide to let others interact with your puppy.")

		saynn("'Voice', one of the inmates orders. Tavi looks back at you with a tilt of her head. You nod and so Tavi barks loudly.")

		saynn("[say=tavi]Ruff![/say]")

		saynn("The inmates chuckle. At the same time, someone else orders 'Lie down!'. And so Tavi immediately drops to the floor, her tail still wagging.")

		saynn("It's quite wholesome, watching your pup obey the commands of the curious onlookers. The crowd begins to thicken around you two. 'Give paw', someone asks. And so, Tavi extends her paw, letting the inmate shake it and then pat her.")

		saynn("And that's how a game of catch gradually evolves into an impromptu puppy training session. Tavi seems to be enjoying herself though, she does every command that doesn't require her to do anything too lewd.")

		saynn("By the end of it, Tavi is left panting softly. Inmates give her all the pats and scritches before finally letting you two go back to the cell. Who knew she would become such a good puppy.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "walkies_yard"):
		aimCameraAndSetLocName("main_hallroom6")
		playAnimation(StageScene.PuppyDuo, "stand", {npc="tavi", npcAction="walk", npcBodyState={naked=true}})
		saynn("And so you set off towards the yard area. You have to help Tavi climb the stairs because it's too steep but you just about manage.")

		saynn("Lots of gazes don't seem to affect Tavi anymore. She is swaying her naked butt seductively while crawling by your side.")

		addButton("Continue", "See what happens next", "walkies_yard_yard")
	if(state == "walkies_yard_yard"):
		playAnimation(StageScene.PuppyDuo, "stand", {npc="tavi", npcAction="walk", npcBodyState={naked=true}})
		aimCameraAndSetLocName("yard_northCorridor")
		saynn("You enter the area full of green bushes and pathways made out of stones. You hold Tavi's leash while following the little roads. It's certainly nothing compared to big lush planets.. but.. it's still something.")

		saynn("Every now and then, Tavi's ears perk and her nose twitches as she investigates all the scents that are lingering in the air. She barks happily as she finds a little pebble that she can kick around with her paws.")

		saynn("Eventually you reach a good spot to rest. There is a bench that you can sit on, perfect for some idling.")

		addButton("Rest", "Rest with Tavi", "walkies_yard_rest")
	if(state == "walkies_yard_rest"):
		playAnimation(StageScene.PuppyDuo, "sit", {npc="tavi", npcAction="back", npcBodyState={naked=true}})
		saynn("Time for rest. You sit on the bench and then pull Tavi onto it as well, her head resting on your lap.")

		saynn("She is purring softly while you proceed to give her bellyrubs.")

		saynn("[say=pc]Remember how you didn't want to do this at first~?[/say]")

		saynn("Tavi blushes, her paw boops you on the nose. But you boop her back many times, making her stick her tongue.")

		saynn("[say=pc]And now you're the most adorable puppy ever. Doesn't it feel good?[/say]")

		saynn("You dangle the leash in front of her eyes. Tavi nods and lets out a content sigh.")

		saynn("[say=pc]Good girl.[/say]")

		saynn("Tavi smiles and closes her eyes, enjoying being your lap warmer. Inmates and staff members walk past you but who cares about them.")

		saynn("You close your eyes as well and just take a little nap. Various thoughts go through your head. Is this prison bad or good? You have one of the most restrictive collars that have an ability to fry your neck and yet.. you still have a lot of freedom in what you can do.. A little closed-off society that has its own set of rules. A heaven?")

		saynn("Nah.. Stopping now would mean all of this was for nothing. But if you're having fun, does anything else matter? Hell..")

		saynn("Your hand keeps rubbing your pet's belly.. until you decide to return back to the cell.")

		saynn("Looks like Tavi enjoyed that trip, her tail is wagging actively even after being exposed to so many eyes.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "walkies_meetnova"):
		aimCameraAndSetLocName("main_hallroom6")
		playAnimation(StageScene.PuppyDuo, "stand", {npc="tavi", npcAction="walk", npcBodyState={naked=true}})
		saynn("You bring Tavi into the main hall and begin to search for Nova. Tavi is crawling by your side, looking happy about getting walkies.")

		saynn("You know that the husky guard is usually patrolling the yard area so you head there.")

		addButton("Continue", "See what happens next", "walkies_meetnova_nova")
	if(state == "walkies_meetnova_nova"):
		aimCameraAndSetLocName("yard_novaspot")
		addCharacter("nova")
		playAnimation(StageScene.PuppyDuo, "stand", {pc="nova", npc="tavi", npcAction="paw", npcBodyState={naked=true}})
		saynn("It doesn't take long for you to stumble into Nova. The guard is resting while leaning against the prison's wall.")

		saynn("[say=nova]Ohh![/say]")

		saynn("The moment she sees Tavi she runs up to her and starts squishing her cheeks and ruffling her fur.")

		saynn("[say=nova]Such a good girl![/say]")

		saynn("Tavi purrs and rubs herself against the guard, her tail wagging happily. Nova looks up at you.")

		saynn("[say=nova]You did that~?[/say]")

		saynn("You nod and look proud. All the while Nova gives your pet headpats and even some treats, spoiling her.")

		saynn("[say=nova]You're an obedient puppy now, aren't you?[/say]")

		saynn("[say=tavi]Woof![/say]")

		saynn("[say=nova]Aww-w~. Give paw.[/say]")

		saynn("Tavi obediently raises her front paw and rests it in Nova's palm while she shakes it.")

		saynn("[say=nova]Any particular reason why you came to me?[/say]")

		saynn("A somewhat devious thought comes into your mind. You could.. offer your pet.. to be bred by Nova. Maybe she would agree?")

		addButton("Just showing", "Tell Nova that you are just showing her your puppy", "walkies_meetnova_justshow")
		addButton("Offer Tavi", "Offer Nova to breed Tavi", "walkies_meetnova_offer")
	if(state == "walkies_meetnova_justshow"):
		playAnimation(StageScene.PuppyDuo, "kneel", {pc="nova", npc="tavi", npcAction="back", npcBodyState={naked=true}})
		saynn("[say=pc]Just wanted to show her to you. Since you seem to have some connection.[/say]")

		saynn("Nova smiles and pushes Tavi onto her back before proceeding to give her all the bellyrubs. Poor puppy is panting and squirming under the guard's relentless signs of affection.")

		saynn("[say=nova]Well thank you~. You did what I couldn't. Maybe I can pick up some tips from you~.[/say]")

		saynn("[say=tavi]Woof! Ruff![/say]")

		saynn("Nova gropes Tavi's breasts but she doesn't seem to mind. The puppy loves it.")

		saynn("[say=nova]Yeah.. at least this cutie is in good hands.[/say]")

		saynn("The guard helps Tavi to get on all fours and then stands up.")

		saynn("[say=nova]Well, I better get back to it. Captain wouldn't approve of me playing with inmates all day.[/say]")

		saynn("Fair enough. You nod and tug on the leash, inviting your pet to follow you back to her cell.")

		saynn("That was a nice walk.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "walkies_meetnova_offer"):
		playAnimation(StageScene.PuppyDuo, "stand", {pc="nova", npc="tavi", npcBodyState={naked=true}})
		saynn("[say=pc]I was thinking.. You have a dick, right?[/say]")

		saynn("Nova smiles and tilts her head ever so slightly.")

		saynn("[say=nova]Last time I checked, yes.[/say]")

		saynn("You tug on the leash, making Tavi turn around. Then you crouch near her butt and spread it, offering Nova a great view of Tavi's wet pussy."+str(" The visible hymen makes It quite evident that she is still a virgin. Tavi gasps as you do that." if isVirgin else "")+"")

		saynn("[say=pc]Do you wanna fuck my puppy? She could use a breeding or two.[/say]")

		saynn("Nova raises a brow, the view certainly arouses her, making the suit under her armor tense up in her crotch region.")

		if (isVirgin):
			saynn("[say=nova]I.. I can't. I don't wanna cause her pain.[/say]")

			saynn("[say=pc]But look at her. This puppy would love your canine cock inside her. Right, Tavi? It only hurts the first time.[/say]")

		else:
			saynn("[say=nova]I.. I can't. I don't wanna cause her pain.[/say]")

			saynn("[say=pc]But look at her. This puppy would love your canine cock inside her. Right, Tavi? She is not a virgin anymore so you're fine.[/say]")

		saynn("You smack Tavi's butt, making her gasp again.")

		saynn("[say=tavi]..woof..[/say]")

		saynn("[say=nova]I don't know.. Are you sure? I'd need a condom at least.. I won't go in raw.[/say]")

		addButtonWithChecks("Best condom", "Give Nova your best condom", "walkies_meetnova_givebestcondom", [], [ButtonChecks.HasCondoms])
		addButton("Worst condom", "Give Nova your worst condom", "walkies_meetnova_giveworstcondom")
		addButton("Never mind", "It's fine", "walkies_meetnova_nofuck")
	if(state == "walkies_meetnova_nofuck"):
		saynn("[say=pc]Well. It's okay then, don't worry about it.[/say]")

		saynn("Nova nods and pats Tavi some more.")

		saynn("[say=nova]She is a good puppy though, you trained her well.[/say]")

		saynn("Tavi purrs and bounces happily.")

		saynn("[say=nova]Well, I better get back to it. Captain wouldn't approve of me playing with inmates all day.[/say]")

		saynn("Fair enough. You nod and tug on the leash, inviting your pet to follow you back to her cell.")

		saynn("That was a nice walk.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "walkies_meetnova_fuck"):
		addCharacter("nova", ["naked"])
		playAnimation(StageScene.PuppySexOral, "tease", {pc="nova", npc="tavi", npcBodyState={naked=true}, bodyState={naked=true, hard=true}})
		saynn("You offer Nova a packaged condom. Tavi looks unsure, her tail covering her slick folds. But she doesn't say no.. Seems she trusts you.")

		saynn("[say=pc]Pretty please?[/say]")

		saynn("Nova hesitates about it for a second. But then decides to grab the condom after gazing at your leashed pet for a little longer.")

		saynn("[say=nova]Alright. This place should be quiet enough for this.[/say]")

		saynn("Nova takes off her armor pieces and stores them on some bench before unzipping her undersuit, revealing a canine sheath with a red dripping cock already peeking out. The husky crouches before the feline, her length not that far from Tavi's mouth.")

		saynn("[say=nova]Would you help me get fully hard, cutie?[/say]")

		saynn("Tavi goes cross-eyed while looking at the cock so close to her maw. She parts her lips and lets her tongue roll out before sliding it over Nova's length, from the knotted base to the pointy tip, catching a drop of precum in the process.")

		saynn("[say=nova]Good girl.. Do you want this?[/say]")

		saynn("Tavi looks at both of you from her low position.. And nods.")

		saynn("[say=nova]Alright, let's have some fun..[/say]")

		saynn("Nova rips the package open and then drags the elastic ring of the condom over her length.")

		addButton("Watch", "See what happens next", "walkies_meetnova_startfuck")
	if(state == "walkies_meetnova_startfuck"):
		playAnimation(StageScene.PuppySexAllFours, "tease", {pc="nova", npc="tavi", npcBodyState={naked=true}, bodyState={naked=true, hard=true, condom=true}})
		saynn("Nova stands up and crouches behind Tavi this time, her paws landing on her butt and caressing it, a mixture of dominance and tenderness in her touch. Tavi tries to look over her shoulder, her eyes reflecting her eagerness to please.")

		saynn("[say=nova]You know what to do.[/say]")

		saynn("Tavi responds with a soft whimper before her tail decides to move out of the way, offering the husky full access to her needy holes.")

		saynn("[say=nova]Stay, puppy.[/say]")

		saynn("Nova leans in low, her tongue darting out to taste that pussy's juices. Tavi's body reacts by swaying back and forth, following the motions of Nova's head, short noises leaving her throat.")

		saynn("[say=nova]I will be gentle.[/say]")

		if (isVirgin):
			saynn("The husky starts guiding her cock towards Tavi's virgin hole, its head spreading the folds and quickly finding an organic obstacle that is her hymen. The more Nova puts pressure on it, the more Tavi whines and squirms, her legs shaking.")

			saynn("Seems like it will be less painful just to ram it in.. And Nova knows it.")

			saynn("[say=nova]It will hurt for some time, sweetie.. Love you.[/say]")

		else:
			saynn("The husky starts guiding her cock towards Tavi's tight hole, its head spreading the folds and already proceeding to stretch the entrance itself. The more Nova puts pressure on it, the more Tavi squirms.")

			saynn("[say=nova]Love you, sweetie.[/say]")

		addButton("Continue", "See what happens next", "walkies_meetnova_fucking")
	if(state == "walkies_meetnova_fucking"):
		playAnimation(StageScene.PuppySexAllFours, "sex", {pc="nova", npc="tavi", npcBodyState={naked=true}, bodyState={naked=true, hard=true, condom=true}})
		if (tookVirginity):
			saynn("Nova grips Tavi's butt firmly while gathering her strength. And then, after a final sigh, she thrusts her hips forward, her knotted cock putting enough pressure on Tavi's hymen to suddenly tear through it, [b]stealing Tavi's virginity![/b].")

			saynn("Tavi gasps and jerks forward from the sudden sharp pain but Nova doesn't let her, pulling her back onto her cock. The feline is whining loudly while her inner walls clench around their first cock, her pussy dripping green toxic-like blood onto the floor.")

			saynn("[say=nova]There we go. Sorry, hun. It will get better from now, promise.[/say]")

			saynn("After that, Nova proceeds to slowly pick up the pace, fucking your pet while you hold her leash and watch her face. Tavi is still feeling a lot of discomfort.. but there are also quite a few pleasurable sensations too now.")

		else:
			saynn("Nova grips Tavi's butt firmly while gathering her strength. And then, after a final sigh, she thrusts her hips forward, her knotted cock stretching Tavi's sensitive folds enough to slide inside!")

			saynn("Tavi gasps and jerks forward from the sudden motion but Nova doesn't let her, pulling her back onto her cock. The feline is squirming while her inner walls grip that canine length, her pussy dripping juices onto the floor.")

			saynn("[say=nova]Such a tight puppy.. Are you sure you're not a virgin?[/say]")

			saynn("After that, Nova proceeds to slowly pick up the pace, fucking your pet while you hold her leash and watch her face. Tavi's reluctance slowly fades away, pleasurable sensations clouding her mind.")

		saynn("Little moans begin to escape from your puppy. And Nova starts to pant softly, the tightness making her more eager to increase the pace, her knot getting bigger until it starts slapping against Tavi's folds.")

		saynn("[say=nova]Should I knot this little slut?..[/say]")

		if (tookVirginity):
			saynn("Getting knotted during your first sex? Sounds fun.")

		addButton("Continue", "See what happens next", "walkies_meetnova_faster")
	if(state == "walkies_meetnova_faster"):
		playAnimation(StageScene.PuppySexAllFours, "fast", {pc="nova", npc="tavi", npcBodyState={naked=true}, bodyState={naked=true, hard=true, condom=true}})
		saynn("Tavi answers with just a moan, her body trembling while Nova thrusts inside her needy slit. She has gotten so submissive after all the training that you did, her eyes show lust and desire.")

		saynn("Soon, a loud passionate noise of love escapes from your pet, her muscles suddenly tense up, her pussy pulsing around that member.")

		saynn("[say=nova]Cumming already?.. Ngh.. Such a soft cutie..[/say]")

		saynn("There is no point in pulling out since she has that condom on her cock. Nova fights Tavi's clenching pussy, shoving her length inside with more force.. until the knot slips inside too.")

		addButton("Continue", "See what happens next", "walkies_meetnova_knot")
	if(state == "walkies_meetnova_knot"):
		playAnimation(StageScene.PuppySexAllFours, "inside", {pc="nova", npc="tavi", npcBodyState={naked=true}, bodyState={naked=true, hard=true, condom=true}})
		if (condomBroke):
			saynn("Nova grunts as she manages to shove her full length inside Tavi, breaking into her womb. The extreme tightness of the puppy's inner walls shoots husky over the edge instantly. She arches her back as cock starts stuffing the condom inside Tavi's womb.. until something snaps.. Oops.. Seems, [b]the condom has broke, spilling all of its contents inside![/b]")

			saynn("Tavi is whining as her pussy gets stretched to the extreme by that knot, her whole body shakes while another orgasm overwhelmes her senses. The amount of seed in her babymaker becomes too much, some of it starts leaking out already, making Nova looking.. quite concerned.")

			saynn("[say=nova]Hey.. S-something is wrong.[/say]")

			saynn("Nova tries to pull out but she is tied together with Tavi too firmly by the knot. Tugging on it only makes Tavi moan more.")

			saynn("[say=nova]I think the condom broke..[/say]")

			saynn("You offer Nova a little smile.")

			saynn("[say=pc]It's okay~.[/say]")

			saynn("Nova huffs, her cheek red. It's obvious that she still enjoyed it. You crouch before Tavi and pat her.")

			saynn("[say=pc]Such a good little breeding toy.[/say]")

			saynn("Tavi purrs softly..")

			saynn("They spend time like this until Nova finally manages to pull her cock out. And indeed, the condom has a gaping hole in it. All of her cum.. is inside Tavi. Oh well.")

		else:
			saynn("Nova grunts as she manages to shove her full length inside Tavi, breaking into her womb. The extreme tightness of the puppy's inner walls shoots husky over the edge instantly. She arches her back as cock starts stuffing the condom inside Tavi's womb.. And luckily, it seems to be durable enough.")

			saynn("Tavi is whining as her pussy gets stretched to the extreme by that knot, her whole body shakes while another orgasm overwhelmes her senses. The amount of seed in her babymaker becomes too much, creating a subtle bump on her belly.")

			saynn("[say=nova]So good..[/say]")

			saynn("Nova tries to pull out but she is tied together with Tavi too firmly by the knot. Tugging on it only makes Tavi moan more.")

			saynn("[say=nova]I think we will be stuck like this for a while.[/say]")

			saynn("You offer Nova a little smile.")

			saynn("[say=pc]It's okay~.[/say]")

			saynn("Nova huffs, her cheek red. It's obvious that she still enjoyed it. You crouch before Tavi and pat her.")

			saynn("[say=pc]Such a good little breeding toy.[/say]")

			saynn("Tavi purrs softly..")

			saynn("They spend time like this until Nova finally manages to pull her cock out. She quickly ties up the filled condom and disposes of it.")

		addButton("Continue", "See what happens next", "walkies_meetnova_aftercum")
	if(state == "walkies_meetnova_aftercum"):
		playAnimation(StageScene.PuppyDuo, "stand", {pc="nova", npc="tavi", npcBodyState={naked=true}, bodyState={naked=true, hard=true}})
		saynn("Nova pats Tavi too and starts putting on her armor piece by piece.")

		if (condomBroke):
			saynn("[say=nova]Felt nice.. Too bad the condom snapped. Maybe you should have given me a better one.[/say]")

			saynn("You shrug and offer her a kind smile. Maybe you were counting on this to happen.")

		else:
			saynn("[say=nova]Felt nice, not gonna lie.[/say]")

			saynn("You offer her a kind smile.")

		saynn("[say=nova]Well, see you around. You too, puppy..[/say]")

		saynn("After that intense session, you tug on the leash, inviting Tavi to follow you back to her cell.")

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

	if(_action == "tricks"):
		getModule("TaviModule").advanceSkill("taviSkillPetplay")

	if(_action == "walkies"):
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

	if(_action == "tricks_bitch"):
		processTime(10*60)

	if(_action == "trick_fetch"):
		processTime(4*60)
		didFetch = true

	if(_action == "trick_liedown"):
		processTime(2*60)

	if(_action == "trick_sit"):
		processTime(2*60)

	if(_action == "tricks_fetch_pat"):
		processTime(3*60)

	if(_action == "tricks_fetch_ballgag"):
		processTime(3*60)
		getCharacter("tavi").getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("ballgag"))
		isGagged = true

	if(_action == "tricks_rollover"):
		processTime(3*60)

	if(_action == "trick_sit_bark"):
		processTime(2*60)

	if(_action == "trick_sit_givepaw"):
		processTime(2*60)

	if(_action == "trick_sit_sitdown"):
		processTime(2*60)

	if(_action == "walkies_bitchsuit"):
		processTime(3*60)
		#getCharacter("tavi").getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("PuppyCorset"))

	if(_action == "walkies_mainhall"):
		processTime(3*60)

	if(_action == "walkies_yard"):
		processTime(3*60)

	if(_action == "walkies_meetnova"):
		processTime(3*60)

	if(_action == "walkies_mainhall_fetch"):
		processTime(10*60)

	if(_action == "walkies_mainhall_yes"):
		processTime(3*60)

	if(_action == "walkies_mainhall_no"):
		processTime(3*60)

	if(_action == "walkies_yard_yard"):
		processTime(3*60)

	if(_action == "walkies_yard_rest"):
		processTime(15*60)
		GM.pc.addStamina(100)
		GM.pc.addPain(-100)

	if(_action == "walkies_meetnova_nova"):
		processTime(3*60)

	if(_action == "walkies_meetnova_givebestcondom"):
		var breakChance = GM.pc.useBestCondom()
		if(RNG.chance(breakChance)):
			condomBroke = true
		setState("walkies_meetnova_fuck")
		return

	if(_action == "walkies_meetnova_giveworstcondom"):
		var breakChance = GM.pc.useWorstCondom()
		if(getCharacter("nova").shouldCondomBreakWhenFucking("tavi", breakChance)):
			condomBroke = true
		setState("walkies_meetnova_fuck")
		return

	if(_action == "walkies_meetnova_nofuck"):
		processTime(2*60)

	if(_action == "walkies_meetnova_startfuck"):
		processTime(2*60)

	if(_action == "walkies_meetnova_fucking"):
		processTime(5*60)
		if(isVirgin):
			tookVirginity = true
			setFlag("TaviModule.TaviIsNotVirgin", true)

	if(_action == "walkies_meetnova_faster"):
		processTime(3*60)

	if(_action == "walkies_meetnova_knot"):
		processTime(10*60)
		if(condomBroke):
			getCharacter("tavi").cummedInVaginaBy("nova")
		else:
			addFilledCondomToLootIfPerk(getCharacter("nova").createFilledCondom())

	setState(_action)

func saveData():
	var data = .saveData()

	data["isCorrupt"] = isCorrupt
	data["isPure"] = isPure
	data["isNormal"] = isNormal
	data["isVirgin"] = isVirgin
	data["petSkill"] = petSkill
	data["isGagged"] = isGagged
	data["didFetch"] = didFetch
	data["didVoice"] = didVoice
	data["condomBroke"] = condomBroke
	data["tookVirginity"] = tookVirginity

	return data

func loadData(data):
	.loadData(data)

	isCorrupt = SAVE.loadVar(data, "isCorrupt", false)
	isPure = SAVE.loadVar(data, "isPure", false)
	isNormal = SAVE.loadVar(data, "isNormal", false)
	isVirgin = SAVE.loadVar(data, "isVirgin", false)
	petSkill = SAVE.loadVar(data, "petSkill", 0)
	isGagged = SAVE.loadVar(data, "isGagged", false)
	didFetch = SAVE.loadVar(data, "didFetch", false)
	didVoice = SAVE.loadVar(data, "didVoice", false)
	condomBroke = SAVE.loadVar(data, "condomBroke", false)
	tookVirginity = SAVE.loadVar(data, "tookVirginity", false)
