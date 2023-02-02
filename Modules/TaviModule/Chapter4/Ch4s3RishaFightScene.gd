extends SceneBase

func _init():
	sceneID = "Ch4s3RishaFightScene"

func _run():
	if(state == ""):
		addCharacter("rishatau")
		addCharacter("jaxontau")
		addCharacter("directortau")
		playAnimation(StageScene.Duo, "holdpistol", {npc="rishatau"})
		saynn("You stand opposite of Risha, a few meters away from her. She smiles at you. And so you smile back, tightly gripping your training energy pistol.")

		saynn("Suddenly Risha lunges forward at you, like a bull, sticking her powerful shoulder forward.")

		addButton("Aim gun", "Try to shoot her before she reaches you", "st1_aimgun")
		addButton("Dodge", "She is strong but you are faster. Try to avoid her attack", "st1_dodge")
	if(state == "st1_aimgun"):
		playAnimation(StageScene.Duo, "defeat", {npc="rishatau"})
		saynn("You raise your energy gun and try to aim it at Risha but it is too late to shoot, the lynx hits you like a truck, causing you to fly into the wall behind and drop your weapon.")

		saynn("Ow, that wasn't the best start. But Risha has a huge advantage over you. You slide down to the floor while the lynx chuckles. Both Jaxon and the director stand still and watch the scene unfold.")

		saynn("[say=jaxontau]Learn to read your opponent, Tavi. Risha is no match for you, strength-wise.[/say]")

		saynn("[say=rishatau]Don't listen to him. You can do it, Tavi~.[/say]")

		saynn("She aims the gun at you. And she is very close.")

		addButton("Disarm her", "She stands awfully close to you", "st2_gun")
		addButton("Make her trip", "Use your legs", "st2_trip")
	if(state == "st1_dodge"):
		playAnimation(StageScene.Duo, "defeat", {npc="rishatau"})
		saynn("Rather than trying to shoot her now, you decide to wait for a good moment before quickly sidestepping to the side, making Risha miss you.")

		saynn("What you didn't realize is that Risha is a stubborn girl, she quickly pushes off the wall and lunges at you again, easily bringing you down with one rough shove. You drop your weapon before hitting the floor.")

		saynn("Ow, that wasn't the best start. But Risha has a huge advantage over you.")

		saynn("[say=jaxontau]Can't dodge everything, Tavi. Risha is a cat too, she is both agile and strong.[/say]")

		saynn("[say=rishatau]Don't listen to him. You can do it, Tavi~.[/say]")

		saynn("She aims the gun at you. And she is very close.")

		addButton("Disarm her", "She stands awfully close to you", "st2_gun")
		addButton("Make her trip", "Use your legs", "st2_trip")
	if(state == "st2_gun"):
		playAnimation(StageScene.Duo, "firepistol", {npc="rishatau"})
		saynn("You expect her to shoot. And that makes it easier to react. As soon as you see Risha's finger tightening around the trigger, you dodge to the side and then reach forward, slapping her hand and stealing her gun. Only the tip of your ear got slightly scorched by her shot, leaving a slight burn mark.")

		saynn("Risha growls and tries to grab you but you are faster, aiming her own gun at her and shooting the lynx right in the chest. Risha hisses and recoils away while her leotard receives a little hole.")

		saynn("Risha tries to grab you again but this time it was very easy to predict, you avoid her hands and rush to the other side of the room.")

		saynn("[say=rishatau]Run all you can, Tavi. You will just be tired when you lose.[/say]")

		saynn("Risha just looks at you, trying to predict your next move.")

		addButton("Aim at chest", "Aim at the center of mass", "st3_aimchest")
		addButton("Aim at legs", "Aim at Risha's legs", "st3_aimlegs")
	if(state == "st3_aimchest"):
		playAnimation(StageScene.Duo, "firepistol", {npc="rishatau", npcAction="shove"})
		saynn("You aim the gun at Risha. She sees that instantly dashes towards you again while blocking with her powerful arms. You shoot once and hit one of her wrists. Sadly, that wasn't enough to stop her.")

		saynn("Risha grunts but she was fast enough to grab you by the neck. She quickly tightens her grip, making breathing harder and causing you to drop your gun. She glares at you while shaking her free hand, the one that got damaged.")

		saynn("[say=rishatau]Nice try. I wonder if you're into being choked.[/say]")

		saynn("[say=jaxontau]Sometimes you gotta play dirty, Tavi.[/say]")

		addButton("Claw at", "Use your claws on her hand", "st4_clawat")
		addButton("Kick crotch", "Use your free legs to deliver a low blow", "st4_kickballls")
	if(state == "st4_clawat"):
		playAnimation(StageScene.Duo, "stand", {npc="rishatau", npcAction="defeat"})
		saynn("The lack of air quickly makes you weaker. And more desperate. But you're not ready to give just yet. You extend your claws and sink them into Risha's hand before leaving many scratches.")

		saynn("Risha grunts and hisses as you do that. Her grip gets lowered enough for you to break free and fall to your knees, coughing and gasping for air. All the while Risha is left with both of her arms wounded. You both see the gun on the ground and decide to go for it.")

		saynn("But you were first, successfully grabbing it first and then shooting Risha in the chest. And again. And again. Risha blocks a few shoots with her wounded arms so you aim for her legs, causing the lynx to quickly collapse onto the floor.")

		saynn("[say=rishatau]Argh! Enough![/say]")

		saynn("You press your foot into her chest and aim at her head. She raises her arms. But Jaxon quickly snatches the gun from your hands.")

		saynn("[say=jaxontau]Hey. You did good, Tavi.[/say]")

		addButton("Continue", "See what happens next", "tavi_gonna_lose")
	if(state == "st4_kickballls"):
		playAnimation(StageScene.Duo, "stand", {npc="rishatau", npcAction="defeat"})
		saynn("The lack of air quickly makes you weaker. And more desperate. But you're not ready to give just yet. Your hands try to pry her digits off of your neck but that proves to be impossible. So you go for the low blow and ram your knee into Risha's crotch.")

		saynn("She yelps and lets go of your neck before dropping to her knees and grabbing onto her damaged goods.")

		saynn("[say=rishatau]You little.. bitch.. Ugh..[/say]")

		saynn("Her pain gives you enough time to recover your breathing and grab the dropped gun off the floor. You hold Risha at gunpoint.")

		saynn("[say=rishatau]Fine.. I give up.[/say]")

		saynn("Jaxon walks up to you and fetches the gun from your hands.")

		saynn("[say=jaxontau]Hey. You did good, Tavi.[/say]")

		addButton("Continue", "See what happens next", "tavi_gonna_lose")
	if(state == "st3_aimlegs"):
		playAnimation(StageScene.Duo, "firepistol", {npc="rishatau", npcAction="defeat"})
		saynn("You aim the gun at Risha. She sees that instantly dashes towards you again while blocking with her powerful arms. But instead of her chest, you aim for her legs. And so your first shot causes Risha to hit the floor.")

		saynn("Risha grunts and rubs her little burn mark near her ankle.")

		saynn("[say=pc]Just give up already.[/say]")

		saynn("[say=jaxontau]Don't be merciful, Tavi. The enemy is not gonna spare you.[/say]")

		saynn("Risha spots the gun. The other gun. The one that you started with, lying there, on the floor, not that far from her. She dives for it.")

		addButton("Aim at her", "Make Risha regret it", "st4_shootrisha")
		addButton("Aim at gun", "Shoot the gun away from her", "st4_shootgun")
	if(state == "st4_shootrisha"):
		playAnimation(StageScene.Duo, "firepistol", {npc="rishatau", npcAction="kneel"})
		saynn("You agree with the guy and pull the trigger a few more times. One weak energy energy blast hits Risha's arm, another one hits her back. The lynx stops trying to reach for the gun and raises her hands.")

		saynn("[say=rishatau]Fine.. I give up.[/say]")

		saynn("You keep the weapon aimed at her while approaching the other gun and picking it up, leaving no chances.")

		saynn("Jaxon walks up to you and fetches the guns.")

		saynn("[say=jaxontau]Hey. You did very well, Tavi.[/say]")

		addButton("Continue", "See what happens next", "tavi_gonna_lose")
	if(state == "st4_shootgun"):
		playAnimation(StageScene.Duo, "firepistol", {npc="rishatau", npcAction="kneel"})
		saynn("You decide to spare the lynx from more pain and instead aim for the gun. One highly-precise shot sends the gun flying away from Risha. She grumbles. And since there is nothing else she can do, Risha raises her hands.")

		saynn("[say=rishatau]Fine.. I give up.[/say]")

		saynn("You keep the weapon aimed at her while approaching the other gun and picking it up, leaving no chances.")

		saynn("Jaxon walks up to you and fetches the guns.")

		saynn("[say=jaxontau]You will have to learn to kill at some point, Tavi. But you did very well.[/say]")

		addButton("Continue", "See what happens next", "tavi_gonna_lose")
	if(state == "st2_trip"):
		playAnimation(StageScene.Duo, "stand", {npc="rishatau"})
		saynn("You decide to use your legs to help you by sweeping Risha off her feet. She wasn't expecting to hit the floor so soon, her gun gets tossed away somewhere far.")

		saynn("You gotta act fast while you're ahead. You straddle Risha and begin choking her out, applying pressure to her throat, making breathing harder. This quickly becomes dirty.")

		saynn("But Risha begins to pry your paws off of her neck quite easily, using her sheer strength.")

		saynn("[say=rishatau]You're more kinky than I thought, Tavi.[/say]")

		saynn("Suddenly Risha throws you off away from her and towards the bed. You both get up onto your feet but the lynx is already walking towards you with a smile on her face.")

		saynn("[say=jaxontau]Use everything you can, Tavi. Every fight is a fight for survival.[/say]")

		addButton("Jump over", "That bed can give you a good point to jump over Risha", "st3_jumpbed")
		addButton("Tease", "Change tactics completely", "st3_tease")
	if(state == "st3_jumpbed"):
		saynn("There is no way you can win against Risha in a head-on fight, you quickly learned that. And all the guns are scattered on the floor, you notice one behind the lynx. But she blocks you from getting to it. She corners you.")

		saynn("[say=rishatau]You're so quiet. Cat's got your tongue~?[/say]")

		saynn("But instead of answering, you get on Risha's bed and leap over her head in one beautiful motion before doing a graceful land and roll. Your paws grab the energy gun and aim it at the lynx.")

		saynn("[say=rishatau]Hey! You little..[/say]")

		saynn("Risha pivots and rushes towards you. Without too much hesitation, you pull the trigger. And then again and again, sending weak blasts of energy towards Risha. She absorbs the first one but each next makes her less eager to fight you. The gun in your paws heats up until it refuses to shoot anymore.")

		addButton("Throw gun", "Throw the gun at Risha", "st4_throwgun")
		addButton("Kick", "Risha seems weak enough for you to just kick her", "st4_finishingkick")
	if(state == "st4_throwgun"):
		playAnimation(StageScene.Duo, "throw", {npc="rishatau", npcAction="defeat"})
		saynn("You see that the weapon needs some cooling before it can fire again. You obviously have no time for that so you just throw the thing at Risha, aiming for her head. The lynx didn't see it coming.")

		saynn("Bonk.")

		saynn("The muscular cat gets confused, she loses balance and collapses shortly after. That gives you enough time to go grab the second gun and pin Risha to the floor.")

		saynn("[say=rishatau]Fine. I give.[/say]")

		saynn("Jaxon walks up to you and fetches the gun.")

		saynn("[say=jaxontau]Good job, Tavi, you were very resourceful.[/say]")

		addButton("Continue", "See what happens next", "tavi_gonna_lose")
	if(state == "st4_finishingkick"):
		playAnimation(StageScene.Duo, "kick", {npc="rishatau", npcAction="defeat"})
		saynn("The last shot wasn't enough. And the gun is all out of juice. But Risha also doesn't seem to be that threatening now. You get a good run-up and jump before shoving both of your legs into the lynx's chest, executing a perfect dropkick.")

		saynn("Risha grunts as she recoils back and falls to her knees, seemingly defeated by your stunt. Your kick forced all the air out of her lungs, making her pant heavily. All the while you quickly get up off the floor and go find another gun.")

		saynn("[say=rishatau]Fine.. I give..[/say]")

		saynn("Jaxon walks up to you and fetches the gun.")

		saynn("[say=jaxontau]Good job, Tavi, your kicks are something else.[/say]")

		addButton("Continue", "See what happens next", "tavi_gonna_lose")
	if(state == "st3_tease"):
		saynn("There is no way you can win against Risha in a head-on fight, you quickly learned that. And all the guns are scattered on the floor, you notice one behind the lynx. But she blocks you from getting to it. She corners you.")

		saynn("[say=rishatau]You're so quiet. Cat's got your tongue~?[/say]")

		saynn("When all choices are bad, you gotta follow your heart. Means that it's time for some experimentation. Instead of trying to fight back, you put on a kind but cunning smile and spread your arms, offering a hug.")

		saynn("[say=pc]No, my tongue is still here, see~.[/say]")

		saynn("You stick out your tongue while Risha puts her paws on you before pinning to the nearest wall. You offer no resistance, instead putting one paw on her breasts and another on her crotch, teasing both. That makes the lynx confused. Jaxon and the director are now paying way more attention than they were.")

		saynn("[say=rishatau]What are you doing, Tavi?[/say]")

		saynn("You lean in towards Risha's ear and purr playfully into it.")

		saynn("[say=pc]If you let me win, I might just offer you a fun time~.[/say]")

		saynn("Risha raises her brow. All the while your paws continue to knead her bits, causing her nips to get stiffer and her package to put more pressure on the leotard. Her paws lower pressure on you.")

		saynn("[say=rishatau]Is that a promise?[/say]")

		saynn("You continue smiling while slowly prying her paws off of you. Then you look at the bed nearby and wink to Risha while biting your lip. The lynx deliberates a bit but then turns her head towards the observers. Now seems to be the best time to attack.")

		addButton("Kick crotch", "Make it sting hard", "s4_kickcrotchtease")
		addButton("Grab gun", "Rush for the gun while Risha is confused", "s4_grabguntease")
	if(state == "s4_kickcrotchtease"):
		playAnimation(StageScene.Duo, "kick", {npc="rishatau", npcAction="defeat"})
		saynn("Your paws slide back to Risha's breasts before catching on to her hard nips with your claws. And as soon as the lynx directs her attention back at you to complain, you shove your knee between her legs, causing a huge spike of pain for the poor cat.")

		saynn("[say=rishatau]You litt-.. fuck..[/say]")

		saynn("Risha grabs onto her crotch and yelps. You offer her no support so the lynx swiftly collapses onto the floor. You see that Jaxon is wincing too.")

		saynn("[say=jaxontau]That was rough, Tavi.[/say]")

		saynn("You take your time and pick up one of the guns off the floor before approaching Risha again.")

		saynn("[say=rishatau]Bitch.. so unfair. Ugh.[/say]")

		saynn("[say=pc]Tell me about it.[/say]")

		saynn("You offer the cat a cheeky smile. Jaxon walks up to you and fetches the gun.")

		saynn("[say=jaxontau]Good job, Tavi. You saw Risha's weakness.[/say]")

		addButton("Continue", "See what happens next", "tavi_gonna_lose")
	if(state == "s4_grabguntease"):
		playAnimation(StageScene.Duo, "aimpistol", {npc="rishatau", npcAction="kneel"})
		saynn("You take the chance and shove Risha away before diving for the energy gun on the floor. The lynx stumbles and falls onto her bed before you aim the gun at her. The cat quickly understands that she is screwed if she moves.")

		saynn("[say=rishatau]Fuck. You lied. Such a buzzkill.[/say]")

		saynn("[say=pc]Never fight if you're horny, Risha.[/say]")

		saynn("Risha raises her paws and kneels.")

		saynn("[say=rishatau]I fight because I'm horny, Tavi.[/say]")

		saynn("You offer the cat a cheeky smile. Jaxon walks up to you and fetches the gun.")

		saynn("[say=jaxontau]Good job, Tavi. You saw Risha's weakness.[/say]")

		addButton("Continue", "See what happens next", "tavi_gonna_lose")
	if(state == "tavi_gonna_lose"):
		playAnimation(StageScene.Duo, "defeat", {npc="rishatau"})
		saynn("The director claps softly in the background. You feel prideful. But suddenly Risha grabs onto your leg and twists it painfully before overpowering you and pinning into the floor. You cry out from pain as she wrenches your arm behind your back, seemingly about to make it pop out of its socket.")

		saynn("[say=pc]Fuck! AGH![/say]")

		saynn("[say=rishatau]Never lose your focus, Tavi.[/say]")

		saynn("[say=jaxontau]True. That's gonna be a lesson for you. Alright, you two can stop.[/say]")

		saynn("Risha looks you in the eyes and puts on an evil smile. You two are kinda close and she has full control at the moment. But in the end she lets go of your arm and gets up before offering you a helping hand.")

		saynn("You decide not to decline the help and use it to get up off the floor.")

		addButton("Continue", "See what happens next", "after_fight")
	if(state == "after_fight"):
		playAnimation(StageScene.Duo, "stand", {npc="rishatau"})
		removeCharacter("directortau")
		saynn("Risha gently pats you on your shoulder. You swipe your leotard and fix your hair. As you do that, you catch the director's gaze. He was silent this whole time.")

		saynn("Jaxon walks up to him.")

		saynn("[say=jaxontau]So, wanna look at more of AlphaCorp's best future soldiers?[/say]")

		saynn("[say=directortau]No.[/say]")

		saynn("Jaxon scratches behind his head.")

		saynn("[say=jaxontau]Right. I heard you're staying here until tomorrow, we still have time.[/say]")

		saynn("[say=directortau]I saw enough. I will be in my quarters.[/say]")

		saynn("[say=jaxontau]Of course, sir.[/say]")

		saynn("His voice has way more bass than when hearing him through the speakers. And just like that, he leaves the room.")

		saynn("Risha whispers into your ear.")

		saynn("[say=rishatau]That guy creeps me out.[/say]")

		saynn("[say=pc]Yeah.. I get a feeling he doesn't like me.[/say]")

		saynn("[say=rishatau]Relax, very soon we won't need to see his face ever again.[/say]")

		saynn("Jaxon returns to you two.")

		saynn("[say=jaxontau]Okay ladies. Enough murmuring to each other. Follow me, Tavi.[/say]")

		saynn("[say=pc]Sure. See you, Risha.[/say]")

		saynn("The lynx nods and does some stretches as you prepare to leave.")

		addButton("Follow", "See where he brings you", "follow_jaxon")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "follow_jaxon"):
		runScene("Ch4s4JaxonTalkScene")
		endScene()
		return

	setState(_action)
