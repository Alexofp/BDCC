extends SceneBase

var first_npc_id = ""
var second_npc_id = ""

func _init():
	sceneID = "Ch4s8KaitScene"

func _run():
	if(state == ""):
		addCharacter("kait")
		saynn("It's early morning, most of the inmates are just waking up. Especially lilacs, their lifestyle makes them stay up during nights, to provide entertainment and such. You look around, searching for a snow leopard that somewhat ruined your last mission.")

		saynn("Here she is, the kitty has just left her spacious cell and is doing stretches, such a cat. Gotta act quick while she is still around.")

		addButton("Confront", "Ask Kait why she decided to betray you and Tavi", "confront_kait")
	if(state == "confront_kait"):
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		saynn("Kait was in the process of yawning when you suddenly shove her back into her cell and then pin her against the wall. The lilac cat gasps when you do that.")

		saynn("[say=kait]Wha..[/say]")

		saynn("[say=pc]Why did you snitch on us?[/say]")

		saynn("Kait blinks a lot, her paws try to free herself but it's not that hard to keep her pinned.")

		saynn("[say=kait]The heck is your problem? Tavi's cell is too cramped?[/say]")

		saynn("You shake her.")

		saynn("[say=pc]Talk already.[/say]")

		saynn("Kait's annoyed eyes flash brightly.")

		saynn("[say=kait]What? Did your last mission fail? What a shame. Tavi is probably already looking for a new pet.[/say]")

		saynn("Kait raises her knee and gently presses it into your stomach before applying a fair amount of strength to push you back, escaping your grasp.")

		saynn("[say=kait]I have no idea what you're talking about, don't try to pull me into your problems. And get out of my cell.[/say]")

		saynn("You gotta be a little bit more persuasive if you want the answers.")

		addButton("Kind", "Ask her again nicely", "ask_nicely")
		addButton("Rough", "Try to force the answer out of her", "ask_rough")
	if(state == "ask_nicely"):
		saynn("You decide not to pin her again. But you do stand near the doorframe.")

		saynn("[say=pc]Okay, let's start again. Listen, the captain somehow knew what we were up to. And you were the latest person who saw us. I'm not blaming you yet but I'd like an explanation.[/say]")

		saynn("Kait raises a brow and crosses her arms.")

		saynn("[say=kait]Again, shame that your plans got busted. But I'm the last person who would want to screw over others like that.[/say]")

		saynn("[say=pc]You are angry at Tavi though.[/say]")

		saynn("Kait growls softly.")

		saynn("[say=kait]I have a reason, okay? Bitch talks about communication and trust. And then fucking ghosts me out of nowhere.[/say]")

		saynn("Hard to tell if she is lying. Well, she isn't lying about Tavi ghosting her. Maybe she just didn't have anything to do with it. Beating her up probably won't accomplish anything but to make you and Tavi feel better.")

		addButton("Be rough", "Might as well try the rough approach", "ask_rough")
		addButton("Leave", "Admit that she doesn't know anything", "try_to_leave")
	if(state == "ask_rough"):
		saynn("The cat is practically asking for it. You pounce at her and push her against the wall, your arm is wrapped around her neck, pressing on her throat just above the collar. Your rough grip makes her stand on her toes.")

		saynn("[say=pc]There is no way the captain would have been able to prepare that ambush without you.[/say]")

		saynn("Kait hisses and tries to pry your arm off.")

		saynn("[say=pc]You are his pet now, aren't you? Your slutty mouth whispering to him everything that happens in the prison.[/say]")

		saynn("[say=kait]Why the fuck.. argh.. would I do that?[/say]")

		saynn("Kait tries to kick you again but this time you're ready, you leave her legs zero room to do anything. The cat's tail is wagging.")

		saynn("[say=pc]Because you hate Tavi for what she did. You wanted revenge. Isn't that right, slut?[/say]")

		saynn("You tighten the grip around her neck, Kait starts to gasp for air.")

		saynn("[say=kait]Let go.. I will.. tell..[/say]")

		saynn("Can you trust her though?")

		addButton("Beat her up", "Make her tell you everything by force", "beat_kait_up")
		addButton("Stop choking", "Listen to what she has to say", "stop_choking_kait")
	if(state == "stop_choking_kait"):
		saynn("You relax your grip, letting the cat breathe. But you still hold her by the collar, Kait looks way more.. willing.. already.")

		saynn("[say=pc]Spill it.[/say]")

		saynn("[say=kait]I.. I had nothing.. to do with that.[/say]")

		saynn("You furrow your brows again and are about to choke her again when she stops you.")

		saynn("[say=kait]But.. I understand you, okay? I do have my problems with Tavi. But ratting you two out to the captain.. that would be stupid on my part, don't you think?[/say]")

		saynn("[say=pc]Then how did he know?[/say]")

		saynn("Kait shrugs as best as her position allows.")

		saynn("[say=kait]I want to escape this prison as much as you and Tavi do. And I need all the friends that I could get. I don't need enemies.[/say]")

		saynn("You think about it for a second. So far her story does line up. Maybe Tavi was wrong. Maybe someone else ratted you out. Better ask her again.")

		saynn("You take a step back, letting Kait catch her breath. She rubs her neck.")

		saynn("[say=kait]Do I look like I'm the captain's pet? I demand my golden pet bed and my golden pet bowl then.[/say]")

		saynn("[say=pc]You do look like you would make a good pet though.[/say]")

		saynn("[say=kait]PFf-f. No you.[/say]")

		addButton("Leave", "Admit that she doesn't know anything", "try_to_leave")
	if(state == "try_to_leave"):
		saynn("[say=pc]Fine, you don't know anything about it.[/say]")

		saynn("You prepare to leave but this time it's Kait who suddenly stops you.")

		saynn("[say=kait]Leaving already~?[/say]")

		saynn("You glare at Kait. She offers you a cunning smile, her fluffy tail wags a lot behind her back.")

		saynn("[say=kait]Now it's my time to ask questions. Right after I get my apology.[/say]")

		saynn("She extends her claws and wiggles her girly rear slightly, like a cat that is about to pounce at its prey. It seems she won't just let you go now.")

		saynn("[say=pc]You're trying to be like Tavi way too much.[/say]")

		saynn("[say=kait]Hey! I'm not! I'm not into feet stuff for once.[/say]")

		saynn("[say=pc]Way more submissive though.[/say]")

		saynn("Kait bares her fangs and growls.")

		saynn("[say=kait]I will show you. You will be worshiping every inch of my body when I'm done with you.[/say]")

		saynn("Seems like she wants to fight.")

		addButton("Fight", "Start the fight", "fight_kait")
		addButton("Run!", "Try to escape the fight", "run_from_fight")
	if(state == "run_from_fight"):
		playAnimation(StageScene.Solo, "stand")
		saynn("Since you're standing near the door, you just take off and escape before Kait can do her first blow. You only hear Kait taunting you.")

		saynn("[say=kait]What a pussy![/say]")

		saynn("Well, at least you avoided the fight. Even if you didn't learn much, it's pretty safe to say that Kait had nothing to do with it.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "if_won"):
		setFlag("TaviModule.Ch4KaitFoundBug", true)
		playAnimation(StageScene.Duo, "stand", {npc="kait", npcAction="defeat"})
		saynn("Kait collapses after losing the fight. But as she does that, you hear.. a noise. Like something metallic has just hit the floor and bounced a few times.")

		saynn("[say=pc]What was that?[/say]")

		saynn("The feline grunts, trying to get up but failing. You look around and spot.. an object. A very small one, about the size and shape of a coin. But it seems to have some circuitry inside. It sounded like it fell out of Kait's collar.")

		saynn("[say=kait]Argh..[/say]")

		saynn("You pick up the unknown object. Kati's eyes go big when she sees that coin-shaped little device.")

		saynn("[say=kait]What the..[/say]")

		saynn("[say=pc]You clearly know what this is. Explain before I break some of your bones.[/say]")

		saynn("[say=kait]It's a.. uhm. Looks like a bug..[/say]")

		saynn("Huh? Is she a spy?")

		saynn("[say=pc]And you've been carrying it all this time?[/say]")

		saynn("Her eyes jump from spot to spot in panic. She then suddenly snatches it out of your hand and smashes against the floor.")

		saynn("[say=kait]I'm as surprised as you, okay?![/say]")

		saynn("[say=pc]Why do I get a feeling that you're lying?[/say]")

		saynn("[say=kait]Why would I need a fucking bug in my collar to rat on you?[/say]")

		saynn("You can feel genuine passion from her, the cat is truly upset. But in the end, it seems you getting caught was still her fault, whether she had anything to do with it or not.")

		addButton("Leave", "This answer satisfies you", "leave_kait")
		addButton("To stocks", "Punish the cat by locking her into the stocks", "start_stocks_kait")
	if(state == "beat_kait_up"):
		setFlag("TaviModule.Ch4KaitFoundBug", true)
		setFlag("TaviModule.Ch4KaitGotBeatenUp", true)
		playAnimation(StageScene.SexStart, "start", {npc="kait"})
		saynn("The bitch had plenty of time to tell you everything, stopping now would just let her confuse you more with her cunning tactics.")

		saynn("Instead of letting go, you slam the lilac against the wall behind her before delivering a punch to her stomach, forcing all the air out of her.")

		saynn("[say=kait]UGh, you fucker!..[/say]")

		saynn("She extends her claws and lunges at you. Her speed allowed her to scratch your shoulder once but when her second attempt happened, you managed to catch her wrist, bend to an uncomfortable angle and then run it claws-first into the metal wall behind her. Ow, you hear something inside her palm shattering, a few claws cracking. A loud cry tries to escape from the cat but you were quick to cover her mouth.")

		saynn("[say=pc]What was that? I think I misheard, right?[/say]")

		saynn("Kait hisses into your hand, you protect yourself from her second clawed paw with your shoulder but you know that she is about to do something silly, probably with using her legs. So when you notice her hips tensing up, you just stomp on her right foot which turned out to be her dominant one. The poor cat produces a stifled cry and bites into your hand, causing you to stagger back, letting go of her.")

		saynn("Kait yelps and loses balance before hitting the floor. Something metallic hits the floor and bounces a few times. When you prepare for another stomp, the cat gets into a fetal position, protecting herself.")

		saynn("[say=kait]Stop!.. Please! Agh..[/say]")

		saynn("Your hand reaches for her collar and pulls her up before pushing her against the wall.")

		saynn("[say=pc]Talk.[/say]")

		saynn("A few tears run down Kait's cheeks, she looks around for some help but it's all lilacs outside of her cell.")

		saynn("[say=kait]I hate Tavi, okay?! I wanted to escape with her!.. I heard your plans, yes. And I was.. upset.. to put it lightly. Fuck, it hurts..[/say]")

		saynn("[say=pc]It can hurt a lot more.[/say]")

		saynn("Kait tilts her head down.")

		saynn("[say=kait]But whatever happened with you and the captain, I had nothing to do with that! Please![/say]")

		saynn("So confusing, the cat has no reason to lie. But maybe that's her tactic. You look around for that metallic object that fell seemingly out of Kait's collar and find it. Looks like a.. a coin. A black rubber coin that has some circuitry inside. You present it to the cat.")

		saynn("[say=pc]The fuck is this then?[/say]")

		saynn("Kait directs her gaze towards the object. Her pupils dilate.")

		saynn("[say=kait]It's.. it's a.. bug.. I think..[/say]")

		saynn("[say=pc]It was in your collar. Means you're the captain's spy.[/say]")

		saynn("[say=kait]I.. I'm.. I had.. no idea.. about it.[/say]")

		saynn("You throw the coin onto the floor before stomping on it, causing sparks. Kait covers her face with her paw that's not broken yet. Hissing can be heard from her each time she tries to move a muscle, the cat must be in huge pain. Some painkillers would help to prolong the.. fun.")

		if (GM.pc.getInventory().hasItemID("painkillers")):
			addButton("To stocks", "Drug the kitty up and throw her into stocks", "use_painkillers_and_go_stocks")
		else:
			addDisabledButton("To stocks", "You don't have any painkillers")
		addButton("Leave", "She suffered enough", "leave_kait")
	if(state == "leave_kait"):
		saynn("Now that the bug is destroyed, the kitty shouldn't be able to spy you on anymore. It's probably a good idea to go tell Tavi about that.")

		saynn("You walk out of Kait's cell, leaving her on the floor.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "if_lost"):
		setFlag("TaviModule.Ch4LostToKait", true)
		playAnimation(StageScene.SexCowgirl, "tease", {npc="kait", pc="pc"})
		saynn("Kait manages to pin you to the floor after you have lost. She straddles you and presses your hands against the cold surface.")

		saynn("[say=kait]Got you! Say that you're sorry already![/say]")

		saynn("[say=pc]I'm sorry that you're a spy?[/say]")

		saynn("She frees one hand and slaps your face.")

		saynn("[say=kait]I'm not! I'm against AlphaCorp, just like you. But if you're gonna go against me.. If you're gonna steal Tavi..[/say]")

		saynn("[say=pc]So that's what it's about.[/say]")

		saynn("Kait furrows her brows, her fluffy tail bonks your legs while wagging.")

		saynn("[say=kait]Shut up or I will make you.. in fact..[/say]")

		addButton("Face sitting", "She will sit on your face", "punish_facesitting")
		addButtonWithChecks("Cowgirl anal", "She will ride your cock", "punish_rideanal", [], [ButtonChecks.HasReachablePenis])
	if(state == "punish_facesitting"):
		playAnimation(StageScene.SexFaceSitting, "sit", {pc="kait", npc="pc", bodyState={exposedCrotch=true}})
		saynn("[say=kait]In fact I should just do this.[/say]")

		saynn("Kait raises her body a bit before crawling forward and sitting on your head. She pushes her shorts directly into your face, muffling any vocal protests from you. Her strong ankles keep your arms pinned.")

		saynn("Any attempt to struggle just results in you brushing your face against the girl's pussy through the clothing. Kait doesn't seem to mind though.")

		saynn("[say=kait]Ah. Much better. You know, in moments like these, I almost can forgive her.[/say]")

		saynn("She giggles and raises herself so she can pull her shorts down, exposing her pretty pussy slit that is already clouding your mind with its scent. A second later Kait just plops herself back onto your face, spreading her juices around.")

		saynn("[say=kait]Nah~. Fuck that bitch~.[/say]")

		addButton("Continue", "See what happens next", "kait_cums_facesitting")
	if(state == "kait_cums_facesitting"):
		playAnimation(StageScene.SexFaceSitting, "grind", {pc="kait", npc="pc", bodyState={exposedCrotch=true}})
		saynn("Kait doesn't stop there, she begins dragging her sensitive petals over your face, using every bump for her pleasure. Breathing is hard when your nostrils are blocked by someone's wet slit but you do get just enough air not to suffocate. You do hear some cute noises coming from the cat through, she is moaning while riding your face.")

		saynn("[say=kait]I will be stronger than she is~. My team will be better than hers.[/say]")

		saynn("She arches her back and uses your {pc.breasts} as support while continues to slowly pick up the pace. You feel her flower getting more moist, she is really forcing her scent onto you. You can't help but to stick your tongue a bit and let her drag her pussy over it.")

		saynn("[say=kait]Like, look what I'm doing to her pet already. Ah~. Tavi is next~.[/say]")

		saynn("Very soon Kait's moans become more prominent, the lilac keeps brushing her crotch over your lips until the climax begins to catch up with her. The kitty is panting heavily while grinding your face, you can feel faint spasms of her pussy muscles.")

		saynn("[say=kait]Get ready.. pet..[/say]")

		saynn("Suddenly she lets out a passionate moan before her cute pussy begins to shower your face with her female juices. The snow leopard arches her back further while her legs lock up around your head and her paws grab tightly onto your {pc.breasts}.")

		saynn("Some of her hot arousal inevitably ends up in your mouth. So humiliating. But also kinda nice.")

		addButton("Continue", "See what happens next", "kait_getsup_after_facesitting")
	if(state == "kait_getsup_after_facesitting"):
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		saynn("After resting a bit on your face, Kait finally gets up and puts her shorts back on.")

		saynn("[say=kait]This answers my questions~. Now go get a shower or something before I decide to use your face again for something else.[/say]")

		saynn("You leave her cell and try to hide your wet face from all the lilacs. Some do smirk at you, probably not the rarest sight here.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "punish_rideanal"):
		playAnimation(StageScene.SexFaceSitting, "sit", {pc="kait", npc="pc", bodyState={exposedCrotch=true}})
		saynn("[say=kait]In fact I should just do this.[/say]")

		saynn("Kait raises her body a bit before crawling forward and sitting on your head. She pushes her shorts directly into your face, muffling any vocal protests from you. Her strong ankles keep your arms pinned.")

		saynn("Any attempt to struggle just results in you brushing your face against the girl's pussy through the clothing. Kait doesn't seem to mind though.")

		saynn("[say=kait]Ah. Much better. You know, in moments like these, I almost can forgive her.[/say]")

		saynn("She giggles and raises herself so she can pull her shorts down, exposing her pretty pussy slit that is already clouding your mind with its scent. Seeing her flower from so close arouses you almost instantly, your {pc.penis} is getting harder.")

		saynn("[say=kait]Nah~. Fuck that bitch~.[/say]")

		saynn("Kait notices how.. eager you are.. and decides to change her plans. She looks down at you, smiling.")

		saynn("[say=kait]You like my pussy? I'm afraid you won't get it because you've been so bad, you will have to settle for the second best~.[/say]")

		addButton("Anal", "See what happens next", "kait_prepares_to_ride_anal")
	if(state == "kait_prepares_to_ride_anal"):
		playAnimation(StageScene.SexCowgirl, "tease", {npc="kait", pc="pc", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("Kait straddles your crotch again, using one of her paws to keep you pinned and another to expose and get a hold of your member, her soft feline digits slide over the veiny texture, making you more lusty.")

		saynn("The cat's pussy is in your clear view, Kait raises herself but instead of guiding your shaft to her slit, she instead goes for her tailhole, letting the tip of your dick to leak pre onto her tight-looking pink star.")

		saynn("[say=kait]Would Tavi let you do that to her~. I'm clearly better.[/say]")

		saynn("Kait proceeds to slowly lower herself onto your {pc.penis}. She parts her lips and pants slightly as her tailhole twitches even from just being prodded. But kitty is insatiable, she keeps putting more pressure onto her cute butthole until..")

		addButton("Continue", "See what happens next", "kait_rides_anal")
	if(state == "kait_rides_anal"):
		playAnimation(StageScene.SexCowgirl, "sex", {npc="kait", pc="pc", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("..until finally letting your shaft inside. Kait bites her lip while holding onto your {pc.masc} body, her neglected pussy dripping juices onto you. She slowly lowers herself until her soft fluffy buttcheeks reach your hips. You pick up on her warm breathing.")

		saynn("[say=kait]So nice~. I should focus on playing with this cute pet instead.[/say]")

		saynn("Kait begins to ride your cock, gradually raising her lower part of the body and then doing the opposite, letting your shaft explore her from the inside. Her pucker is tight but it seems being a feline lets her get away with it, this kitty is stretchy if you will.")

		saynn("She catches you staring at her wet dripping snatch and giggles.")

		saynn("[say=kait]I'm such a buzzkill, right~? You wanted to breed me and here I am, making you fuck my asshole. Maybe you should have joined my team instead~.[/say]")

		if (getCharacter("kait").isVisiblyPregnant()):
			saynn("[say=pc]You're already pregnant, breeding you won't make your belly any bigger.[/say]")

			saynn("[say=kait]You.. you're not wrong. Comes with the job.[/say]")

		saynn("Kait closes her eyes and focuses on the pleasure, little moans escape from her while she slowly rides your cock. Her free paw lands on her {kait.breasts} and gives them a good squeeze.")

		saynn("It feels good, your body tries to meet the cat's motions but she pins you to the floor and giggles while doing this on her terms.")

		saynn("[say=kait]You gonna cum in my ass, you cute~? I better cum too, you know.[/say]")

		saynn("Her paw moves from her breasts to her crotch, her digits playing with her clit. Very soon her moans become more audible, Kait rides your cock faster and faster while pleasuring herself.")

		addButton("Cum!", "Fill her ass up", "cum_kait_riding_anal")
	if(state == "cum_kait_riding_anal"):
		playAnimation(StageScene.SexCowgirl, "inside", {npc="kait", pc="pc", pcCum=true, npcCum=true, npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("You grip tightly onto the floor while your whole body enters the orgasmic state, your {pc.penis} throbs and twitches inside Kait until finally bursting with {pc.cum}. Kait arches her back and squirms around your member while you stuff her cute fluffy butt to the brim. She makes some very passionate noises. Both her holes are pulsating, her anus milking your cock while her pussy squirts juices all over your body.")

		saynn("[say=kait]Yeah, cum inside the snow leopard's ass like a good pet~.[/say]")

		saynn("Kait rides the rest of her climax with your dick inside her. After that, she just bites her lip again and proceeds to moan softly, enjoying the sensations.")

		saynn("Some of the seed already begins to leak back, creating a little mess. Eventually Kait gets up and spreads her buttcheeks for you, showing off her gaping creamed tailhole as it slowly closes.")

		addButton("Continue", "See what happens next", "kait_getsup_after_riding")
	if(state == "kait_getsup_after_riding"):
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		saynn("After quickly catching her breath, Kait puts her shorts back on.")

		saynn("[say=kait]This answers my questions~. Now go away before I make you clean all of the mess that you caused.[/say]")

		saynn("You leave her cell and try to hide your blush. Some do smirk at you, probably not the rarest sight here.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "start_stocks_kait"):
		setFlag("TaviModule.Ch4KaitIntoStocks", true)
		aimCameraAndSetLocName("main_punishment_spot")
		GM.pc.setLocation("main_punishment_spot")
		playAnimation(StageScene.Duo, "stand", {npc="kait", npcBodyState={naked=true}})
		saynn("You grab Kait by the collar and begin to pull her out of her cell and towards the main hall. The snow leopard does try to struggle but overall obeys your grasp.")

		saynn("[say=kait]Where are you pulling me..[/say]")

		saynn("[say=pc]Stocks.[/say]")

		saynn("[say=kait]Hey! I told you everything![/say]")

		saynn("[say=pc]Did you?[/say]")

		saynn("As you begin to walk up the stairs that lead into the main hall, Kait grabs onto the corner and refuses to let go.")

		saynn("[say=kait]If you leave me there, others will use me..[/say]")

		saynn("You stop and turn around before leaning closer to Kait's head and staring into her eyes.")

		saynn("[say=pc]You don't like it?[/say]")

		saynn("[say=kait]Not against my will, no..[/say]")

		saynn("[say=pc]Maybe you should have thought about that before attacking me?[/say]")

		saynn("Kait pouts but after a few tugs on her collar, she finally lets go and follows you, her head tilted down, fluffy tail stuck between her legs.")

		saynn("[say=pc]You've been rude to me, rude to Tavi. Been spying on us. And now you complain when the consequences come? You know, I get a feeling that you wanted this to happen.[/say]")

		saynn("You reach the main platform that has all the punishment equipment. You approach a free set of stocks and present them to Kait.")

		saynn("[say=pc]Undress.[/say]")

		saynn("[say=kait]Hey..[/say]")

		saynn("[say=pc]You want your uniform torn? Be my guest.[/say]")

		saynn("Kait looks around. Obviously there are inmates around, it's one of the most crowded places in the whole prison. She tilts her head down again and proceeds to unbutton her shirt and take it off, exposing her {kait.breasts}. Kait covers herself in shame.")

		saynn("[say=pc]Continue. Don't tell me you're not a slut, the proof is on you.[/say]")

		saynn("She furrows her brows at you.")

		addButton("Force her", "Help Kait undress and get into the stocks", "force_kait_to_undress")
	if(state == "force_kait_to_undress"):
		addCharacter("kait", ["naked"])
		playAnimation(StageScene.Stocks, "idle", {pc="kait", bodyState={naked=true}})
		saynn("Instead of waiting for her to come around to it, you reach your hands out and pull her shorts down, forcibly exposing the cat's fluffy crotch that has a cute pink pussy slit hiding in the middle. Kait tries to close her legs and cover all her bits, her tail wags a lot.")

		saynn("[say=kait]Meanie.. You are just like Tavi..[/say]")

		saynn("[say=pc]Means you're enjoying it. C'mon.[/say]")

		saynn("Kait huffs. You pull her closer and hold the stocks open for her. Snow leopard slowly bends forward, placing her neck into the opening in the middle of the lower bar. You grab her paws and place them into the correct spots one by one. Naked kitty still uses her tail to hide her bits.")

		saynn("You lower the top part and lock the stocks, trapping the feline in there. Kait is forced to stay bent, sticking her naked butt for anyone. You try to move her tail out of the way but it quickly returns. So you smack her tight ass once, making it jiggle.")

		saynn("[say=pc]Quit that.[/say]")

		saynn("Kait obeys, pulling her tail to the side, exposing her pussy and the tight-looking pink pucker to you and anyone around.")

		saynn("[say=kait]What now..[/say]")

		addButton("Leave", "Leave Kait for others to use", "kait_freeuse")
		addButtonWithChecks("Breed her", "Breed Kait's pussy", "start_breed_kait", [], [ButtonChecks.HasReachablePenis])
		addButtonWithChecks("Pussy grind", "Use her face for your pleasure", "start_grinding_kait", [], [ButtonChecks.HasReachableVagina])
	if(state == "use_painkillers_and_go_stocks"):
		setFlag("TaviModule.Ch4KaitIntoStocks", true)
		aimCameraAndSetLocName("main_punishment_spot")
		GM.pc.setLocation("main_punishment_spot")
		playAnimation(StageScene.Duo, "stand", {npc="kait", npcBodyState={naked=true}})
		saynn("You'd love to punish that cat more for how she got you and Tavi into trouble. For how rude she was. But Kait doesn't seem to be doing too well, her wounds bring her lots of pain. So you produce a painkillers pill before bringing it to Kait's maw.")

		saynn("[say=kait]What is that..[/say]")

		saynn("[say=pc]You're gonna swallow it.[/say]")

		saynn("Kait shuts her mouth and shakes her head.")

		saynn("[say=pc]Or you're gonna lose your teeth and swallow it.[/say]")

		saynn("That changes things a bit. She is still unwilling, you try to push the pill past her fangs but she is hissing annoyed at you. So you grab her half-broken paw and bend it more, forcing a cry out of the cat. That was enough for you to throw the pill in there and to close her mouth so she doesn't spit it out.")

		saynn("[say=pc]Swallow. You're an expert at that.[/say]")

		saynn("She pouts but eventually you hear an audible gulp. While is busy with that, you tear-open her shirt, exposing her {kait.breasts} and causing all the buttons to scatter throughout the floor. Kait tries to cover herself but that only makes her vulnerable to her shorts being pulled down and stolen, exposing her fluffy white crotch with a cute pussy slit in the middle.")

		saynn("After that you just grab her by the collar and proceed to pull her out of her cell, parading her naked through the prison, heading towards the main hall.")

		saynn("[say=kait]Hey.. Where are you pulling me..[/say]")

		saynn("[say=pc]Stocks.[/say]")

		saynn("[say=kait]Why.. I told you everything..[/say]")

		saynn("[say=pc]You need to be punished for what you did.[/say]")

		saynn("You bring her out into the big hall and then climb the main platform. Lots of inmates are already staring at you and your girl.")

		addButton("Stocks", "Throw her into the stocks", "kait_force_rough_stocks")
	if(state == "kait_force_rough_stocks"):
		addCharacter("kait", ["naked"])
		playAnimation(StageScene.Stocks, "idle", {pc="kait", bodyState={naked=true}})
		saynn("You find a free set of stocks and bring Kait to them. She doesn't seem to be wanting to bend so you give her a little incentive by pulling on her short hair. The cat hisses but eventually gives in, aligning her neck with the opening in the stocks and placing her paws into the smaller ones. You shut the top panel on her and lock the stocks, trapping the feline in there.")

		saynn("[say=kait]You are just like Tavi..[/say]")

		saynn("[say=pc]Means you're enjoying it.[/say]")

		saynn("Naked kitty is forced to stay bent, sticking her naked butt for anyone. But she still uses her tail to hide her bits. You try to move her tail out of the way but it quickly returns. So you smack her tight ass once, making it jiggle.")

		saynn("[say=pc]Quit that.[/say]")

		saynn("Kait obeys, pulling her tail to the side, exposing her pussy and the tight-looking pink pucker to you and anyone around.")

		saynn("[say=kait]What now..[/say]")

		addButton("Leave", "Leave Kait for others to use", "kait_freeuse")
		addButtonWithChecks("Breed her", "Breed Kait's pussy", "start_breed_kait", [], [ButtonChecks.HasReachablePenis])
		addButtonWithChecks("Pussy grind", "Use her face for your pleasure", "start_grinding_kait", [], [ButtonChecks.HasReachableVagina])
	if(state == "kait_freeuse"):
		addCharacter(first_npc_id)
		addCharacter(second_npc_id)
		playAnimation(StageScene.StocksSpitroast, "tease", {pc="kait", npc=first_npc_id, npc2=second_npc_id, bodyState={naked=true}})
		saynn("[say=pc]Time for the others to fuck you.[/say]")

		saynn("[say=kait]Hey.. No..[/say]")

		saynn("As you step away from the stocks, inmates with hungry eyes already lineup to use Kait.")

		addButton("Watch", "See what happens", "watch_others_breed_kait")
		addButton("Leave", "You'd rather not watch that", "leave_before_others_breed")
		addButton("Protect", "You changed your mind", "protect_kait")
	if(state == "protect_kait"):
		setFlag("TaviModule.Ch4KaitStocksProtected", true)
		playAnimation(StageScene.Stocks, "idle", {pc="kait", bodyState={naked=true}})
		removeCharacter(first_npc_id)
		removeCharacter(second_npc_id)
		saynn("[say=pc]Actually, I changed my mind. Get the fuck away from her.[/say]")

		saynn("You push any inmates away from Kait and protect her. The queue is obviously not happy.")

		saynn("[say=pc]Anyone has a problem with that?[/say]")

		saynn("You catch angry glares from people. But no one seems to be brave enough to step out. Luckily there are other sluts to fuck so the crowd slowly disperses.")

		saynn("[say=kait]Uh.. you gonna unlock me?[/say]")

		saynn("[say=pc]No. Serve your punishment.[/say]")

		saynn("You smack the cat's ass for the last time and prepare to leave. At least you got her punished for what she did, Tavi should be happy.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "leave_before_others_breed"):
		setFlag("TaviModule.Ch4KaitStocksUsedByOthers", true)
		saynn("You turn away and leave the place, letting the inmates do whatever they want with the cat. At least you got her punished for what she did, Tavi should be happy.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "watch_others_breed_kait"):
		setFlag("TaviModule.Ch4KaitStocksUsedByOthers", true)
		playAnimation(StageScene.StocksSpitroast, "sex", {pc="kait", npc=first_npc_id, npc2=second_npc_id, bodyState={naked=true}, npcBodyState={exposedCrotch=true, hard=true}, npc2BodyState={exposedCrotch=true, hard=true}})
		saynn("Two first inmates already expose their cocks and align themselves. When Kait tries to voice her protest, they just force their cocks inside her at roughly the same time. They don't stop there, already fucking both her mouth and pussy.")

		saynn("Behind them there is already a little queue, it seems Kait will have a lot of fun today.")

		saynn("Muffled garbled noises can be heard coming from Kait's throat while her pussy makes wet sounds instead, the inmates quickly pick up the pace while the poor feline is forced to endure the onslaught.")

		addButton("Continue", "See what happens next", "kait_gets_bred_by_inmates")
	if(state == "kait_gets_bred_by_inmates"):
		playAnimation(StageScene.StocksSpitroast, "fast", {pc="kait", pcCum=true, npcCum=true, npc=first_npc_id, npc2=second_npc_id, bodyState={naked=true}, npcBodyState={exposedCrotch=true, hard=true}, npc2BodyState={exposedCrotch=true, hard=true}})
		saynn("Inmates reach their peak speed and soon enough cum begins to flow into Kait's holes. Her own body desperately tries to squirm while the two dicks stuff her full of seed. Kait's eyes roll up as some of the cum gets shot out of her nostrils. Lewd.")

		saynn("Soon after that, the inmates pull out. And others take their place.. You think you saw everything, time to go.")

		addButton("Continue", "Time to leave", "endthescene")
	if(state == "start_breed_kait"):
		setFlag("TaviModule.Ch4KaitStocksPunishedByPC", true)
		playAnimation(StageScene.StocksSex, "tease", {npc="pc", pc="kait", bodyState={naked=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("[say=pc]So eager. I won't keep you waiting then.[/say]")

		saynn("[say=kait]Meow?..[/say]")

		saynn("You get behind Kait and run your hands over her white fluffy butt before giving it another smack. Then you spread her butt and drag your digits over your petals, noticing that they're slightly wet.")

		if (getCharacter("kait").isVisiblyPregnant()):
			saynn("[say=pc]Could use another breeding even if you're pregnant already.[/say]")

		else:
			saynn("[say=pc]Pussy practically begging to be bred.[/say]")

		saynn("[say=kait]Hey.. Ah..[/say]")

		saynn("You forcefully spread her pussy lips and slide two fingers inside. Her soft inner walls wrap around your digits nicely. And that feline scent also makes you quite aroused. Without any extra foreplay, you pull your digits out before exposing your {pc.penis} and aligning it with the girl's slutty slit. The tip of your member rubs against the petals.")

		saynn("[say=kait]Not so rough at least?..[/say]")

		addButton("Fuck her", "Why be gentle with a bound girl", "kait_begin_stocks_fuck")
	if(state == "kait_begin_stocks_fuck"):
		playAnimation(StageScene.StocksSex, "sex", {npc="pc", pc="kait", bodyState={naked=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("Instead of answering her, you just pull your hips forward, forcing your shaft to spread the girl's slit until your balls slap against her crotch. Kait gasps when you penetrate her pussy so fast. You give her a second to get used to your size before proceeding to move your lower part of the body, little back and forth motion. One of your hands dig into the fluffy butt while another holds onto her tail like it's a handle.")

		saynn("[say=kait]Ah.. I'm not a slut..[/say]")

		saynn("[say=pc]Sure.[/say]")

		saynn("[say=kait]Fuck you..[/say]")

		saynn("Stifled noises of pleasure escape from Kait's mouth, her pussy feels tight around your cock. She tries to escape your onslaught but this is the battle that she can't win. As she tries to stomp on your feet, you pull on her tail with enough strength to raise her rear off the floor while still trusting inside, stretching out her wet cunt.")

		saynn("[say=kait]Agh.. Don't you dare.. inside..[/say]")

		saynn("[say=pc]Who's gonna stop me? Who's gonna stop the queue of inmates after me? Bitch, enjoy being the sextoy that you are, you're very good at it.[/say]")

		saynn("You pick up the pace, tugging on the tail before forcing yourself deeper, your {pc.cock} smashing against the girl's natural barricade. You notice her legs shaking slightly in the air.")

		addButton("Inside", "Breed that slut", "cum_inside_kait")
	if(state == "cum_inside_kait"):
		playAnimation(StageScene.StocksSex, "tease", {npc="pc", pc="kait", pcCum=true, npcCum=true, bodyState={naked=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("Suddenly Kait lets out a muffled moan, her whole body shivers while her pussy gets tight around your cock, too tight for you to just endure it. You pound her cunt a few more times before your own orgasm overwhelms you, strings after strings of {pc.cum} stuff the cat's womb, quickly overflowing it. Your dick keeps throbbing inside the slut's pulsating cunt, your balls are being milked dry.")

		if (GM.pc.hasVagina()):
			saynn("Your legs shake too, your own pussy squirts all over the floor, the stimulation was too much!")

		saynn("You let go of the tail and yank your cock a few seconds later, letting the last waves of {pc.cum} land on the girl's fluffy ass and back. Her fur if white but the seed is still clearly visible, especially where her dark dots are.")

		saynn("[say=kait]Huff.. you.. fucker..[/say]")

		saynn("[say=pc]You still have high spirits? Don't worry, that's temporary.[/say]")

		saynn("Kait pants heavily, she looks around as best as she can and realizes that she is quite screwed indeed. As you smack her girly ass again, her gaping slit leaks some of the seed back.")

		saynn("[say=pc]Enjoy.[/say]")

		addButton("Leave", "Leave Kait for others to use", "kait_freeuse")
	if(state == "start_grinding_kait"):
		setFlag("TaviModule.Ch4KaitStocksPunishedByPC", true)
		playAnimation(StageScene.StocksSexOral, "tease", {npc="pc", pc="kait", bodyState={naked=true}, npcBodyState={exposedCrotch=true}})
		saynn("[say=pc]So eager. I won't keep you waiting then.[/say]")

		saynn("[say=kait]Meow?..[/say]")

		saynn("You stand in front of Kait and expose your {pc.pussyStretch} pussy for her. The feline can barely move her neck so she can't even look up at you or just look away. You grab her by the hair and shove your slit into her face.")

		saynn("[say=pc]Lick. Stick your tongue out.[/say]")

		saynn("But you only hear her snarling back. So you're left with no choice but to pull on her hair harder, causing lots of pain. Poor kitty hisses and squirms as much as stocks allow.")

		saynn("[say=kait]Fuck you..[/say]")

		saynn("[say=pc]Is that how you're gonna talk?[/say]")

		addButton("Grind", "Grind your pussy against that slut's face", "start_grinding_kaits_face")
	if(state == "start_grinding_kaits_face"):
		playAnimation(StageScene.StocksSexOral, "pussy", {npc="pc", pc="kait", bodyState={naked=true}, npcBodyState={exposedCrotch=true}})
		saynn("The slut is clearly not willing to do what you want. So you just take what you want with force. One of your hands holds the girl's maw closed while you drag your crotch over her face back and forth. You hear more growling but you don't care, you continue grinding that bitch's face, spreading your female juices all over it.")

		saynn("[say=pc]Nothing but a sextoy. Quit trying to be someone you're not.[/say]")

		saynn("Kait's ears droop as she hears that. Her spirits are still high but she realizes that she is helpless under your onslaught. You continue brushing your slit over her feline maw, forcing your scent into that fur. Feels good, little moans escape from you. You giggle seeing the girl's fluffy tail wagging so much. Behind the stocks there is already a big queue lining up.")

		saynn("[say=pc]If only you could have seen what awaits you.[/say]")

		saynn("Kait is huffing and puffing while you pick the pace, the stimulation is enough to arouse you but you also idly rub your clit, pushing yourself closer to your climax.")

		saynn("[say=pc]Get ready.. bitch..[/say]")

		addButton("Cum", "Squirt all over that face", "squirt_over_kaits_face")
	if(state == "squirt_over_kaits_face"):
		playAnimation(StageScene.StocksSexOral, "pussy", {npc="pc", pc="kait", pcCum=true, npcCum=true, bodyState={naked=true}, npcBodyState={exposedCrotch=true}})
		saynn("You continue pushing yourself further and further, more moans escape from your lips, until you finally get yourself over the peak. A powerful orgasm overwhelms your body and mind, making your legs and arms shake, your pussy gushing femcum all over that face.")

		saynn("All the while Kait is just keeping her eyes and mouth closed. But this you're doing the opposite, forcing her mouth open so some of the juices flow inside.")

		saynn("[say=pc]Oo-oh.. Such a good slut.[/say]")

		saynn("You hear more soft growling. You rub your wet pussy against that fur a little more before taking a step back.")

		saynn("[say=pc]Bitch, if I walk behind you and I see a wet cunt..[/say]")

		saynn("You do that and, sure enough, Kait's slit is nothing but a waterfall of her juices. You give her girly ass a few smacks until it's red and then slide your hand over that slit, catching some of her fluids.")

		saynn("Then you return back to her face and let her sniff her own arousal.")

		saynn("[say=pc]LICK.[/say]")

		saynn("Kait huffs and sticks her rough feline tongue out before tasting her juices. You force your wet fingers inside that maw and let her clean them.")

		saynn("[say=pc]Good slut, I wanna see this more. Keep the bitchiness to yourself.[/say]")

		addButton("Leave", "Leave Kait for others to use", "kait_freeuse")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "beat_kait_up"):
		addExperienceToPlayer(400)

	if(_action == "fight_kait"):
		runScene("FightScene", ["kait"], "kaitfight")

	if(_action == "use_painkillers_and_go_stocks"):
		GM.pc.getInventory().removeXOfOrDestroy("painkillers", 1)

	if(_action == "kait_cums_facesitting"):
		processTime(60*10)
		GM.pc.cummedOnBy("kait", FluidSource.Vagina)
		GM.pc.cummedInMouthBy("kait", FluidSource.Vagina)
		GM.pc.addSkillExperience(Skill.SexSlave, 50)
		GM.pc.addLust(50)

	if(_action == "kait_prepares_to_ride_anal"):
		GM.pc.addLust(50)

	if(_action == "cum_kait_riding_anal"):
		processTime(10*60)
		getCharacter("kait").cummedInAnusBy("pc")
		GM.pc.orgasmFrom("kait")
		GM.pc.addSkillExperience(Skill.SexSlave, 50)

	if(_action == "force_kait_to_undress"):
		processTime(60*5)

	if(_action == "kait_freeuse"):
		first_npc_id = InmateGenerator.new().generate({NpcGen.Gender: RNG.pick([NpcGender.Male, NpcGender.Male, NpcGender.Shemale, NpcGender.Herm]), NpcGen.Temporary: true, NpcGen.NoChastity: true}).getID()
		second_npc_id = InmateGenerator.new().generate({NpcGen.Gender: RNG.pick([NpcGender.Male, NpcGender.Male, NpcGender.Shemale, NpcGender.Herm]), NpcGen.Temporary: true, NpcGen.NoChastity: true}).getID()

	if(_action == "kait_gets_bred_by_inmates"):
		processTime(20*60)
		getCharacter("kait").cummedInMouthBy(first_npc_id)
		getCharacter("kait").cummedInVaginaBy(second_npc_id)

	if(_action == "kait_begin_stocks_fuck"):
		processTime(6*60)

	if(_action == "cum_inside_kait"):
		processTime(60*10)
		getCharacter("kait").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("kait")
		GM.pc.addSkillExperience(Skill.SexSlave, 50)

	if(_action == "start_grinding_kaits_face"):
		processTime(6*60)

	if(_action == "squirt_over_kaits_face"):
		processTime(60*10)
		getCharacter("kait").cummedInMouthBy("pc", FluidSource.Vagina)
		getCharacter("kait").cummedOnBy("pc", FluidSource.Vagina)
		GM.pc.orgasmFrom("kait")
		GM.pc.addSkillExperience(Skill.SexSlave, 50)

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "kaitfight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("if_won")
			addExperienceToPlayer(500)
		else:
			setState("if_lost")
			addExperienceToPlayer(20)

func saveData():
	var data = .saveData()

	data["first_npc_id"] = first_npc_id
	data["second_npc_id"] = second_npc_id

	return data

func loadData(data):
	.loadData(data)

	first_npc_id = SAVE.loadVar(data, "first_npc_id", "")
	second_npc_id = SAVE.loadVar(data, "second_npc_id", "")
