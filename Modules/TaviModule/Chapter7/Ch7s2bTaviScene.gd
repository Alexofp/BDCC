extends SceneBase

var isCorrupt = false
var isPure = false
var isNormal = false
var isVirgin = false
var npc1id = ""
var npc2id = ""

func _init():
	sceneID = "Ch7s2bTaviScene"

func resolveCustomCharacterName(_charID):
	if(_charID == "npc1"):
		return npc1id
	if(_charID == "npc2"):
		return npc2id

func _run():
	if(state == ""):
		isCorrupt = getModule("TaviModule").isCorrupt()
		isPure = getModule("TaviModule").isPure()
		isNormal = (!isCorrupt && !isPure)
		isVirgin = getModule("TaviModule").isVirgin()
		addCharacter("tavi")
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("You taught Tavi everything she needs to know. Which means.. there is no point putting it off any longer. You call her and she walks up to you, her feline eyes look"+str(" eternally lusty" if isCorrupt else " kind")+".")

		saynn("[say=pc]It's time. I will need your help to do this, Tavi.[/say]")

		if (isCorrupt):
			saynn("Almost instantly, a wide smile appears on her face, her sharp fangs on display, her pointy horns glowing.")

			saynn("[say=tavi]I thought you would never ask~. What's the plan? I'm sure it will change once we start. But you know~.[/say]")

		else:
			saynn("A cute little smile appears on her face. Tavi carefully moves her hair out of the way and straightens her posture.")

			saynn("[say=tavi]I'm glad you didn't give up, owner. Even when they broke me. What's the plan?[/say]")

		saynn("[say=pc]We go in. We deal with everyone who stands in our path. We call Syndicate. We get out.[/say]")

		saynn("Tavi hums.")

		saynn("[say=tavi]The simpler the plan, the less can go wrong~. Let's do this.[/say]")

		if (isVirgin && !getFlag("TaviModule.Ch6TaviRegrewHymen", false) && GM.pc.hasReachablePenis()):
			if (isCorrupt):
				saynn("Tavi was about to follow you but then she had a change of mind, her clawed paw landing on your shoulder.")

				saynn("[say=tavi]Actually. You know, this could be our last time together.[/say]")

				saynn("Huh?")

				saynn("[say=pc]You think we shouldn't do it?[/say]")

				saynn("Tavi shakes her head. And then cleans close to your ear before breathing warmly into it.")

				saynn("[say=tavi]You know.. You protected my virginity so well~. Not a single time you fucked my wet pussy. Even when I was needy and hungry for your cock..[/say]")

				saynn("Tavi's paws travel over your {pc.masc} body while her voice reverberates in your head with dark undertones. And it drives you mad.. All of your thoughts become lewd, your {pc.penis} getting hard instantly..")

				saynn("[say=tavi]But it's time to change that. That hymen between my legs.. that seal must be broken. Torn to pieces.. By your cock.. In the most rough way possible.[/say]")

				saynn("She purrs softly.")

				saynn("[say=tavi]Destroy my purity. Steal my last sign of innocence. Fuck me raw, owner~. I want your cock inside me. Don't make me beg~.[/say]")

				saynn("The mission can probably wait a few.. hours.. Right? This is your last chance after all..")

				addButton("Fuck Tavi", "Take Tavi's virginity", "virginity_rough")
				addButton("Nah", "You'd rather not", "virginity_deny")
			else:
				saynn("Tavi was about to follow you but then she had a change of mind, her paw landing on your shoulder.")

				saynn("[say=tavi]Hey.. Before we.. I wanna tell you something.[/say]")

				saynn("You turn around and see Tavi being quite puzzled all of the sudden.")

				saynn("[say=pc]What's up, Tavi?[/say]")

				saynn("She struggles to pick the right words, stammering instead.")

				saynn("[say=tavi]It's.. it's about..[/say]")

				saynn("Your hand lands on her arm and strokes it gently. Tavi's cheeks blush. She looks so.. vulnerable.")

				saynn("[say=tavi]It's about my.. innocence. I wanna thank you.[/say]")

				saynn("You raise a brow.")

				saynn("[say=pc]Uh. What for?[/say]")

				saynn("She pouts.")

				saynn("[say=tavi]You know what for.. I was a slutty lusty bitch in heat. And you never took advantage of that. You helped me keep my virginity.[/say]")

				saynn("[say=pc]Well, you're welcome Tavi. I didn't wanna steal it against your will. It was probably valuable to you since you somehow managed to keep it throughout all of this.[/say]")

				saynn("She scratches herself behind her head and looks down.")

				saynn("[say=tavi]Yeah.. about that..[/say]")

				saynn("Tavi struggles to pick the right words again. She really thinks about it.. about what she wants to say.")

				saynn("[say=tavi]I.. I want you to breed me.[/say]")

				saynn("Wow. What a bombshell.")

				saynn("[say=tavi]I mean.. I want you to fuck me.. I mean..[/say]")

				saynn("You grab Tavi's shoulders and gently knead them.")

				saynn("[say=pc]I get it. You want me to take your virginity.[/say]")

				saynn("Her cheeks blush brightly, illuminating the dimly lit cell with a subtle green glow.")

				saynn("[say=tavi]Yes.. If everything goes wrong, this could be our last time together.. You know?..[/say]")

				saynn("The mission can probably wait a few.. hours.. Right? This is your last chance after all..")

				addButton("Fuck Tavi", "Take Tavi's virginity", "virginity_gentle")
				addButton("Nah", "You'd rather not", "virginity_deny")
		else:
			addButton("Step out", "Meet with Tavi near the checkpoint", "near_checkpoint")
	if(state == "virginity_deny"):
		if (isCorrupt):
			saynn("[say=pc]It's okay. I want you to stay a virgin, Tavi.[/say]")

			saynn("She pouts and crosses her arms.")

			saynn("[say=tavi]Why?[/say]")

			saynn("Now it's your turn to lean to her and whisper into her ear.")

			saynn("[say=pc]Because you belong to me, slut. And so it's for me to decide if and when you will lose your virginity. Understand?[/say]")

			saynn("Tavi bites her lip as she hears your authoritative voice.")

			saynn("[say=tavi]Of course, owner. My cunt is yours to unseal anytime.. Or to keep sealed forever.. Even if that's cruel..[/say]")

			saynn("You smack Tavi's ass, making her purr.")

			saynn("[say=pc]Good whore. Now let's go.[/say]")

			saynn("She nods and eagerly follows.")

		else:
			playAnimation(StageScene.Hug, "hug", {npc="tavi"})
			saynn("You hug Tavi.")

			saynn("[say=pc]It's okay, Tavi. I want you to stay the way you are. Pure.[/say]")

			saynn("She smiles softly and nuzzles your shoulder.")

			saynn("[say=tavi]Okay..[/say]")

			saynn("[say=pc]I'm sure we will be fine. And free. Let's focus on that.[/say]")

			saynn("She nods.")

			saynn("[say=tavi]Of course. We can do it.[/say]")

			saynn("Tavi follows you eagerly.")

		addButton("Step out", "Meet with Tavi near the checkpoint", "near_checkpoint")
	if(state == "virginity_rough"):
		playAnimation(StageScene.Choking, "tease", {npc="tavi", bodyState={naked=true,hard=true}, npcBodyState={naked=true}})
		saynn("Yeah.. Now is the perfect time to do this.")

		saynn("You grab Tavi's neck and tilt your head slightly while looking her in the eyes. Your other hand pulls your {pc.penis} out.")

		saynn("[say=pc]Show me your virgin cunt, slut.[/say]")

		saynn("Tavi gasps softly.. but then gets quite excited. Her clawed palms quickly unbutton her shirt and then urgently pull down her shorts, putting her juicy tits and her slick slit on full display.")

		saynn("[say=tavi]Here is what you asked, owner~.[/say]")

		saynn("You squeeze that neck harder, causing Tavi to open her mouth and pull her chin high, a silent noise escapes her throat.")

		saynn("[say=pc]I'm not asking, whore. I'm taking.[/say]")

		saynn("She nods subtly, unable to say a word. Which is exactly how you want it.")

		saynn("You align yourself with her pussy and then grab her leg, raising it high, giving you full access to her crotch. Your shaft rubs against her slick green folds, catching some of her arousal. Each time you try to put pressure on Tavi's untapped love tunnel, all of her muscles tense up, her hymen stopping you. But not for long..")

		addButton("Thrust inside", "Do it", "rough_steal")
	if(state == "rough_steal"):
		playAnimation(StageScene.Choking, "inside", {npc="tavi", bodyState={naked=true,hard=true}, npcBodyState={naked=true}})
		saynn("You align yourself a little better, your member keeping her folds spread as you start to stretch her pussy hole, it's tip putting pressure on the girl's virginity.. Before you roughly thrust your hips forward, finally tearing through and [b]stealing Tavi's virginity[/b].")

		saynn("[say=tavi]H-h.. hh~..[/say]")

		saynn("She lets out another gasp that you silent by choking her. Tavi's pussy starts dripping green glowing blood onto the floor as you slide inside her, letting her slit get used to its first ever cock. The more you steal her oxygen, the more her inner walls clench around your cock, making you eager to keep going.. All the while you keep looking into her lusty eyes.")

		saynn("[say=pc]Your cunt is mine. Mine to fuck. Mine to use and abuse.[/say]")

		saynn("She drools while you say that, quickly getting weaker and weaker.. But it feels so good.")

		addButton("Fuck her", "Start fucking Tavi raw", "rough_fuck")
	if(state == "rough_fuck"):
		playAnimation(StageScene.Choking, "sex", {npc="tavi", bodyState={naked=true,hard=true}, npcBodyState={naked=true}})
		saynn("You relax your choking hand enough to let Tavi grab at least some air as you start to fuck her, your motions forceful and relentless. Quiet stifled moans escape from the feline as her pussy gets pounded so roughly.. and so passionately.")

		saynn("[say=pc]So tight. Shame I didn't do this earlier.[/say]")

		saynn("Her paws hold onto your hand. She doesn't try to pry it off, just using it for support. Her whole body is already shivering, her limited breaths sounding ragged.")

		saynn("And soon enough, the feline arches her back more as her first vaginal orgasm takes over, making her eyes roll up and her tongue drool more, her slick pussy walls clenching even tighter around you.")

		saynn("[say=tavi]Nh-h-h h-h..[/say]")

		saynn("[say=pc]Cumming already? What a fucktoy. Nghrh..[/say]")

		addButton("Faster", "Fuck her faster", "rough_faster")
	if(state == "rough_faster"):
		playAnimation(StageScene.Choking, "fast", {npc="tavi", bodyState={naked=true,hard=true}, npcBodyState={naked=true}})
		saynn("You only rail her pussy harder and faster as she is cumming, pushing through her resistance. Your cock overstimulating her not-so-virgin folds to the point of her bleeding slit suddenly squirting, releasing a fountain of juices.")

		saynn("[say=pc]You are loving it. Loving being my cocksleeve.[/say]")

		saynn("[say=tavi]Nh-h!.. Hh!..[/say]")

		saynn("Cell smells of sex already, the air vibrates with the sound of your hips slapping against her thighs. Your thrusts are so deep, you reach her cervix, causing a bump to appear on her belly on each apex.")

		saynn("Her cunt feels good.. too good to pull out. Time to creampie your pet.")

		addButton("Cum inside", "Breed Tavi", "rough_cum")
	if(state == "rough_cum"):
		playAnimation(StageScene.Choking, "inside", {npc="tavi", bodyState={naked=true,hard=true}, npcBodyState={naked=true}})
		saynn("You ram your cock balls deep into Tavi's stretched cunt, breaking into her womb and causing her to orgasm again. Her pussy clenches around your shaft so hard, you can't hold back anymore.")

		saynn("Your {pc.penis} throbs as it starts shooting thick spurts of {pc.cum} directly into her babymaker, filling it to the brim. Your hand around her hand loosens as your own climax makes you feel weaker.")

		saynn("[say=tavi]Yes-s.. Kgh.. Breed your stupid horny pet.. Ah.. Drain those balls..[/say]")

		saynn("[say=pc]Fuck.. yes..[/say]")

		saynn("After you spill your load into her.. Tavi starts to smile.")

		saynn("[say=tavi]Another round~?[/say]")

		addButton("Continue", "See what happens next", "rough_otherfuck")
	if(state == "rough_otherfuck"):
		playAnimation(StageScene.SexMissionary, "fast", {npc="tavi", bodyState={naked=true,hard=true}, npcBodyState={naked=true}})
		saynn("You spend the next hour fucking Tavi in various positions.. Pounding her pussy raw, making up for all the missed opportunities.")

		saynn("Obviously you orgasm inside, your balls struggling to produce enough of your seed before you stuff it into Tavi's pulsing lovehole.")

		saynn("Each time you orgasm, you feel a little weaker. But your sex drive doesn't go away, it only gets ignited more.")

		addButton("Continue", "See what happens next", "rough_otherfuck2")
	if(state == "rough_otherfuck2"):
		playAnimation(StageScene.SexReverseCowgirl, "fast", {npc="tavi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("Even when you are too exhausted to continue fucking her, Tavi finds a way to make you hard and then starts riding you with her slick dripping pussy, moaning passionately in the process.")

		saynn("And your orgasms keep coming and coming, your balls getting drained by that insatiable kitty as she only seems to be getting more eager from this.")

		saynn("After a few more of those, the idea of falling asleep suddenly starts to become quite appealing.. Tavi literally fucks you until you lose consciousness.. Breeding her pussy for the last time felt still as good though..")

		addButton("Continue", "See what happens next", "rough_afterfuck")
	if(state == "rough_afterfuck"):
		playAnimation(StageScene.Sleeping, "idle", {npc="tavi", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("As you open your eyes, you find yourself lying on Tavi's bed with her being your cuddle-blanket. She is purring quietly while resting on your chest.")

		saynn("You realize that a few hours have passed since your fun time. Your hands carefully stroke Tavi's back.")

		saynn("[say=tavi]Murr-r~?..[/say]")

		saynn("[say=pc]Fine-e. Maybe some other time..[/say]")

		saynn("You continue resting together for a while. The captain can wait a few hours.. He won't be able to avoid his fate forever.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "virginity_gentle"):
		playAnimation(StageScene.Hug, "kiss", {npc="tavi", npcBodyState={naked=true}, bodyState={naked=true, hard=true}})
		saynn("Tavi looks so.. soft.. and.. cute. You sigh and nod in agreement.")

		saynn("[say=pc]Come here, girl..[/say]")

		saynn("You two step towards each other. Your hands reach out first, pulling the feline into a warm intimate embrace. The moment calls for it, you share a long deep kiss while your hands begin to undress her and her paws begin to undress you.")

		saynn("Tavi and you don't just share a physical connection.. Your actions are filled with trust, love and shared vulnerability. Every touch, every kiss, a proof of your mutual feelings.")

		addButton("Bed", "Gently move to the bed", "vir_bed")
	if(state == "vir_bed"):
		playAnimation(StageScene.SexMissionary, "tease", {npc="tavi", bodyState={naked=true,hard=true}, npcBodyState={naked=true}})
		saynn("Gently and with full care, you ease Tavi onto the bed, your lips meeting in another lingering kiss that conveys your deep affection. Your hands explore each other's bodies, caressing and teasing, fueling the fires inside you..")

		saynn("[say=pc]Want me to use a condom?[/say]")

		saynn("[say=tavi]..no.[/say]")

		saynn("You nod and pretty much cover Tavi's neck and shoulders with million little kisses while her paws slide down over your {pc.masc} body, getting a feel for it. Her breath quickens with each passing moment, a mixture of excitement and nervousness coursing through her, making her heart beat faster.")

		saynn("[say=pc]Do you like it?[/say]")

		saynn("[say=tavi]Yes, I do.. very much..[/say]")

		saynn("And so, you position yourself a little better, carefully aligning your hard {pc.penis} with Tavi's slick virgin love tunnel. For now you just let your member brush against her sensitive folds, spreading them and sending sparks of arousal through the feline.")

		saynn("[say=pc]I will be gentle..[/say]")

		saynn("[say=tavi]Please..[/say]")

		saynn("After saying, you begin to guide your member directly towards her awaiting flower. Your tip easily sliding between her petals but quickly encountering Tavi's organic barricade.. her hymen. Putting any kind of pressure on it causes shivers to go through her spine, a mixture of pain and discomfort washing over her.")

		saynn("[say=pc]Should I stop?[/say]")

		saynn("[say=tavi]No.. Do it..[/say]")

		saynn("And so this is the moment.. Can't go back anymore.. and proceeding forward is painful. Better make it count then..")

		addButton("Thrust inside", "Take Tavi's virginity", "vir_steal")
	if(state == "vir_steal"):
		playAnimation(StageScene.SexMissionary, "inside", {npc="tavi", bodyState={naked=true,hard=true}, npcBodyState={naked=true}})
		saynn("You exhale audibly and then.. with one powerful motion.. thrust inside, your member putting so much pressure on Tavi's innocence.. that it manages to tear through it, [b]taking Tavi's virginity[/b].")

		saynn("[say=tavi]Hh!..[/say]")

		saynn("Tavi clings to you, her claws scratching your back as she arches her back and gasps, sharp painful sensations washing over her. After tearing through her hymen, you immediately pause, offering the feline comfort and support, your lips offering her a tender kiss.")

		saynn("[say=tavi]Nh-h..[/say]")

		saynn("Tavi is not a girl.. but a woman now. Her pussy is bleeding slightly after the defloration.. giving your shaft a green glow. First time always hurts.. so you give Tavi every bit of care that you can.")

		saynn("[say=pc]Tell me when I can..[/say]")

		saynn("[say=tavi]You can.. Just.. slow..[/say]")

		addButton("Slow fuck", "Start moving your hips slowly", "vir_slow")
	if(state == "vir_slow"):
		playAnimation(StageScene.SexMissionary, "sex", {npc="tavi", bodyState={naked=true,hard=true}, npcBodyState={naked=true}})
		saynn("Hearing that allows you to start slowly moving your hips, your member exploring and slowly stretching Tavi's love tunnel that clenches around its first ever cock..")

		saynn("The initial discomfort gradually subsides, replaced by a rising tide of pleasure. Tavi's body slowly adapts to the new sensations, your lovemaking finally becoming what it is supposed to be.. a harmonious dance of passion and intimacy.")

		saynn("[say=tavi]Ah..[/say]")

		saynn("Little moans begin to escape from the feline, her eyes full of feelings for you. Feelings that she didn't know she could experience. Feelings that you share with her.")

		saynn("The slick inner walls draw you in deeper.. but you keep a slow pace throughout, restraining yourself to what is comfortable for Tavi. And still, the tightness of her flower quickly brings you to your peak..")

		saynn("[say=pc]Where should I..[/say]")

		if (getModule("TaviModule").hasWombMark()):
			saynn("[say=tavi]Inside.. Ah.. I don't mind carrying our offspring, owner..[/say]")

		else:
			saynn("[say=tavi]Inside.. Ah.. I can't get pregnant anyway..[/say]")

		saynn("And so she spoke. Hard to say if she has a clear mind at this moment, so many feelings are probably clouding up her thoughts. But you know that you two won't regret it either way..")

		addButton("Cum inside", "Try to breed Tavi", "vir_cum")
	if(state == "vir_cum"):
		playAnimation(StageScene.SexMissionary, "inside", {npc="tavi", bodyState={naked=true,hard=true}, npcBodyState={naked=true}})
		saynn("You chase your orgasm.. until you realize that Tavi is close too. A passionate moan escapes her lips before she clings onto your body again and lets the pleasure numb her other senses.")

		saynn("[say=tavi]Ah-h..[/say]")

		saynn("Pretty much instantly, your own climax catches up with you. Your {pc.penis} throbbing inside Tavi roughly once every second, pulsing and flooding her womb with your thick {pc.cum} to the brim.")

		saynn("[say=tavi]F-feels so good..[/say]")

		saynn("Her body is shivering, her flower clenching around your member, eagerly accepting your load.")

		saynn("Both of you are panting heavily. You have stopped any movement, just enjoying how her pussy feels while she enjoys being creampied for the first time ever.")

		saynn("[say=tavi]T-thank you..[/say]")

		saynn("Truly one to remember forever. Almost makes you forget what's happening outside. Like it's all fake.. Only this short moment matters.. Inside this small cell.. your feelings are big.. for each other..")

		addButton("Cuddle", "Give Tavi some aftercare", "vir_cuddle")
	if(state == "vir_cuddle"):
		playAnimation(StageScene.Sleeping, "idle", {npc="tavi", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("And so you pull out and pull Tavi onto your chest for some cuddles. She purrs and wraps her paws around you, enjoying resting her chin on your chest.")

		saynn("[say=tavi]If we die.. It was worth it.. All of this..[/say]")

		saynn("You tilt your head slightly while she offers you a little soft smile.")

		saynn("[say=tavi]But we won't die. We will succeed.[/say]")

		saynn("You nod and just.. rest..")

		saynn("Minutes pass like seconds. Makes you wonder if you really want to escape. Maybe you can be happy.. even if you're not free? Bad thoughts..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "near_checkpoint"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		aimCameraAndSetLocName("hall_mainentrance")
		GM.pc.setLocation("hall_mainentrance")
		saynn("And here you are. Standing before the checkpoint. Tavi is standing by your side.")

		saynn("You don't have any laser rifles or shiny armor to protect yourself. Just your fists and bodies and a strong desire to get out of this place. Or maybe you just wanna make the captain pay for what he did? Does it matter in the end? Not really.")

		saynn("Will they be ready? Maybe. But it won't stop you. And Tavi will help you make it clean and smooth.")

		saynn("Checkpoint.. Elevator.. Command deck.. Captain's office. Should be easy.")

		addButton("Checkpoint", "Walk through the main entrance", "checkpoint_firstguard")
	if(state == "checkpoint_firstguard"):
		aimCameraAndSetLocName("hall_checkpoint")
		playAnimation(StageScene.Duo, "stand", {pc="tavi", npc=npc1id})
		saynn("You and Tavi step through the sensor array that they got going on and look at the guards.")

		saynn("[say=npc1]Move it, inmates. Don't waste my time.[/say]")

		saynn("Tavi gives you a silent sign and walks up to the first guard.")

		saynn("[say=tavi]Hey~. I heard you all have big scary pain sticks with you. Can I see one~?[/say]")

		saynn("The guard sees Tavi's red accents on her uniform and sighs.")

		saynn("[say=npc1]No. That would be the last thing you see then. Move along, inmates.[/say]")

		addButton("Continue", "See what happens next", "cp_first_taviwin")
	if(state == "cp_first_taviwin"):
		playAnimation(StageScene.Duo, "stand", {pc="tavi", npc=npc1id, bodyState={naked=true}, npcAction="defeat"})
		saynn("Tavi smirks and suddenly drops her shorts and takes off her shirt, revealing her {tavi.breasts} and a cute"+str(" virgin" if isVirgin else "")+" pussy to them. She raises her paws like she is surrendering.")

		saynn("[say=tavi]What about now~? See, I'm completely harmless, officers. Can I see your sticks~?[/say]")

		saynn("That sudden stunt.. catches the two guards.. off-guard.. allowing Tavi to close distance to one of them until she is practically rubbing against their armor.")

		saynn("[say=tavi]I touch your stick, you touch my boobs. Sounds fair~?[/say]")

		saynn("[say=npc1]Uhh.. Yea-a.. Wait.. No. Get back, whore![/say]")

		saynn("The guard pulls out {npc1.his} stun baton but that's exactly what Tavi was waiting for. Her quick paws reach for the guard's gloves and then redirect the weapon so the scary shocking part gets pressed into their neck!")

		saynn("[say=npc1]ARGH![/say]")

		saynn("The guard drops to {npc1.his} knees, {npc1.his} body shaking as a powerful shock goes through it!")

		saynn("[say=tavi]Nice stick~.[/say]")

		saynn("But the second guard was fast enough to pull out a shock remote and aim at you. {npc2.He} presses the button on it.. but nothing happens. So {npc2.he} pulls {npc2.his} baton out and shoves Tavi back before trying to strike you!")

		saynn("Tavi grunts as her feline frame gets pushed. All she can do is throw her baton towards you! She was falling so she did at a weird angle, meaning you will need a lot of agility to catch it..")

		addButton("Just fight", "Do not try to catch the weapon", "cp_justfight")
		addButtonWithChecks("Catch it", "Catch the stun baton that Tavi threw at you", "cp_catchit", [], [[ButtonChecks.StatCheck, Stat.Agility, 20]])
	if(state == "cp_justfight"):
		playAnimation(StageScene.Duo, "stand", {npc=npc2id})
		saynn("You didn't catch the weapon so it hits the wall and rolls off who knows where.")

		saynn("The second guard is still angry with you.. so.. It's time for a fight.")

		addButton("Fight", "Start the fight", "fight2_npc")
	if(state == "lost_fight"):
		aimCameraAndSetLocName("hall_mainentrance")
		GM.pc.setLocation("hall_mainentrance")
		playAnimation(StageScene.Solo, "defeat")
		saynn("You lost the fight.. And so you and Tavi get thrown out back into the main hall.")

		saynn("[say=tavi]Ow.. Well, it was worth a try I guess.[/say]")

		saynn("Seems like you gotta get stronger if you wanna do this to the end. Luckily, the guards didn't put any extra restraints on you.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "won_second_guard"):
		playAnimation(StageScene.Duo, "stand", {npc=npc2id, npcAction="defeat"})
		saynn("Both of the guards are defeated. That's a start.")

		saynn("You fetch one of the badges from them. It will probably get disabled in a few minutes. But that's all you need to get access to the top floor of the prison.")

		saynn("[say=risha]Going somewhere~?[/say]")

		saynn("A voice stops you and Tavi.")

		addButton("Turn around", "See who is there", "risha_intro")
	if(state == "cp_catchit"):
		playAnimation(StageScene.Duo, "stunbaton", {npc=npc2id, npcAction="defeat"})
		saynn("That throw by Tavi wasn't perfect but you still managed to catch the sparking stun baton before striking the second guard first! {npc2.He} grunts and drops to {npc2.his} knees as the electrical shock flows through {npc2.him}.")

		saynn("[say=tavi]Good job~.[/say]")

		saynn("You fetch one of the badges from the defeated guards. It will probably get disabled in a few minutes. But that's all you need to get access to the top floor of the prison.")

		saynn("[say=risha]Going somewhere~?[/say]")

		saynn("A voice stops you and Tavi.")

		addButton("Turn around", "See who is there", "risha_intro")
	if(state == "risha_intro"):
		addCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {npc="risha", pc="tavi", bodyState={naked=true}})
		saynn("It's Risha. She looks at you quickly. But her gaze is mostly stolen by Tavi's.. exposed assets.")

		if (getModule("TaviModule").hasHorns()):
			saynn("[say=risha]Oh wow. Nice handlebars you got there, sister. And your ass is looking.. mm~.. Is this all for me~?[/say]")

			saynn("[say=tavi]It depends.[/say]")

		else:
			saynn("[say=risha]Is this all for me, sister~?[/say]")

			saynn("[say=tavi]It depends.[/say]")

		saynn("She slowly approaches you. Behind you is the closed elevator. Which means.. She is cornering you.")

		saynn("[say=pc]What's your problem, Risha?[/say]")

		saynn("[say=risha]Cap's orders are to stop you. And I have to obey, I'm afraid. No hard feelings.[/say]")

		saynn("Tavi understands where this is going. And decides to act.")

		saynn("[say=tavi]Whatcha gonna do, Risha? Are you gonna pin me~? Against this wall?[/say]")

		saynn("The lynx raises a brow while naked Tavi bravely steps closer, her gaze directed towards the nearest wall, away from the guard.")

		saynn("[say=risha]If you're gonna resist, sure.[/say]")

		saynn("[say=tavi]What are you gonna do next? I probably stole something by now already so you will have to frisk me~. And since I'm naked.. how are you gonna do this~?[/say]")

		saynn("Tavi closes the distance with the guard and proceeds to step around, circling while her tail teasingly reveals the curves of her ass and"+str(" virgin" if isVirgin else "")+" pussy.")

		saynn("[say=risha]I will just have to search all of your pockets. By the way, when did you become a..[/say]")

		saynn("[say=tavi]A slut~? Maybe I always was.[/say]")

		saynn("Tavi bites her lip and puts her paws on Risha's armor slowly stripping it, starting with her crotch piece. Her plan becomes more and more clear..")

		saynn("[say=risha]What are you..[/say]")

		saynn("Tavi's paws strip a few more pieces of Risha's riot armor and then pull out her barbed cock that's already quite hard.")

		saynn("[say=tavi]Preparing you.. You wanna search my pockets with your cock, don't you~?[/say]")

		saynn("It's probably time to step in. Because if you don't, Tavi will actually have to go through with this. And then you will still get thrown out.")

		saynn("Best thing you can come up with is.. double teaming Risha. Tavi distracts her while you bring her down. But how.. Risha's stun baton is in her hands.. And she is still wearing a lot of armor. Her hair isn't protected though.. You will need a lot of strength.")

		addButton("Pull lightly", "Use your strength to pull on Risha's hair", "risha_light")
		addButtonWithChecks("Pull firmly", "Use all of your strength to pull on Risha's hair", "risha_firm", [], [[ButtonChecks.StatCheck, Stat.Strength, 20]])
	if(state == "risha_firm"):
		playAnimation(StageScene.SexFreeStanding, "tease", {npc="risha", npcBodyState={naked=true, hard=true}})
		saynn("You sneak behind Risha while she is busy with Tavi and suddenly yank on her hair, putting your full strength into it.")

		saynn("[say=risha]Ah~..[/say]")

		saynn("But instead of collapsing, Risha arches her back and moans softly, her cock twitching from your rough act. Huh? What a slut..")

		saynn("[say=tavi]Yeah, you like that, don't you~?[/say]")

		saynn("Tavi sees what's happening and quickly strips the rest of Risha's armor, leaving her naked, exposed and vulnerable. She then throws you a set of Risha's handcuffs that you use to cuff the lusty guard, also making her helpless.")

		saynn("[say=risha]Umm.. H-hey. What are you..[/say]")

		saynn("Tavi giggles when Risha finally snaps out of it.")

		saynn("[say=tavi]Sorry, sis. No time to play~. I'm sure you would love to breed me but we gotta go.[/say]")

		saynn("Risha tests her own handcuffs and huffs.")

		saynn("[say=risha]..bitch. Always such a tease..[/say]")

		saynn("Tavi boops her sister on the nose.")

		saynn("[say=tavi]Love you too.[/say]")

		saynn("Your old badge doesn't seem to work anymore so you steal Risha's one.")

		saynn("[say=pc]No hard feelings.[/say]")

		saynn("[say=risha]None taken.[/say]")

		saynn("You and Tavi head towards the elevator.")

		addButton("Elevator", "Step into it", "alex_meet")
	if(state == "risha_light"):
		playAnimation(StageScene.Solo, "hurt", {pc="risha"})
		saynn("You sneak behind Risha while she is busy with Tavi and suddenly yank on her hair, trying to make her collapse.")

		saynn("But the strength you put in wasn't enough for that. The feline grunts painfully and throws you off.")

		saynn("[say=risha]Argh.. What a bitch![/say]")

		saynn("Well.. Tavi did make her lusty. And your sneaky attack brought some pain too. Which should help. But it looks like the fight is inevitable.")

		addButton("Fight", "Start the fight", "fight3_risha")
	if(state == "lost_risha"):
		playAnimation(StageScene.Duo, "defeat", {npc="risha"})
		GM.pc.setLocation("hall_mainentrance")
		aimCameraAndSetLocName("hall_mainentrance")
		saynn("You drop to your knees before Risha. It hurts.")

		saynn("The feline leans closer to you.")

		saynn("[say=risha]Good try. But you're clearly not ready.[/say]")

		saynn("She throws you and Tavi out and walks off. At least she didn't fuck you. Why did she not fuck you?")

		saynn("Seems you will need to try a little harder than that.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "won_risha"):
		playAnimation(StageScene.Duo, "stand", {npc="risha", npcAction="defeat"})
		saynn("Risha hisses as she hits the floor, her bulky armor is now weighing her down rather than protecting her.")

		saynn("Your old badge doesn't seem to work anymore so you steal Risha's one.")

		saynn("[say=pc]No hard feelings.[/say]")

		saynn("[say=risha]None taken.[/say]")

		saynn("Tavi walks up to Risha and pats her on the head.")

		saynn("[say=tavi]Sorry, sis. I know you would love to breed me. But we gotta go~.[/say]")

		saynn("[say=risha]..bitch. Always such a tease..[/say]")

		saynn("Tavi boops her sister on the nose.")

		saynn("[say=tavi]Love you too.[/say]")

		saynn("You and Tavi head towards the elevator.")

		addButton("Elevator", "Step into it", "alex_meet")
	if(state == "alex_meet"):
		removeCharacter("risha")
		addCharacter("alexrynard")
		aimCameraAndSetLocName("hall_elevator")
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("As the elevator doors open, you see.. Alex. His attention was directed to some random prototype in his hands. But he puts it away and looks at you. He doesn't even seem to be surprised much by the naked feline standing by your side.")

		saynn("[say=alexrynard]Gonna stand there? Step in.[/say]")

		saynn("He doesn't seem to be.. hostile. So you and Tavi step inside the elevator. You press the badge against the control panel before selecting the command deck.")

		saynn("[say=alexrynard]Brave.[/say]")

		saynn("The doors close with an annoying screech. The elevator begins to move.")

		saynn("[say=alexrynard]I should really lube these gears up, huh?[/say]")

		saynn("[say=pc]You're not gonna stop us?[/say]")

		saynn("The foxy shrugs.")

		saynn("[say=alexrynard]It's not my job. And you seem to have made up your mind. Other guards will try to stop you though.[/say]")

		saynn("[say=pc]We know.[/say]")

		saynn("You three stand side by side. In silence. Only the quiet noise of the elevator moving can be heard.")

		saynn("[say=tavi]I lashed out at you that one time. Sorry about that.[/say]")

		saynn("[say=alexrynard]Don't worry about it. You use shit methods.. But I understand you. This prison could use some changes.[/say]")

		saynn("[say=pc]Changes?[/say]")

		saynn("[say=alexrynard]Improvements. Replacements. I don't know. Just don't destroy it, okay? Good people built it. Would be a shame to see all that progress go to waste.[/say]")

		if (isCorrupt):
			saynn("[say=tavi]Can't promise anything, sweetie. The guy is crazy.[/say]")

			saynn("The foxy turns his head and looks at Tavi's horns.. and exposed tits.")

			saynn("[say=alexrynard]Uh huh.[/say]")

		else:
			saynn("[say=tavi]We will try.[/say]")

			saynn("He nods.")

		saynn("Soon, the elevator doors open. The guy prefers to stay while you two step out. You finally feel like you're getting somewhere.")

		addButton("Command deck", "See what happens next", "nova_meet")
	if(state == "nova_meet"):
		removeCharacter("alexrynard")
		addCharacter("nova")
		playAnimation(StageScene.Duo, "stand", {npc="nova", pc="tavi", bodyState={naked=true}})
		aimCameraAndSetLocName("cd_near_split")
		saynn("You step out into the rich man's corridor. Makes sense for the captain to keep himself away from inmates physically as well as mentally.")

		saynn("Carpets, paintings, wooden furniture. A stark contrast to the cold, dimly lit cells that you almost grew to call home. Still, it lacks any.. passion. Nothing stands out to you.")

		saynn("As you and Tavi step through the corridor, you walk into Nova. She blocks your path.")

		saynn("[say=nova]Oh.. Tavi?[/say]")

		saynn("The feline proudly displays herself to the husky.")

		saynn("[say=tavi]Hey there, Nova~. May we pass perhaps?[/say]")

		if (getModule("TaviModule").hasHorns()):
			saynn("Nova's gaze is glued to Tavi's sexy forms.. her horns.."+str(" her womb mark.." if getModule("TaviModule").hasWombMark() else "")+" And Tavi is not ashamed in the slightest.")

		else:
			saynn("Nova's gaze is glued to Tavi's naked forms.. And Tavi is not ashamed in the slightest.")

		saynn("[say=nova]Captain's orders. Sorry cutie. I have to.[/say]")

		saynn("Seems like the fight is inevitable. But then Tavi suddenly starts stepping towards the husky, putting a lot of sway into her hips. She has a mean little smile on her face.. which causes Nova to stagger. Poor husky steps back, pretty much melting just from the drilling gaze.")

		saynn("[say=nova]T-Tavi?..[/say]")

		saynn("[say=tavi]I know that you're a good pupper. You have a kind.. and soft.. heart.[/say]")

		saynn("Nova is blushing, her shaky paw reaches for the stun baton.. deliberating.")

		saynn("[say=nova]Nuh.. Don't say that..[/say]")

		saynn("Tavi crosses her arms under her breasts and tilts her head.")

		saynn("[say=tavi]Nuh? You're a bad puppy? A slutty lil' shit?[/say]")

		saynn("Nova shakes her head. Tavi has started pretty well. But you feel like she is losing Nova's subby state. You can probably help.. but you will need to use a smooth sexy voice for that..")

		addButton("Attack Nova", "You'd rather just force the husky to submit", "nova_attack")
		addButtonWithChecks("Sexy voice", "Use a sexy voice to try to make Nova submit", "nova_sexyvoice", [], [[ButtonChecks.StatCheck, Stat.Sexiness, 20]])
	if(state == "nova_attack"):
		playAnimation(StageScene.Duo, "hurt", {npc="nova", npcAction="shove"})
		saynn("You hope that Tavi's humiliations were enough to distract Nova as you carefully approach her. Your hand tries to steal the guard's stun baton.. but it meets her paw instead. One accidental hand holding later and she snaps out of it, shoving both of you back.")

		saynn("[say=nova]I have to stop you. I just.. have to..[/say]")

		saynn("Well, looks like you will have to fight her. At least it will be easier.")

		addButton("Fight", "Start the fight", "fight4_nova")
	if(state == "lost_nova"):
		playAnimation(StageScene.Solo, "defeat")
		GM.pc.setLocation("hall_mainentrance")
		aimCameraAndSetLocName("hall_mainentrance")
		saynn("You drop to your knees, defeated by Nova. She puts her baton away and clips a leash to your collar. Tavi decides not to fight it and lets Nova clip a leash to her collar too.")

		saynn("[say=nova]Not today, cutie.[/say]")

		saynn("After that, she just brings you back out in the main hall. Makes you wonder why they don't punish you at all. Almost like they are tired of this, just like you and Tavi.")

		saynn("Seems you will need to try a little harder than that.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "won_nova"):
		playAnimation(StageScene.Duo, "stand", {npc="nova", npcAction="defeat"})
		saynn("Nova grunts and drops to her knees, unable to continue fighting.")

		saynn("[say=nova]Ow..[/say]")

		saynn("No time to chat. You feel like you're very close. As you and Tavi walk past her, you only hear this.")

		saynn("[say=nova]Good luck..[/say]")

		saynn("Huh? You're not sure if that was sarcasm. Sounded pretty genuine.")

		if (isCorrupt):
			saynn("[say=tavi]Thanks. But we will not need it~.[/say]")

		else:
			saynn("[say=tavi]Thanks. We will probably need it.[/say]")

		addButton("Continue", "See what happens next", "walk_to_skar")
	if(state == "nova_sexyvoice"):
		playAnimation(StageScene.Duo, "stand", {npc="nova", pc="tavi", npcAction="allfours", bodyState={naked=true}})
		saynn("You carefully take position behind Nova, almost like you're taking her side now. You whisper to her ear but Tavi hears it too.")

		saynn("[say=pc]You're not a lil' shit, Nova. You're a good husky, aren't you?[/say]")

		saynn("[say=nova]Sometimes.. I'm both really.[/say]")

		saynn("You point at Tavi and tap on Nova's shoulder.")

		saynn("[say=pc]But you would be a good husky for her?[/say]")

		saynn("Tavi hears that and smiles while taking a seductive pose, angling her hips to the side and putting her paw on her side.")

		saynn("[say=nova]M-mayhaps..[/say]")

		saynn("Seems like it's working. Nova blushes more and stops squeezing the handle of her weapon. You could steal her painstick right now.. But why hurt this pupper?")

		saynn("[say=pc]Why don't you get on all fours for her then? Show how good of a girl you can be?[/say]")

		saynn("[say=nova]Umm.. Ahm.. I d-don't.. c-can't..[/say]")

		saynn("Tavi sees that the husky is deliberating and suddenly starts advancing again, stepping slowly but deliberately, still holding her paw on her side and drilling the girl with her gaze.")

		saynn("Nova immediately drops to all fours and starts producing extremely cute noises that sound like little squeaks and whines.")

		saynn("[say=nova]Ee-ek.. Sorr-ry.. M-Miss T-Tavi?..[/say]")

		saynn("Nova is defeated.. without a single strike. Tavi leans down and pats Nova.")

		saynn("[say=tavi]Good girl~. Thank you.[/say]")

		saynn("The puppy whines more while her tail wags like crazy.")

		saynn("[say=tavi]We're gonna go now, sorry pupper.[/say]")

		saynn("[say=nova]G-Good l-luck..[/say]")

		saynn("Huh? You're not sure if that was sarcasm. Sounded pretty genuine, considering her current position.")

		if (isCorrupt):
			saynn("[say=tavi]Thanks. But we will not need it~.[/say]")

		else:
			saynn("[say=tavi]Thanks. We will probably need it.[/say]")

		saynn("Time to go further.")

		addButton("Continue", "See what happens next", "walk_to_skar")
	if(state == "walk_to_skar"):
		removeCharacter("nova")
		playAnimation(StageScene.Duo, "walk", {npc="tavi"})
		aimCameraAndSetLocName("cd_last_intersection")
		saynn("You walk through the soulless corridors, quickly getting closer to the source. There is no fear for some reason. Probably because you got this whole thing figured out. There are no unknowns anymore. No mysteries left to solve. All you have to do is execute.")

		saynn("[say=tavi]Only one left.[/say]")

		saynn("While approaching the captain's office, a familiar figure blocks your path..")

		addButton("Continue", "See what happens next", "skar_block")
	if(state == "skar_block"):
		addCharacter("skar")
		playAnimation(StageScene.Duo, "stand", {npc="skar", pc="tavi", bodyState={naked=true}})
		saynn("Skar is leaning against the wall, crossing his prosthetic arms. Makes sense to keep your strongest guard near you.")

		saynn("[say=tavi]May we?[/say]")

		saynn("He shakes his head slowly. You decide to step in.")

		saynn("[say=pc]I get it.[/say]")

		saynn("[say=skar]Do you?[/say]")

		saynn("[say=pc]A little bit. I understand what. I don't quite understand why. Why are you still fighting for him?[/say]")

		saynn("He lowers his gaze.")

		saynn("[say=skar]Stability, I guess.[/say]")

		saynn("[say=pc]Stability?[/say]")

		saynn("He flexes his arms and you can hear servos working in them. His prosthetic jaw has a similar quiet whirl as he talks.")

		saynn("[say=skar]I've had enough.. adventures.. Wars.[/say]")

		saynn("He sighs and looks at you.")

		saynn("[say=skar]I just wanna live my boring life. I don't want anything to change, it's too late for that.[/say]")

		saynn("Huh. Is that the true Skar? He sounds like he is.. spent.")

		saynn("[say=pc]Then why did you give us a chance back then?[/say]")

		saynn("He shrugs.")

		saynn("[say=skar]I don't know. The captain ordered to stop the riot, not you. I don't care about you.[/say]")

		saynn("Such a soldier, following orders without taking responsibility. Maybe there is a spark of hope in him though.")

		saynn("[say=pc]Maybe it's time to choose for yourself then? You did it once, why not do it again? Just let me walk through.[/say]")

		saynn("He shakes his head and blocks the path. That spark fades away. Seeing that you will not get anywhere, you both prepare to fight.")

		saynn("Although.. it's two versus one. You can try to withstand his attacks until Tavi comes up with a plan to take him down quickly. But you would need to have a high pain ceiling to survive for enough time..")

		addButton("Just fight", "Start the fight", "fight5_skar")
		addButtonWithChecks("Let Tavi help", "Endure Skar's attacks until Tavi helps you win", "skar_tavihelp", [], [[ButtonChecks.StatCheck, Stat.Vitality, 20]])
	if(state == "skar_lost"):
		playAnimation(StageScene.Solo, "defeat")
		GM.pc.setLocation("hall_mainentrance")
		aimCameraAndSetLocName("hall_mainentrance")
		saynn("As you get defeated, Skar grabs you and Tavi by the collar and drags you away.")

		saynn("You were so close. But sadly, you failed this time.")

		saynn("[say=skar]It's not worth it. You can't change anything.[/say]")

		saynn("You don't even wanna describe how wrong he is.")

		saynn("Seems you will need to try a little harder than that.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "skar_won"):
		playAnimation(StageScene.Duo, "stand", {npc="skar", npcAction="defeat"})
		saynn("Skar grunts as he hits the floor hard.")

		saynn("[say=skar]Ugh.. It's not worth it. You can't change anything.[/say]")

		saynn("[say=pc]If there were less like you, maybe it would have been easier. But I don't plan on giving up no matter what.[/say]")

		saynn("The reinforced door is the last barrier before the captain's office. Tavi steals Skar's badge and tries to use it.. but the door refuses to open.")

		saynn("[say=tavi]Seems like he doesn't even trust his own guards anymore.[/say]")

		saynn("Well.. You're kinda stuck here.")

		saynn("[say=tavi]Hold on, I know what to do~.[/say]")

		addButton("Continue", "See what happens next", "tavi_hacks_door")
	if(state == "skar_tavihelp"):
		playAnimation(StageScene.Duo, "hurt", {npc="skar", npcAction="stunbaton"})
		saynn("You decide not to attack the guy at all, only focusing on blocking and avoiding his attack. And oh boy, those mechanical arms he has might look a bit clunky at first.. but they never get tired, allowing Skar to keep pushing and striking.")

		saynn("While you're busy with that, Tavi gets out of sight and sneaks behind him. She waits for a good moment.. Each second makes you wish you had more training.")

		addButton("Continue", "See what happens next", "skar_taviwin")
	if(state == "skar_taviwin"):
		playAnimation(StageScene.Solo, "defeat", {pc="skar"})
		saynn("When Skar commits to another strike, Tavi suddenly jumps on his back, catching him in the moment of recovery. She uses her weight to make him lose balance before bringing him down, his armor producing a metallic cling when it hits the floor.")

		saynn("[say=skar]Ugh..[/say]")

		saynn("The impact stuns the guy enough for Tavi to quickly cuff him with his own cuffs.")

		saynn("[say=tavi]That's what being without a good team brings you. Instability~.[/say]")

		saynn("The reinforced door is the last barrier before the captain's office. Tavi steals Skar's badge and tries to use it.. but the door refuses to open.")

		saynn("[say=tavi]Seems like he doesn't even trust his own guards anymore.[/say]")

		saynn("Well.. You're kinda stuck here.")

		saynn("[say=tavi]Hold on, I know what to do~.[/say]")

		addButton("Continue", "See what happens next", "tavi_hacks_door")
	if(state == "tavi_hacks_door"):
		removeCharacter("skar")
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcBodyState={naked=isCorrupt}})
		saynn("Tavi starts inspecting the access panel. Nothing obvious stands out but she finds a little crack that she slides her claw inside before using it to pry open the outer cover, revealing some insulated wiring.")

		saynn("[say=pc]Would be a shame to stop now.[/say]")

		saynn("Tavi smiles.")

		saynn("[say=tavi]Never~.[/say]")

		saynn("She can't quite figure what each wire means.. So she steals Skar's stun baton and shoves it into the panel, causing all sorts of sparks to start bursting from it.")

		saynn("[say=tavi]Now watch.[/say]")

		saynn("The door blinks non-stop. Its security bolts toggle on and off.. And then the door opens when the right wire gets an impulse sent through it.")

		saynn("[say=tavi]That's why I like hacking software more. Software and people~. This isn't even a challenge.[/say]")

		saynn("And now.. All you can do is walk in. You and Tavi look at each other.")

		saynn("[say=pc]Ready?[/say]")

		if (isCorrupt):
			saynn("[say=tavi]Been waiting my whole life for this~. And I won't pull any punches.[/say]")

		else:
			saynn("[say=tavi]Been waiting my whole life for this. Let me just put this on.[/say]")

			saynn("Tavi pulls out her inmate uniform which she had stored.. somewhere.. and wears it.")

			saynn("[say=tavi]My body won't work on him anyway.[/say]")

		addButton("Walk in", "See what's up with the captain", "start_captain_scene")
func taviSpeak(corruptSpeak, pureSpeak):
	if(isCorrupt):
		return corruptSpeak
	if(isPure):
		return pureSpeak
	return corruptSpeak


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "virginity_rough"):
		processTime(3*60)

	if(_action == "virginity_gentle"):
		processTime(3*60)

	if(_action == "near_checkpoint"):
		processTime(3*60)

	if(_action == "rough_steal"):
		processTime(2*60)
		setFlag("TaviModule.TaviIsNotVirgin", true)
		setFlag("TaviModule.Ch7TaviTookVirginityBeforeMission", true)

	if(_action == "rough_fuck"):
		processTime(5*60)

	if(_action == "rough_faster"):
		processTime(3*60)

	if(_action == "rough_cum"):
		processTime(3*60)
		getCharacter("tavi").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("tavi")
		GM.pc.addSkillExperience(Skill.SexSlave, 60)
		GM.pc.addStamina(-50)

	if(_action == "rough_otherfuck"):
		processTime(20*60)
		getCharacter("tavi").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("tavi")
		GM.pc.addStamina(-50)

	if(_action == "rough_otherfuck2"):
		processTime(20*60)
		getCharacter("tavi").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("tavi")
		GM.pc.addStamina(-50)

	if(_action == "rough_afterfuck"):
		processTime(3*60*60)
		GM.pc.addPain(-600)
		GM.pc.addStamina(600)

	if(_action == "vir_bed"):
		processTime(5*60)

	if(_action == "vir_steal"):
		processTime(3*60)
		setFlag("TaviModule.TaviIsNotVirgin", true)
		setFlag("TaviModule.Ch7TaviTookVirginityBeforeMission", true)

	if(_action == "vir_slow"):
		processTime(3*60)

	if(_action == "vir_cum"):
		processTime(8*60)
		getCharacter("tavi").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("tavi")
		GM.pc.addSkillExperience(Skill.SexSlave, 60)

	if(_action == "vir_cuddle"):
		processTime(60*60)
		GM.pc.addPain(-100)
		GM.pc.addStamina(100)

	if(_action == "checkpoint_firstguard"):
		processTime(2*60)
		npc1id = GuardGenerator.new().generate({NpcGen.Level: 30, NpcGen.Temporary: true}).getID()
		npc2id = GuardGenerator.new().generate({NpcGen.Level: 30, NpcGen.Temporary: true}).getID()
		addCharacter(npc1id)
		addCharacter(npc2id)

	if(_action == "cp_first_taviwin"):
		processTime(2*60)

	if(_action == "fight2_npc"):
		runScene("FightScene", [npc2id], "fight2_npc")
		return

	if(_action == "risha_intro"):
		removeCharacter(npc1id)
		removeCharacter(npc2id)

	if(_action == "fight3_risha"):
		runScene("FightScene", ["risha"], "fight3_risha")
		getCharacter("risha").addPain(40)
		getCharacter("risha").addLust(30)
		return

	if(_action == "nova_meet"):
		processTime(3*60)

	if(_action == "fight4_nova"):
		runScene("FightScene", ["novaArena"], "fight4_nova")
		getCharacter("novaArena").addLust(40)
		getCharacter("novaArena").addStamina(-60)
		return

	if(_action == "walk_to_skar"):
		processTime(3*60)

	if(_action == "fight5_skar"):
		runScene("FightScene", ["skar"], "fight5_skar")
		return

	if(_action == "tavi_hacks_door"):
		addExperienceToPlayer(300)

	if(_action == "skar_taviwin"):
		processTime(10*60)

	if(_action == "start_captain_scene"):
		setFlag("TaviModule.Ch7CaptainSceneHappened", true)
		runScene("Ch7s3CaptainScene")
		endScene()
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "fight2_npc"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("won_second_guard")
		else:
			setState("lost_fight")
			addExperienceToPlayer(5)

	if(_tag == "fight3_risha"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("won_risha")
		else:
			setState("lost_risha")
			addExperienceToPlayer(5)

	if(_tag == "fight4_nova"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("won_nova")
		else:
			setState("lost_nova")
			addExperienceToPlayer(5)

	if(_tag == "fight5_skar"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("skar_won")
		else:
			setState("skar_lost")
			addExperienceToPlayer(5)

func saveData():
	var data = .saveData()

	data["isCorrupt"] = isCorrupt
	data["isPure"] = isPure
	data["isNormal"] = isNormal
	data["isVirgin"] = isVirgin
	data["npc1id"] = npc1id
	data["npc2id"] = npc2id

	return data

func loadData(data):
	.loadData(data)

	isCorrupt = SAVE.loadVar(data, "isCorrupt", false)
	isPure = SAVE.loadVar(data, "isPure", false)
	isNormal = SAVE.loadVar(data, "isNormal", false)
	isVirgin = SAVE.loadVar(data, "isVirgin", false)
	npc1id = SAVE.loadVar(data, "npc1id", "")
	npc2id = SAVE.loadVar(data, "npc2id", "")
