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

	setState(_action)

func saveData():
	var data = .saveData()

	data["deserved"] = deserved

	return data

func loadData(data):
	.loadData(data)

	deserved = SAVE.loadVar(data, "deserved", true)

func getDevCommentary():
	return "Cuddling seemed like one of the simplest rewards that can easily lead to lots of possibilities for sex so that's why I decided to add it ^^.\n\nAnd wow, something happened to me while I began writing the hypno massage part. I wanted to just write a simple massage scene but then I thought to myself, why not add a little sensual dialogue to it x3. And then that quickly spiraled out of control into some weird hypno fetish x3. Worst part is that I kinda like it. Did I develop a new fetish while writing a scene??"

func hasDevCommentary():
	return true
