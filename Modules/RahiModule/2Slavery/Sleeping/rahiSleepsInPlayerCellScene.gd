extends SceneBase

var condomBroke = false

func _init():
	sceneID = "rahiSleepsInPlayerCellScene"

func _run():
	if(state == ""):
		addCharacter("rahi", ["naked"])
		playAnimation(StageScene.Sleeping, "sleep", {npc="rahi", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("Rahi quietly walks into your cell and joins you, laying near. The bed was barely big enough for one person already but you open your arms and pull her closer, practically making her into your fluffy blanket. Rahi snuggles up against your {pc.masc} chest and quietly purrs.")

		saynn("You two say your goodnights to each other and then just lay there, together, simply enjoying the warmth and closeness of each other's bodies.. before drifting off to sleep..")

		addButton("Continue", "See what happens next", "sex_check")
	if(state == "blowjob"):
		saynn("The night passes.")

		saynn("You are sleeping soundly when you suddenly feel something warm and wet wrap around your hardening cock. You lazily open your eyes and look down to see someone under your blanket.. you know who it is, the brown feline tail poking out gives it away.. You decide to just let her do it.")

		saynn("Rahi's lips are wrapped tightly around your member. She doesn't say a word, her eyes are locked onto your crotch as she bobs her head up and down, taking you deep into her mouth and sucking it. Hearing your noises of love only makes her more eager, her rough tongue wrapping around your girth and sliding over it for that extra pleasure.")

		saynn("All the while her paws are just gently massaging your balls, causing you to grip the sheets tighter. Occasionally Rahi stops to give herself a breather. But she makes sure to keep kneading your balls and lick all the precum off the tip of your dick, making you throb already..")

		saynn("It wasn't long before you felt yourself approaching climax. You can't help but to not warn Rahi with a gasp. But she obediently keeps going, taking you deep into her throat until you can't hold the release off anymore.. You moan as your {pc.penis} starts twitching and exploding with {pc.cum} inside her mouth. Your kitty swallows every drop of it before peeking out of the blanket and looking up at you with a satisfied expression.")

		saynn("[say=pc]Wow, kitty..[/say]")

		saynn("You rest your head on the pillow, catching your breath as Rahi crawls up next to you, snuggling against your chest.")

		saynn("[say=rahi]Good morning, {rahiMaster}..[/say]")

		saynn("You cuddle together for a little longer before Rahi leaves and goes back to her own cell.")

		addButton("Continue", "That was lewd", "endthescene")
	if(state == "cowgirl"):
		playAnimation(StageScene.SexCowgirl, "sex", {npc="rahi", pc="pc", bodyState={naked=true, hard=true, condom=true}, npcBodyState={naked=true}})
		saynn("The night passes. Even though there aren't really any nights in space.. people still call the time when everyone sleeps a night. But someone certainly isn't sleeping..")

		saynn("You wake up from this strange and arousing sensation.. as if.. someone has straddled your hips.. You sneakily open your eyes and notice Rahi, your kitty, completely naked, grinding her pussy into your {pc.penis}, causing your shaft to begin hardening. You decide to pretend that you are still sleeping, letting kitty carry out her mischievous plan.")

		saynn("Before long, you were fully erect. Rahi, being the cautious kitty, pulls out a packaged condom and quickly rips it open with her claw before applying it to your dick. Then she carefully positions herself just above you, her pussy already dripping..")

		saynn("Rahi slowly lowers herself, moaning as she lets your member to spread her folds and stretch her soft inner walls, filling her up. After that, she just begins to slowly ride you, bouncing up and down on your dick.")

		saynn("You still try to pretend.. but it's hard.. you squirm ever so slightly under her while producing some quiet moans. All the while bites her lip and rides you faster while trying to hide her panting. You feel yourself getting close.. and Rahi seems to feel that too.")

		if (condomBroke):
			saynn("She feels it really well in fact.. at some point the low-quality condom on your dick has [b]broken[/b], which means that Rahi is in fact riding you raw.. As you produce a loud groan, Rahi brings herself down on your {pc.penis} as deep as her pussy allows. And she stays there.. obediently letting you fill her womb up with your sticky hot {pc.cum}.. not even knowing about that..")

			saynn("But after she has recovered, Rahi slowly raises herself and sees.. the broken condom..")

			saynn("[say=rahi]Oh.. oops..[/say]")

			saynn("After that she just sprints out of the cell, seed leaking out of her used hole in the process..")

		else:
			saynn("Luckily, the condom managed to endure all the fucking. As you produce a loud groan, Rahi brings herself down on your {pc.penis} as deep as her pussy allows. And she obediently stays there.. while you stuff the condom inside her with your hot stick {pc.cum}..")

			saynn("After she recovers, Rahi slowly raises herself and carefully ties up the condom.. before flopping on you. You put your hand on her and pull her closer for snuggles.")

			saynn("[say=rahi]Oh.. you're.. good morning, {rahiMaster}..[/say]")

			saynn("You cuddle together for a little longer before Rahi leaves and goes back to her own cell.")

		addButton("Continue", "That was lewd", "endthescene")
	if(state == "chastitycum"):
		saynn("The night passes.")

		saynn("You wake up when you feel someone's paws on your chastity cage.. Clearly those are Rahi's.. She is sneakily teasing you while being under the blanket, kissing and licking the tip of the cage, already making you desperately hard.. You decide not to announce that you're awake, letting your kitty play with you more.")

		saynn("Eventually, Rahi gets more brave, sneakily slipping her fingers down to your anal ring, gently rubbing and teasing your sensitive skin. She licks them and then, slowly but surely, begins to work them up your butt, stretching your tailhole. As soon as she reaches your prostate and begins to massage it, your locked away dick leaks out some precum.")

		saynn("This is it.. your kitty slowly fingers your pleasure spot while bringing her muzzle to your ballsack and dragging her tongue over them.. you can't help but to moan softly.")

		saynn("She continues to expertly tease and play with you until you just can't take it anymore.. With a cute moan, you finally reach your climax. Your caged up member throbs inside its contains while weak strings of {pc.cum} begins sprouting out of it. You squirm and pant heavily while Rahi obediently licks the seed off your cage, making sure to snatch every last drop before swallowing it all, leaving no evidence.")

		saynn("After that, she pulls her digits out of your butt and lays on top of you, her muzzle resting on your chest. You wrap your arm around her and snuggle.")

		saynn("[say=pc]Thank you.. kitty..[/say]")

		saynn("[say=rahi]Oh.. Meow.. Good morning, {rahiMaster}..[/say]")

		saynn("You cuddle together for a little longer before Rahi leaves and goes back to her own cell.")

		addButton("Continue", "That was lewd", "endthescene")
	if(state == "pegging"):
		playAnimation(StageScene.SexAllFours, "teaseflop", {pc="rahi", npc="pc", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("The night has passed.")

		saynn("You are lying on your bed, enjoying your remaining minutes of sleep. That's when you feel a paw gently caressing your face.. testing if you'd wake up.. You sneakily half-open one of your eyes instead and notice Rahi standing over you, wearing nothing but a lubed-up strapon and a little mischievous grin. It seems your kitty is in her dominant mindset.")

		saynn("After making sure that you're sleeping, Rahi reaches down and gently turns you on your stomach. She takes a moment to admire the sight of your exposed backside, probably feeling a rush of arousal at the thought of what she is about to do.")

		saynn("She climbs onto the bed and sits behind you, her strapon pressing against your tailhole.. It seems she wants to peg you.. Now would be the perfect moment to stop that.. or let it happen.")

		addButton("Let it happen", "Let Rahi peg you", "pegging_doit")
		addButton("Turn tables", "Fuck Rahi instead!", "pegging_doturntables")
	if(state == "pegging_haspenis"):
		playAnimation(StageScene.SexAllFours, "sex", {npc="rahi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("Rahi slides her paws under your hips, lifting them up before positioning her strapon against your anus. But just when she was about to push forward, you suddenly wake up and turn around before grabbing Rahi and rolling her onto her back in one smooth movement. Your kitty yelps as you remove the useless strapon harness and toss it aside.")

		saynn("[say=pc]You thought I'm that easy?[/say]")

		saynn("[say=rahi]Meow.. it's just.. you have a nice butt, {rahiMaster}.. huff..[/say]")

		saynn("You make her stand on all fours before positioning yourself between her legs and suddenly thrusting your {pc.penis} into her moist pussy slit, spreading the petals of that flower and plunging deep into it, causing your kitty to produce a cute noise.")

		saynn("[say=pc]And you have a nice pussy.[/say]")

		saynn("[say=rahi]Nya-ah..[/say]")

		saynn("The surprise quickly turns to pleasure as you rail her not-so-dominant slit with a gradually-increasing intensity. Rahi eagerly moans as you push on her g-spot while railing her, filling your kitty up with your hard cock.")

		saynn("You get a hold of her conveniently-placed tail and yank on it, making Rahi squirm and her fur stand on its ends, her body recoiling from each of your thrusts, just in time for another one on her way back. Her pussy is wet and slippery, the sound of flesh slapping together fills the room.. that and the scent of sex.")

		saynn("You take your time, enjoying the feeling of Rahi's tight pussy wrapping around your shaft. You grab one of her legs and pull it up over your shoulder, fucking her even deeper. Rahi can't endure that for long, she suddenly cries out in ecstasy, her body shaking from many orgasmic waves washing over it.")

		addButton("Cum inside", "Breed the kitty", "pegging_haspenis_cuminside")
		addButton("Pull out", "Rather be safe", "pegging_haspenis_pullout")
	if(state == "pegging_haspenis_cuminside"):
		playAnimation(StageScene.SexAllFours, "inside", {npc="rahi", pc="pc", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("Rahi's pussy is clenching around your {pc.penis} so well that you get really eager to stuff her up. With a few final rough trusts, you shove your member deep before letting that slit bring you over the edge. You groan as your dick pumps your hot stick {pc.cum} directly inside Rahi's womb, flooding it with your seed. Her body tenses as she feels the warmth of your {pc.cum} inside her, making her let out a long, shuddering moan of pleasure.")

		saynn("After both orgasms are over, you just lay there for a few moments, panting and recovering from this intense breeding attempt.")

		saynn("[say=pc]That's.. what you get..[/say]")

		saynn("[say=rahi]T-thank you.. And.. good morning..[/say]")

		saynn("Oh yeah, the day has just begun, didn't it. And your kitty is already leaking seed out of her used hole.")

		saynn("You let her hug you for the last time before she grabs the strapon harness and leaves.")

		addButton("Continue", "That was lewd", "endthescene")
	if(state == "pegging_haspenis_pullout"):
		playAnimation(StageScene.SexAllFours, "tease", {npc="rahi", pc="pc", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("Rahi's pussy is clenching around your {pc.penis} so well that you feel like you're about to cum. And that turned out to be a good call! As you pull your twitching throbbing member out, it instantly shoots out its first string of {pc.cum}, followed by another.. and another.. all of them landing on Rahi's ass and her back, marking her fur. All the while Rahi is left with some empty space inside her pulsing pussy, moaning softly as her folds slowly tighten up around the stretched hole.")

		saynn("After both orgasms are over, you just lay there for a few moments, panting and recovering from this intense sex session.")

		saynn("[say=pc]That's.. what you get..[/say]")

		saynn("[say=rahi]T-thank you.. And.. good morning..[/say]")

		saynn("Oh yeah, the day has just begun, didn't it. And your kitty is already all messy.")

		saynn("You let her hug you for the last time before she grabs the strapon harness and leaves.")

		addButton("Continue", "That was lewd", "endthescene")
	if(state == "pegging_stealstrapon"):
		playAnimation(StageScene.SexAllFours, "sex", {npc="rahi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("Rahi slides her paws under your hips, lifting them up before positioning her strapon against your anus. But just when she was about to push forward, you suddenly wake up and turn around before grabbing Rahi and rolling her onto her back in one smooth movement. Your kitty yelps as you take off the strapon harness from her.. and instead put it on yourself.")

		saynn("[say=pc]You thought I'm that easy?[/say]")

		saynn("[say=rahi]Meow.. it's just.. you have a nice butt, {rahiMaster}.. huff..[/say]")

		saynn("Rahi shivers slightly as you position the rubber cock at the entrance of her pussy. Luckily, it's been pre-lubed so all you have to do is slowly push it in.. savoring the way Rahi's tight walls hug the length of the dildo. A little moan slips from her lips when you shove most of the toy inside before proceeding to retract it instead, but not fully of course.")

		saynn("After you've given Rahi a fair chance to get used to the toy, you suddenly pick up the pace, thrusting harder, forcing that strapon to kiss Rahi's womb entrance as you shove it in. You lean down and whisper into her ear.")

		saynn("[say=pc]Do you like that, little sub? Do you like it when I fuck you like this?[/say]")

		saynn("Rahi whimpers in response, her body shuddering with pleasure as you continue to pound into her. You barely feel it yourself, the harness does put some pressure on your crotch but not quite enough to cum.. all your focus is on Rahi anyways. You quicken the pace even more, plunging the rubber strapon deep into Rahi's pussy, the knot at its base stretching her pussy folds extremely wide.")

		saynn("The climax didn't take long. As soon as the knot slips in, Rahi's body starts convulsing, her arms and legs shaking from multiple orgasmic waves. She sticks her tongue out, moaning while her soft inner walls clench tightly around the rubber shaft, refusing to let you pull it out.")

		saynn("[say=pc]Oh yeah, that's what you get, kitty.[/say]")

		saynn("You still have the rubber toy inside her. But after her orgasm is over, you two just lay there for a few moments, panting and recovering from this intense sex session.")

		saynn("[say=rahi]T-thank you.. And.. good morning..[/say]")

		saynn("Oh yeah, the day has just begun, didn't it. And your kitty is already all messy.")

		saynn("You let her hug you for the last time before she grabs the strapon harness and leaves.")

		addButton("Continue", "That was lewd", "removestraponandleave")
	if(state == "pegging_doit"):
		playAnimation(StageScene.SexAllFours, "sexflop", {pc="rahi", npc="pc", pcCum=true, npcCum=true, bodyState={naked=true}, npcBodyState={naked=true, hard=true}})
		saynn("You decide not to deny this.. opportunity.. and just keep pretending that you're in a deep state of sleep.")

		saynn("Slowly, Rahi presses her rubber toy between your buttcheeks and slowly grinds them, her paws reach down to caress your {pc.masc} thighs. Your kitty whispers to you, trying to sound authoritative..")

		saynn("[say=rahi]Cute.. little.. toy..[/say]")

		saynn("While she teases you so much, your breathing becomes deeper.. your body responding to her touch. Rahi takes this as a sign to continue. She uses her paw to align the tip of the toy with your anus and then starts gently prodding your star with it, gradually putting more and more pressure.. until the lubed-up tip slips in.. forcing a quiet gasp out of you.")

		saynn("You don't show any resistance.. letting Rahi push the rubber toy deeper into your {pc.analStretch} tailhole, stretching you out..")

		if (GM.pc.isWearingChastityCage()):
			saynn("The strapon finds your prostate and presses on it.. Your locked up dick wakes up almost instantly and starts to desperately try to get hard.. but the metal cage is stronger.. leaving you only to drip precum onto the bed sheets..")

		elif (GM.pc.hasReachablePenis()):
			saynn("The strapon finds your prostate and presses on it.. Your {pc.penis} wakes up almost instantly and starts to get hard.. The tip drops precum onto the bed sheets..")

		elif (GM.pc.hasReachableVagina()):
			saynn("Even though Rahi is not going for your pussy, even just feeling her stretch your other hole makes you get wet and needy.. Your slit dripping juices onto the bed sheets.")

		saynn("After Rahi has.. fitted.. most of the toy inside you.. she starts moving her hips back and forth, pounding your willing ass at a slow but steady pace. Again, you try not to resist and just obediently take it but your body keeps squirming under your kitty's body.. She could feel the heat of your body and the tightness of your {pc.thick} ass and it made her more eager.")

		if (GM.pc.isWearingChastityCage()):
			saynn("This continues for a while.. your prostate produces some transparent fluid that then gets forced out of your caged up dick when Rahi massages that spot with her toy. Desperate for release, you begin to moan softly into the pillow.. Your kitty hears that and places her paw on your chastity cage, trying to tease your cock through it.. but she can't quite get to it.. all she can do is pound your ass with her rubber cock..")

			saynn("You're completely relaxed on the bed.. And soon, a feeling begins to arise inside you.. a pressure, a different kind of it. The more that rubber head stokes your prostate, the bigger that pressure is. This might be it, you can't think about anything else but it. Your mind wants that release so much.. that it actually causes it..")

			saynn("Your anal ring clenches around Rahi's strapon as you suddenly cum! Your whole body shivering while the inflated prostate gets milked by your kitty, making your caged up dick slowly leak {pc.cum} onto the bed. She whispers again..")

			saynn("[say=rahi]Such a good slut..[/say]")

		elif (GM.pc.hasPenis()):
			saynn("This continues for a while.. your prostate produces some transparent fluid that then gets forced out of your {pc.penis} when Rahi massages that spot with her toy. Desperate for release, you begin to moan softly into the pillow.. Your kitty hears that and places her paw on your shaft, slowly stroking it.. But even that was enough to finally bring you over the edge..")

			saynn("Your anal ring clenches around Rahi's strapon as you suddenly cum! Your whole body shivering while the inflated prostate gets milked by your kitty, making your cock slowly leak {pc.cum} onto the bed. She whispers again..")

			saynn("[say=rahi]Such a good slut..[/say]")

		elif (GM.pc.hasVagina()):
			saynn("This continues for a while. Even though your anus is not that sensitive to allow you to cum just from anal, Rahi's strapon actually manages to knead your g-spot through the inner wall.. and that slowly drives you insane. Desperate for release, you begin to moan softly into the pillow.. Your kitty hears that and places her paw on your wet pussy and starts rubbing your clit with little circular motions.. and even that was enough to finally bring you over the edge..")

			saynn("Your anal ring clenches around Rahi's strapon as you suddenly cum! Your whole body shivering while the neglected pussy sprays your girlcum all over the bed. She whispers again..")

			saynn("[say=rahi]Such a good slut..[/say]")

		else:
			saynn("This continues for a while. Even though your anus is not that sensitive to allow you to cum just from anal, Rahi's strapon actually manages to reach and knead your pleasure spot.. and that slowly drives you insane. Desperate for release, you begin to moan softly into the pillow.. Your kitty hears that and places her paw on your crotch and rubs it in little circular motions.. and even that was enough to finally bring you over the edge..")

			saynn("Your anal ring clenches around Rahi's strapon as you suddenly cum! Your whole body shivering while Rahi keeps pounding your ass. She whispers again..")

			saynn("[say=rahi]Such a good slut..[/say]")

		saynn("Then she just pulls her strapon out, leaves a little kiss on your cheek and runs away before you wake up and spot her.")

		addButton("Continue", "That was lewd", "removerahistraponandleave")
	if(state == "fingering"):
		saynn("The night passes.")

		saynn("Rahi is still resting on your chest, snuggling. You were sleeping soundly when you suddenly felt her paws gently sliding over your {pc.masc} curves, exploring your every inch.. You could open your eyes and stop her.. but.. why not see what she does to you.")

		saynn("Your kitty tests you a little more, brushing her paws over your {pc.thick} thighs and watching your reaction. When she sees that you don't respond, she gets bolder, moving one of her paws down between your legs and resting it on your {pc.pussyStretch} pussy slit..")

		saynn("After that, Rahi starts to tease your clit, moving her clawed digits in a slow, circular motion around it. Then she gently drags them over the sensitive folds as well, making you grip the bed sheets.")

		saynn("As her fingers dance over your pussy, you feel your arousal growing, causing your petals to become moist. Rahi feels that and carefully spreads your pussy lips with two digits while prodding at the entrance with the other two. You don't resist at all, allowing your kitty to slip her digits inside your needy sex and start moving them in and out at a slow pace, occasionally stopping to rub your clit a little more. You can feel Rahi's breath on your chest but it's you who's panting and moaning quietly, still doing your best to pretend you're not awake.")

		saynn("As the minutes pass, Rahi continues to gently finger you, slowly bringing you to the brink of orgasm. Finally, with one last stroke of your g-spot, you cum.. your body shivering and squirming under Rahi's touch while your lips produce incredibly cute noises.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Even though it was a vaginal orgasm, it still triggers your locked up cock to throb and shoot weak lines of {pc.cum} through the firm metal cage, creating quite a mess..")

			saynn("After your long moment of ecstatic pleasure is over, Rahi pulls her digits out and does her best to clean your cage with her wet digits before bringing them to her mouth and using her feline tongue to lick it all off.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Even though it was a vaginal orgasm, it still triggers your {pc.penis} to throb and leak thick sticky {pc.cum}, creating quite a mess..")

			saynn("After your long moment of ecstatic pleasure is over, Rahi pulls her digits out and does her best to clean your shaft with her wet digits before bringing them to her mouth and using her feline tongue to lick it all off.")

		else:
			saynn("After your long moment of ecstatic pleasure is over, Rahi pulls her digits out before bringing them to her mouth and using her feline tongue to lick it all off.")

		saynn("That felt.. really good.. Your kitty returns to just snuggling with you after destroying any evidence.")

		addButton("Continue", "That was lewd", "endthescene")
	if(state == "pussylicking"):
		saynn("The night passes. And it seems, someone has woken up earlier than you..")

		saynn("You open your eyes when you feel someone's warm breath on your crotch. That someone is hiding under the blanket, probably unaware that you're awake. Whoever that is, the blanket hides them pretty well.. except for the brown feline tail that's clearly sticking out. Cute.. Your curiosity stops you from announcing your state..")

		saynn("Your kitty gathers some courage and then begins placing gentle kisses on your inner thighs, encouraging you to spread your legs for her which you obediently do, allowing Rahi to admire your {pc.pussyStretch} pussy. You can feel her moving her mouth closer to your sensitive folds and inhaling the sweet scent. Her paws gently caress your {pc.masc} curves while she keeps landing one kiss after another, creeping closer and closer..")

		saynn("You quickly become aroused and needy after so much great teasing.. Rahi feels that and, with her feline tongue out, starts to slowly lick up your wetness, tasting you for the first time tonight.. You produce a little soft moan that spooks your kitty.. but soon enough she gets bolder again, letting you feel her tongue yet again, her tail flicking with excitement.")

		saynn("After giving your folds some treatment, Rahi uses the rough tip to flick at your clit, sending little pulses of pleasure through your body. She wraps her lips around that sensitive bud and starts licking and sucking on it, forcing more moans out of you. Your hips begin to buck involuntarily, making you push yourself further into Rahi's face, urging her on.")

		saynn("When you get even more wet, Rahi's tongue works its way down to your pussy entrance, easily spreading the folds and pushing the tip inside as far as it could reach. The sweet taste only made her more eager to start sliding her tongue inside, lapping up your juices. That skilled tongue quickly brings you close to your climax, your body begins to tense up until you just can't take it anymore..")

		saynn("With a loud cry of pleasure, you lock your legs around Rahi's head and cum hard, your pussy pulsating and squirting all over her face and into her opened mouth. Your kitty quickly swallows your juices and proceeds to lick up every drop, her tongue still working on extending your climax, adding more pleasure waves that rock your whole body.")

		saynn("In the end, you're left panting and extremely satisfied. You unlock Rahi's head and use your hands to pull her up, closer to your face. That makes your kitty let out a meow of surprise.")

		saynn("[say=pc]Thank you, kitty..[/say]")

		saynn("The feline wanted to say something but you just kissed her, making her purr instead. You both just lay on the bed, enjoying the company of each other until it's time to actually wake up..")

		addButton("Continue", "That was lewd", "endthescene")
	if(state == "leggrind"):
		saynn("The night passes.")

		saynn("You wake up with a strange feeling.. A strange warm feeling around one of your legs. You open your eyes and notice Rahi, your kitty, still snoozing away, all cute and snuggled up to you. And that feeling is actually coming from her gently humping your leg. She is sleeping naked, just like you today.")

		saynn("It seems your kitty has a burning need that she couldn't just ignore. She keeps panting softly while slowly grinding her pussy against your body. And from doing that, she gets even more lusty, her sensitive folds spreading her juices across your skin.")

		saynn("You're not sure how to react. Should you wake her up? But that would ruin the moment for her. Nah, better to let her do it and see what happens..")

		saynn("Adorable little moans escape from your kitty while she keeps rubbing against you. Her eyes are closed, it's like she is running in her dreams.. kinda..")

		saynn("After some minutes, Rahi begins to hump you more urgently, her hips thrusting harder and faster against your leg, her sensitive slit gets more and more wet. You can feel her body tightening, the pleasure building inside her.. until she can't hold back anymore.")

		saynn("With a little cute squeak, Rahi reaches the peak of her pleasure. Her whole body begins to shiver as she experiences a powerful but contained orgasm. Her paws grip onto you. Her ears, snout, whiskers, tail, all of them flick in an irregular pattern while her spasming pussy gushes girlcum onto your leg. She barely makes any sound but you can.. feel.. how much passion is coursing through her body.")

		saynn("When her orgasm is over, your kitty just lays there, panting and spent but probably feeling satisfied.")

		saynn("After some time, she opens her eyes.. and feels a rush of embarrassment wash over her as she realizes what happened. She quickly slips out of bed and dashes away, towards her cell, leaving you with a wide grin.")

		addButton("Continue", "That was so cute", "endthescene")
	if(state == "walkies"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="allfours", npcBodyState={naked=true}})
		saynn("The night passes.")

		saynn("You wake up a little earlier today from something.. jumping on you? As your eyes begin blinking open, you find.. Rahi.. right up in your face. It takes you a moment to realize that your kitty is completely naked, on all fours and with a leash clasped between her teeth. Her eyes shine with playful anticipation.")

		saynn("[say=pc]Mornin' pup.. You want walkies, don't you..[/say]")

		saynn("Rahi's tail wags excitedly as she hears these words. You're still a little sleepy and so you try to hide under the blanket to savor the little time that you have before the prison's busy life starts. But Rahi doesn't let you enjoy the bed's comfy embrace, she starts tugging on the blanket with her paws while you desperately fight back.")

		saynn("[say=pc]Just give me five more minutes..[/say]")

		saynn("But your pup is relentless, she yoinks the blanket from you and gets off your bed, still standing on all fours and watching you, now all cold and vulnerable. It seems you have no choice..")

		saynn("[say=pc]Alriiight, I'm waking up.[/say]")

		saynn("Rahi purrs loudly and puts the blanket onto the chair before dropping the leash at your feet, barking happily, her body rubbing against your legs.")

		saynn("You pick up the leash and clip to Rahi's collar before giving her a gentle pat.")

		saynn("[say=pc]Ready for walkies, pup?[/say]")

		saynn("Together, you venture out of your cell, Rahi moving her bare paws and knees over the prison floor. As you stroll through the corridors, your kitty remains at your side, her leash held loosely by your hand. Such a simple act of walking around is so much more fun for Rahi as she embraces her inner puppy.")

		var possibleWalk = RNG.pick(["sniff", "grass", "shiny", "guard"])
		if (getModule("RahiModule").getSkillScore("rahiSkillWatersports") > 5 && RNG.chance(20)):
			possibleWalk = "pee"
		if (possibleWalk == "sniff"):
			saynn("Rahi's tail wags with each step, putting her playful self on full display. She occasionally stops to sniff curiously at passing inmates and staff, her innocent curiosity adding some charm to this unconventional walk. You watch your pup with a smile, her energy is quite infectious.")

		elif (possibleWalk == "pee"):
			saynn("As Rahi explores the surroundings and also herself at the same time, her puppy-like nature leads her to a nearby bush. She observes it and then crouches down nearby, mimicking the posture of a puppy that's about to relieve themselves. It's kinda cute.")

			saynn("Your puppy lets out a playful whimper before releasing a steady stream of warm, golden liquid onto the grass. The sight is both naughty and endearing, a reminder of how well you trained her.")

		elif (possibleWalk == "grass"):
			saynn("Rahi's tail wags fast as she spots a patch of soft, green grass. Unable to resist the temptation, she begins to roll in it, her fur becoming a little dirty in the process but she doesn't seem to mind. You can't help but to watch your pup and be amused by her joy.")

		elif (possibleWalk == "shiny"):
			saynn("Rahi's tail wags with each step, putting her playful self on full display. She occasionally darts off to investigate random shiny objects on the ground, her curious nature makes her do that. You follow patiently, chuckling softly at her eagerness.")

		elif (possibleWalk == "guard"):
			saynn("One of the guards approaches you, his stern expression softening as he sees Rahi's playful behavior. Your kitty obediently sits by your side and looks at him, proudly displaying naked self while her eyes are filled with innocent curiosity. The staff member couldn't resist reaching his hand out to give your pup a gentle pat on the head.")

		saynn("It wasn't the longest walk.. but it didn't need to be. Playful gestures, gentle strokes, headpats and whispered words of encouragement create a nice kinky atmosphere and help you bond with your puppy more..")

		saynn("As you return to the cell, Rahi is now looking satisfied, she slowly gets up and presents you her collar, waiting for you to unclip the leash.")

		saynn("[say=pc]Good girl.[/say]")

		saynn("Your kitty nuzzles you, a soft purr escaping from her chest. After that she just darts off to her cell while you are left to rest in your bed for a little longer before the actual day starts.")

		addButton("Continue", "That was so cute", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "sex_check"):
		if(getModule("RahiModule").shouldSexThePlayerOnMornings()):
			var domLevel = getModule("RahiModule").getSkillScore("rahiSkillDominance")
		
			var possible = []
			possible.append("leggrind")
		
			if(GM.pc.hasReachablePenis()):
				possible.append("blowjob")
				possible.append("cowgirl")
			if(GM.pc.isWearingChastityCage()):
				possible.append("chastitycum")
			if(GM.pc.hasReachableAnus() && domLevel >= 6):
				possible.append("pegging")
			if(GM.pc.hasReachableVagina()):
				possible.append("fingering")
				possible.append("pussylicking")
			if(getModule("RahiModule").getSkillScore("rahiSkillPetplay") > 5):
				possible.append("walkies")
		
			var newState = RNG.pick(possible)
		
			if(newState in ["pegging"]):
				var strapon = GlobalRegistry.createItem("StraponCanine")
				#var fluids = strapon.getFluids()
				#fluids.addFluid("CumLube", RNG.randi_range(3, 5)*100.0)
				getCharacter("rahi").getInventory().equipItem(strapon)
		
			if(newState in ["blowjob", "chastitycum"]):
				getCharacter("rahi").cummedInMouthBy("pc")
				GM.pc.orgasmFrom("rahi")
			if(newState == "cowgirl"):
				condomBroke = GM.pc.shouldCondomBreakWhenFucking("rahi", 30.0)
				if(condomBroke):
					getCharacter("rahi").cummedInVaginaByAdvanced("pc", {condomBroke=condomBroke})
				else:
					addFilledCondomToLootIfPerk(getCharacter("pc").createFilledCondom())
				GM.pc.orgasmFrom("rahi")
			if(newState in ["fingering"]):
				GM.pc.orgasmFrom("rahi")
			if(newState in ["pussylicking"]):
				getCharacter("rahi").cummedInMouthBy("pc", FluidSource.Vagina)
				GM.pc.orgasmFrom("rahi")
		
			if(newState != null):
				setState(newState)
				return
		endScene()
		return

	if(_action == "pegging_doit"):
		processTime(10*60)
		GM.pc.orgasmFrom("rahi")

	if(_action == "pegging_doturntables"):
		getCharacter("rahi").resetEquipment()
		if(GM.pc.hasReachablePenis()):
			setState("pegging_haspenis")
		else:
			var strapon = GlobalRegistry.createItem("StraponCanine")
			#var fluids = strapon.getFluids()
			#fluids.addFluid("CumLube", RNG.randi_range(3, 5)*100.0)
			GM.pc.getInventory().equipItem(strapon)
			setState("pegging_stealstrapon")
		return

	if(_action == "pegging_haspenis_cuminside"):
		processTime(5*60)
		getCharacter("rahi").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("rahi")
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "rahi_breed")

	if(_action == "pegging_haspenis_pullout"):
		processTime(5*60)
		getCharacter("rahi").cummedOnBy("pc")
		GM.pc.orgasmFrom("rahi")
		GM.pc.addSkillExperience(Skill.SexSlave, 40, "rahi_breed")

	if(_action == "removestraponandleave"):
		GM.pc.removeStrapon()
		endScene()
		return

	if(_action == "removerahistraponandleave"):
		getCharacter("rahi").resetEquipment()
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["condomBroke"] = condomBroke

	return data

func loadData(data):
	.loadData(data)

	condomBroke = SAVE.loadVar(data, "condomBroke", false)

func getDevCommentary():
	return "I added this scene because I wanted Rahi to have some.. agency? You know, so it's not always just you approaching her and starting scenes. It also means that after completing Rahi's content you will still see her every now and again ^^. The lewd scenes are also handy to reset your lust so they are kinda useful x3."

func hasDevCommentary():
	return true
