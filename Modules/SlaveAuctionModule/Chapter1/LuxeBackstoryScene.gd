extends SceneBase

func _init():
	sceneID = "LuxeBackstoryScene"

func _run():
	if(state == ""):
		addCharacter("luxewife")
		playAnimation(StageScene.Duo, "stand", {pc="luxe", npc="luxewife", npcAction="sit"})
		saynn("[say=luxewife]You look different, Luxe. New haircut?[/say]")

		saynn("Her sarcasm bounces off the spacious living quarters, a warm and familiar room to you. Red trims and dark wooden furniture dominate the space. The centerpiece, a massive bed pressed proudly against one of the walls.. a bed that looks like it belongs in a castle. But there are also less impressive exhibits here.. a desk.. a few chairs.. a wardrobe.. everything you need to live a good wealthy life.")

		saynn("Sitting on the edge of the bed is Aisha, her dark fur sleek and soft. Her amber eyes, wide with curiosity and relief, track your every move. Her tail flicks behind her, betraying her excitement even as her voice carries a playful edge.")

		saynn("You let the door slide shut behind you with a faint hiss, stepping further into the room.")

		saynn("[say=luxe]It worked, as you can see.[/say]")

		saynn("There is some obvious arrogance in your voice but you don't care. You stand still, your imposing frame radiating an amount of confidence that is impossible to ignore.")

		saynn("[say=luxe]I'm different now. But you..[/say]")

		saynn("Your golden-tipped fur catches the light as you grin.")

		saynn("[say=luxe]You look just as sexy, Aisha.[/say]")

		saynn("Her lips twitch into a small smile, her eyes linger on your fur that is glowing faintly as though kissed by fire.")

		saynn("[say=luxewife]What a showoff~.[/say]")

		saynn("[say=luxe]Not yet.[/say]")

		saynn("You slip a cigar from your pocket, letting it rest between your fingers as you step closer. With a deliberate flex of your muscles, the golden tips of your fur ignite in a controlled burst of heat. You press the cigar's end against them.. and light it up.")

		saynn("Moments later, you're already savoring the deep inhales, sending lazy plumes of smoke curling into the air.")

		saynn("[say=luxe]Now I'm a showoff.[/say]")

		saynn("Aisha giggles, batting away the smoke wafting in her direction.")

		saynn("[say=luxewife]You never used to be much of a cigar guy.[/say]")

		saynn("[say=luxe]I wasn't. But now, how can I not?[/say]")

		saynn("[say=luxewife]Cigars are for old people, Luxe. Like your father.[/say]")

		saynn("You chuckle softly.")

		saynn("[say=luxe]I'm a dad too, you know.[/say]")

		saynn("[say=luxewife]Oh, I know~. Trust me, I know that very well.[/say]")

		saynn("Her teasing lingers in the air.")

		addButton("Continue", "See what happens next", "aisha_hugs")
	if(state == "aisha_hugs"):
		playAnimation(StageScene.Hug, "hug", {pc="luxe", npc="luxewife"})
		saynn("Aisha gets up and gives you a tight hug, her paws exploring your strong back.")

		saynn("[say=luxewife]So warm.. Sarcasm aside.. Glad you're okay, my love. It's a bit reckless to agree to such untested treatments, don't you think?[/say]")

		saynn("[say=luxe]You should think about it too. Golden accents would suit you.[/say]")

		saynn("You smirk and hug your wife with your free hand, the other one keeps holding the cigar.")

		saynn("[say=luxewife]You and your gold..[/say]")

		saynn("[say=luxe]You are my gold, Aisha. You and our kids. I want you all to be safe. And this treatment is already proven to improve your skin's heat resistance. Perfect against those laser-happy AlphaCorp fuckers.[/say]")

		saynn("Aisha looks away, her voice softening.")

		saynn("[say=luxewife]I don't know, Luxe.. I've heard stories. And besides, I think you got me pregnant again.[/say]")

		saynn("Your confident grin falters, just slightly. Your ears flick backward in surprise, and you exhale a slow puff of smoke.")

		saynn("[say=luxe]Another one? Hah. Woman, you are such an eager breeding bitch. Are we building an army, or are you just trying to make sure I'm outnumbered?[/say]")

		saynn("Aisha grabs your hand and puts it over her belly before smiling, her voice cheeky but with a subtle hint of vulnerability..")

		saynn("[say=luxewife]Wo-o-ow. Did the first twenty one kids that I gave you made you lose interest in me? Maybe I should start pegging you instead. Since you seem to be over the whole 'breeding' thing.[/say]")

		saynn("You laugh, your hand sliding over that belly up to her chin, tilting her face up to meet your gaze.")

		saynn("[say=luxe]Don't forget who has your key~. And don't be silly, I will never lose interest in you.[/say]")

		saynn("The cat blushes deeply while your voice drops, now low and intimate as you lean closer to Aisha's ear.")

		saynn("[say=luxe]If you're pregnant, it's because I can't get enough of you, and you know it.[/say]")

		saynn("[say=luxewife]You always knew how to sweet-talk me into things..[/say]")

		saynn("[say=luxe]That's because I love you. And.. you don't need the treatment now if you're unsure. But I really-really want you to be safe.. you will see the benefits, trust me. You will feel indestructible.[/say]")

		saynn("Aisha's laughter fills the room, easing the tension.. She gives you a little kiss on the lips.")

		saynn("[say=luxewife]Alright, Mr. Indestructible. But don't think I'm going to stop joking about pegging you. It's too much fun.[/say]")

		saynn("[say=luxe]I'd expect nothing less from you. Speaking of various sexual activities.. You should see my cock, it changed too.[/say]")

		saynn("Your horny hands begin trying to strip your wife. Aisha moans softly, feeling the warm arms trace her girly curves.. but before the moment can deepen further, she pulls back slightly, her expression becoming more serious.")

		saynn("[say=luxewife]I really want to.. But speaking of dicks.. your father wanted to see you.[/say]")

		saynn("You grumble.. but stop.")

		saynn("[say=luxe]Probably wants to criticize my 'reckless choices' as well. I will handle it.[/say]")

		saynn("You lean down to kiss Aisha's forehead.")

		saynn("[say=luxewife]After that you can come back and handle me, hot guy~.[/say]")

		addButton("Continue", "See what happens next", "dad_talk")
	if(state == "dad_talk"):
		removeCharacter("luxewife")
		addCharacter("luxedad")
		playAnimation(StageScene.Duo, "stand", {pc="luxe", npc="luxedad", npcAction="sit"})
		saynn("The room hums with the faint sound of the holo-wall flickering in the background, maps of trade routes and starts shifting slowly in a dance of light.")

		saynn("You step into the dimly lit office, your golden-tipped fur giving a faint glow, making you stand out more in the bland but rich environment.")

		saynn("[say=luxe]Father?[/say]")

		saynn("The old man looks up from his desk, his fingers wrapped around his powerful chin. The age has put its toll on him.. but his eyes are still sharp, the same piercing gaze that you remember staring into as a child.")

		saynn("[say=luxedad]Luxe. Closer. I wanna see my mistakes clearer.[/say]")

		saynn("The words, sharp as ever, make you sigh. You step closer, your boots hitting the polished floor with soft thuds.")

		saynn("[say=luxe]Calling me a mistake, huh?[/say]")

		saynn("[say=luxedad]No. But I clearly fucked up somewhere while raising you.[/say]")

		saynn("Not the best start, but it could have been worse.")

		saynn("[say=luxe]I didn't die, as you can see.[/say]")

		saynn("[say=luxedad]I'm old, Luxe, but don't mistake me for a fool. It will take more than some questionable drugs to kill a true Blacktail.[/say]")

		saynn("It wasn't exactly a drug injection.. but you know better than to correct your father. He is not exactly wrong either.")

		saynn("[say=luxe]What's the problem then?[/say]")

		saynn("[say=luxedad]I'm old, that's the problem. And I'm only getting older. Soon I will have to stop being the head of our family. Because I will be dead.[/say]")

		saynn("At least he didn't lose his sense of humor yet. You hadn't noticed just how gray his beard had become, how tired the lines of his face now look.")

		saynn("[say=luxe]So what? You want to tell me which of your million kids is the chosen one? Make it quick then, who do I gotta bow to now?[/say]")

		addButton("Continue", "See what happens next", "dad_getsup")
	if(state == "dad_getsup"):
		playAnimation(StageScene.Duo, "stand", {pc="luxe", npc="luxedad", npcAction="stand"})
		saynn("Your father rises from his chair.. no, his throne.. and steps closer to you. His gaze scans you, lingering on the golden glow of your trim.")

		saynn("[say=luxedad]It's you, Luxe.[/say]")

		saynn("The words land heavy. You blink, tilting your head.")

		saynn("[say=luxe]Really? Why?[/say]")

		saynn("[say=luxedad]Do I have to spell it out? Despite your.. recklessness.. You're our best slaver by far. I'm actually proud of how far you've come.[/say]")

		saynn("[say=luxe]It's easy, slaves can't run away if you break their ankles.[/say]")

		saynn("Your father sighs and looks away.")

		saynn("[say=luxedad]Younglings.. Can't believe I was like this once.[/say]")

		saynn("[say=luxe]So you're giving me the throne?[/say]")

		saynn("[say=luxedad]It's not a throne. I'm leaving you my power.. and my responsibility. It's not as easy as you think.[/say]")

		saynn("[say=luxe]If an old guy can do it, so can I.[/say]")

		saynn("He doesn't rise to your bait, his frown deepening. Straightening his posture, he looms over you despite his age.")

		saynn("[say=luxedad]Do you know why we.. Blacktail.. do what we do?[/say]")

		saynn("[say=luxe]Why we enslave? To humiliate AlphaCorp and its weak limp-dick leader in front of the whole galaxy.[/say]")

		saynn("The look he gives you could carve stone.")

		saynn("[say=luxedad]Don't make me regret my decision.[/say]")

		saynn("[say=luxe]C'mon, I'm not stupid.[/say]")

		saynn("The tips of your fur throw some glowing embers.. that fade before they ever touch the floor.")

		saynn("[say=luxedad]Then don't act stupid. This isn't about you anymore. It's about the Syndicate. About what's best for our mission.[/say]")

		saynn("His voice hardens, the authority in it pressing down on you like a weight.")

		saynn("[say=luxedad]You can't afford to be weak. If you're weak, the Syndicate is weak. Do you understand me?[/say]")

		saynn("[say=luxe]C'mon, ..[/say]")

		saynn("Your dad cuts you off.")

		saynn("[say=luxedad]Do you understand me?[/say]")

		saynn("[say=luxe]Yes. I understand, Father.[/say]")

		saynn("[say=luxedad]I doubt you do. Not yet. But you will. You will get older, you will get wiser. You will make choices you don't want to make. Sacrifices. It's not fun, but we don't have the luxury of weakness.[/say]")

		saynn("You wonder if he chose you just to make your life harder. The responsibility he speaks of feels more like a curse than an honor.")

		saynn("[say=luxe]I will try to not disappoint you, Father.[/say]")

		saynn("His chuckle is dry, raspy, and surprisingly warm.")

		saynn("[say=luxedad]I will be dead, Luxe. I won't care. But the Syndicate can't be disappointed. That's our life's work - freeing this galaxy from AlphaCorp's greedy, blood-soaked hands. If we fail, it will all be for nothing.[/say]")

		saynn("The speech leaves him hungry for air.")

		saynn("[say=luxe]Our blood won't be spilled for nothing. I swear it.[/say]")

		saynn("He nods, subtle but approving.")

		saynn("[say=luxedad]You may go.[/say]")

		saynn("You turn to leave, the weight of his words settling on your shoulders. The moment the door slides shut behind you, though, your thoughts shift. You're still Luxe Blacktail. And right now, there is a certain pregnant wife waiting in your bed.")

		addButton("Continue", "See what happens next", "back_in_room")
	if(state == "back_in_room"):
		removeCharacter("luxedad")
		playAnimation(StageScene.Solo, "stand", {pc="luxe"})
		saynn("You return to your quarters, already feeling the heat of anticipation building in your chest. The thought of what's waiting for you behind that door has your tail flicking with impatience. But as you step inside, the excitement freezes.")

		saynn("Room is empty. Your wife, Aisha, is nowhere to be seen.")

		saynn("[say=luxe]Where is she?[/say]")

		saynn("The still air offers no answer, but something catches your eye.. a small note resting on the bed.")

		saynn("You grab and read it.")

		saynn("'Will be back soon, don't worry too much, luv u xoxo'.")

		saynn("Fair enough. But it does leave you wondering what could possibly delay your very obligatory breeding session.")

		addButton("Wait", "Wait for Aisha", "wait_for_aisha")
	if(state == "wait_for_aisha"):
		addCharacter("luxewife2")
		saynn("The minutes crawl by. The room starts to feel warmer.. damn, they really need better cooling in here. You pace, the anticipation gnawing at your thoughts.. until finally.. after what feels like an eternity, the door slides open.")

		saynn("And there she is..")

		saynn("[say=luxewife2]Hey..[/say]")

		saynn("Did she really..")

		addButton("Continue", "See what happens next", "aisha_reveal")
	if(state == "aisha_reveal"):
		playAnimation(StageScene.Duo, "stand", {pc="luxe", npc="luxewife2"})
		saynn("Aisha steps inside, her fur glowing faintly with a golden aura. The tips of her black fur shimmer with embers, the glow catching the dim light of the room and making her look almost otherworldly.")

		saynn("[say=luxewife2]I thought they'd finish before you got back, but.. it took longer than expected.[/say]")

		saynn("You take her in, eyes scanning every glowing inch of her transformed body. The faint blush on her cheeks has a golden hue, her tail swishing behind her with excitement.")

		saynn("[say=luxe]Wow.[/say]")

		saynn("It's all you can manage.")

		saynn("[say=luxewife2]You're about to get mad at me, aren't you?[/say]")

		saynn("[say=luxe]You look.. breathtaking.. Aisha.[/say]")

		saynn("Her shy smile deepens.. and you watch as the gold spreads faintly across her cute cheeks.")

		saynn("[say=luxewife2]I didn't expect my blood to change color. It's like.. there is lava flowing through my veins. So strange.[/say]")

		addButton("Embrace", "Hug your wife", "do_hug_new_wife")
	if(state == "do_hug_new_wife"):
		playAnimation(StageScene.Hug, "kiss", {pc="luxe", npc="luxewife2"})
		saynn("You step closer, pulling her into a firm embrace. The glow of her body feels almost electric against yours. Your lips find hers, pressing into a slow, deep kiss.")

		saynn("[say=luxe]It's not lava, Aisha. It's liquid gold. But I get why you'd think it's lava.[/say]")

		saynn("Her ears fold down as her fluffy tail curls around yours, cuddling it softly.")

		saynn("[say=luxewife2]Enlighten me, love.[/say]")

		saynn("[say=luxe]Because you are super hot.[/say]")

		saynn("Her amber eyes flash with mischief as her lips curl into a teasing smirk.")

		saynn("[say=luxewife2]Also. Do I have to start smoking cigars now?[/say]")

		saynn("[say=luxe]Obviously. It's mandatory.[/say]")

		saynn("Her soft giggle sends sparks of warmth through you. Your hands, unable to wait any longer, slip down her sides, teasing the edge of her pants. Her fur glows brother as your touch grows bolder, the room's dim light unable to compete with the golden hue of her body.")

		saynn("[say=luxewife2]Are you sure it's a good idea.. Right after that treatment..[/say]")

		saynn("You acknowledge her words.. but keep going anyway, the unbearable wait only made you hornier. Your hands grope her tight ass and slide under her pants.. finding that little locked treasure.. putting pressure on its metal containment.. as well as her needy flower hiding behind.")

		addButton("Continue", "See what happens next", "luxe_undress")
	if(state == "luxe_undress"):
		playAnimation(StageScene.Grope, "stroke", {pc="luxe", npc="luxewife2", bodyState={naked=true, hard=true}, npcBodyState={naked=true, caged=true}})
		saynn("[say=luxe]You know.. You are talking to the future head of this family.[/say]")

		saynn("Her ears perk, and her grin turns playful.")

		saynn("[say=luxewife2]Ohh.. More good news.. Hello, Blacktail leader..[/say]")

		saynn("Her paws reach into your pants and finds your glowing hard cock already peeking from its sheath. Her soft digits rub the leaky tip.")

		saynn("[say=luxe]And this means that you should always obey me, like a good girl.[/say]")

		saynn("She leans in close, her lips brushing against your ear, her voice teasing it.")

		saynn("[say=luxewife2]Alright.. I will be your good girl~. But only if you treat me like a bad one..[/say]")

		saynn("Oh, you're on.")

		saynn("Lots more hot kisses are exchanged while the clothes fall off from the both lovers, revealing all the secrets..")

		addButton("Continue", "See what happens next", "sex1_start")
	if(state == "sex1_start"):
		playAnimation(StageScene.SexOverTable, "tease", {pc="luxe", npc="luxewife2", bodyState={naked=true, hard=true}, npcBodyState={naked=true, caged=true}})
		saynn("Aisha barely has time to gasp as you grab her and turn her around before bending her over the wide dining table.")

		saynn("[say=luxewife2]Ah.. we have a bed, you know..[/say]")

		saynn("[say=luxe]It's too far.[/say]")

		saynn("She wiggles under your firm grip, her position makes her extremely vulnerable. You slide a hand down her glowing thighs.. before spreading her legs wider.")

		saynn("[say=luxewife2]And you just can't wait, can you..[/say]")

		saynn("[say=luxe]Neither could you.[/say]")

		saynn("The tail moves out of the way to uncover the golden drippy pussy folds that are now glowing ever so slightly in the faint light.. as well as her tight tailhole and the tip of her own feline cock.. the one that has a metal chastity cage sitting snugly on it, forcing it to be limp no matter what. You run your digits along her folds.. but also the cold metal too, tracing the contours of her cage.. your cage.")

		saynn("[say=luxe]Still locked up tight. Just the way I like you.[/say]")

		saynn("Your voice is dripping with satisfaction while Aisha shivers, her checks glowing faintly gold with a blush as she glances behind her with an obedient gaze.")

		saynn("[say=luxewife2]It's yours to keep locked, always has been, love.. But if you want me to peg you.. ah..[/say]")

		saynn("Your hand spreads her wetness while the other is resting possessively on the caged shaft. You trip it lightly and give it a teasing squeeze that makes Aisha gasp. The cage quickly grows tighter as her arousal builds, her cock trying to get hard within its unyielding confines.")

		saynn("[say=luxe]Already straining. You're so desperate, aren't you?[/say]")

		saynn("You watch a single bead of pre drip from the cage's tip.")

		saynn("[say=luxewife2]Don't tease..[/say]")

		saynn("You grin and align yourself, your cock looking hard and ready, the veins glowing brightly, the tip already leaking. You push it against her needy pussy entrance, teasing her just enough to make her squirm and claw at the edge of the table.")

		saynn("[say=luxe]Beg.[/say]")

		saynn("[say=luxewife2]Please.. ah.. breed me, Luxe..[/say]")

		saynn("Even though she is probably pregnant.. might as well make sure.")

		addButton("Continue", "See what happens next", "sex1_sex")
	if(state == "sex1_sex"):
		playAnimation(StageScene.SexOverTable, "sex", {pc="luxe", npc="luxewife2", bodyState={naked=true, hard=true}, npcBodyState={naked=true, caged=true}})
		saynn("That's all you needed to hear. With one powerful impulse, you bury your cock deep inside Aisha, stretching her tight walls and making her cry out. The wooden desk groans beneath you both as you pull back.. before ramming it in again, setting a punishing cycle.")

		saynn("[say=luxewife2]Ah-h.. you're on fire today..[/say]")

		saynn("The sound of fur slapping against fur fills the room, as well as the cat's gasps and moans. Your hands grip her waist tightly, your claws digging into her skin as you use your wife on the desk nice and harder, your cock pistoning into her needy pussy. Her glowing furs are like little fire tongues.. sending embers of golden hues that only make you want her more.")

		saynn("Her tail wraps around your waist, seemingly pulling you in. One of your hands goes around her leg and returns to her caged cock, gripping it roughly. You can feel the pressure building in as her arousal surges, her cute feline shaft trying to swole inside, straining painfully against the unyielding metal.")

		saynn("[say=luxe]You're mine.[/say]")

		saynn("You growl as you squeeze her furry orbs, causing her body to tremble beneath you, her walls clenching hard around your cock.")

		saynn("[say=luxewife2]Ah.. yes.. a-always yours..[/say]")

		addButton("Continue", "See what happens next", "sex1_fast")
	if(state == "sex1_fast"):
		playAnimation(StageScene.SexOverTable, "fast", {pc="luxe", npc="luxewife2", bodyState={naked=true, hard=true}, npcBodyState={naked=true, caged=true}})
		saynn("The moment you ramp up the pressure and start pounding her pussy harder, her orgasm hits her like a truck, her slit clamping down on your glowing shaft as her juices spill out, wetting your member and dripping onto the desk. At the same time, her caged cock jerks violently, desperate to release. The cage holds firm.. but thin jets of seed begin shooting through the tiny openings, splattering across the wooden surfaces.")

		saynn("[say=luxewife2]Ahh-h-h.. Luxe!..[/say]")

		saynn("Aisha cries out, her body shaking uncontrollably, her voice breaking as another gush of her juices coats your cock, her panting becomes more and more audible.")

		saynn("You're not done yet though, your knot has only begun inflating with liquid gold. You grip her tighter and keep thrusting through her climax, determined to make her scream even louder.")

		saynn("The room gets hotter and hotter.. probably from your and Aisha's fur looking almost like real fire by this point. Your hearts are beating like hell but the heat resistance makes you feel invulnerable.")

		addButton("Continue", "See what happens next", "sex1_cum")
	if(state == "sex1_cum"):
		playAnimation(StageScene.SexOverTable, "inside", {pc="luxe", npc="luxewife2", bodyState={naked=true, hard=true}, npcBodyState={naked=true, caged=true}})
		saynn("As soon as you feel your peak drawing near, you commit..")

		saynn("With one final, powerful thrust, you bury your cock to the hilt, your swollen knot popping inside that tight pussy, locking you and your lover together. Aisha whimpers as the stretch sends her over the edge again, her golden pussy clenching around you hard. Her cage strains even more as her cock twitches inside, your shaft forcing another few bursts of seed out of her balls.")

		saynn("You growl.. as your own cock begins to throb, spurting thick, hot ropes of cum deep inside her. The knot ensures not a drop is wasted while you pump her full of your virile seed, making Aisha's belly looking even more pregnant than it was.")

		saynn("[say=luxe]Grr.. good girl.[/say]")

		saynn("Aisha is panting heavily, squirming beneath you, her body completely spent and stuffed at the same time, your full length still buried inside her.")

		saynn("[say=luxewife2]A-always your g-girl.. hahh-h.. t-this is intense.. my h-heart.. b-beating like crazy.[/say]")

		saynn("[say=luxe]Mine's too. Time to rest.[/say]")

		saynn("Carefully, you yank your knot out, causing a fountain of your seed to emerge from her stuff gaping pussy.")

		addButton("Continue", "See what happens next", "after_sex1")
	if(state == "after_sex1"):
		playAnimation(StageScene.SexLotus, "tease", {pc="luxewife2", npc="luxe", bodyState={naked=true, caged=true}, npcBodyState={naked=true, hard=true}})
		saynn("You pull your wife onto the bed and start cuddling with her.")

		saynn("[say=luxewife2]Now I'm p-pregnant for sure..[/say]")

		saynn("[say=luxe]Good.[/say]")

		saynn("The atmosphere in the room becomes hazy.. Lots of little steam clouds everywhere. You realize that it's coming from your heavy breaths. Aisha and you, you're both panting.. still.. Your golden fur tips dancing and swaying..")

		saynn("[say=luxewife2]I'm n-not sure if we s-supposed to breathe out s-steam..[/say]")

		saynn("It's concerning.. but probably nothing to worry about. You pull your wife closer.. and realize how crazy her heartbeat actually is.. now that's concerning.")

		saynn("[say=luxe]Are you feeling okay, Aisha?[/say]")

		saynn("[say=luxewife2]I'm not s-sure.. I think I n-need some fresh air..[/say]")

		saynn("The golden glow of the room dims slightly as Aisha rolls off the bed, her legs shaky and her breath uneven. You just keep watching her, noticing the quiver in her steps.")

		saynn("[say=luxe]Aisha?[/say]")

		saynn("[say=luxewife2]I'm f-fine..[/say]")

		saynn("She stammers, her hand reaching for the wall to steady herself.")

		addButton("Continue", "See what happens next", "aisha_begins_to_die")
	if(state == "aisha_begins_to_die"):
		playAnimation(StageScene.SexStart, "start", {pc="luxe", npc="luxewife2", bodyState={naked=true}, npcBodyState={naked=true,caged=true}})
		saynn("But before Aisha can make it another step, her legs buckle, and she collapses to the floor with a soft thud.")

		saynn("[say=luxe]Aisha![/say]")

		saynn("You yell while bolting from the bed and kneeling beside her. You cradle her trembling body in your hands, your glowing fur casting flickering light across her weakening features.")

		saynn("Her breaths are ragged, her heartbeat erratic against your chest. Your voice becomes desperate.")

		saynn("[say=luxe]What's happening? Stay with me, Aisha. Stay with me.[/say]")

		saynn("Her amber eyes, dulled now, open to meet yours. She manages a weak smile.. but her trembling hand barely reaches your cheek before falling limply to her side.")

		saynn("[say=luxewife2]I.. I think t-this.. t-this is it.. for m-me..[/say]")

		saynn("Her voice is nothing but whisper now, her words faltering as a cough wracks her body. Her lips part.. and a faint wisp of golden steam escapes.")

		saynn("Your chest begins to tighten as you feel a strange heat building in her, her glowing fur now almost too bright to look at.")

		saynn("[say=luxe]No. No, no, NO-NO-NO![/say]")

		saynn("Your voice is cracking. You lift her easily and dash towards the door, the golden embers on your fur flicker violently. You step out into the hall and begin shouting.")

		saynn("[say=luxe]HELP! SOMEONE! SHE NEEDS HELP![/say]")

		saynn("Aisha's body shudders harder in your arms, her glow intensifying like a fire.. burning out of control. The more you look at her.. the more you feel your own heart beginning to pound harder.. harder and harder..")

		saynn("[say=luxewife2]L-Luxe..[/say]")

		saynn("Her whisper is barely audible")

		saynn("You keep looking down at her, your heart breaking as her once-strong body seems to crumble in your hands.")

		saynn("[say=luxewife2]Don't.. talk.. Just h-hold on..[/say]")

		saynn("Tears are streaming down her cheeks.. before evaporating from the immense heat.. She grips your arm weakly, her claws trembling against your fur.")

		saynn("[say=luxewife2]Y-you.. you have to s-stay calm.. p-please..[/say]")

		saynn("[say=luxe]W-what?..[/say]")

		saynn("Your fur shines brightly.. just like Aisha's..")

		saynn("[say=luxewife2]If.. if you lose it.. i-it will t-take you too..[/say]")

		saynn("Her voice is fading as more steam escapes her lips, her fur now almost blinding. You can feel it.. she is burning up from the inside..")

		saynn("[say=luxe]No.. I don't want to.. Aisha.. I'm not leaving you..[/say]")

		saynn("You refuse to accept her words while her hand tightens slightly, her last ounce of strength focused on you.")

		saynn("[say=luxewife2]I l-love y-you, L-Luxe.. D-don't let this b-break y-you..[/say]")

		saynn("Your body trembles as you fight the urge to scream again, your instincts are begging you to let out your agony. You bite down hard on your own lip, drawing blood.. and trying desperately to stay composed..")

		saynn("Aisha's body grows hotter, the glow now almost white. Her once-lush fur begins to disintegrate into shimmering golden embers that float into the air. Her eyes meet yours one last time.. filled with love and pain.")

		saynn("[say=luxewife2]I.. l-love.. y-you..[/say]")

		saynn("[say=luxe]No, Aisha.. Stay with me.. Stay..[/say]")

		saynn("You lose the ability to speak as her body lights up in your hands.. before turning into ash, slipping through your fingers like sand..")

		addButton("Continue", "See what happens next", "aisha_dead")
	if(state == "aisha_dead"):
		removeCharacter("luxewife2")
		playAnimation(StageScene.Solo, "kneel", {pc="luxe", bodyState={naked=true}})
		saynn("You stare down at the empty space where she was, your hands trembling, now streaked with golden dust. The glow of your fur flickers dangerously, the heat within you threatening to boil over.")

		saynn("Don't let this break you..")

		saynn("You clench your fists, breathing deeply through the burning in your chest. There is rising inferno in your chest, you can feel it..")

		saynn("Don't let this break you..")

		saynn("You force yourself to calm down, suppressing that inferno. You grind your teeth as the tears slide down your cheeks.. but you don't scream.. you don't let the grief consume you..")

		saynn("Don't let this break you..")

		saynn("Instead, you kneel there in silence, the ashes of your wife slipping through your fingers. The air is heavy, the faint smell of burning fur and a lingering golden glow the only reminder of her.")

		saynn("You focus on your breathing.. your stare emotionless.. not a single word leaves your closed lips. The fire inside you begins to fade.. bit by bit.. but the pain remains strong..")

		saynn("People begin to surround you.. their faces nothing but blur.. their voices nothing but noise..")

		addButton("Continue", "See what happens next", "luxe_griefs")
	if(state == "luxe_griefs"):
		playAnimation(StageScene.Solo, "sit", {pc="luxe"})
		saynn("The next few days blur together.")

		saynn("You sit alone in your quarters in complete silence. The room feels like it has shrunk, closing in on you.")

		saynn("Before you, on the desk, sits the urn.. A small, sealed container of polished obsidian with faint golden etchings. You can't take your eyes off of it..")

		saynn("You haven't moved for hours.. Maybe weeks.. Time has no meaning.")

		saynn("You want to scream. The urge claws at your throat, burns in your chest. It's the only sensation you truly feel.. the suffocating pressure of grief pushing against your ribcage. But you don't. You won't. You didn't have time to promise it to her.. but you promised yourself that you wouldn't..")

		saynn("Your hands rest on your knees, steady, deliberate. Not a single tremor betrays the storm inside you. Your glowing fur tips have dimmer over the past days, now barely casting any light. Even the embers have abandoned you.. mirroring the void in your chest..")

		saynn("Your breathing is shallow, measured, too even to be real. The rhythm is forced, a performance for no one. Not a single tear falls. You have trained yourself out of that luxury.")

		saynn("Your jaw tightens. Your gaze hardens.")

		saynn("The emptiness gnaws at you, relentless. It's as if the universe is hollow, stripped of meaning. And yet, you're still here, stuck in it, forced to exist when she doesn't.")

		saynn("Your head tilts back, resting against the chair. You close your eyes, hoping for the bliss of nothingness. But it doesn't come. Her face is there, burned into the darkness behind your eyelids.")

		saynn("It's unbearable.. but you have to endure it..")

		addButton("Continue", "See what happens next", "dad_tries_help")
	if(state == "dad_tries_help"):
		addCharacter("luxedad")
		playAnimation(StageScene.Solo, "sit", {pc="luxe", npc="luxedad"})
		saynn("The door slides open. Your father steps into your room, his heavy boots clicking against the floor. He doesn't ask for permission to enter. He doesn't need to.")

		saynn("He stands behind you, looking at the same urn.")

		saynn("[say=luxedad]My condolences.[/say]")

		saynn("A subtle nod is all you can force out of yourself.")

		saynn("[say=luxedad]We weren't exactly on the best terms. But she had the heart of a good woman. Of a good mother.[/say]")

		saynn("Silence settles again, heavy and suffocating. You feel it creeping up your spine, the urge.. eating at you.")

		saynn("[say=luxedad]Just know this.. It gets worse before it gets better. You will move on eventually.[/say]")

		saynn("Move on? The words twist like a knife in your chest.. but you don't respond, feels like you are over it by now indeed.")

		saynn("[say=luxedad]You're still young. There is no shortage of girls, especially for someone with your status.[/say]")

		saynn("His words are so casual, so dismissive. It stings.. makes you feel something that you don't want to feel.")

		saynn("[say=luxedad]There are more pressing matters than your personal grief. The mission doesn't stop. Hear me?[/say]")

		saynn("You take your gaze off of the urn and look at him, your expression is completely blank.")

		saynn("[say=luxe]I hear you.[/say]")

		saynn("Your voice is calm, measured. Your father nods, satisfied with the answer. But his gaze lingers on you.")

		saynn("[say=luxedad]Grief makes men soft. It's a weakness we can't afford.[/say]")

		saynn("You just nod again.")

		saynn("Your dad reaches into his pocket and pulls out a small pill bottle with an empty label. With a flick of his digits, he opens it, revealing its contents.. some kind of pills.")

		saynn("[say=luxedad]These will help against that side-effect of your treatment. R&D did a lot of tests to make sure that these work.[/say]")

		saynn("He sets the bottle on the desk, next to the urn.")

		saynn("[say=luxedad]So you won't end up like her.[/say]")

		saynn("It stings.. Your hand twitches.")

		saynn("Your father steps closer, his voice dropping lower.")

		saynn("[say=luxedad]You can only get over bad feelings if you actually feel them. But tomorrow, I want you in top shape. This has dragged on for long enough.[/say]")

		saynn("His words linger in the air, heavy and uninvited.")

		saynn("[say=luxedad]She saved you. Don't waste your second chance, son.[/say]")

		saynn("Your father straightens his posture, his gaze softening for just a moment. Then, without another word, he turns and leaves the room.")

		saynn("The door hisses shut behind him, leaving you alone again.")

		saynn("Your eyes are focussed on that pill bottle..")

		addButton("Continue", "See what happens next", "luxe_very_angry")
	if(state == "luxe_very_angry"):
		removeCharacter("luxedad")
		playAnimation(StageScene.Solo, "stand", {pc="luxe"})
		saynn("The silence feels like it's crushing you, growing heavier with every breath.")

		saynn("This has dragged on for long enough..")

		saynn("You open the bottle and grab a pill. It's small, unassuming. Without a second thought, you toss it into your mouth and swallow.")

		saynn("Nothing happens.. for a moment..")

		saynn("But then..")

		saynn("A SCREAM rips from your throat, raw and primal, echoing off the walls.")

		saynn("[say=luxe]AAAAAAAAAA-A-AH.[/say]")

		saynn("You grab the edge of the desk and flip it over in a single, furious motion. The urn.. crashes to the floor.. before shattering into a hundred pieces, the ashes scattering like smoke in the wind.")

		saynn("You don't stop, you can't stop. Your fists slam into the walls, leaving dents and cracks in the wood, the glowing tips of your fur blaze brighter with every punch, embers flickering and sparking around you.")

		saynn("Your scream dies down, replaced by heavy, ragged breaths. Your body trembles, your mind nothing but a complete chaos.")

		saynn("The chair is next, you grab it and smash it against the double bed.. Splinters fly everywhere, the bed's frame collapsing.")

		saynn("No matter how much you thrash your room.. it doesn't get any easier to endure the pain.")

		saynn("So you step out.. inferno shining brightly in your eyes.")

		addButton("Continue", "See what happens next", "near_cells")
	if(state == "near_cells"):
		playAnimation(StageScene.Duo, "stand", {pc="luxe", npc="luxecatgirl", npcAction="kneel"})
		addCharacter("luxecatgirl")
		saynn("Luxe's boots are heavy against the metal floor, each step fast and deliberate.")

		saynn("He follows the corridors until he finds the 'slave cells'.")

		saynn("The door hisses open, revealing the dimly lit, sterile space. Rows of big metal cages line the walls, each one holding a different soul.. some defiant, others broken.")

		saynn("Luxe's gaze sharpens as he makes his way down the row.. until he sees her.")

		saynn("A cute-looking catgirl sits quietly in the corner of her cage-cell, her red fur catching the faint light. Her eyes lift to meet yours, wide and submissive, with a small flicker of curiosity in them. A bulky slave collar is weighting her neck down, a symbol of ownership. Her wrists are resting in her lap, spotting obvious cuff marks.")

		saynn("Her red hair cascades over her shoulders, her tail curling tightly around her legs as if trying to make herself seem smaller.")

		saynn("The sight turns the fire inside Luxe into a raging firestorm, primal growl vibrating the hot air around him. None of this is gonna be pretty..")

		addButton("Skip it", "You don't want him to explain it with full details", "skip_it")
		addButton("Feel it", "(Sexual violence) See what happens next", "feel_it")
	if(state == "skip_it"):
		playAnimation(StageScene.SexStart, "defeated", {pc="luxe", npc="luxecatgirl"})
		saynn("Blind rage fuels Luxe as he lashes out on that poor catgirl.")

		saynn("Screams, begging, whining.. The sounds of this abuse make even the most bratty slaves shut their mouths and hope that their turn won't come.")

		saynn("Luxe takes the girl against her will. And then leaves her bleeding unconscious frail frame on the floor.")

		saynn("Blood finally extinguishes the uncontrollable fire inside him.")

		addButton("Continue", "See what happens next", "after_catgirl")
	if(state == "feel_it"):
		playAnimation(StageScene.Choking, "tease", {pc="luxe", npc="luxecatgirl"})
		saynn("Luxe's broad frame fills the cell entrance, his burning fur tips casting flickering light onto the catgirl's crimson fur. She shrinks back, her collar clinging against the cage as she presses herself against it, her wide eyes fixed on the towering beast before her.")

		saynn("[say=luxecatgirl]P-Please, master.. I will do whatever you want.. Anything.. Just don't hurt me..[/say]")

		saynn("Luxe doesn't answer. His silence is deafening, more terrifying than any growl or roar. He steps forward, his heavy steps echoing through the confined space. The catgirl yelps and presses herself into the corner.. but there is nowhere to run.. Luxe's clawed hand lashes out, grabbing her by the throat and hauling her up to her feet.")

		saynn("The first strike comes without warning, his free hand collides with her cheek, leaving a bunch of nasty cuts in one swipe, barely avoiding the eyes. A sharp cry escapes her lips, her body convulsing in his grip. Luxe then throws her to the ground with a force that knocks the air from her lungs, her small frame skidding across the cold floor.")

		saynn("Before she can recover, he's on her again, his claws digging into her arms as he drags her upright, pinning her against the wall of the cage. Her legs dangle helplessly, her arms desperately trying to free themselves. Luxe doesn't relent, drawing more blood from her by slashing her petite chest before slamming her back against the metal surface.")

		saynn("The sobbing catgirl gasps for breath, her vision blurring as the force of each strike leaves her dazed. Each strike lands on her with calculated brutality. The last few hits force nasty crack noises out of some of her ribs.")

		saynn("[say=luxecatgirl]M-Master.. P-Please.. I'll.. kh.. d-do anything.. a-anything..[/say]")

		saynn("Her words fall on deaf ears, Luxe's glowing eyes are fixed on her, his expression cold and devoid of mercy.")

		addButton("Continue", "See what happens next", "catgirl_collapses")
	if(state == "catgirl_collapses"):
		playAnimation(StageScene.SexStart, "defeated", {pc="luxe", npc="luxecatgirl"})
		saynn("Finally, she collapses, her legs giving out beneath her. Luxe lets her fall, her hands barely breaking her fall as she crumples to the floor. Her body trembles uncontrollably, tears streaming down her crimson fur as she looks up at him with desperate, pleading eyes.")

		saynn("[say=luxecatgirl]P-please..[/say]")

		saynn("Her voice is trembling.")

		saynn("Luxe crouches before her, grabbing her by the hips and flipping her onto her back with a single, strong motion. She yelps as her legs are forced apart, her bruised thighs shaking under his iron grip. The catgirl squirms beneath him.. but his weight and power make resistance futile.")

		addButton("Continue", "See what happens next", "sex2_sex")
	if(state == "sex2_sex"):
		playAnimation(StageScene.SexMatingPress, "sex", {pc="luxe", npc="luxecatgirl", bodyState={showPenis=true, hard=true}, npcBodyState={naked=true}})
		saynn("He doesn't waste time. His cock, already hard and leaking, presses against her entrance. Without warning or preparation, he drives into her with brutal force, his thick shaft stretching her far beyond her limits.")

		saynn("She screams, her head tilting back as her claws scrape uselessly against his chest. The unbearable pain leaves her gasping, her body struggling to adjust to his size.")

		saynn("Luxe begins thrusting, each motion hard and unrelenting. His silence is deafening, the only sounds in the room are the rhythmic slaps of his hips against her and her broken cries.")

		saynn("[say=luxecatgirl]P-please.. khh.. hh.. m-master.. I c-can't.. ah-kh.. too m-much..[/say]")

		saynn("She sobs, her voice cracking.")

		addButton("Continue", "See what happens next", "sex2_fast")
	if(state == "sex2_fast"):
		playAnimation(StageScene.SexMatingPress, "fast", {pc="luxe", npc="luxecatgirl", bodyState={showPenis=true, hard=true}, npcBodyState={naked=true}})
		saynn("But there is no mercy in Luxe, he moves like a beast possessed, his fur flickering erratically and leaving trails as his glowing cock slams into the poor catgirl over and over. Her body jolts with each thrust, her legs trembling as they remain pinned by the wolf.")

		saynn("Her cries grow weaker as the abuse continues, her energy draining under his relentless assault. His claws dig into the skin of her shoulders, leaving more bleeding cuts and scratches.")

		saynn("Soon, the girl's body begins to twitch uncontrollably, her pussy clenching around his cock as her orgasm is forced upon her weak body. The sudden climax makes her scream again, her voice echoing off the walls as her juices coat his shaft. But Luxe doesn't stop even thin, he thrusts through her climax, his motions rough and erratic, the veiny orb at the base of his shaft getting bigger.")

		saynn("Her eyes roll back, her head turning to the side as her cries turn to faint gasps.. Her body still quivers beneath him, her legs struggling to stay in position as he keeps her pinned down.")

		addButton("Continue", "See what happens next", "sex2_cum")
	if(state == "sex2_cum"):
		playAnimation(StageScene.SexMatingPress, "inside", {pc="luxe", npc="luxecatgirl", pcCum=true, bodyState={showPenis=true, hard=true}, npcBodyState={naked=true}})
		saynn("Finally, with a deep, guttural growl, Luxe knots the girl, his whole length gets forced inside, the swollen knot locking them together. The tightness is enough to send him off cumming, his throbbing shaft sends thick, hot seed flooding her womb, each pulse pushing her further into overstimulation, making her belly bumpier. Her limp body jerks weakly with every spurt, her eyes slowly closing as the consciousness begins to leave her.")

		saynn("Luxe stays inside her, his chest moving as he glares down at the unconscious girl. Her face is streaked with tears, her hair all sorts of messed up, her body littered with bruises, cuts and scratches.")

		saynn("For a moment, he remains motionless, the rage in his eyes slowly giving way to something hollow.. The fire inside him starts to die down, leaving only ashes in its wake.")

		saynn("Luxe pulls out finally, his cock slipping free as his seed spills from her used body. Her stands, towering over her limb form as she lies sprawled on the cold floor, her chest seemingly still..")

		saynn("The wolf stumbles back from the girl and empties the contents of his stomach onto the floor.. before walking away, leaving the broken catgirl in the cage.")

		addButton("Continue", "See what happens next", "after_catgirl")
	if(state == "after_catgirl"):
		removeCharacter("luxecatgirl")
		playAnimation(StageScene.Solo, "stand", {pc="luxe", bodyState={naked=true}})
		saynn("You open your eyes, greeted by the dim glow of your living quarters. A soft hum of machinery runs in the background. The air feels sterile, artificial.. much like the numbness settling in your chest.")

		saynn("You sit up slowly, head pounding, the aftermath of yesterday's rage still coursing faintly through your veins.")

		saynn("[say=luxe]What have you done, you stupid fuck.[/say]")

		saynn("Feeling the heat beginning to eat you up from the inside.. you calm yourself down.. you're getting quite good at it.")

		saynn("Rising to your feet, you stagger toward the adjacent bathroom. The reflective surface of the mirror greets you with an unwelcome sight: it's your face. Messy fur, bags under your glowing eyes.. and a faint streak of dried blood on your cheek.")

		saynn("You grab a toothbrush and squeeze a line of toothpaste onto its bristles with more force than necessary. The minty smell hits your nostrils, sharp and clean.. in stark contrast to the mess swirling inside you.")

		saynn("Brushing your teeth feels automatic, mechanical.. your muscle memory holding you together. The rhythmic scrubbing downs out the fading images of last night.. the girl's screams, her innocent eyes.. her limp body. You spit into the sink and watch the foamy mix swirl down the drain.")

		saynn("Your eyes look at the mirror again. For a moment, you see her.. Aisha.. standing behind you, her glowing fur reflecting in the glass.")

		saynn("[say=luxe]..Aisha![/say]")

		saynn("You blink, and she is gone, leaving only your mean face staring back. You sigh and mutter to yourself.")

		saynn("[say=luxe]Get a grip already.[/say]")

		saynn("You rinse your mouth and splash cold water onto your face.")

		saynn("Returning to the main room, you find your official attire laid out neatly on the desk. The staff had clearly been here while you slept, repairing the damage, sweeping away the shattered urn, scrubbing the walls clean of ash and soot. Even the faint scent of smoke is gone, replaced with the sterile sting of cleaning agents.")

		saynn("You put on your clothes piece by piece, the familiar fabric going over your body like armor. Each buckle fastened, each clasp secured. The constant reminder of the role you're meant to play. Leader. Commander. The future head of the Blacktail family.")

		addButton("Continue", "See what happens next", "dad_comes_back")
	if(state == "dad_comes_back"):
		addCharacter("luxedad")
		playAnimation(StageScene.Duo, "stand", {pc="luxe", npc="luxedad"})
		saynn("Before you gather enough strength to step beyond the suffocating walls of your once-shared sanctuary, the door slides open with its usual sterile hiss. Your father strides in uninvited, his presence filling the room like an unwelcome shadow.")

		saynn("[say=luxedad]You're up. Good. We've got work to do. Time to start preparing you for your future role.[/say]")

		saynn("His tone is businesslike, sharp, as if yesterday didn't even happen. You swallow hard, the weight of what you've done still pressing heavily on your chest.")

		saynn("[say=luxe]That slave..[/say]")

		saynn("[say=luxedad]Pregnant.[/say]")

		saynn("His words hit like a sledgehammer.. but he doesn't stop.")

		saynn("[say=luxedad]Broken ribs. Multiple concussions. Lost about half her blood. Torn vaginal canal. Did I mention the pregnancy? Congrats. We, Blacktail, always had quite the virile seed.[/say]")

		saynn("The room tilts slightly. You grab the edge of the desk to steady yourself, the reality slamming into you with unrelenting force.")

		saynn("Your eyes close instinctively.. but the darkness offers no salvation. Instead, it conjures flashes of your black-furred wife.. a soft face.. amber eyes staring at you.. Then the images of the poor abused catgirl show up instead, flashing fast, twisting your gut violently.")

		saynn("[say=luxe]I.. I want her gone. Sell her off.[/say]")

		saynn("Your voice comes out strained, barely above a whisper.")

		saynn("[say=luxedad]Sell her off? Are you serious?[/say]")

		saynn("You open your eyes to meet his piercing elderly gaze.")

		saynn("[say=luxedad]She's carrying the next Blacktail family member inside her. We don't sell our legacy.[/say]")

		saynn("Legacy.. The word tastes like ash in your mouth.")

		saynn("[say=luxe]I fucked up. I don't want to see her ever again. Get rid of her.[/say]")

		saynn("Your father steps closer, his looming presence filling your vision. His expression hardens, the faintest glimmer of disappointment flickering in his eyes.")

		saynn("[say=luxedad]At least keep the child. They didn't ask for this.[/say]")

		saynn("The truth stings, fueling your guilt. Your jaw tightens, your hands clenched into fists, your fur lighting up a bit.")

		saynn("[say=luxe]You want the next Blacktail heir to be from a slave? From a whore?[/say]")

		saynn("Your words spill out like venom.. leaving a bitter aftertaste.")

		saynn("[say=luxedad]Is that the problem?[/say]")

		saynn("You squeeze your eyes shut again, trying to block out his penetrating stare, but it's no use. The images are back.. broken, bleeding, begging.. burning.. dying.. What have you done, you dumb fuck..")

		saynn("[say=luxe]Sell. Her. Off.[/say]")

		saynn("You leave no room for negotiation in your voice.")

		saynn("Your father doesn't respond immediately. He studies you in silence, his sharp gaze peeling back the layers you've tried to build around yourself. The pause stretches unbearably, heavy with unspoken judgment.")

		saynn("[say=luxedad]Alright. I will see what I can do.[/say]")

		saynn("He turns away slightly.. but decides to add to his words first.")

		saynn("[say=luxedad]Before we go, my son..[/say]")

		saynn("You glance up, feeling the weight in his tone.")

		saynn("[say=luxedad]Tell me. Do you really think you weren't born by a whore?[/say]")

		saynn("His words are a dagger to the gut, sharp and painful. He doesn't wait for your answer, his heavy footsteps follow him into the corridor before the door hisses shut behind him.")

		saynn("The silence that follows is unbearable.")

		saynn("You close your eyes again.. but there is no escape..")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "aisha_hugs"):
		processTime(3*60)

	setState(_action)
