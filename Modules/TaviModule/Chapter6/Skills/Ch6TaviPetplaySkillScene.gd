extends SceneBase

var isCorrupt = false
var isPure = false
var isNormal = false
var isVirgin = false
var petSkill = 0
var isGagged = false
var didFetch = false
var didVoice = false

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
