extends SceneBase

var deserved = true

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
			addButton("Gentle scratches", "(Masochism) Test Rahi's pain threshold while cuddling with her", "gentle_scratches")
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

	setState(_action)

func saveData():
	var data = .saveData()

	data["deserved"] = deserved

	return data

func loadData(data):
	.loadData(data)

	deserved = SAVE.loadVar(data, "deserved", true)

func getDevCommentary():
	return "Cuddling seemed like one of the simplest rewards that can easily lead to lots of possibilities for sex so that's why I decided to add it ^^.\n\nAnd wow, something happened to me while I began writing the hypno massage part. I wanted to just write a simple massage scene but then I thought to myself, why not add a little sensual dialogue to it x3. And then that quickly spiraled out of control into some weird hypno fetish x3. Worst part is that I kinda like it. Did I develop a new fetish while writing a scene??\n\nThe biting scene turned out to be like 1.6k words x3. Mostly because I wrote a few variations depending on how high her masochism skill is. It usually scales from Rahi receiving pain and not liking it to Rahi basically cumming from it x3. Dunno if people even notice that"

func hasDevCommentary():
	return true
