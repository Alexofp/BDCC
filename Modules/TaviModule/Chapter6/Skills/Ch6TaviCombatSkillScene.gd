extends SceneBase

func _init():
	sceneID = "Ch6TaviCombatSkillScene"

func _run():
	if(state == ""):
		addCharacter("tavi")
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("You tell Tavi that you want to train her combat skills because they will be important for the future.")

		saynn("Tavi nods and listens to you.")

		var combat = getModule("TaviModule").getSkillScore("taviSkillCombat")
		addButton("Lesson 1", "Test Tavi's skills", "les1")
		if (combat >= 1):
			addButton("Lesson 2", "Try to make Tavi be able to fight again", "les2")
		if (combat >= 2):
			addButton("Lesson 3", "Train Tavi's fighting skills", "les3")
		if (combat >= 3):
			addButton("Lesson 4", "Train Tavi's fighting skills further", "les4")
		if (combat >= 4):
			addButton("Lesson 5", "See if Tavi has learned something", "les5")
		if (combat >= 5):
			addButton("Sparring", "Fight Tavi", "sparring")
		addButton("Cancel", "You changed your mind", "cancel_lesson")
	if(state == "les1"):
		saynn("Since Tavi has.. changed a bit after that last failed attempt to escape, it might be worth checking if she is still a capable fighter.")

		saynn("[say=pc]Alright, Tavi. Let's do a little sparring match.[/say]")

		saynn("Tavi stands before you, her feline ears twitching with uncertainty. She lowers her head a bit, making her overall profile smaller.. but that's about it. You don't even notice her claws being out. Huh.")

		saynn("[say=pc]Come on, Tavi. You can do this.[/say]")

		saynn("Well, might as well try to hit her and see what happens..")

		addButton("Strike first", "Attack Tavi", "les1_oops")
	if(state == "les1_oops"):
		playAnimation(StageScene.Duo, "shove", {npc="tavi", npcAction="defeat"})
		saynn("You try to push Tavi and she just.. collapses instantly. No resistance, no attempts to dodge or block, Tavi just huffs softly while rubbing her scratched knees.")

		saynn("[say=pc]Tavi..[/say]")

		saynn("[say=tavi]I'm sorry.. I can't fight.. Not anymore..[/say]")

		saynn("Huh. You leave your combat stance and approach the tall kitty, your hand lands on her head and gently pats her.")

		saynn("[say=pc]Why not? You were fighting incredibly well before.. Mostly because you were using dirty moves but still.[/say]")

		saynn("[say=tavi]Any time I think about resisting.. or violence.. I get a vision.. a flashback of me.. orgasming non-stop.. so much that it felt like torture.. while listening to Eliza's words..[/say]")

		saynn("There is no way that's possible.. And if it is.. It can't be permanent, can it? Surely not.")

		saynn("You help Tavi get up.")

		saynn("[say=pc]Punch me. Slap me. Throw your arm forward. Anything. Let's start small, Tavi.[/say]")

		addButton("Continue", "See what happens next", "les1_ow")
	if(state == "les1_ow"):
		saynn("Tavi slowly gets up and assumes the fighting stance yet again. She starts slowly strafing around you, trying to focus. But you can see in her eyes that she wants to avoid hurting you at all cost.")

		saynn("Finally, Tavi closes the distance and gently slaps your wrist.. Ow!")

		if (GM.pc.getPainLevel() >= 1.0):
			playAnimation(StageScene.Duo, "defeat", {npc="tavi", npcAction="shove"})
			saynn("You grunt as you drop to your knees, unable to continue fighting. That attack was enough to bring you down to your knees before her! You got defeated!")

			saynn("Tavi sees that and gasps, instantly trying to help you.")

			saynn("[say=tavi]Sorry!.. sorry-sorry-sorry..[/say]")

			saynn("[say=pc]It's okay, I'm okay. That's how fights go, Tavi. Someone has to lose. You won. Didn't that feel good?[/say]")

		else:
			playAnimation(StageScene.Duo, "hurt", {npc="tavi", npcAction="shove"})
			saynn("It didn't hurt that much actually but you try to amplify the effect to make Tavi seem more powerful. You grunt audibly.")

			saynn("Tavi sees that and gasps, instantly trying to help you.")

			saynn("[say=tavi]Sorry!.. sorry-sorry-sorry..[/say]")

			saynn("[say=pc]It's okay, I'm okay. That's how fights go, Tavi. Someone has to beat the other person. Didn't that feel good though?[/say]")

		saynn("Tavi's sorry eyes look into yours. It feels like she is about to start crying.")

		saynn("[say=tavi]I just.. don't wanna fight anymore.. sorry..[/say]")

		saynn("That's.. kinda sad. You nod and decide to end the first lesson here.")

		saynn("Maybe you just need to give her some time and try again later?")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "les2"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("You can't expect Tavi to be able to fight after what happened to her. But she must be able to stand for herself, she is a red after all.")

		saynn("[say=pc]Let's do another sparring.[/say]")

		saynn("[say=tavi]You saw it already. I can't fight anymore..[/say]")

		saynn("You sigh and help Tavi get into a fighting stance, lowering her torso a little and making her hover her paws near her muzzle.")

		saynn("[say=pc]You might have given up Tavi. But I didn't.[/say]")

		saynn("Maybe if you make her experience stress, her natural instincts will kick in and protect her? Who knows.")

		saynn("You and Tavi stand face to face. Tall kitty's posture still looks quite unsure. Seems she is letting you do the first move, holding her paws up to protect herself against your attack.")

		addButton("Light punch", "Test Tavi's defense", "les2_punch")
	if(state == "les2_punch"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="defeat"})
		saynn("As soon as you wind up your punch, Tavi's eyes widen with a mix of fear and uncertainty. You didn't even touch her yet and she suddenly just flops to her knees before you, seemingly already defeated.")

		saynn("You sigh and lower your guard.")

		saynn("[say=tavi]Ow..[/say]")

		saynn("[say=pc]I didn't even touch you yet..[/say]")

		saynn("Tavi shrugs and looks up at you with her adorable eyes, her ears slightly twitching, her arms crossed under her {tavi.breasts}, emphasizing them. She is looking so.. cute.. Making it painful for you to even just scold her, never mind fight. Wait..")

		saynn("[say=tavi]I'm not a violent person anymore.. Hurting anyone pains me as well.[/say]")

		saynn("A realization slowly down upon you as you smile and reach your hand out to pat Tavi.")

		saynn("[say=pc]What if.. You don't fight physically.[/say]")

		saynn("Tavi raises a brow while softly purring from the pats.")

		saynn("[say=pc]What if you use.. charm and allure as your weapons. Making people bad for hurting you while also gradually dominating them.. using your words.. or your body.[/say]")

		saynn("Tavi looks up at you, her innocent sorry eyes slowly becoming.. less innocent. Her lips are forming into a little cute smile.")

		saynn("[say=tavi]I mean.. I can try that. I still know a thing or two about dominating.[/say]")

		saynn("Tavi quickly springs up to her feet and waits for you to take your spot.")

		addButton("Fight", "See what Tavi will do", "les2_lewdfight")
	if(state == "les2_lewdfight"):
		playAnimation(StageScene.Duo, "punch", {npc="tavi", npcAction="dodge"})
		saynn("You and Tavi face each other again in her cell, both seemingly ready. You assume a combat stance while Tavi.. Just stands normally, her eyes looking a bit more confident than before.")

		saynn("As you take the first swing, Tavi suddenly evades it, masterfully stepping back while subtly swaying her hips. Her feline grace is helping her quite a bit, you found yourself momentarily distracted by the fluidity of that motion.")

		saynn("But instead of attacking, Tavi takes a step closer, swaying her hips yet again and even letting you see her breasts bouncing ever so slightly with each step. Her voice is soft and kind.")

		saynn("[say=tavi]After all.. I did make you submit to me once already.[/say]")

		saynn("She spreads her arms, inviting you to hug her.. or attack her. But as you try to punch her, Tavi dodges out of the way and only closes the distance yet again, her paws grabbing your arm at the peak of your swing.")

		saynn("[say=tavi]I'm sure I can make you submit again~.[/say]")

		saynn("She is holding your hand now.. Making your heartbeat skyrocket for some reason. But you still have free limbs.")

		addButton("Kick her", "Let's see how she will protect herself against this one", "les2_kick")
	if(state == "les2_kick"):
		playAnimation(StageScene.Duo, "kick", {npc="tavi", npcAction="hurt"})
		saynn("You squeeze her paw even more tightly to make sure she can't dodge anymore.. But doing so also made you so.. lusty.. for some reason.")

		saynn("And as you wind up a kick, Tavi braces, finally realizing her mistake.")

		saynn("Your kick connects, sending all the air out of Tavi. She hisses painfully and then coughs.")

		saynn("[say=tavi]Ow..[/say]")

		saynn("Tavi stops smiling as she loses her.. mindset.. so you decide to stop there, just holding that paw.")

		saynn("[say=pc]Nicely done. You almost won.[/say]")

		saynn("Gradually, Tavi calms down her breathing.")

		saynn("[say=tavi]I wasn't even close.[/say]")

		saynn("You shrug and smile.")

		saynn("[say=pc]Try to see the fights as a.. puzzle. You can't fight physically so there will be a lot of problems that you will have to solve, right in the middle of a brawl. While not having a lot of time.[/say]")

		saynn("Tavi hums as she extends the claws on her paw and gently prods your hand with them.")

		saynn("[say=tavi]I will think about it. Thank you.[/say]")

		addButton("Continue", "That was a nice lesson", "endthescene")
	if(state == "les3"):
		saynn("It's that time again. Time to train Tavi's newly found alternative fighting skills.")

		saynn("[say=pc]Let's do a quick sparring match.[/say]")

		saynn("Tavi's ears perk. She takes her spot near the middle of her cell and awaits when you take yours.")

		saynn("[say=tavi]Sure. Let's do this.[/say]")

		saynn("You assume your normal combat stance, while Tavi keeps her posture straight, her mood seems to be quite playful.")

		saynn("Might as well not go too hard on Tavi.")

		addButton("Strike", "Try to hit her", "les3_thefight")
	if(state == "les3_thefight"):
		playAnimation(StageScene.Hug, "hug", {npc="tavi"})
		saynn("As you take your first swing, Tavi gracefully evades the attack with a subtle sway of her hips, her feline grace captivating. She did the same thing last time but this time she seems to be much more.. confident.")

		saynn("With a cute little smile, Tavi locks eyes with you, her voice alluring and somewhat commanding.")

		saynn("[say=tavi]I like playing~. And right now you're mine to play with.[/say]")

		saynn("Her words send a little thrilling shiver down your spine, it's like she became her old Tavi for a second there.")

		saynn("As she tries to close the distance, you throw another weak punch which gets caught by her paw. You try to punch her with your free hand but that one gets caught too. Tavi is standing in front of you, her warm breathing can be felt on your face.")

		saynn("[say=tavi]Why fight, cutie~? Just let me do what I want with you~. It will be fun.[/say]")

		saynn("Both of your hands are being held by her paws.. So you try to step back and wind up a kick.. But Tavi reads your mind and just makes 2 steps forward before turning this weird tango dance into a tight hug. Her breasts brushing against your {pc.masc} chest.. are those her nipples poking you? Lewd..")

		saynn("Tavi purrs softly into your ear while rubbing against you, making your attempts to fight her properly.. weak and easily counterable..")

		saynn("[say=tavi]It's okay to surrender.. Sometimes losing can be more fun than winning.. Trust me~..[/say]")

		saynn("She holds you tightly.. Which feels very nice. But you won't go down that easy..")

		addButton("Struggle", "Try to push Tavi away", "les3_struggle")
	if(state == "les3_struggle"):
		playAnimation(StageScene.Cuddling, "idle", {pc="tavi", npc="pc"})
		saynn("You try to pry her paws off of you and push her away. Seeing that she doesn't use her claws or bites makes resisting her grab quite easy.")

		saynn("But as soon as you free yourself, Tavi just quickly circles you and ends up behind, wrapping her paws around you yet again.")

		saynn("[say=tavi]Not so fast~.[/say]")

		saynn("Tavi gently gropes your body.. your {pc.breasts}.. while rubbing against you and nuzzling your neck. It feels so nice.. The obvious solution would be to stomp on her feet.. but why would you do that to this lovely kitty that makes you feel so good..")

		saynn("The feline uses your uncertainty to her full advantage, gently nibbling on your ear and breathing warmly into it, making you feel so.. weak.")

		saynn("[say=tavi]If you're gonna be a good {pc.boy}.. I will cuddle you. Just don't try to hurt me~.[/say]")

		saynn("You.. give up any resistance. Tavi feels that and slowly pulls you down onto the floor, her paws still groping you.")

		saynn("You both settle on the floor and begin cuddling. Tavi still purrs into your ear. You lost but you don't mind it..")

		saynn("[say=tavi]There we go.. Good~.. I know you were holding back. You practically let me win. Next time.. don't pull back your punches.. mhm?[/say]")

		saynn("You nod and rest in her arms. It seems Tavi doesn't even need her claws or teeth.. Makes you wonder if this would work on others too.")

		saynn("You spend some time together, enjoying the company of each other.. while you are incredibly horny..")

		addButton("Continue", "That was a nice lesson", "endthescene")
	if(state == "les4"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("Tavi won last time. But that was because she used your past experiences with her against you. This time you will try to stay focussed and not let her teasing get to you. She can't hurt you physically anyway.")

		saynn("[say=pc]Let's fight, Tavi.[/say]")

		saynn("You take your spot. She takes hers. You lower your head a little and frown, she smiles kindly and puts her paws on her waist, looking quite relaxed.")

		saynn("As the fight begins, Tavi acts first, slowly approaching you, watching your hands while swaying her hips seductively. She purrs teasingly as she starts circling you.")

		saynn("[say=tavi]You know.. Why don't you just surrender to me? I promise you will enjoy it~.[/say]")

		addButton("Punch", "Try to attack Tavi", "les4_attack")
	if(state == "les4_attack"):
		playAnimation(StageScene.Duo, "punch", {npc="tavi", npcAction="dodge"})
		saynn("When you expect teasing.. it has a way smaller effect on you, allowing you to reach out and throw a good punch towards Tavi.")

		saynn("But, of course, she dodges out of the way at the last second. Tavi smiles softly and rubs herself against you while you recover.")

		saynn("[say=tavi]Mm-m~.. Impressive. But imagine how much better it would feel to submit to me?[/say]")

		saynn("You ignore her comment and push her, throwing the tall feline off-balance a bit.")

		saynn("[say=pc]I'm not falling for your tricks.[/say]")

		saynn("Tavi frowns a little but that emotion quickly fades away, replaced by the cheeky smile as she continues to slowly circle you, keeping enough distance to make grabbing her not worth it.")

		saynn("[say=tavi]You can have me, cutie. All you have to do is.. not fight it~.[/say]")

		saynn("She learned to expect a single attack. But what if you mix things up a bit..")

		addButton("Punch and kick", "Do two attacks in a row", "les4_firstdamage")
	if(state == "les4_firstdamage"):
		playAnimation(StageScene.Duo, "kick", {npc="tavi", npcAction="block"})
		saynn("As you throw the weak punch towards her, Tavi evades the attack with her feline grace. But instead of retaliating completely, she, again, closes the distance and tries to rub her body against you. That's when you suddenly kick her, causing Tavi to grunt painfully as she blocks the attack at the last second, her forearms sustaining most of the damage.")

		saynn("[say=tavi]Argh..[/say]")

		saynn("Tavi hisses as she rubs her wrists, her cheeky smile fading away.")

		saynn("[say=pc]Something is wrong~?[/say]")

		saynn("Tall kitty stops and looks at you, her eyes aren't so confident anymore.")

		saynn("[say=tavi]I'm fine. More than fine.[/say]")

		saynn("Suddenly Tavi wiggles her ass and then leaps at you, her paws trying to hug you tightly. Big mistake..")

		addButton("Throw her down", "Catch Tavi and redirect her towards the floor", "les4_bigdefeat")
	if(state == "les4_bigdefeat"):
		playAnimation(StageScene.Duo, "shove", {npc="tavi", npcAction="defeat"})
		saynn("Tavi's last desperate attack goes horribly wrong as you catch her and, instead of letting her hug you, throw her away and towards the floor. She yelps painfully as she hits the cold surface and collapses.")

		saynn("[say=tavi]Ouch!.. Ow.. H-hey..[/say]")

		saynn("She is huffing while licking her bruises and scratches, her tail wagging annoyed.")

		saynn("[say=pc]Some enemies will be able to resist your teasing, Tavi. They will quickly figure out that you're all bark and no bite.[/say]")

		saynn("[say=tavi]So what do I do then..[/say]")

		saynn("You shrug and crouch before her.")

		saynn("[say=pc]You once said that pain is a tool. Why not use it?[/say]")

		saynn("Tavi lowers her head.")

		saynn("[say=tavi]I can't..[/say]")

		saynn("[say=pc]You know what else you said?[/say]")

		saynn("Tavi listens to you carefully. But you're staying silent.")

		saynn("[say=tavi]You're not gonna say it?..[/say]")

		saynn("[say=pc]You know everything already, Tavi. You must reach the conclusion yourself or it won't have an effect on you.[/say]")

		saynn("She is clearly trying to bring up her old memories. But it seems like her brain is fighting her, trying to hide the right ones.")

		saynn("[say=tavi]I need to think about it..[/say]")

		saynn("You nod and decide to end the lesson there.")

		addButton("Continue", "That was an alright lesson", "endthescene")
	if(state == "les5"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("Tavi might never be able to hurt others but she still needs to figure out how to defend herself. You call her and offer to do another fight.")

		saynn("[say=tavi]You sure?..[/say]")

		saynn("You nod and watch Tavi get into her spot. Her confidence surely took a hit after the last lesson. Maybe this time she will find a way to win.. because you're not gonna give her an easy time.")

		addButton("Continue", "See what happens next", "les5_naked")
	if(state == "les5_naked"):
		addCharacter("tavi", ["naked"])
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcBodyState={naked=true}})
		saynn("You were about to do your first strike when Tavi's paws begin undoing the buttons on her shirt, exposing her {tavi.breasts} with green perky nipples. Seconds later the shorts go away too, exposing Tavi's neat pussy folds.")

		saynn("She smiles, seeing your confusion.")

		saynn("[say=tavi]What~? Might as well.[/say]")

		saynn("That will surely make focussing a little harder.. but not impossible. You just have to avoid looking at her privates and pay attention to her paws instead..")

		saynn("Tavi uses the opportunity to start walking towards you, her naked hips swaying so nicely..")

		addButton("Kick her", "You must win", "les5_kick")
	if(state == "les5_kick"):
		playAnimation(StageScene.Duo, "kick", {npc="tavi", npcAction="dodge", npcBodyState={naked=true}})
		saynn("Not everyone is gonna be attracted to her hips, you must stay cool. When Tavi closes the distance enough, you wind up a slow kick that she dodges with ease. Oh no, her naked breasts are jiggling so much as she does it. Tavi easily closes the distance yet again and even brushes her paw against your cheek.")

		saynn("[say=tavi]You like my tits, don't you? Go on, touch them~.[/say]")

		saynn("As you catch Tavi's hand, she starts holding yours back, digits intertwining with yours. Kinda wholesome..")

		saynn("But that means she can't step away anymore. You prepare another attack..")

		addButton("Continue", "See what happens next", "les5_tavi_does_pain")
	if(state == "les5_tavi_does_pain"):
		playAnimation(StageScene.Duo, "hurt", {npc="tavi", npcBodyState={naked=true}})
		saynn("You were about to attack Tavi but then her paw extends its claws and puts pressure on yours, threatening to sink them in. And as soon as you relax your grip, the tall kitty slides behind your back and uses her other hand to yank on your hair, forcing a grunt out of you.")

		saynn("[say=pc]Argh..[/say]")

		saynn("That was.. unexpected to say the least. Tavi holds you like this, her clawed paw gets pressed against the exposed part of your neck, putting pressure there now.")

		saynn("[say=pc]How are you..[/say]")

		saynn("She leans closer to your ear, growling softly.")

		saynn("[say=tavi]I realized something very important~.[/say]")

		saynn("Tavi bares her fangs and gently bites your ear, sending shivers down your spine.")

		saynn("[say=tavi]The painful sensations in the right circumstances can be as pleasurable as the sexual one, if not more~.[/say]")

		saynn("She is not.. wrong. You can't deny that having your hair pulled by a naked tall kitty that is now rubbing against you while nibbling your ears.. provides some nice contrast.")

		saynn("But you gotta resist still.")

		addButton("Reist", "Try to get out of her grasp", "les5_lose")
	if(state == "les5_lose"):
		playAnimation(StageScene.SexFaceSitting, "sit", {pc="tavi", npc="pc", bodyState={naked=true}})
		saynn("Tavi is behind you, holding your hair.. Best thing you can come up with is stomping on her feet.")

		saynn("But as soon as you raise your leg, Tavi sees it and yanks on your hair harder, bringing you down to the floor before pinning you.. using her body.")

		saynn("[say=tavi]Not so fast~.[/say]")

		saynn("Wow. Your head is trapped between her thighs, your eyes gaze upon her wet pussy. Tavi is smiling softly, watching you squirm under her.")

		saynn("You realize that you lost. But you don't even mind it.")

		saynn("[say=pc]Um. Good job.[/say]")

		saynn("[say=tavi]Uh huh~.[/say]")

		addButton("Enough", "That was a pretty good fight", "les5_enough")
		addButton("Lick Tavi out", "Get to work", "les5_lick")
	if(state == "les5_enough"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcBodyState={naked=true}})
		saynn("You carefully spread open her legs and crawl from under her. Tavi seems a bit disappointed but she smiles anyway.")

		saynn("[say=tavi]Next time you lose I won't let you go~.[/say]")

		saynn("Fair enough. You pat Tavi for figuring this whole fighting thing out. All she needs now is just more practice.")

		addButton("Continue", "That was a nice lesson", "endthescene")
	if(state == "les5_lick"):
		playAnimation(StageScene.SexFaceSitting, "grind", {pc="tavi", npc="pc", bodyState={naked=true}})
		saynn("Without saying much after that, you grab onto Tavi's and forcibly lower them, letting the tall kitty rest her crotch on your face.")

		saynn("[say=tavi]So eager.. Just like old times..[/say]")

		saynn("Tavi bites her lip and moans softly as you let your tongue out and start dragging it over her moist green pussy folds. It seems being a little rough and confident also makes her horny. You use the tip of your tongue to play with her clit and that makes Tavi arch her back and press her"+str(" virgin" if getModule("TaviModule").isVirgin() else "")+" slit into your face harder.")

		saynn("[say=tavi]Oh fuck~..[/say]")

		saynn("You can't really talk so you focus on lapping up her juices and teasing her folds. At some point it becomes too much for Tavi and so she starts riding your face, grinding her pussy against you and spreading her juices.")

		saynn("[say=tavi]I'm sorry, Owner. But it feels too good~.[/say]")

		saynn("Might as well allow her to do it.. this time. You stick your tongue out more and let the feline rub her crotch against.. until her muscles begin to tense up.")

		saynn("[say=tavi]Oh.. I'm gonna..[/say]")

		saynn("You can feel it quite well. Tavi's thighs close around your head tighter while her pussy starts pulsating and.. even squirts a little, covering your face with transparent lewd fluids. Her whole body shivers as she is going through her powerful orgasm. Her paws land on your chest and scratch it.. but you don't mind.")

		saynn("[say=tavi]Yes-s~.. I'm such a good girl, aren't I? I know I am~.[/say]")

		saynn("What a brat.. Tavi gets off your face, finally allowing you to breathe fully. Then kitty leans in closer and playfully licks your cheek.")

		saynn("[say=tavi]Tasty~.[/say]")

		saynn("You pat Tavi for figuring this whole fighting thing out. All she needs now is just more practice.")

		addButton("Continue", "That was a nice lesson", "endthescene")
	if(state == "sparring"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("You invite Tavi to do a little sparring match.")

		saynn("She takes her spot and prepares.")

		saynn("[say=tavi]Let's see how much I've learned~.[/say]")

		saynn("Tavi will only get more skilled if you win.")

		addButton("Fight", "Start the fight", "do_fight")
	if(state == "sparring_lost"):
		playAnimation(StageScene.Duo, "defeat", {npc="tavi", npcBodyState={naked=true}})
		saynn("Defeated, you drop to your knees before Tavi.")

		saynn("The feline is smiling. Wait, how is she naked already..")

		addButton("Continue", "See what happens next", "spar_tavi_rides_face")
	if(state == "spar_tavi_rides_face"):
		playAnimation(StageScene.SexFaceSitting, "grind", {pc="tavi", npc="pc", bodyState={naked=true}})
		saynn("Tavi suddenly tackles you and then sits on your head, shoving her pussy into your face.")

		saynn("[say=tavi]You lost, fair and square~.[/say]")

		saynn("She traps your head between her girly thighs and starts grinding her sensitive petals against your face features, moaning softly as the friction provides her stimulation.")

		saynn("Hard to say anything when someone's pussy is pressed against your lips.. So you just accept the loss and let Tavi ride you. Her horny scent is amazing though, you can't stop yourself from flicking your tongue out for a second and tasting her. But Tavi clearly wants more..")

		saynn("[say=tavi]Don't hide that tongue~.[/say]")

		saynn("She drags her claws over your cheeks until you submit and let your tongue roll out. Tavi instantly starts rubbing her pussy against it, her panting mixes with the occasional noise of love.")

		saynn("[say=tavi]Good {pc.boy}.. Lick that"+str(" virgin" if getModule("TaviModule").isVirgin() else "")+" pussy up..[/say]")

		saynn("Tavi holds onto your head while grinding her pussy against it.. harder and harder.. until the orgasm finally makes her body lock up and start shaking. Her thighs squeezing your head tight while her pulsing slit creates a strong torrent of her transparent girlcum, marking your face with her scent.")

		saynn("[say=tavi]Ngh-h~..[/say]")

		saynn("As Tavi raises herself from your face, you lick your lips, swallowing some of it.")

		saynn("At least you can tell yourself that it was just training..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "sparring_won"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="defeat"})
		saynn("Tavi falls to her knees before you, unable to continue fighting.")

		saynn("She has lost. But at least it feels like she got some experience out of this.")

		saynn("[say=tavi]How did I do..[/say]")

		addButton("Good", "Tell her that she did well", "sparring_enough")
	if(state == "sparring_enough"):
		saynn("You approach Tavi and pat her on the head.")

		saynn("[say=pc]You did well, Tavi.[/say]")

		saynn("You hear soft purring coming from her. She is not so upset anymore about losing.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "les1"):
		getModule("TaviModule").advanceSkill("taviSkillCombat", 1)

	if(_action == "les2"):
		getModule("TaviModule").advanceSkill("taviSkillCombat", 2)

	if(_action == "les3"):
		getModule("TaviModule").advanceSkill("taviSkillCombat", 3)

	if(_action == "les4"):
		getModule("TaviModule").advanceSkill("taviSkillCombat", 4)

	if(_action == "les5"):
		getModule("TaviModule").advanceSkill("taviSkillCombat", 5)

	if(_action == "cancel_lesson"):
		increaseFlag("TaviModule.Ch6Tiredness", -1)
		endScene()
		return

	if(_action == "les1_oops"):
		processTime(3*60)

	if(_action == "les1_ow"):
		GM.pc.addPain(1)

	if(_action == "les2_punch"):
		processTime(3*60)

	if(_action == "les2_lewdfight"):
		processTime(10*60)

	if(_action == "les2_kick"):
		processTime(2*60)
		GM.pc.addLust(30)

	if(_action == "les3_thefight"):
		processTime(10*60)
		GM.pc.addLust(50)

	if(_action == "les3_struggle"):
		processTime(3*60)
		GM.pc.addLust(50)

	if(_action == "les4_attack"):
		processTime(3*60)

	if(_action == "les4_firstdamage"):
		processTime(3*60)

	if(_action == "les4_bigdefeat"):
		processTime(2*60)

	if(_action == "les5_naked"):
		processTime(3*60)

	if(_action == "les5_kick"):
		GM.pc.addLust(30)

	if(_action == "les5_tavi_does_pain"):
		processTime(3*60)
		GM.pc.addPain(20)
		GM.pc.addLust(20)

	if(_action == "les5_lose"):
		processTime(6*60)
		GM.pc.addLust(20)

	if(_action == "les5_lick"):
		processTime(10*60)
		GM.pc.cummedOnBy("tavi")

	if(_action == "do_fight"):
		runScene("FightScene", ["tavi", "tavi_lust_battle"], "tavi_fight")
		return

	if(_action == "spar_tavi_rides_face"):
		processTime(10*60)
		GM.pc.cummedOnBy("tavi")
		GM.pc.cummedInMouthBy("tavi", FluidSource.Vagina, 0.2)

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "tavi_fight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			getModule("TaviModule").advanceSkill("taviSkillCombat")
			setState("sparring_won")
			addExperienceToPlayer(10)
		else:
			setState("sparring_lost")
