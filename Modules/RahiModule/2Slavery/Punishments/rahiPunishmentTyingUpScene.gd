extends SceneBase

var deserved = true

func _init():
	sceneID = "rahiPunishmentTyingUpScene"

func _initScene(_args = []):
	if(_args.size() > 0):
		deserved = _args[0]

func _reactInit():
	processTime(5*60)
	getCharacter("rahi").getInventory().equipItem(GlobalRegistry.createItem("ZiptiesWrist"))
	getCharacter("rahi").getInventory().equipItem(GlobalRegistry.createItem("ZiptiesAnkle"))

func _run():
	if(state == ""):
		addCharacter("rahi")
		playAnimation(StageScene.SexStart, "start", {npc="rahi", npcBodyState={naked=true}})
		saynn("You produce the ropes that Rahi has used before. The feline already understands what's gonna happen. She unbuttons her shirt and opens it, revealing her {rahi.breasts} to you. Then she pulls her shorts down, exposing her neat tight kitty too. The feline presents naked herself to you.")

		if (deserved):
			saynn("[say=rahi]She won't resist..[/say]")

		else:
			saynn("[say=rahi]She won't resist.. but why?..[/say]")

		saynn("Without saying anything, you grab kitty's paws before forcefully bringing them behind her back. That forces a meow out of the kitty. You wrap the rope around her wrists a few times before tying them together with a nice tight knot. That's not it though, you continue wrapping the rope around her chest, under her breasts and then above them too, trying to make it all look neat.")

		saynn("As you tighten her ropes, a small gasp escapes from Rahi, the ropes really emphasize her breasts now.")

		saynn("Then you slowly pull her down until she is sitting on the floor. Then you grab the second rope and start tying up her ankles together using a similar method, just wrapping the rope a few times around the ankles before adding a tight knot. Then you tie together her knees too, rendering kitty completely helpless.")

		saynn("After being done, you get up and look at your work. You see a kitty that's tied up pretty well. Rahi tests your restraints by wiggling but apart from moving her shoulders and bending her back, she can't do much.")

		if (deserved):
			saynn("[say=rahi]Huff.. Sorry for failing you, {rahiMaster}..[/say]")

		else:
			saynn("[say=rahi]This is unfair, {rahiMaster}..[/say]")

		saynn("What now.")

		addButton("Nap", "Now would be a good time to nap", "take_a_nap")
		if (getModule("RahiModule").getSlaveryStage() >= 1):
			addButton("Vibrator", "Make that kitty squirm", "vibrator")
		if (getModule("RahiModule").isSkillLearned("rahiSkillMasochist")):
			addButton("Nipple clamps", "(Masochist) Make it painful for Rahi", "nipple_clamps")
		if (getModule("RahiModule").isSkillLearned("rahiSkillSex")):
			if (GM.pc.hasReachablePenis()):
				addButton("Blow job", "(Sex) Make her suck you off like this", "blow_job")
			if (GM.pc.hasReachableVagina()):
				addButton("Sit on face", "(Sex) Sit on her face with your pussy", "pussy_sit")
		if (getModule("RahiModule").getSlaveryStage() >= 3):
			addButton("Complete isolation", "Add even more restraints", "complete_isolation")
	if(state == "take_a_nap"):
		saynn("Well, might as well take a short nap while you're at it.")

		saynn("You lie down onto Rahi's bed and make yourself comfy. The feline looks at you with pleading eyes but doesn't say anything.")

		saynn("You just close yours and try to nap for some time.")

		saynn("A few hours pass. You feel better.")

		saynn("As you open your eyes you see.. kitty. She is still there. And she is still tied up. Her head is tilted down, her ears lowered.")

		if (deserved):
			saynn("Kitty's eyes look sorry, her whole expression shows that she is clearly guilty. She notices that you're awake and just keeps still.")

			saynn("You get up and begin to untie her.")

			saynn("[say=rahi]Thank you for punishing her, {rahiMaster}..[/say]")

		else:
			saynn("Kitty's eyes show that she is upset. Her fluffy tail starts to wag when she notices that you're awake. She is pouting.")

			saynn("You get up and begin to untie her.")

			saynn("[say=rahi]Huff..[/say]")

		addButton("Continue", "See what happens next", "do_untie")
	if(state == "vibrator"):
		saynn("Why let her just rest there when you can make it more interesting. You produce a ball gag harness and present it to the tied up kitty.")

		saynn("[say=pc]Open your mouth, kitty. Can't have you making noises while I nap.[/say]")

		if (deserved):
			saynn("The feline knows that she screwed up so she parts her lips for you, showing off her sharp fangs and rough tongue. You shove the shiny red ball in there before proceeding to secure the harness around her head, slowly tightening each strap to make sure she can't just shake it off.")

		else:
			saynn("Rahi's eyes show you what she thinks about the unfairness of this. But considering her current state, she decides to part her lip for you in the end, showing off her sharp fangs and rough tongue. You shove the shiny red ball in there before proceeding to secure the harness around her head, slowly tightening each strap to make sure she can't just shake it off.")

		saynn("After the kitty got gagged, you grab the main element of this punishment, a pink vibrator in the shape of a small egg, two of them in fact. You then use some tape to attach the first toy to the kitty's clit and gently slide the second one inside. Rahi looks down at this with big kitty eyes, she is still trying to get used to the ropes and the red rubber ball in her mouth that makes her drool.")

		saynn("Then you grab the remotes and sit on the bed.")

		saynn("[say=pc]Let's have some fun, shall we?[/say]")

		saynn("And with that, you turn on both of them to their lowest settings. As the toys begin to buzz between Rahi's legs she instantly closes them tighter and produces a muffled noise directed at you. None of that saves her from the pleasure though, the feline's eyes slowly fill up with lust, the kitty squirms against the restraints. From what you can see, her pussy already gets moist with juices. But you're just getting started.")

		saynn("You lie in bed and play with the remotes, suddenly putting them both to their maximum setting. The buzzing becomes way more audibly soon followed by a series of muffled moans, kitty is rubbing her thighs together while arching her back and drooling onto herself, the ballgag was a right choice.")

		saynn("When the panting and moans become more rapid, you turn the power down to a more acceptable medium setting. But that doesn't stop kitty from squirming. She lies on the cold floor and begins to wiggle left and right, actively struggling against her ropes that only seem to dig deeper into her fur.")

		saynn("You give her some time to get used to this setting before dialing it down to.. zero. The buzzing stops. But the kitty didn't like that for sure, she began to produce desperate stifled noises at you, huffing and puffing. There is a little wet spot under her, made out of her arousal, kitty was probably pretty close.")

		addButton("Make her cum", "Use her neediness against her", "vibrator_makecum")
		addButton("Deny her", "Just take a nap without letting her cum", "vibrator_deny")
	if(state == "vibrator_makecum"):
		playAnimation(StageScene.SexStart, "defeated", {npc="rahi", npcBodyState={naked=true}})
		saynn("Why not, you turn the power of the little pink toys to the maximum again. The buzzing begins to get lost between all the muffled moans. Rahi arches her back more, rolling side to side until the orgasm overwhelmed her.")

		saynn("The kitty's body begins to shake and shiver, she is helplessly thrashing against her restraints while the toys continue working on her clit and pussy relentlessly. After some long passionate moans, her slit suddenly squirts all over her thighs, a strong scent of her femcum fills the room.")

		saynn("Since she really wanted to cum, you might as well let her do it.. again and again. You just lower the remotes down to the medium setting and leave them on the side of the bed before closing your eyes.")

		saynn("[say=pc]I'm gonna nap for a bit. Have fun.[/say]")

		saynn("Rahi glances at you with lusty eyes full of despair. The toys are still buzzing against her pleasure spots even after they became very sensitive.")

		addButton("Nap", "See what happens to Rahi after some time", "rahi_vibrator_cum_nap")
	if(state == "rahi_vibrator_cum_nap"):
		saynn("Some time has passed. As you open your eyes you see.. a spaced-out Rahi.. With a sizable puddle of her arousal underneath. Luckily the toys ran out of charge at some point but the feline still got to experience a few forced orgasms, which she is still recovering from, letting out a muffled moan ever so often.")

		saynn("You get down to her and pull the wet toys away from her sensitive pussy slit. The reward has quickly turned to punishment for her.")

		saynn("[say=pc]You're there, kitty?[/say]")

		saynn("The feline slowly raises her head and looks at you with her.. tired eyes. At least she got some satisfaction out of it.")

		saynn("Time to untie her.")

		addButton("Continue", "See what happens next", "do_untie")
	if(state == "vibrator_deny"):
		playAnimation(StageScene.SexStart, "defeated", {npc="rahi", npcBodyState={naked=true}})
		saynn("You decide to be extremely mean today and switch both the toys to their lowest power setting again. They buzz ever so slightly, enough to keep Rahi from calming down but not nearly enough to let her get off to it. Poor kitty is wiggling and drooling all over the floor, her hips instinctively try to hump something but that's not gonna get her anywhere too.")

		saynn("[say=pc]Feel this, kitty? That's all you're gonna get. Get used to it.[/say]")

		saynn("Her eyes.. so horny.. full of despair.. The feline huffs and pouts, trying everything to get that little bit extra of pleasure but nothing is working. She is forced to endure a constant source of pleasure that is never gonna make her cum.")

		saynn("[say=pc]I'm gonna take a nap. Have fun.[/say]")

		saynn("You place the remotes on the side of the bed and close your eyes, just listening to the noises of a desperate kitty now. Strangely enough, they help you slip into your dreams faster.")

		addButton("Continue", "See what happens next", "vibrator_deny_nap")
	if(state == "vibrator_deny_nap"):
		saynn("One good nap after, you finally open your eyes and find.. Rahi.. still squirming ever so slightly. The toys were running at such a low setting that it allowed them to keep their charge for way longer than they supposed to, poor kitty is still at the verge of cumming but it seems like she didn't.. not even once. She keeps producing little lusty noises of hopelessness. There is a big wet spot under her butt, the fur around her pussy is drenched in her pussy juices.")

		saynn("She notices that you're awake and glances at you with the most subby eyes you have ever seen. It's like she is ready to devote herself to you for eternity, just in exchange to being able to finally cum. But you know well enough that it's just her kitty skills coming into play.")

		saynn("You turn off the toys and let the kitty cool off. The feline pants heavily, the lust in her eyes slowly fading, replaced with.. exhaustion. Your hand pulls the little vibrators away from her slit and stores them.")

		saynn("[say=pc]Let's do that again sometime.[/say]")

		saynn("Time to untie her.")

		addButton("Continue", "See what happens next", "do_untie")
	if(state == "nipple_clamps"):
		saynn("You feel like now would be a good time to train the kitty's ability to handle uncomfortable sensations. You grab some metal nipple clamps and crouch before the feline.")

		saynn("She sees them and huffs audibly. Luckily, she is tied up enough for you to do whatever you want with her.")

		if (deserved):
			saynn("[say=rahi]She is sorry, {rahiMaster}..[/say]")

			saynn("[say=pc]I know.[/say]")

		else:
			saynn("[say=rahi]This is very unfair, {rahiMaster}..[/say]")

			saynn("[say=pc]Who is in charge here?[/say]")

		saynn("Rahi tilts her head and pushes her chest out for you, presenting her {rahi.breasts} with perky nipples that got quite stiff after you undressed Rahi and tied her up. You move one of the clamps to her breasts before attaching it firmly, pinching the nipple. Rahi jerks to the side as soon as that happens. You hold onto one of her ropes and attach a clamp to the second one too, pinching the sensitive skin.")

		if (getCharacter("rahi").canBeMilked()):
			saynn("Some milk squirts out of Rahi's breasts as soon as the clamps squeeze her nipples. Lewd.")

		var masScore = getModule("RahiModule").getSkillScore("rahiSkillMasochist")
		if (masScore < 4):
			saynn("[say=rahi]Ow-w.. That's too painful.. Please..[/say]")

			saynn("Kitty seems to be very much not used to the pain, she is hissing quietly to herself. The clamps tug on her nips, causing a lot of discomfort to the feline. And she is clearly struggling to endure it. Her body is trying to squirm to try to get distracted but that only makes things worse as the clamps wiggle.")

		elif (masScore < 7):
			saynn("[say=rahi]It's still very painful.. ow..[/say]")

			saynn("She doesn't like the sensations obviously. But you notice her getting more.. aroused.. as well. The feline is afraid to breathe deeply because occasionally that causes the clamps to shift a bit, pulling on her perky nips. Kitty bites her lip while glancing down at her chest.")

		elif (masScore < 12):
			saynn("[say=rahi]So painful.. yes, more..[/say]")

			saynn("Kitty likes it, her wet pussy can't lie. It's clearly painful for her. But the feline seems to be liking this mix of pleasure and suffering. Quite a lot in fact, she is squirming almost non-stop, her lusty eyes glancing you out.")

		else:
			saynn("[say=rahi]It hurts.. so good..[/say]")

			saynn("The feline is dripping arousal onto the floor. She is still wincing from the pain. But she seems to be eagerly trying to cause more of these uncomfortable spikes as well by shaking her chest and moaning.")

		addButton("Nap", "Just rest while kitty struggles with the pain", "nippleclamps_nap")
	if(state == "nippleclamps_nap"):
		saynn("After that you just take a nap while kitty is left there, unable to do anything about her breasts because of the ropes.")

		saynn("Some time passes..")

		var masScore = getModule("RahiModule").getSkillScore("rahiSkillMasochist")
		if (masScore < 5):
			saynn("You open your eyes and see Rahi panting heavily and gritting her teeth. Her eyes show that she is suffering from the painful sensations. Sometimes her chest shivers slightly, causing the clamps to pull on the nips harder. No matter what she does, she can't escape it. Poor kitty is grunting.")

			saynn("As she notices that you're awake, her gaze becomes hopeful.")

			saynn("[say=rahi]P-Please, {rahiMaster}.. Enough.. She is very-very sorry!..[/say]")

			saynn("Alright, maybe the kitty had enough for now. You reach for her clamps and carefully take them off. But even that caused the feline to suddenly arch her back and let out a painful cry. She breathes heavily while her sensitive nips look slightly red from the skin being so irritated.")

		elif (masScore < 8):
			saynn("You open your eyes and see Rahi gritting her teeth and panting with her eyes closed. She is trying her best to endure the painful sensations but after so much time, she is clearly losing. Each time she dares to move even slightly, the clamps tug on her nips, making the kitty yelp.")

			saynn("As she notices you being awake, she sighs audibly.")

			saynn("[say=rahi]She is sorry, {rahiMaster}.. She hopes she can be forgiven.. Ah..[/say]")

			saynn("Seems like kitty has earned some rest. You reach for the nipple clamps and carefully take them off. But the sudden new sensations made kitty hiss loudly and shiver a lot. Her pussy is dry, it seems the feline needs more practice.")

		elif (masScore < 14):
			saynn("You are awoken by Rahi's noises. Ever so often, she lets out a desperate stifled moan that then gets dragged on into a painful cry. She is still actively wiggling on the floor, causing the nipple clamps to dangle and shift around, tugging on the sensitive nips. But the kitty just keeps doing it.")

			saynn("She notices that you're awake and presents you her chest.")

			saynn("[say=rahi]T-this.. feels so weird.. {rahiMaster}.. So much pain.. but she can't stop.. ah~..[/say]")

			saynn("You look down at her crotch.. she is somewhat wet down there, rubbing her thighs together. Kitty started off strong but now she is so exhausted the pain makes her desperate and needy.")

			saynn("As you reach to remove the clamps, Kitty jerks to the side, causing you to basically rip them off instead. That sends the feline into a state of agony, she produces a painful cry of pleasure while her tired body shakes and quivers, fighting against the ropes that dig into the fur.")

			saynn("Oops.")

		else:
			saynn("You are awoken by Rahi's noises. She is.. moaning.. a lot actually. Ever so often she drags one of her noises so long her voice becomes raspy for a bit. She is eagerly squirming on the floor, forcibly making her breasts bounce and her clamps dangle all over the place while pulling on the sensitive nips. And the kitty just kept doing it while panting heavily, her pussy looks so wet..")

			saynn("She notices that you're awake and only squirms harder.")

			saynn("[say=rahi]S-she.. she loves it, {rahiMaster}.. She wants more.. Please.. More of this.. Make your kitty suffer..[/say]")

			saynn("Wow, your kitty is one hell of a painslut. You decide not to deny her request and reach your hand towards one of the nipple clamps. But instead of carefully taking it off, you begin pulling on it.. harder and harder.. until it starts slipping off. And while doing so, the area that it pinches gets smaller and smaller, causing such a huge pain spike that the feline is arching her back and letting her tongue roll out.")

			saynn("Her neglected pussy slit suddenly squirts all over her thighs, the kitty is cumming! Passionate moans escape from her blushing face, she is shaking violently, struggling to endure the sensations. That's when you pull the second nipple clamp off as well, making kitty produce the loudest cry. Everyone in the general block probably heard that one. Poor kitty goes cross-eyed, she rolls around on the floor while her pussy keeps squirting until there are no lewd fluids left in her.")

			saynn("Wow, what a reaction. After some time, kitty finally begins to calm down.. her eyes.. satisfied.. Wait, wasn't this supposed to be a punishment?")

		saynn("You begin to untie the kitty..")

		addButton("Continue", "See what happens next", "do_untie")
	if(state == "blow_job"):
		playAnimation(StageScene.SexOral, "tease", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("You decided to change your mind and punish the kitty differently. Your hand finds a ring gag and presents it to the feline.")

		saynn("[say=pc]I'm gonna fuck that little mouth of yours, understand?[/say]")

		saynn("Kitty slowly parts her lips for you, letting the metal ring past her fangs, forcing her maw to be open. She quickly finds herself drooling.")

		if (deserved):
			saynn("[say=rahi]She deserves anything you want to do with her, {rahiMaster}..[/say]")

		else:
			saynn("[say=rahi]She doesn't understand why she deserves it..[/say]")

		saynn("Well, time for the fun part. You expose your {pc.penis} and quickly get it ready before getting a grasp on the feline's pony tail and pulling her head close to your crotch.")

		saynn("The kitty seems to be examining your member with great interest, her eyes follow the tip while you smack her cheek with it, leaving a string of precum on her fur.")

		addButton("Facefuck", "Punish that slut's throat", "do_facefuck")
	if(state == "do_facefuck"):
		playAnimation(StageScene.SexOral, "fast", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		var sexScore = getModule("RahiModule").getSkillScore("rahiSkillSex")
		saynn("You go straight from zero to a hundred by aligning your member with the metal ring in Rahi's mouth before thrusting inside, your dick going past kitty's teeth and straight down her throat, stretching it. And before she knows it, you begin fucking her throathole, pulling your {pc.masc} hips back before slamming them forward until your balls slap against the feline's chin.")

		saynn("It feels good, Rahi's throat is clenching around your shaft so well that you think that you won't last long.")

		if (sexScore < 6):
			saynn("Rahi is not doing that well though, she is lacking experience, meaning she can't even suppress her gag reflex. The poor kitty is gagging and choking on your dick while you keep pushing it further against her resistance. Her terrified eyes shed tear after tear while her throat makes wet noises. She can't do anything, the ropes are holding her paws, the ring keeps her from biting and any attempts to pull away are countered by you yanking hard on her ponytail.")

			saynn("Rahi looks like she is about to pass out. But wow, her throat is kneading your {pc.penis} so much that you let out moan after moan. Very soon you find yourself at the edge. One rough thrust and you ram almost your whole cock down that throathole before cumming hard. Strings after strings of {pc.cum} begin filling the cat's belly while her eyes roll up. She is getting weaker but your orgasm only grows stronger, your whole body shaking while her tight inner walls are milking your balls for all of its seed.")

			saynn("Satisfied, you pull out and let go of the girl's hair. Rahi instantly collapses onto the floor and begins coughing {pc.cum} onto the floor, looks like some of it got inside her lungs, ow. After she is just desperately gasping for air. She looks.. exhausted.. lightly speaking.")

			saynn("[say=pc]Wanna tell me something, kitty?[/say]")

			saynn("The feline submissively shakes her head and just tries to recover her breath.")

		elif (sexScore < 11):
			saynn("Rahi is seemingly keeping up with your onslaught. She doesn't have the most experience in sex but she is able to somewhat suppress her gag reflex for a bit. She is still slipping up occasionally, which leads to her gagging and choking on your dick while you keep thrusting it deeper, forcing her to deepthroat you. Her sorry eyes are shedding tears while various sloppy wet noises escape from her. When things get too uncomfortable, she begins to resist against her ropes and try to bite down on that ring on her mouth but none of it is working.")

			saynn("The moments when she can't control her reflex are the best, during them her throat is kneading your {pc.penis} so much that you can't help but to moan. Very soon you find yourself at your edge. One rough thrust and you ram almost your whole cock down that throathole before cumming hard. Strings after strings of {pc.cum} begin filling the cat's belly while her eyes roll up. She is getting weaker but your orgasm only grows stronger, your whole body shaking while her tight inner walls are milking your balls for all of its seed.")

			saynn("Satisfied, you pull out and let go of the girl's hair. Rahi instantly collapses onto the floor and begins coughing and gasping for air. But she recovers somewhat quickly even if she looks like she watched the most sad opera in the world with how much tears she cried.")

			saynn("[say=pc]Did you enjoy it, kitty?[/say]")

			saynn("The feline lowers her head and then shakes it slightly. It was a punishment after all.")

			saynn("[say=pc]Good.[/say]")

		else:
			saynn("Rahi eagerly lets you use her throat as rough as you wish. It seems she got quite experienced at these kinds of things, she has mastered her gag reflex so much that she is intentionally triggering it, allowing herself to gag and choke on your dick while you force her to deepthroat you. Her lusty eyes shine brightly before she closes them and cries a little, various wet noises escape from her. She doesn't resist at all, instead actively shoving her head onto your dick until the balls slap her chin.")

			saynn("She learned how to truly pleasure you, making her throat get so tight around your shaft that you can't help but to moan. She even finds time to use her rough tongue, wrapping it around your tip and collecting any pre while you thrust through. Very soon you find yourself at your edge. One rough thrust and you ram almost your whole cock down that throathole before cumming hard. Strings after strings of {pc.cum} begin filling the cat's belly. She is letting herself be choked until her tight inner walls begin to milk your balls for all of its seed. She has committed so much that some of your {pc.cum} gets shot out of her nostrils, a very lewd view.")

			saynn("Satisfied, you pull out and let go of the girl's hair. Rahi keeps sitting on the floor, her tongue licking the metal ring and her lips. Her lusty submissive eyes slowly open and look up at you. Seems like kitty is completely fine, wanting more even, she is only panting slightly but that's about it.")

			saynn("[say=pc]Ugh.. wow..[/say]")

			saynn("Rahi winks, she collects all the seed that is still in her mouth and swallows it with opened mouth.")

		saynn("Time to untie her.")

		addButton("Continue", "See what happens next", "do_untie")
	if(state == "pussy_sit"):
		playAnimation(StageScene.SexFaceSitting, "sit", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true}})
		saynn("You decided to change your mind and punish the kitty differently. Rahi lets out a meow of surprise when you expose your {pc.pussyStretch} pussy and sit on her face, your crotch hovering just above her lips.")

		saynn("[say=pc]We're gonna spend some time together, with you being my pillow, mhm?[/say]")

		saynn("Kitty deeply blushes while her eyes scan the contours of your {pc.masc} body, the ones that she can see from her spot. Just feeling her warm breath near your slit makes you excited already.")

		saynn("You slowly lowerself onto her face until your sensitive petals collide with her lips.")

		addButton("Lick!", "Make her lick you out", "pussy_start_lick")
	if(state == "pussy_start_lick"):
		playAnimation(StageScene.SexFaceSitting, "grind", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("You get comfy on Rahi's face, idly rubbing your pussy juices into her fur. Might as well make her work too now.")

		saynn("[say=pc]Lick![/say]")

		var sexScore = getModule("RahiModule").getSkillScore("rahiSkillSex")
		if (sexScore < 4):
			saynn("Kitty hears your order and blushes harder, she swiftly rolls her tongue out and starts quickly dragging it over your petals back and forth. She clearly lacks experience so her tongue is not as pleasurable as you would hoped but she got the enthusiasm.")

			saynn("You bite your lip and move your hips, meeting her tongue and helping yourself get off that way. Little moans begin to escape your lips, you lean back and push your wet pussy into that cat's face more, letting her rough tongue collect your arousal.")

			saynn("It feels.. good.. Rahi's tongue is clearly getting tired from eating your pussy out, just from a lack of endurance. So you grind her face more instead, marking her with your scent. Very soon the orgasm begins to draw closer until the pleasure waves finally shoot you over the edge.")

			saynn("Your muscles begin to tense up uncontrollably while your legs shake and lose strength to keep you up. Rahi keeps eagerly licking you out until she gets a warm shower that's coming from your squirting pulsating slit. You arch your back and let the orgasm waves flow through you, assisted by your personal pussy licker.")

			if (GM.pc.isWearingChastityCage()):
				saynn("The pressure in your chastity cage gets too much, your locked dick suddenly begins to shoot strings of {pc.cum} past the metal frame, creating oh quite the mess on the floor.")

			elif (GM.pc.hasReachablePenis()):
				saynn("The pressure in your {pc.penis} gets too much, it suddenly begins to shoot out strings of {pc.cum}, creating oh quite the mess on the floor.")

			saynn("After the climax begins to fade, you just keep sitting on Rahi's face, letting her clean up any wetness.")

			saynn("[say=pc]Good job kitty, even if you need quite some practice to be a pro at this.[/say]")

			saynn("You can feel purring happening down there, the vibrations get transferred to your sensitive pussy, providing extra stimulation.")

		elif (sexScore < 7 || RNG.chance(40)):
			saynn("Kitty hears your order and blushes slightly before getting to work. She lets her tongue roll out before dragging it over your sensitive pussy lips, making them wet with her saliva. She makes sure to poke your clit too, forcing out a moan or two out of you. Rahi is clearly trying to learn the best to pleasure you, letting you just enjoy yourself.")

			saynn("But your body, it begs for more, your hips begin to move slightly, meeting the cat's tongue motions. While doing that, you spread your juices all over Rahi's face, forcing your lewd scent into her fur. You lean back and just keep moaning while the feline under you keeps eating you out.")

			saynn("It feels.. quite good. Rahi's tongue is slowly running out of steam but its texture still feels great. You grind her face faster and faster until the orgasm starts to draw near. A few more motions and you suddenly cum..")

			saynn("Your muscles begin to tense up uncontrollably while your legs shake and lose strength to keep you up. Rahi keeps eagerly licking you out even after she gets a warm shower that's coming from your squirting pulsating slit, she makes sure to collect as much girlcum as she can in her mouth. You arch your back and let the orgasm waves flow through you, assisted by your personal pussy licker.")

			if (GM.pc.isWearingChastityCage()):
				saynn("The pressure in your chastity cage gets too much, your locked dick suddenly begins to shoot strings of {pc.cum} past the metal frame, creating oh quite the mess on the floor.")

			elif (GM.pc.hasReachablePenis()):
				saynn("The pressure in your {pc.penis} gets too much, it suddenly begins to shoot out strings of {pc.cum}, creating oh quite the mess on the floor.")

			saynn("After the climax begins to fade, you just keep sitting on Rahi's face, letting her clean up any wetness.")

			saynn("[say=pc]Good job kitty, you're slowly getting better.[/say]")

			saynn("You can feel purring happening down there, the vibrations get transferred to your sensitive pussy, providing extra stimulation.")

		elif (sexScore < 15):
			saynn("Kitty hears your order and eagerly digs into your crotch, her rough feline tongue already doing little circles around your sensitive clit, making you so needy. Kitty is so good that you start dropping moans. Her lips are rubbing against your pussy ones, collecting arousal onto them before Rahi obediently swallows it all.")

			saynn("After giving your clit the treatment it deserves, Rahi begins to grind her muzzle against your wet petals while her tongue moves down to your pussy hole and tries to penetrate it, putting more and more pressure until the tip finally slides in. The kitty under you is purring, sending vibrations through her tongue while her tongue lapping at your soft inner walls, the pleasure slowly driving you insane.")

			saynn("You barely move your hips at all, just letting the kitty eat your pussy. You lean back and support yourself with your hands while she works on lapping all the lewd fluids and brushing her rough nose against your clit. You feel like you won't last long, your noises of pleasure getting more pronounced. Until her efforts finally shoot you over the edge..")

			saynn("Your whole body locks up and shivers uncontrollably, your arms and legs shaking, struggling to keep you still. Your pussy twitches and pulsates, Rahi overstimulates your flower so much that you start squirting all over her face, covering her with your juices until she has to close her eyes. She tries to catch as much of your girlcum as she can, swiftly swallowing it, before returning to licking you down there.")

			if (GM.pc.isWearingChastityCage()):
				saynn("The pressure in your chastity cage gets too much, your locked dick suddenly begins to shoot strings of {pc.cum} past the metal frame, creating oh quite the mess on the floor.")

			elif (GM.pc.hasReachablePenis()):
				saynn("The pressure in your {pc.penis} gets too much, it suddenly begins to shoot out strings of {pc.cum}, creating oh quite the mess on the floor.")

			saynn("After the climax begins to fade, you just keep sitting on Rahi's face, letting her clean up any wetness.")

			saynn("[say=pc]Ah.. You're such a good pussy licker.[/say]")

			saynn("Rahi just purrs louder at you.")

		else:
			saynn("Kitty doesn't even need to hear your order, she was already nuzzling your pussy slit and sucking on your little sensitive clit. Then she rolls her feline tongue out and proceeds to playfully rub your cherry from side to side, already making you moan and squirm above her. That really gets your going, your sensitive lady bits already getting all moist and needy. And Rahi is eager to lap all of your arousal.")

			saynn("After that she moves her muzzle down slightly, letting her nose brush against your clit while her tongue gets dragged over the petals with quite some pressure, letting you feel the texture. The friction is too much, you're squirming more and more until the orgasm overwhelms you. Your pussy slit gushes juices all over the cat's face but she just gets more eager to penetrate your pussy hole and starts licking you from the inside, letting your clenching walls get tight around her tongue. She uses the whole length of it, the tip manages to quickly find your g-spot and start prodding it at a steady rate. Kitty is tongue-fucking your slit and that just drives you mad, you're moaning like a slut while your shivering body tries to arch itself more, your pulsating slit squirting girlcum again and again, even if less this time.")

			saynn("You have to actively resist your body because any movement is just pushing you further into this abyss of pleasure, the tied up kitty is obediently hammering at your spot while you ride one orgasm after another. You moan so much that your voice has those desperate raspy tones to it. And that's when Rahi starts to purr loudly, not just because she enjoys it too, but to provide extra stimulation, the powerful vibrations that she is making are transferring through her tongue and echoing throughout your whole crotch, it feels so-o warm down there.")

			saynn("At some point you just have to cut it by raising yourself off the Rahi's face. But even then her masterful efforts cause your pussy to twitch and squirt out what fluids are left. And because there is almost no wetness left, your legs and arms are only shaking harder.")

			saynn("[say=pc]Fu-u-u-uck.. So fucking go-o-o-od..[/say]")

			saynn("And Rahi is just casually licking her lips, enjoying the view.")

			saynn("You really take your time, recovering your breath.")

			saynn("[say=rahi]Again~?..[/say]")

			saynn("Oh fuck no, that's enough for one time.")

		saynn("Time to untie her.")

		addButton("Continue", "See what happens next", "do_untie")
	if(state == "complete_isolation"):
		playAnimation(StageScene.Hogtied, "idle", {pc="rahi"})
		
		saynn("At the last moment you decide your mind slightly. Rahi exhales a sigh of relief as you untie her paws. But then she hears the click of cuffs that lock her paws and ankles in an even tighter pose. And as she tries to comment on this, you force a rubber ball into her mouth before swiftly shoving on the whole head muzzle too, gagging the feline.")

		saynn("[say=rahi]H-hey.. T-the ropes were enough..[/say]")

		saynn("Yeah, that's why you repurpose the ropes by tying them around Rahi's chest and crotch, creating a tight hardness out of them. One of the vibrators gets slotted under the crotch rope and then gets gently pushed inside the feline's slit, stretching it. Then you find a few little pink vibro-bullets that you tape to her clit and to her nipples.")

		saynn("[say=rahi]Rahi is very s-sorry, {rahiMaster}.. Do you really have to..?[/say]")

		saynn("You're really getting tired of her tone, your hands tighten the gag head harness until Rahi can only make faint mumbling noises. Then you grab a blindfold and tie it around her eyes, taking away kitty's sight too.")

		saynn("Kitty is not struggling too much. And that's bad. You grab some chains and run between the both sets of cuffs before pulling on it hard, forcing kitty's ankles and wrists together, hogtying the girl and making her constantly arch her back. Her tail is wagging a lot so you tie some ropes around it too before tying the other end around her ponytail, making it so kitty experiences pain if she even tries to look anywhere except forward.")

		saynn("[say=rahi]huff-f-f.. mphf.. hfhf-mpr-fh..[/say]")

		saynn("What? Kitty is still asking for more? Great. You grab some ear plugs and gently wear them on Rahi's ears, stealing one of the last of her senses away. Now she can't even hear you or most of her noises.")

		saynn("Kitty is cuffed, tied up, chained up, blindfolded, gagged, plugged and isolated. The only thing that's left is to make her squirm hard. That's where the little remotes come in, you slowly raise the power sliders on each one, causing the toys on her nipples, clit and inside her pussy to switch on. Rahi instantly jerks to the side but that only causes the ropes to dig into her sensitive spots more, any noises that she makes are almost fully muffled thanks to the ballgag.")

		saynn("Poor kitty, you already hear her breathing getting deeper. With most of her senses gone, she is forced to focus on the only feelings that are left.. pleasure and pain.. a dangerous mix of sensations.")

		saynn("Rahi's nipples quickly get stiff, the toys buzzing against them provides extra stimulation that the feline probably didn't experience that much."+str(" The vibrations even cause her nips to start lactating milk, lonely drops drip down her curvy tits." if getCharacter("rahi").canBeMilked() else "")+"")

		saynn("Her pussy is twitching and leaking juices while two toys work on getting all her buttons pressed there at the same time. Very fast her pussy slit starts to squirt out small amounts of her girlcum, soon followed by her body trying to squirm but failing and instead receiving some discomforting sensations.")

		saynn("No matter what she does.. or if she stays still.. something is causing her to try to move. But she can't, the feline is completely helpless.")

		saynn("Well, might as well take a nap while she is like this.")

		addButton("Nap", "Take a good nap", "isolation_nap")
	if(state == "isolation_nap"):
		saynn("After a short hour of pointless dreams, you open your eyes and see.. Well, you do see Rahi.")

		saynn("The feline has clearly given up any attempts at resistance a long time ago. The dildo and the little vibrators are still buzzing away at her sensitive spots, causing the feline's pussy to pulsate regularry as a new orgasm overwhelms the poor kitty.")

		saynn("There is quite a sizable pool of girlcum under her, the whole cell smells of Rahi's arousal. Heck, the whole block probably.")

		saynn("Desperate deep noises manage to slip past her gagged mouth. She can't say a single word but you can tell, kitty is completely spaced out, there is only one thing on her mind, constant overstimulation.")

		saynn("You crotch before the kitty and raise her blindfold, letting her see. Rahi's eyes are rolled up so high that you almost can't see them.")

		saynn("Well, might as well untie her now. You turn off the vibrators, letting kitty finally.. relax. She keeps panting through her nose and will probably continue doing that for a while. You start unchaining her paws, ankles, untying her tail, chest, crotch, pulling out the dildo..")

		saynn("As you ungag her.. Rahi just continues to drool. You place her head on your lap and give her some scritches behind the ears. Oh right, you pull the plugs out of her ears too.")

		saynn("[say=pc]You're there, kitty?[/say]")

		saynn("[say=rahi]ny.. nya.. nya-a-a..[/say]")

		saynn("She might have lost it. But oh well, you can continue cuddling her until she returns to her senses. Which took a while of course. But at least it was fun.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "take_a_nap"):
		processTime(2*60*60)
		GM.pc.addStamina(50)

	if(_action == "vibrator"):
		var rahi = getCharacter("rahi")
		rahi.getInventory().equipItem(GlobalRegistry.createItem("ballgag"))

	if(_action == "blow_job"):
		var rahi = getCharacter("rahi")
		rahi.getInventory().equipItem(GlobalRegistry.createItem("ringgag"))

	if(_action == "complete_isolation"):
		var rahi = getCharacter("rahi")
		rahi.resetEquipment()
		rahi.getInventory().equipItem(GlobalRegistry.createItem("blindfold"))
		rahi.getInventory().equipItem(GlobalRegistry.createItem("inmatewristcuffs"))
		rahi.getInventory().equipItem(GlobalRegistry.createItem("inmateanklecuffs"))
		rahi.getInventory().equipItem(GlobalRegistry.createItem("ropeharness"))
		rahi.getInventory().equipItem(GlobalRegistry.createItem("ballgag"))
		rahi.getInventory().equipItem(GlobalRegistry.createItem("bondagemittens"))

	if(_action == "do_untie"):
		getCharacter("rahi").resetEquipment()
		endScene()
		return

	if(_action == "vibrator_makecum"):
		processTime(30*60)

	if(_action == "vibrator_deny"):
		processTime(30*60)

	if(_action == "rahi_vibrator_cum_nap"):
		processTime(90*60)
		getCharacter("rahi").cummedOnBy("rahi")

	if(_action == "vibrator_deny_nap"):
		processTime(90*60)

	if(_action == "nippleclamps_nap"):
		processTime(90*60)
		getModule("RahiModule").advanceSkill("rahiSkillMasochist")
		
		if(getModule("RahiModule").getSkillScore("rahiSkillMasochist") < 14):
			getCharacter("rahi").cummedOnBy("rahi")

	if(_action == "do_facefuck"):
		processTime(10*60)
		getModule("RahiModule").advanceSkill("rahiSkillSex")
		getCharacter("rahi").cummedInMouthBy("pc")
		GM.pc.orgasmFrom("rahi")
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "rahi_facefuck")

	if(_action == "pussy_start_lick"):
		processTime(10*60)
		getCharacter("rahi").cummedOnBy("pc", FluidSource.Vagina, 0.7)
		getCharacter("rahi").cummedInMouthBy("pc", FluidSource.Vagina, 0.3)
		GM.pc.orgasmFrom("rahi")
		getModule("RahiModule").advanceSkill("rahiSkillSex")
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "rahi_grind")

	if(_action == "isolation_nap"):
		processTime(60*60)
		getCharacter("rahi").resetEquipment()

	setState(_action)

func saveData():
	var data = .saveData()

	data["deserved"] = deserved

	return data

func loadData(data):
	.loadData(data)

	deserved = SAVE.loadVar(data, "deserved", true)
