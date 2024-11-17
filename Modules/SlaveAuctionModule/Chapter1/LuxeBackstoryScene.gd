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
		saynn("Big office, one of the walls is glowing with projected holograms of planets and busy routes between them.")

		saynn("Luxe steps inside, his fur giving off a faint glow, making him stand out more.")

		saynn("[say=luxe]Father?[/say]")

		saynn("[say=luxedad]Luxe. Closer. I wanna see my mistakes clearer.[/say]")

		saynn("Luxe sighs and approaches the desk behind which his father is sitting in a big chair that is more like a throne than a chair.")

		saynn("[say=luxe]Calling me a mistake, huh?[/say]")

		saynn("[say=luxedad]No. But I clearly fucked up somewhere while raising you.[/say]")

		saynn("Not the best start. But it could have been worse too.")

		saynn("[say=luxe]I didn't die, as you can see. What's the problem?[/say]")

		saynn("[say=luxedad]I'm old, that's the problem. And I'm only getting older. Soon I will not be able to be the head of our family. Because I will be dead.[/say]")

		saynn("Your eyes never really realized how gray the beard of your dad looks. It always happens so fast..")

		saynn("[say=luxe]And so you wanted to tell me which one of your kids is the successor? C'mon, who do I gotta obey now.[/say]")

		addButton("Continue", "See what happens next", "dad_getsup")
	if(state == "dad_getsup"):
		playAnimation(StageScene.Duo, "stand", {pc="luxe", npc="luxedad", npcAction="stand"})
		saynn("Your father gets up and approaches you, his old eyes scanning you and your new fur.")

		saynn("[say=luxedad]It's you, Luxe.[/say]")

		saynn("Sudden news makes you raise a brow and tilt your head.")

		saynn("[say=luxe]Really? Why?[/say]")

		saynn("[say=luxedad]Do I have to spell it out for you? Despite your.. recklessness.. You're my best slaver by far. I'm actually proud of how far you've come.[/say]")

		saynn("[say=luxe]It's easy, slaves can't run away if you break their ankles.[/say]")

		saynn("Your father sighs and looks away.")

		saynn("[say=luxedad]Younglings.. Can't believe I was the same.[/say]")

		saynn("[say=luxe]So you're leaving me your throne?[/say]")

		saynn("[say=luxedad]I'm not leaving you a throne. I'm leaving you my power. But I'm also leaving you my responsibility. It's not as easy as you think.[/say]")

		saynn("[say=luxe]If an old guy can do it, so can I.[/say]")

		saynn("[say=luxedad]Do you know why we.. Blacktail.. do what we do?[/say]")

		saynn("[say=luxe]Why we enslave? To humiliate AlphaCorp and its weak limp-dick leader in front of the whole galaxy.[/say]")

		saynn("[say=luxedad]..you have a lot to learn, my son.[/say]")

		saynn("[say=luxe]C'mon, I'm not stupid.[/say]")

		saynn("[say=luxedad]Then don't act stupid. The main thing you gotta understand is.. it's not about you anymore. It's about what's best for our mission. It's about what's best for Syndicate.[/say]")

		saynn("[say=luxedad]You can not be weak anymore. Because if you're weak - The Syndicate is weak. Do you understand me?[/say]")

		saynn("[say=luxe]C'mon, ..[/say]")

		saynn("Your dad cuts you off.")

		saynn("[say=luxedad]Do you understand me?[/say]")

		saynn("[say=luxe]Yes. I understand, father.[/say]")

		saynn("[say=luxedad]I doubt you do now. But you will get older. You will get wiser. You will have to make choices that you don't wanna make. You will have to learn to sacrifice. It's not fun. But we, you and me, we are not allowed to be weak.[/say]")

		saynn("Makes you feel like he chose you just so he could make your life a little worse..")

		saynn("[say=luxe]I will try to not disappoint you, father.[/say]")

		saynn("He chuckles.")

		saynn("[say=luxedad]I will be long dead, I will not care in the slightest. But you can not disappoint the Syndicate. That is our life's work. Freeing this galaxy from AlphaCorp's greedy bloody hands, it's our mission that we have to carry out, no matter what. Or it all will be for nothing.[/say]")

		saynn("[say=luxedad]You may go now.[/say]")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "aisha_hugs"):
		processTime(3*60)

	setState(_action)
