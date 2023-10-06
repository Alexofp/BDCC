extends SceneBase

var deserved = true
var breastPumpID = ""

func _init():
	sceneID = "rahiRewardCuddleScene"

func _initScene(_args = []):
	if(_args.size() > 0):
		deserved = _args[0]

func _reactInit():
	processTime(2*60)

func _run():
	if(state == ""):
		addCharacter("rahi")
		playAnimation(StageScene.Cuddling, "idle", {npc="rahi"})
		if (deserved):
			saynn("Rahi has been such a good girl today that you can't help but to feel a deep desire to reward your kitty. You extend your hands and pull her close before guiding her to the not-so-cozy inmate bed.. but that's the best this place has to offer and so you will take it.")

			saynn("[say=rahi]Meow?..[/say]")

			saynn("[say=pc]Tshh..[/say]")

			saynn("Words aren't needed. You get settled in and watch Rahi willingly slide into your embrace. A contented purr escapes from her lips as she begins to feel the warmth that your body provides and the feeling of safety that your little relationship gives her.")

		else:
			saynn("Rahi didn't particularly do anything impressive today.. But you don't need a good reason to reward your kitty. You extend your hands and pull her close before guiding her to the not-so-cozy inmate bed.. but that's the best this place has to offer and so you will take it.")

			saynn("[say=rahi]Meow?.. But she..[/say]")

			saynn("[say=pc]Tshh..[/say]")

			saynn("Words aren't needed. You get settled in and watch Rahi's curious eyes try to figure out why you are so kind to her.. But either way, eventually she gives up on that and just slides into your embrace, a contented purr escapes from her lips as she begins to feel the warmth that your body provides and the feeling of safety that your little relationship gives her.")

		saynn("Your hands slide under Rahi's inmate uniform. And with delicate strokes, you begin to run your fingers through her soft fur, savoring the sensations and letting your kitty.. relax. She enjoys the attention, occasionally nuzzling and licking your palms like some adorable cat.")

		addButton("Just rest", "Enjoy the moment..", "just_rest")
		addButton("Hypno Massage", "Offer Rahi a sensual massage with some extra encouragement", "give_massage")
		if (getModule("RahiModule").isSkillLearned("rahiSkillMasochist")):
			addButton("Scratching", "(Masochism) Test Rahi's pain threshold while cuddling with her", "gentle_scratches")
		if (getModule("RahiModule").isSkillLearned("rahiSkillSex")):
			addButtonWithChecks("Tribadism", "(Sex) This bed seems to be a good place for some kinky scissoring with Rahi..", "do_tribadism", [], [ButtonChecks.HasReachableVagina])
			addButtonWithChecks("Reverse cowgirl", "(Sex) This bed seems to be a good place for some lewd times with Rahi..", "do_reversecowgirl", [], [ButtonChecks.HasReachablePenis])
		if (getCharacter("rahi").canBeMilked()):
			if (GM.pc.getInventory().getItemsWithTag(ItemTag.BreastPump).size() > 0):
				if (!getCharacter("rahi").hasEffect(StatusEffect.SoreNipplesAfterMilking)):
					addButton("Breast pumps", "Use one of your breast pumps to milk Rahi's lactating breasts", "pick_breastpump")
				else:
					addDisabledButton("Breast pumps", "Give Rahi some rest, her nipples are sore")
			else:
				addDisabledButton("Breast pumps", "You don't have any unused breast pumps")
		else:
			addDisabledButton("Breast pumps", "Rahi is not lactating")
	if(state == "just_rest"):
		saynn("Lost in the intimate connection, Rahi's eyes slowly close, her ears lowering while her purrs are growing deeper. You continue to idly trace little patterns over the fur of her shoulders and belly, showering your kitty with affection.")

		saynn("During this moment of.. vulnerability.. and complete trust.. Rahi revels in the care and adoration that you offer. Everyone needs some aftercare occasionally.. even you. You decide to rest your chin on her shoulder and chuckle softly as she tilts her head towards yours and tickles you with her whiskers by accident.")

		saynn("As you cuddle Rahi, time seems to slow down. The world outside fades away, leaving only you, Rahi and the bond that you two are sharing.. A good reminder that even when the whole world is busy suffering through wars and deaths.. There exists a place.. a heaven if you will.. free of all of that.. a place where you could be cherished and treated with utmost tenderness..")

		saynn("And just like that.. you spend some more time together, enjoying the company of each other.")

		addButton("Continue", "That was nice", "endthescene")
	if(state == "give_massage"):
		saynn("Your hands continue sliding over Rahi's short fur, your touches become focused and deliberate. With each stroke or knead, you work your way across her body, removing tension from Rahi's muscles and instilling a sense of relaxation instead..")

		saynn("You bring your mouth closer to Rahi's ear and begin whispering into it, your voice laced with a hypnotic allure.")

		saynn("[say=pc]I want you to only hear my voice, kitty.. Forget everything else.. I'll help..[/say]")

		saynn("Rahi nods silently while you keep murmuring into her ear, letting her feel your warm breath. Her body starts to respond instinctively, her wagging tail calming down, her eyes half-closed..")

		saynn("[say=pc]Embrace the profound connection we share, kitty.. As I guide you through this journey of pleasure.. allow yourself to be consumed by the rapture that awaits you..[/say]")

		saynn("Your hands brush over her fluffy girly curves for a bit before you decide to start unbuttoning her shirt, one button at a time, slowly uncovering her belly and chest.. but she doesn't seem to mind..")

		saynn("[say=pc]Every touch, every whisper, leads you further into the abyss of bliss. Allow your mind to empty, kitty, embrace the intoxicating sensations that ripple through your being..[/say]")

		saynn("In fact, it seems her mind has become a blank canvas, open and receptive to your whispered suggestions.. You still let her feel your warm breath on her while your hands open her shirt and let it slide off her shoulder, uncovering the beautiful perky nipples and round breasts. You cup them and begin kneading ever so slightly."+str(" Very soon you begin to feel Rahi's milk dripping over your hands. It's so easy to make her lactate when she is relaxed like this.." if getCharacter("rahi").canBeMilked() else "")+"")

		saynn("[say=pc]Trust in the journey.. Only within this surrender will you discover the trust depths of your pleasure..[/say]")

		saynn("With each of your intimate whispers, Rahi's breaths grow deeper and more rhythmic. Her mind, stripped of all thoughts and worries, is focused solely on this connection forget between you and her..")

		saynn("[say=pc]Feel your body becoming weightless, drifting on a cloud of pleasure.. Every touch, every stroke, resonates deep within you, awakening a sense of.. ecstasy..[/say]")

		saynn("Rahi parts her lips and lets out a silent moan as you keep giving her a little massage. It seems your words amplify the effects of your touches by a lot. Time lost its meaning, your kitty has surrendered herself fully, allowing the sensations to consume her, leaving nothing but pure pleasure in its wake..")

		saynn("It only takes a few moments before Rahi arches her back and produces one of the cutest moans you ever heard, her body shivering ever so slightly..")

		saynn("[say=pc]Good girl.. Embrace the moment.. You are a vessel of pleasure..[/say]")

		saynn("Long quiet noises of love escape from your kitty, resonating with your whispers. From now on you just let her ride these ecstatic waves that you have caused. It's cute to see her breasts bounce a little each time Rahi's body tenses up from this strange form of.. mind stimulation.")

		saynn("By the end of the session, Rahi's mind is a.. tranquil void, completely devoid of any thoughts or concerns. She lays in your embrace, enjoying the euphoria that courses through her body..")

		saynn("As you land a little kiss on your kitty's cheek, she suddenly snaps out of it with a gasp.")

		saynn("[say=rahi]Ah-h.. oh.. h-hey there, {rahiMaster}..[/say]")

		saynn("[say=pc]Hey there, kitty. Did you like the massage?[/say]")

		saynn("[say=rahi]Uh.. She.. doesn't remember.. she might have missed most of it..[/say]")

		saynn("You chuckle and nuzzle your silly kitty, helping her.")

		addButton("Continue", "That was unusual", "endthescene")
	if(state == "gentle_scratches"):
		var masLevel = getModule("RahiModule").getSkillScore("rahiSkillMasochist")
		if (masLevel < 3):
			saynn("You continue to trace little patterns along her fur, your hands still caressing her belly while under her shirt. But, slowly, you begin to apply more.. pressure.. with your nails, gently scratching rather than just stroking. You can feel some shivers going through Rahi's body while you do that..")

			saynn("[say=rahi]Meeow.. This hurts a little..[/say]")

			saynn("Sensing her discomfort, you lean in closer and let her ears feel your warm breath. You begin to whisper into it softly, trying to reassure your kitty.")

			saynn("[say=pc]Try to relax, kitty. Don't focus on the pain.. Focus on me.. But.. feel free to tell me to stop when it gets too much.[/say]")

			saynn("Rahi nods and then takes a deep breath before surrendering herself to your touch. And so you continue gently dragging your nails over her belly, combing her short fur while also scratching the skin underneath. Her body responds to the increasing pressure by shivering again so you press your cheek against her hers and nuzzle the kitty.")

			saynn("[say=rahi]It's.. it's a little too much..[/say]")

			saynn("Aww, even with that, your kitty is lacking experience to endure the uncomfortable sensations. So you switch back to rubbing her belly.")

			saynn("[say=pc]That's okay, kitty.[/say]")

			saynn("[say=rahi]Sorry..[/say]")

			saynn("You land a little kiss on her neck.")

			saynn("[say=pc]Don't be.[/say]")

			saynn("You spend the rest of the time just cuddling together.")

		elif (masLevel < 7):
			saynn("You continue to trace little patterns along her fur, your hands still caressing her belly while under her shirt. But, slowly, you begin to apply more.. pressure.. with your nails, gently scratching rather than just stroking. You can feel some shivers going through Rahi's body while you do that..")

			saynn("[say=rahi]Meeow.. This hurts a little..[/say]")

			saynn("Sensing her discomfort, you lean in closer and let her ears feel your warm breath. You begin to whisper into it softly, trying to reassure your kitty.")

			saynn("[say=pc]If you focus on it, it's gonna hurt more.. Just let it.. flow through. Feel free to tell me to stop when it gets too much.[/say]")

			saynn("Rahi nods and then takes a deep breath before surrendering herself to your touch. And so you continue gently dragging your nails over her belly, combing her short fur while also scratching the skin underneath. Her body responds to the increasing pressure by shivering again so you press your cheek against her hers and nuzzle the kitty.")

			saynn("[say=rahi]M-meow..[/say]")

			saynn("Huh.. You would expect her to voice another complaint by now.. But.. these.. acts of affection.. intertwined with the faint sting of pain.. seem to combine into a new and unique sensation within her.")

			saynn("You try to balance it out, leaving a few scratches on your kitty before landing a little kiss on her neck. Her breathing is so.. deep.. Rahi squirms under you slightly.. but doesn't stop you.")

			saynn("Your hands slowly unbutton her shirt and sneak under it, cupping Rahi's {rahi.breasts}. She looks down at her exposed chest with surprised eyes. But the reasons become clear when your digits reach for her nips and begin poking them with your nails.")

			saynn("[say=rahi]Ah-..[/say]")

			saynn("That seems to sting so much that Rahi produces a little gasp. Her squirming gets incredibly more pronounced when you catch one of her nips between your nails.")

			saynn("[say=rahi]T-too m-much..[/say]")

			saynn("Aww. Fair enough. You pull your hands away from her breasts and slowly button up her shirt while leaving more little kisses on her neck to help her calm down.")

			saynn("[say=pc]You did very good, kitty.[/say]")

			saynn("[say=rahi]D-did she?..[/say]")

			saynn("You hug your kitty tightly, making her squeak.")

			saynn("[say=pc]You're gonna be a masochist-kitty in no time.[/say]")

			saynn("[say=rahi]Nya..[/say]")

			saynn("You spend the rest of the time just cuddling together.")

		elif (masLevel < 13):
			saynn("Your kitty already has some experience in masochism so you don't waste her time and quickly unbutton her shirt, giving unobstructed access to her belly and her beautiful breasts. Still, she seems to be a little confused about why her {rahi.breasts} are suddenly on display. But when you cup them and press your nails against her skin, kitty suddenly realizes your intent.")

			saynn("[say=rahi]Ah..[/say]")

			saynn("Your nails lightly poke Rahi's nipples, sending a shiver down her spine. And as you keep putting more pressure on them, your kitty's muscles instinctively tensen up, probably because of the discomfort.")

			saynn("[say=pc]Breathe, kitty.. Focus on that..[/say]")

			saynn("Rahi takes a deep breath while you nuzzle her cheek, calming her down. She gradually relaxes into your touches, her body responding to this strange mix of pleasure and pain.")

			saynn("Little noises escape from her as you keep gently dragging your nails over her sensitive nips and areolas around them. Eventually they begin to stiffen up under your touch, clearly from arousement.")

			saynn("[say=pc]Good girl..[/say]")

			saynn("You decided to test her a little and squeeze one of her nips between your nails before tugging on it. That causes an instant reaction of Rahi arching her back and letting out a painful cry, her paws gripping onto you tight.")

			saynn("[say=rahi]Ahh-h.. t-tha.. ah..[/say]")

			saynn("Seeing such a powerful reaction you decide to stop pinching her sensitive flesh and just gently rub it. Your kitty clearly was trying to tell you something but changed her mind.")

			saynn("[say=pc]You want me to stop?[/say]")

			saynn("Blush appears on her cheeks, her ears droop. A few seconds later, she shakes her head. You chuckle and land a little kiss on her neck.")

			saynn("Now, with a deliberate intent, you move both of your hands to her nips and gently pinch them both, causing Rahi's breath to hitch and her body to respond by trying to arch again. This clearly sparks something inside her.")

			saynn("You decide to test that and pull one of your hands down to her shorts instead, your palm sneakily slides under the waistband and finds her pussy.. incredibly wet. That makes your Rahi even more embarrassed so she tries to cover her face up.")

			saynn("[say=pc]No, kitty, you're doing great~. Liking pain is not bad, it's quite arousing to know that I have such a masochistic kitty.[/say]")

			saynn("Slowly, Rahi brings her paws back to their resting spots. You lean over her shoulder and look at her cute blushy face. One of your hands keeps gently pinching her nipple while another finds a little sensitive clit between her legs and squeezes it too between your nails.")

			saynn("So much stimulation, Rahi's eyes shine brightly with.. lust. Her lips parted, producing more and more little moans for you.")

			saynn("[say=rahi]H-huff..[/say]")

			saynn("You don't even try to distract her anymore with nuzzling, instead you bring your mouth to her neck and find a good spot above her collar before gently biting your kitty. It feels like your kitty is so close, she is practically drowning in arousal. You get a little too eager and try to sink your teeth into her flesh which makes Rahi suddenly jerk her body and produce another painful cry.")

			saynn("[say=rahi]Ah!.. T-too much.. t-too.. h-huff..[/say]")

			saynn("Oops.. You quickly pull your teeth and hands away from her sensitive spots, instead just buttoning up her shirt and hugging her.")

			saynn("[say=pc]My bad, kitty.[/say]")

			saynn("[say=rahi]N-no.. It felt good.. just.. too much..[/say]")

			saynn("You bring your mouth back to her cheek and leave a little kiss. Your kitty begins to purr in your hands.")

			saynn("You spend the rest of the time just cuddling together.")

		else:
			saynn("She probably wants it more than you do.. So you don't waste any time and quickly unbutton her shirt, giving unobstructed access to her belly and her beautiful breasts. Still, she seems to be a little confused about why her {rahi.breasts} are suddenly on display. But when you cup them and press your nails against her skin under the fur, kitty suddenly realizes your intent.")

			saynn("[say=rahi]Nya-a..[/say]")

			saynn("Rahi's breath hitches as you slowly apply more pressure, your nails digging into the soft flesh of her nipples, sending an electrifying jolt of pain through her.. pain that causes her nips to stiffen up in response..")

			saynn("[say=pc]Such a good little masochist kitty I have here..[/say]")

			saynn("You trap one of her nips between your nails and pull on it before letting it snap back and send a sharp impulse through her body, causing Rahi to arch her back and gasp.")

			saynn("The sensations intensified, each pinch of her nipples fueling her desire for more. You keep teasing Rahi's limits, occasionally applying.. too much.. pressure.. but now you only hear moans of pleasure from her, mixed with a hint of pain.")

			saynn("[say=rahi]Ah-h-h~..[/say]")

			saynn("One of your hands slides down over her belly and lands on her pussy.. She is so wet down there, you can feel the heat radiating from her slick folds. You find her little clit and pinch it between your nails, causing a much more powerful impulse of pain to flow through her. As you keep tugging on her nips and her clit, Rahi's noises become more passionate, her body squirming under your touches.")

			saynn("[say=rahi]She.. s-she really wants to..[/say]")

			saynn("She is close, you can feel it. And so you decide to let the primal instinct take over and bring your lips to her exposed neck before unpromptedly sinking your teeth into her soft flesh, inflicting a bite that even draws some blood.")

			saynn("[say=rahi]..a-ah-h-h.. h-h..[/say]")

			saynn("Rahi's body convulses from a crazy mixture of pleasure and pain flooding her senses. The intensity of the sudden bite pushes her over the edge, the powerful climax crashing over her like a tidal wave, causing her to let out loud passionate moans while her pussy pulsates and squirts, leaving a big wet spot on her shorts.")

			saynn("Gasping for air, Rahi grips you tightly, her body trembling in the aftermath of her orgasm. The mingling sensations of pain and pleasure are still here, keeping her euphoric. Finally, you retract your teeth after leaving a bite mark on her neck and then just hold your kitty close to you.")

			saynn("[say=rahi]Nyaa-a-ah..[/say]")

			saynn("[say=pc]Good girl..[/say]")

			saynn("After that you begin to slowly button her shirt up and just cuddle with her, helping her recover.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "pick_breastpump"):
		saynn("Pick which breast pump you wanna use on Rahi.")

		addPumpButtons()
		if (false):
			addButton("Nope", "You shouldn't see this", "milk_withpump")
	if(state == "milk_withpump"):
		playAnimation(StageScene.Cuddling, "squirm", {npc="rahi", npcBodyState={naked=true}})
		saynn("Your hands slide slightly up and cup Rahi's {rahi.breasts}, surprising her. And while gently squeezing them, you realize how.. heavy they are with milk, a little wet spots instantly appear roughly where her nips are.")

		saynn("[say=pc]Let's milk you, kitty.[/say]")

		saynn("[say=rahi]Nya..[/say]")

		saynn("You go ahead and unbutton her shirt, exposing her beautiful perky nips that have little jagged lines of white milk streaming down from them. While being extremely gentle, you grab some breast pumps and position them against Rahi's lactating breasts, the soft suction cups enveloping her sensitive dark nipples. Your kitty's body shivers from the touches but she lets you continue anyway, a mixture of excitement and nervousness seems to be coursing through her.")

		saynn("As you activate the pumps, a subtle suction begins, stimulating Rahi's chest and making her gasp as she feels her milk beginning to flow into the containers, drawn out by the device's rhythmic pulsations.")

		saynn("[say=rahi]Feels so.. strange..[/say]")

		saynn("You two continue to cuddle her on the bed, your chin resting on her shoulder while you watch her, captivated by the sight of Rahi's milk being collected. Her soft moans of pleasure begin to fill the room, mingling with the rhythmic hum of the pumps. With each pull, more of her white creamy essence was released, filling the bottles.")

		addButton("Continue", "See what happens next", "do_milk")
	if(state == "do_milk"):
		saynn("Rahi's breathing quickened, her body responding to the unique sensations. She closes her eyes, surrendering to the pumping, her thoughts consumed by the intoxicating mix of pleasure and submission. The suction slowly grows more intense, causing her lactating nipples to look puffy while also making her needy.")

		saynn("The sight is great, your hands land under the breast pumps and begin tracing little delicate patterns along Rahi's exposed skin while the palms are cupping the round forms. Each time you put some extra pressure on them, the milk flow increases and Rahi's breath hitches from a wave of pleasure washing over her.")

		saynn("With a final moan of pleasure, Rahi succumbs to the intense sensations of being milked, her body shivering from blissful release. The milk flows freely out of her nips for a bit but soon enough it begins to die down. It seems.. you have milked your kitty.")

		saynn("[say=pc]Good girl.. made so much milk for me..[/say]")

		saynn("[say=rahi]Y-you're welcome, {rahiMaster}..[/say]")

		saynn("As you turn off and disconnect the pumps, another little noise of love escapes her caused by the air pressure normalizing. Then you just land a little kiss on her cheek and cuddle her a little longer, your hands gently kneading her breasts.")

		addButton("Continue", "See what happens next", "removepumpandend")
	if(state == "do_tribadism"):
		playAnimation(StageScene.SexTribadism, "sex", {npc="rahi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("Rahi rests in your arms, both of you are enjoying the warmth and the intimacy of the embrace. Your bodies are pressed close.. you can feel the desire rising the more you gently caress Rahi's girly curves.")

		saynn("[say=pc]I know a better way to cuddle..[/say]")

		saynn("Kitty purrs quietly.")

		saynn("[say=rahi]Oh?.. Feel free to show it, {rahiMaster}.. You are making her quite.. curious..[/say]")

		saynn("Without saying much, you slowly pull Rahi's shorts down while nuzzling her cheek. She doesn't seem to mind her girly bits being exposed.. her beautiful sensitive folds. After that, you change positions, now sitting in front of her, looking at her.. You spread your legs slightly and invite Rahi to do the same.")

		saynn("[say=pc]Closer, kitty..[/say]")

		saynn("You offer Rahi a hand and she holds onto it while you pull her close, your bodies aligning perfectly, your pussies.. almost kissing. Your eyes remain locked on hers, noticing the obvious.. lusty stare.")

		saynn("You still hold Rahi's paw, intertwining fingers and using it to support your motions.. A little moan escapes from the feline when your moist petals finally collide against each other, already exchanging juices. But you go further and begin grinding your slit against hers, moving your hips at a slow but sensual pace.")

		saynn("[say=rahi]She agrees.. much better.. ah..[/say]")

		saynn("Very soon the kitty gets pulled into it, also sliding her hips to meet yours, slowly ramping up the amount of pleasure that you receive. With each motion, both Rahi and you lose themselves in the intoxicating sensations, ecstatic waves flowing through you, building and intertwining, bringing you both close..")

		saynn("Slowly, your movements become more urgent, more primal. Your bodies rocking against each other, wet pussies grinding with a raw passion that was evident from all the moans escaping from you. At some point the bedsheets under you become marked with your scents.. which is good..")

		saynn("[say=rahi]She is gonna.. Ah..[/say]")

		saynn("You can feel Rahi's body shivering as the climax is edging closer and closer..")

		addButton("Continue", "See what happens next", "tribadism_cum")
	if(state == "tribadism_cum"):
		playAnimation(StageScene.SexTribadism, "tease", {npc="rahi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("You keep desperately grinding your hips with Rahi's until a huge wave finally crashes over you. The kitty and you orgasm almost together, your body convulsing in blissful release as both of you throw your heads back and moan passionately at the ceiling.")

		saynn("It feels so.. good.. to see Rahi's body shaking, knowing that you caused it. Her back is arched, her folds pulsating before suddenly gushing girlcum all over your pussy slit. It seems you teased her a little too much..")

		saynn("As the waves of ecstasy subside, you and Rahi remain entangled, your hearts pounding in sync as you both are exhausted, this passionate sex leaving you breathless..")

		saynn("Time to rest..")

		addButton("Enough", "That was lewd", "endthescene")
		if (getModule("RahiModule").isSkillLearned("rahiSkillWatersports")):
			addButton("Pee..", "(Watersports) The bedsheets are ruined anyways..", "tribadism_pee")
	if(state == "tribadism_pee"):
		saynn("As you both enjoy the afterglow that came after your intense pussy rubbing session, a strong feeling of pleasure and desire still pulsed through your bodies. Your intertwined legs remained locked, your pussies gently pressed against each other, refusing to separate even for a moment.")

		saynn("But.. the more you rest like that.. the more you begin to feel an unexpected sensation.. an urge to relieve yourself.")

		saynn("[say=pc]I.. kinda wanna pee..[/say]")

		saynn("Rahi is still panting softly, her ears lowered.")

		saynn("[say=rahi]Kitty wants that too.. Let's go to the bathroom together..[/say]")

		saynn("Rahi attempts to escape the leg lock but you stop her, your hand still holding her paw and so you yoink her back into the same position. A big smirk appears on your face.")

		saynn("[say=pc]No~[/say]")

		saynn("Rahi tilts her head, slightly confused. But you can pin-point the exact moment she gets when her cheeks blush red.")

		saynn("[say=rahi]But..[/say]")

		saynn("[say=pc]We're not going anywhere, kitty..[/say]")

		saynn("Rahi looks at you with big kitty eyes. You decide to move your hips a little which causes your clit to rub against your kitty's pee hole, making holding back extremely hard. Rahi curls her toes. A little gasp escapes her mouth as she suddenly lets go..")

		saynn("A strong current of Rahi's golden fluid hits your crotch and begins flowing down it, over your pussy. It feels.. so warm. All the while Rahi looks embarrassed beyond belief, her face shows both lust and deep shame.")

		saynn("It doesn't take long for you to reach the point of no return too. Another stream of piss emerges but from your pee hole this time. It marks Rahi's fur with your gross scent and makes her squirm under you as the warm fluid washes over her folds.")

		saynn("[say=rahi]Ah.. This is so..[/say]")

		saynn("[say=pc]What? Wrong? But it feels nice, doesn't it?[/say]")

		saynn("[say=rahi]Yes..[/say]")

		saynn("In the intimate space between Rahi's and your interlocked legs, a small pool of piss begins to form. The rest is overflowing and leaving a yellow spot on the bed sheets, also marking them with a mixture of your scents.")

		saynn("Rahi's sensations intensified as she finally allowed herself to fully embrace the moment. More little moans escape from her as the crossing streams keep caressing her sensitive flesh..")

		saynn("As the last drops fall, you and Rahi exchange lusty glances. Slowly, you pull your legs away, letting the blushing feline escape the embrace and get up.")

		saynn("[say=rahi]She.. she is gonna go get new bed sheets..[/say]")

		saynn("[say=pc]Sure, kitty. You do that~[/say]")

		saynn("Rahi quickly leaves her cell, still marked with your scent.")

		addButton("Continue", "That was very lewd", "endthescene")
	if(state == "do_reversecowgirl"):
		playAnimation(StageScene.SexReverseCowgirl, "tease", {npc="rahi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("Rahi rests in your arms, both of you are enjoying the warmth and the intimacy of the embrace. Your bodies are pressed close.. you can feel the desire rising the more you gently caress Rahi's girly curves.")

		saynn("At some point the kitty begins to feel something hard poking her.. She turns her head and glances at you.")

		saynn("[say=pc]Um.. my bad.[/say]")

		saynn("Rahi smiles, you notice her fingers slowly undoing the buttons of her shirt, revealing the beautiful curves of her breasts.")

		saynn("[say=rahi]Is all good, {rahiMaster}, meow meow..[/say]")

		saynn("It seems she is sharing your desire. With a little mischievous smile, Rahi breaks away from the embrace just so she can pull her shorts down, exposing her needy sacred sex. After that, she straddles your waist, positioning herself so her girly thighs trap your {pc.penis}.")

		saynn("You can't help but to reach your hands out and caress her round slim butt, her tail pulls slightly to the side while her paws land on your member and get it fully hard and ready.. as if it wasn't already..")

		addButton("Continue", "See what happens next", "reversecow_start")
	if(state == "reversecow_start"):
		playAnimation(StageScene.SexReverseCowgirl, "sex", {npc="rahi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("After teasing you for a bit, Rahi finally raises your body and begins lowering herself onto your member, her paw guiding the shaft as it spreads her moist folds and prods the entrance.. before sliding inside.. A little moan escapes from her as she begins to ride you with a slow sensual rhythm, resting her paws on your chest.")

		saynn("[say=rahi]Best way to cuddle.. ah..[/say]")

		saynn("She feels warm and slick, her inner walls grasping your member so nicely that you can't help but to produce a little noise too. Your hands land on her hips and just hold her, letting the kitty do all the work.")

		saynn("Slowly, your kitty picks up the pace, riding you faster. She raises her chin and moans louder, clearly approaching her peak.")

		saynn("[say=rahi]D-do you wanna.. inside?..[/say]")

		saynn("What an interesting proposition.")

		addButton("Inside", "Let kitty ride you to the end", "reversecow_cuminside")
		addButton("Pull out", "Rather not risk it", "reversecow_pullout")
	if(state == "reversecow_cuminside"):
		playAnimation(StageScene.SexReverseCowgirl, "inside", {npc="rahi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("[say=pc]Yes.[/say]")

		saynn("Each time she brings herself down on your {pc.penis}, her inner walls tighten around your throbbing length. At some she just can't take it anymore.. With a cute long moan, Rahi arches her back and cums, her inner muscles clench even harder, pushing you over the edge. You grunt as Rahi begins to feel the warm rush of your seed flooding her womb, claiming it..")

		saynn("You both experience the climax at the same time. Rahi's body is trembling from all the euphoric waves crashing over it and yours does the same, just more controlled. The feline doesn't move anymore, just being your crotch warmer while your full dick is inside her, the last strings of your {pc.cum} panting her insides..")

		saynn("[say=rahi]Nya-a-a..[/say]")

		saynn("Rahi falls back into your hands, letting you cuddle her. Both of you are panting, satisfied.")

		saynn("[say=rahi]Feels so good..[/say]")

		saynn("You spend more time together, enjoying each other's company..")

		addButton("Continue", "That was lewd", "endthescene")
	if(state == "reversecow_pullout"):
		playAnimation(StageScene.SexReverseCowgirl, "tease", {npc="rahi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("[say=pc]Maybe not today.[/say]")

		saynn("Rahi hears you but she still rides you fast, making you a little concerned. Each time she brings herself down on your {pc.penis}, her inner walls tighten around your throbbing length. At some she just can't take it anymore.. With a cute long moan, Rahi arches her back and cums, her inner muscles clench even harder, pushing you over the edge.")

		saynn("[say=pc]Kitty!..[/say]")

		saynn("And that's when she finally pulls away from your dick. Just in time for your hot sticky load to start landing on her fur, leaving quite a mess.")

		saynn("You both experience the climax at the same time. Rahi's body is trembling from all the euphoric waves crashing over it and yours does the same, just more controlled. The feline doesn't move anymore, just warming your twitching member with her thighs, the last strings of your {pc.cum} landing on her legs and belly..")

		saynn("[say=rahi]Nya-a-a..[/say]")

		saynn("Rahi falls back into your hands, letting you cuddle her. Both of you are panting, satisfied.")

		saynn("[say=rahi]Feels so good..[/say]")

		saynn("You spend more time together, enjoying each other's company..")

		addButton("Continue", "That was lewd", "endthescene")
func addPumpButtons():
	var pumps = GM.pc.getInventory().getItemsWithTag(ItemTag.BreastPump)
	for pump in pumps:
		addButton(pump.getVisibleName(), pump.getVisibleDescription(), "milk_withpump", [pump])


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "just_rest"):
		processTime(10*60)
		GM.pc.addStamina(50)
		GM.pc.addPain(-50)
		addMessage("That was a nice rest..")

	if(_action == "give_massage"):
		processTime(10*60)
		increaseFlag("RahiModule.rahiTired", -1)
		addMessage("Rahi didn't get any more tired after this..")

	if(_action == "gentle_scratches"):
		processTime(10*60)
		getModule("RahiModule").advanceSkill("rahiSkillMasochist")

	if(_action == "do_tribadism"):
		processTime(10*60)
		getModule("RahiModule").advanceSkill("rahiSkillSex")

	if(_action == "do_reversecowgirl"):
		processTime(5*60)
		getModule("RahiModule").advanceSkill("rahiSkillSex")

	if(_action == "milk_withpump"):
		var pump = _args[0]
		breastPumpID = pump.getUniqueID()
		GM.pc.getInventory().removeItem(pump)
		getCharacter("rahi").getInventory().forceEquipStoreOther(pump)

	if(_action == "do_milk"):
		processTime(6*60)
		var pump = getCharacter("rahi").getInventory().getItemByUniqueID(breastPumpID)
		getCharacter("rahi").stimulateLactation()
		var howMuchTransferred = getCharacter("rahi").getBodypart(BodypartSlot.Breasts).getFluids().transferTo(pump, 1.0)
		addMessage("The pump managed to milk Rahi's breasts for "+str(Util.roundF(howMuchTransferred))+" ml")
		GM.pc.addSkillExperience(Skill.Milking, 30)
		getCharacter("rahi").addEffect(StatusEffect.SoreNipplesAfterMilking)
		getCharacter("rahi").updateAppearance()

	if(_action == "removepumpandend"):
		var pump = getCharacter("rahi").getInventory().getItemByUniqueID(breastPumpID)
		getCharacter("rahi").getInventory().removeEquippedItem(pump)
		GM.pc.getInventory().addItem(pump)
		endScene()
		return

	if(_action == "tribadism_cum"):
		processTime(5*60)
		GM.pc.rubsVaginasWith("rahi")
		GM.pc.orgasmFrom("rahi")

	if(_action == "tribadism_pee"):
		processTime(3*60)
		GM.pc.pissedOnBy("rahi")
		getCharacter("rahi").pissedOnBy("pc")

	if(_action == "reversecow_start"):
		processTime(3*60)

	if(_action == "reversecow_cuminside"):
		processTime(10*60)
		getCharacter("rahi").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("rahi")
		GM.pc.addSkillExperience(Skill.SexSlave, 30)

	if(_action == "reversecow_pullout"):
		processTime(10*60)
		getCharacter("rahi").cummedOnBy("pc")
		GM.pc.orgasmFrom("rahi")
		GM.pc.addSkillExperience(Skill.SexSlave, 30)

	setState(_action)

func saveData():
	var data = .saveData()

	data["deserved"] = deserved
	data["breastPumpID"] = breastPumpID

	return data

func loadData(data):
	.loadData(data)

	deserved = SAVE.loadVar(data, "deserved", true)
	breastPumpID = SAVE.loadVar(data, "breastPumpID", "")

func getDevCommentary():
	return "Cuddling seemed like one of the simplest rewards that can easily lead to lots of possibilities for sex so that's why I decided to add it ^^.\n\nAnd wow, something happened to me while I began writing the hypno massage part. I wanted to just write a simple massage scene but then I thought to myself, why not add a little sensual dialogue to it x3. And then that quickly spiraled out of control into some weird hypno fetish x3. Worst part is that I kinda like it. Did I develop a new fetish while writing a scene??\n\nThe biting scene turned out to be like 1.6k words x3. Mostly because I wrote a few variations depending on how high her masochism skill is. It usually scales from Rahi receiving pain and not liking it to Rahi basically cumming from it x3. Dunno if people even notice that\n\nThe milking scene was fun to write ^^. First time you can use breast pumps on someone else. It's also probably the first way to get someone else's breastmilk? Not sure x3. At least currently it is. So this scene is handy for male characters ^^"

func hasDevCommentary():
	return true
