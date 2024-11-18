extends SceneBase

func _init():
	sceneID = "LuxeBackstoryScene"

func _run():
	if(state == ""):
		addCharacter("luxewife")
		playAnimation(StageScene.Duo, "stand", {pc="luxe", npc="luxewife", npcAction="sit"})
		saynn("[say=luxewife]You look different, Luxe. New haircut?[/say]")

		saynn("The sarcasm echoes around the spacious living quarters. Red trims and dark wood furniture make it obvious what kind of people this room belongs to. A huge ass double bed is its main feature, positioned proudly against one of the walls. Sitting on it is a cute-looking dark-furred kitty, her amber eyes are just as concerned as they are curious. Her tail wags with excitement and relief.")

		saynn("[say=luxe]Guess what, it worked.[/say]")

		saynn("The door slides closed behind Luxe with a faint hiss. The wolf approaches the only other occupant of this space, his imposing frame radiating an immense amount of confidence towards the cute girl.")

		saynn("[say=luxe]I'm different. But you look just as sexy, Aisha.[/say]")

		saynn("He grins while his black fur shimmers faintly, tipped with golden hues that Aisha seems to be fascinated by.")

		saynn("[say=luxewife]What a showoff.[/say]")

		saynn("[say=luxe]Nope.[/say]")

		saynn("With a smirk, Luxe reaches into his pocket and pulls out a cigar. He presses its tip against the ends of his fur.. before flexing his muscles hard. And moments later, he is already enjoying sending puffs of smoke everywhere.")

		saynn("[say=luxe]But now, yes, a showoff.[/say]")

		saynn("Aisha giggles but waves the smoke away from her face.")

		saynn("[say=luxewife]You never were much into cigars.[/say]")

		saynn("[say=luxe]But now I will be. How can I not?[/say]")

		saynn("[say=luxewife]They're for old people, like your father.[/say]")

		saynn("[say=luxe]I'm already a dad too, you know.[/say]")

		saynn("[say=luxewife]I know~. I know it too well.[/say]")

		saynn("Luxe smirks.")

		addButton("Continue", "See what happens next", "aisha_hugs")
	if(state == "aisha_hugs"):
		playAnimation(StageScene.Hugging, "hug", {pc="luxe", npc="luxewife"})
		saynn("Aisha gets up and gives his young husband a tight hug, her paws exploring his strong back.")

		saynn("[say=luxewife]So warm.. Sarcasm aside.. Glad you're okay, my love. It's a bit reckless to agree to such untested treatments, don't you think?[/say]")

		saynn("[say=luxe]You should think about it too. Golden accents would suit you.[/say]")

		saynn("Luxe smirks and hugs his wife with his free hand, the other one keeps holding the cigar.")

		saynn("[say=luxewife]You and your gold..[/say]")

		saynn("[say=luxe]You are my gold, Aisha. You and our kids. I want you all to be safe. And this treatment is already proven to improve your skin's heat resistance. Perfect against those laser-happy AlphaCorp fuckers.[/say]")

		saynn("Aisha looks away, her voice softening.")

		saynn("[say=luxewife]I don't know, Luxe.. I've heard stories. And besides, I think you got me pregnant again.[/say]")

		saynn("Luxe's confident grin falters, just slightly. His ears flick backward in surprise, and he exhales a slow puff of smoke.")

		saynn("[say=luxe]Another one? Hah. Woman, you are such an eager breeding bitch. Are we building an army, or are you just trying to make sure I'm outnumbered?[/say]")

		saynn("Aisha grabs his hand and puts it over her belly and smiles, her voice cheeky but with a subtle hint of vulnerability..")

		saynn("[say=luxewife]Wo-o-ow. Did the first twenty one kids that I gave you made you lose interest in me? Maybe I should start pegging you instead. Since you seem to be over the whole 'breeding' thing.[/say]")

		saynn("Luxe laughs, his hand sliding over that belly up to her chin, tilting her face up to meet his gaze.")

		saynn("[say=luxe]Don't forget who has your key~. And don't be silly, I will never lose interest in you.[/say]")

		saynn("The cat blushes deeply while Luxe's voice drops, now low and intimate as he leans closer to Aisha's ear.")

		saynn("[say=luxe]If you're pregnant, it's because I can't get enough of you, and you know it.[/say]")

		saynn("[say=luxewife]You always knew how to sweet-talk me into things..[/say]")

		saynn("[say=luxe]That's because I love you. And.. you don't need the treatment now if you're unsure. But I really-really want you to be safe.. you will see the benefits, trust me. You will feel indestructible.[/say]")

		saynn("Aisha's laughter fills the room, easing the tension.. She gives Luxe a little kiss on the lips.")

		saynn("[say=luxewife]Alright, Mr. Indestructible. But don't think I'm going to stop joking about pegging you. It's too much fun.[/say]")

		saynn("[say=luxe]I'd expect nothing less from you. Speaking of various sexual activities.. You should see my cock, it changed too.[/say]")

		saynn("Luxe's horny hands begin trying to strip his wife. Aisha moans softly, feeling the warm arms trace her girly curves.. but before the moment can deepen further, she pulls back slightly, her expression becoming more serious.")

		saynn("[say=luxewife]Speaking of dicks.. your father wanted to see you.[/say]")

		saynn("The wolf grumbles.. but stops.")

		saynn("[say=luxe]Probably wants to criticize my 'reckless choices' as well. I will handle it.[/say]")

		saynn("He leans down to kiss Aisha's forehead.")

		saynn("[say=luxewife]After that you can come back and handle me, hot guy~.[/say]")

		addButton("Continue", "See what happens next", "dad_talk")
	if(state == "dad_talk"):
		removeCharacter("luxewife")
		addCharacter("luxedad")
		playAnimation(StageScene.Duo, "stand", {pc="luxe", npc="luxedad", npcAction="sit"})
		saynn("The room hums with the faint sound of the holo-wall flickering in the background, maps of trade routes and starts shifting slowly in a dance of light.")

		saynn("Luxe steps into the dimly lit office, his golden-tipped fur giving a faint glow, making him stand out more in the bland but rich environment.")

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
		playAnimation(StageScene.Hugging, "kiss", {pc="luxe", npc="luxewife2"})
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

		saynn("[say=luxe]So you should listen like a good girl.[/say]")

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


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "aisha_hugs"):
		processTime(3*60)

	setState(_action)
