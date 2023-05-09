extends SceneBase

var deserved = true
var parConf = 0.0
var parShame = 0.0
var isNaked = false
var parLastEvent = ""
var success = false

func _init():
	sceneID = "rahiRewardExhibitionismScene"

func _initScene(_args = []):
	if(_args.size() > 0):
		deserved = _args[0]

func _run():
	if(state == ""):
		addCharacter("rahi")
		saynn("Exhibitionism can be a very rewarding activity, depending on how confident your kitty is in herself and her body.")

		saynn("What do you wanna do?")

		var exLevel = getModule("RahiModule").getSkillScore("rahiSkillExhibit")
		if (exLevel <= 0):
			addButton("Stripping lvl1", "Make Rahi to strip for a reward", "stripping1")
		elif (exLevel <= 1):
			addButton("Stripping 2", "Make Rahi to strip for a reward", "stripping2")
		elif (exLevel <= 2):
			addButton("Stripping 3", "Make Rahi to strip for a reward", "stripping3")
		else:
			addButton("Stripping", "Ask Rahi to strip for you", "stripping")
		if (exLevel >= 5):
			addButton("Parading", "Take Rahi out and let her show off her body", "parading_start")
		else:
			addDisabledButton("Parading", "Rahi needs to be more confident to do this")
	if(state == "stripping1"):
		playAnimation(StageScene.Duo, "sit", {npc="rahi", npcBodyState={naked=true}})
		saynn("Since Rahi has absolutely zero skill in exhibitionism you decide to go very easy on her today.")

		saynn("You sit in a chair and relax. Rahi stands nervously in her cell, her paws by her sides. She watches you with her big kitty eyes.")

		saynn("[say=pc]I will reward you. But I want you to strip for me first, kitty. Just casually.[/say]")

		saynn("Your voice is low and commanding. Rahi's inexperience shines through as she gets all blushy and small, her tail coiling around her leg, her eyes looking at the floor.")

		saynn("You really want her to try to do it herself, without your help. So you find a bag of treats and hold it in her view. It seems to be some kind of candy.")

		saynn("[say=pc]I will give you one for each clothing piece.. or action.[/say]")

		saynn("You eat one and catch Rahi's jealous eyes, her lips trembling.")

		saynn("Finally, after some time, she reaches up to the collar of her inmate shirt and begins to slowly undo the buttons one by one. Usually undressing is just a part of intercourse but today it's the main focus. Rahi mewls softly as she reveals more and more of her fur-covered body, your intense stare causes her heart to race with a mixture of fear and excitement.")

		saynn("Eventually Rahi unbuttons her shirt.. revealing her beautiful belly.. but the cloth still hides her breasts. You throw your kitty a treat and she happily noms it, her tail unwinds and begins to flick eagerly.")

		saynn("[say=pc]Shorts too.[/say]")

		saynn("Rahi hesitates for a moment, there is a reinforced window in the cell behind which there is a big general block wing. It's tinted slightly.. but who knows. You grab another treat from the bag and eat it.. tastes so good. And then another. Rahi pouts and starts slowly pulling her shorts down, revealing her fluffy crotch and thighs. She keeps her legs closed but you do get a glimpse of her little pink clit which makes you smile. Your kitty, noticing your gaze, quickly covers her private bits.")

		saynn("[say=pc]Good girl.[/say]")

		saynn("You throw another treat at her and she masterfully catches it with her free paw before nomming her reward.")

		saynn("[say=pc]Now take off the shirt fully.[/say]")

		saynn("Rahi blinks many times. She is hesitating yet again. She ate enough treats to be satisfied and doesn't really need any more of them. But.. She went so far.. being basically naked in front of you by now.")

		saynn("In the end, she decides to obey, slowly pulling off the shirt off her shoulders with her free paw. As the shirt falls onto the floor, Rahi instantly covers her {rahi.breasts} from you. Her other paw is still on her crotch.")

		saynn("[say=pc]Excellent. I love how your body looks, kitty. Thank you.[/say]")

		saynn("Rahi smiles, standing before you, naked but not really exposed. It seems it will take some time to make Rahi get used to casual nudity.")

		saynn("Ah, right, you almost forgot to give Rahi the last treat. As you toss the candy at her, kitty reaches her paws out for it. But then she suddenly realizes her mistake and gets extremely embarrassed while you are enjoying the view of her perky tits and cute tight pussy. The candy hits Rahi's snout, making her confused and causing her to flop onto the floor with a loud meow.")

		saynn("[say=rahi]Meeeeeow!..[/say]")

		saynn("You can't help but to chuckle. You get up and come closer to Rahi before giving her some pats.")

		addButton("Continue", "That was cute", "endthescene")
	if(state == "stripping2"):
		playAnimation(StageScene.Duo, "sit", {npc="rahi", npcBodyState={naked=true}})
		saynn("Rahi has.. some experience in exhibitionism. But still not enough to pull her out into the public.")

		saynn("You sit in a chair and relax. Rahi stands a few meters away from you, looking shy, her paws stroking her tail. She watches you with her big kitty eyes.")

		saynn("[say=pc]I want you to strip for me first, kitty. Just because why not.[/say]")

		saynn("You pull out a bag of treats that you have stored just for this occasion. It seems to have random candies in it.")

		saynn("[say=pc]I will give you one for each clothing piece. Or just for obeying.[/say]")

		saynn("Rahi blushes, her heart probably beating faster from all the thoughts in her head. Still, she kinda wanted those treats. She straightens her posture and then begins to remove her inmate uniform, starting with the shirt, slowly undoing each button. You nod as Rahi exposes the fur of her belly for you. Still, you're not giving her the candy just yet..")

		saynn("[say=rahi]Meow..[/say]")

		saynn("She understands what she needs to do. Her eyes get directed towards the floor as she slides the shirt off her shoulders, allowing it to fall and reveal her beautiful perky breasts. You whistle in appreciation, making kitty blush harder. She makes her best attempt at not covering up but your stare makes her do it in the end, hiding the nipples with her arm.")

		saynn("Still, you do toss her a treat. Rahi catches it with her free paw and happily noms it, purring from how sweet it is.")

		saynn("[say=pc]Keep going, kitty.[/say]")

		saynn("Rahi blinks and looks down at the shorts that she is still wearing. She begins to awkwardly try to pull them off with one paw but that goes about as well as expected. At some point she forgets and uses her other arm too, exposing her cute breasts without even realizing it.")

		saynn("After some more time, she finally pulls her shorts down, revealing her cute mound that houses the tight pink slit with a sensitive bean above it. You can tell that Rahi feels exposed and vulnerable.. but also a tiny bit aroused. You toss her another treat. Your kitty noms it but then quickly covers herself with her paws.")

		saynn("[say=pc]You look beautiful, kitty. I will give you another one if you.. play with yourself.[/say]")

		saynn("[say=rahi]Meow.. play?.. Play how..[/say]")

		saynn("You shrug.")

		saynn("[say=pc]Any way you want.[/say]")

		saynn("Kitty stares at the tinted reinforced window behind you that still passes enough light to be able to see inmates walking past.")

		saynn("Rahi deliberates for a bit, not even looking at your bag of treats, she ate enough of those. Eventually she lowers her paws, exposing her bits yet again. But this time she also begins to slowly turn around, showing off her back to you. Kitty is wiggling her butt and stroking her buttcheeks while looking at you over the shoulder, her tail teasingly hiding her slit and the tailhole.")

		saynn("[say=rahi]Is that good?..[/say]")

		saynn("You can't help but to smile. Rahi smiles back.")

		saynn("[say=pc]Yes, it's perfect.[/say]")

		saynn("You hold the treat out on your hand. Rahi turns around again and slowly walks up to you, grabbing it.")

		saynn("[say=rahi]Thank you, {rahiMaster}..[/say]")

		saynn("Your hands land on her thighs and gently caress them while your kitty is enjoying her last treat. She is one step closer to becoming confident.")

		addButton("Continue", "That was nice", "endthescene")
	if(state == "stripping3"):
		playAnimation(StageScene.Duo, "sit", {npc="rahi", npcBodyState={naked=true}})
		saynn("You find a chair and take a seat before pulling a little bag of treats in front of Rahi before offering her a little smile. Your kitty notices it and already knows what this is about. She is still not yet fully into the idea of being casually nude in public, her paw rubs her nose.")

		saynn("You grab a single treat and present it to Rahi.")

		saynn("[say=pc]Come on, Kitty, you can do it.[/say]")

		saynn("The feline bites her lip and reaches for her shirt, her clawed digits slowly unbuttoning it as she catches your fascinated stare. Strangely enough, Rahi doesn't get too embarrassed, just smiling and blushing slightly. She reveals her fluffy belly and then drops the shirt completely, displaying her {rahi.breasts} to you, even crossing her arms under them, emphasizing their volume.")

		saynn("[say=pc]Good kitty.[/say]")

		saynn("Rahi giggles softly. You toss her a candy which she catches and eats quickly.")

		saynn("Feeling more confident, Rahi grabs onto her shorts and begins to slowly pull them down her legs, slowly revealing her crotch area.. and soon her cute pink slit too. Rahi looks at you exploring her girly curves and wiggles her butt to make the shorts fall faster.")

		saynn("[say=rahi]Do you like that, {rahiMaster}?..[/say]")

		saynn("[say=pc]You're doing great.[/say]")

		saynn("Filled with excitement, Rahi slowly walks up to you, swaying her hips widely for that feminine look. As you hold out the candy for her, she slowly leans in and grabs it off your palm with her teeth. All the while her paws are pressed against her thighs, meaning her arms are squeezing her breasts right in front of you."+str(" It doesn't take long for some milk to start coming out of them. So tasty." if getCharacter("rahi").canBeMilked() else "")+"")

		saynn("Rahi purrs after consuming that treat. She straightens her posture before doing a little twirl and posing for you, showing off her naked body, her tail teasingly covering up her pussy that has gotten kinda wet..")

		saynn("She continues to do this little dance for you, shaking her hips and running her paws over the curves. Your hungry gaze watches the show and explores Rahi's body which only seems to make her more eager.")

		saynn("Eventually Rahi exhausts all her moves and just stands before you, panting slightly with a big smile on her face.")

		saynn("[say=pc]Such a good kitty.[/say]")

		saynn("[say=rahi]Thank you, meow..[/say]")

		saynn("It seems your kitty begins to enjoy being an exhibitionist..")

		addButton("Continue", "That was nice", "endthescene")
	if(state == "stripping"):
		playAnimation(StageScene.Duo, "sit", {npc="rahi", npcBodyState={naked=true}})
		saynn("You take a seat on the chair that's in Rahi's cell and look at her with an expectant look on your face. Your kitty notices your stare and smiles, she takes a spot in the middle of the cell and presents herself. Rahi is wearing an inmate shirt and shorts, a standard uniform.")

		saynn("[say=rahi]Want something, {rahiMaster}?..[/say]")

		saynn("[say=pc]Yeah.[/say]")

		saynn("You point at her clothes and she instantly understands the order. She begins to slowly undo the buttons of her shirt, biting her lip as she exposes more and more of her fur to your gaze, her own eyes are constantly watching yours, bathing in your attention.")

		saynn("As she moves the shirt off of her shoulders and exposes her beautiful perky tits to you, it's clear that a rush of arousal rushes through her body, her pink nipples harden and there appears a dark wet spot on her shorts.")

		saynn("She tosses the shirt aside and stands before you, proudly displaying you her chest while only wearing her shorts. Her paws reach out and tug on her own nips, your kitty clearly has no problem touching herself in front of you..")

		saynn("[say=rahi]Nya.. She is such a.. slut..[/say]")

		saynn("After teasing her nips for a bit, your kitty slides her paws down along her belly before hooking her thumbs into the waistband of her shorts and slowly dragging them down. She keeps her gaze locked on your face as she reveals her tight pink pussy, shining with wetness.. You can hear her breathing deeply as she spreads her legs slightly, giving you a better view of her folds. Her digit lands on her clit and rubs it a few times before spreading her petals, causing a string of juices to hang between them.")

		saynn("[say=rahi]See.. a slut that gets wet from being naked in front of people..[/say]")

		saynn("Next, Rahi turns around and bends over, her paws spreading her buttcheeks, giving you a full view of her tight little asshole. She looks back at you over the shoulder, clearly getting heated from presenting herself in such a vulnerable position. Being watched and admired makes her feel so excited..")

		saynn("[say=rahi]Do you like what you see?..[/say]")

		saynn("Of course, you nod eagerly, your eyes still fixed on her body, causing Rahi to feel a surge of satisfaction and pride after pleasing you. She turns around again and steps closer, her paws grabbing your hands and putting them on her chest. You cup her {rahi.breasts}, squeezing and playing with the nipples as she watches your reaction with great interest. It seems just feeling the eyes of others glued to her body is now a good enough reward for her..")

		saynn("[say=rahi]Is this what you want?.. Tell her what to do and she will do it for you..[/say]")

		addButton("Enough", "That was enough of lewd for one time", "stripping_enough")
		addButton("Ask to masturbate", "Order Rahi to touch herself in front of you", "stripping_masturbate")
		if (getModule("RahiModule").isSkillLearned("rahiSkillSex")):
			if (GM.pc.hasReachablePenis()):
				addButton("Rail her", "(Sex) Pin Rahi against the window and breed her pussy for being so sexy", "stripping_rail")
			addButton("Finger her", "(Sex) Pin Rahi against the window and fuck her pussy with your digits", "stripping_fingering")
	if(state == "stripping_enough"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcBodyState={naked=true}})
		saynn("[say=pc]Thank you, kitty, that was enough.[/say]")

		saynn("Naked Rahi licks her lips and slides her paw over your shoulder.")

		saynn("[say=rahi]Of course..[/say]")

		saynn("You stand up and wrap your hands around your kitty, giving her a good hug. Rahi eeps but then leans into your hug and kisses your cheek.")

		saynn("[say=rahi]She likes when you look at her, {rahiMaster}..[/say]")

		addButton("Continue", "That was nice", "endthescene")
	if(state == "stripping_masturbate"):
		playAnimation(StageScene.Duo, "sit", {npc="rahi", npcBodyState={naked=true}})
		saynn("[say=pc]You were touching yourself so well, kitty.[/say]")

		saynn("Rahi smiles obediently and slowly slides her paw down to her crotch. She raises her leg and places the digi foot on the corner of your chair, allowing you to see her sexy moist folds in great detail.")

		saynn("[say=rahi]You watching?..[/say]")

		saynn("You nod softly. Your kitty starts by teasing herself, missing her pussy and instead running her clawed digits along her inner thigh. Slowly, she slides her fingers up to her wet pussy and begins to circle her clit. Your kitty does a little dance with her hips, moving them in rhythm with her fingers.")

		saynn("As she continues to touch herself, her breathing becomes more deep, little moans escape from her. Her free paw lands on her tits and squeezes one tightly while a few fingers of her other paw slip inside her dripping sex, pumping in and out.")

		saynn("[say=rahi]Look at her.. Your kitty is fucking her little pussy.. with her fingers.. ah-h..[/say]")

		saynn("Rahi is enjoying herself way too much, her body starts to tremble, her moans grow more bold and passionate as she approaches climax. She keeps squeezing her breasts and hammering away at her pleasure spot until finally reaching it. A cry of pleasure leaves her lungs as her body tenses up, her legs shaking, her pussy squirting juices all over her paw.")

		saynn("[say=pc]Good girl.[/say]")

		saynn("Panting, Rahi looks down at you while biting her lip. She proudly displays her wet paw and dripping pussy, including spreading the entrance open, showing you how heated she is inside right now. All with zero shame..")

		saynn("[say=rahi]Thank you..[/say]")

		addButton("Continue", "That was nice", "endthescene")
	if(state == "stripping_rail"):
		playAnimation(StageScene.SexStanding, "fast", {npc="rahi", pc="pc", bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true}})
		saynn("You just.. can't resist that kitty any longer, you've been hard for way too long.")

		saynn("Suddenly, you stand up from the chair and pin Rahi against her cell window that leads out into the general pop block. You can feel the heat radiating from her as you expose your {pc.penis} and press your body against hers.")

		saynn("[say=rahi]Ohh.. What are you.. ah..[/say]")

		saynn("With one quick motion, you guide the tip of your shaft towards her pussy lips. One rough thrust and you're inside, her wet pussy lips welcoming you and letting you slide deeper. Rahi purrs, her naked body is pinned between the cold window and you, she can see inmates walking past it..")

		saynn("[say=rahi]Yes.. Please.. fuck your kitty.. your dirty slut..[/say]")

		saynn("She grips that window tightly as you start moving your hips, fucking her needy cunt, her inner walls coating your shaft with juices. Moans leave Rahi's lips as your dick rubs her pleasure spot each time you ram it in. Some inmates outside take note of what's happening.. They can see Rahi's exposed breasts pressed into the window while you pound her slit.")

		saynn("Rahi cries out from pleasure, after seeing so many eyes on her she already reaches her climax. Waves of ecstasy wash over her, causing her body to shiver and her toes to curl, her pussy clenching around your shaft but you push through that, forcibly extending kitty's orgasm.")

		saynn("[say=rahi]Ah!.. Fuck her harder.. Everyone sees how much she loves getting fucked.. Like a dirty little slut..[/say]")

		saynn("You obliged, slamming into Rahi with all your strength, your cock reaching the natural barricade inside her and smashing it each time, causing your kitty's eyes to start rolling up. Another quick orgasm hits her body, causing her legs to start shaking and her drooly tongue to roll out of her mouth. Her pussy keeps clenching tight around your member as more powerful orgasms follow soon, Rahi squirts and really wants to collapse but you don't let her, instead fucking her raw.")

		saynn("[say=rahi]F-f-fu-uck..[/say]")

		addButton("Cum inside", "There is no other choice", "stripping_rail_cuminside")
	if(state == "stripping_rail_cuminside"):
		playAnimation(StageScene.SexStanding, "inside", {npc="rahi", pc="pc", bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true}})
		saynn("Rahi's cunt is pulsating around your dick so hard that it doesn't take long for you to reach your peak too. With one last thrust, you ram your {pc.penis} deep inside Rahi before cumming hard, warm sticky {pc.cum} begins to flood your pet's insides. She lets out a hot moan of pleasure as she feels your seed filling her womb up. The inmates cheer and step closer, watching the action through the window but not daring to step inside.")

		saynn("After Rahi's pussy milks your balls for every last drop, you slowly withdraw from her, a mix of juices and your jizz begins dripping down her thighs.")

		saynn("[say=rahi]Ah.. so much.. inside.. while everyone is watching..[/say]")

		addButton("Continue", "See what happens next", "stripping_rail_aftermath")
	if(state == "stripping_rail_aftermath"):
		playAnimation(StageScene.Duo, "sit", {npc="rahi", npcBodyState={naked=true}})
		saynn("After that incense fucking, you sit on the chair again, recovering your breath. Rahi turns around to face you, looking completely satisfied, with a smile on her face and a glint in her eye. All the while other inmates are still watching through the window. And Rahi really wants to give them a show.")

		saynn("Your kitty takes a step back before spreading her legs, giving the crowd a clear view of her used pussy.")

		saynn("[say=rahi]Look at what {pc.he} did to her.. She can feel it dripping out of her pussy..[/say]")

		saynn("Her voice is filled with desire. She turns her fingers over her pussy lips, spreading them apart to show off the seed that's still oozing out of her. The inmates can't take their eyes off Rahi, some are rubbing their crotches.")

		saynn("[say=rahi]Do you like that?.. Her slutty cunt got stuffed..[/say]")

		saynn("Rahi plunges two of her digits into her pussy, coating them in your {pc.cum} before bringing them to her mouth and cleaning them off with her tongue. She grabs more and more of your seed and licks it all up. Then she shows everyone her mouth before swallowing everything she gathered and showing it again, empty this time.. Some of the audience members stroke their members so hard that they cum already, making Rahi giggle.")

		saynn("Naked stuffed used Rahi returns to you and sits on your lap. She nuzzles your cheek.")

		saynn("[say=rahi]This was amazing.. Thank you..[/say]")

		addButton("Continue", "That was nice", "endthescene")
	if(state == "stripping_fingering"):
		playAnimation(StageScene.SexStanding, "tease", {npc="rahi", pc="pc", npcBodyState={naked=true}})
		saynn("You just.. can't resist from touching that kitty any longer, she's been a tease for way too long.")

		saynn("Suddenly, you stand up from the chair and pin Rahi against her cell window that leads out into the general pop block. You can feel the heat radiating from her as you press your body against hers.")

		saynn("[say=rahi]Ohh.. What are you.. ah..[/say]")

		saynn("Rahi lets out a small gasp, her nipples are pressed against the cold glass while you stand behind her. Your hand slides down over Rahi's hips down to her crotch, finding the little sensitive bean there and rubbing it with quick side-to-side motions. All the while your other hand squeezes between the glass and Rahi's breasts, cupping one of them."+str(" Little milk streams already emerge under your hand, leaving fancy patterns on that window." if getCharacter("rahi").canBeMilked() else "")+"")

		saynn("There are inmates walking around the general pop block, Rahi gets their attention by moaning and spreading her legs slightly, inviting you to touch her more intimately. You take the invitation, sliding your hand further between her legs and rubbing her pussy, occasionally spreading the folds to check her wetness. Rahi is pretty wet, your fingers feel.. the heat.")

		saynn("[say=rahi]Yes.. Please.. finger your kitty.. your dirty slut..[/say]")

		saynn("She is quite bold for such a shy kitty. You smirk and force two of your digits inside her, pumping them in and out roughly while your other hand keeps groping her tits. Rahi's moans turn into cries of pleasure as she feels your fingers hit all the right spots inside her. All the while, a little crowd has gathered behind the window, inmates are watching but don't dare to walk into the cell. Some of them are visibly aroused though..")

		saynn("[say=rahi]Ah!.. Harder.. Everyone sees how much she loves getting fucked.. Like a dirty little slut..[/say]")

		saynn("It seems that your touch, coupled with the many eyes staring at her, brings an immense amount of pleasure to her. You can feel her orgasm building up.. her body is squirming under you, her panting gets faster, her inner walls clenching around your digits.. until there is no going back.")

		saynn("As Rahi reaches the peak, she lets out a loud slutty scream, her body convulsing with pleasure. You hold your pinned into the window, still forcing your digits up her spasming pussy, overstimulating your kitty until she squirts all over your hand. Some inmates outside seem to be bringing themselves over the edge too.")

		saynn("[say=rahi]Ah.. S-She is.. Nya-a.. while everyone is w-watching..[/say]")

		saynn("You decide not to give your kitty any rest and keep finger-fucking her needy hole, hammering away at her sensitive spots and fighting the clenching pussy walls until she squirts again.. and again.. overstimulation causing kitty to stick her drooly tongue out and roll her eyes up, the fur on her inner thighs looking extremely wet from all the girlcum.")

		saynn("[say=rahi]Fu-u-uck!..[/say]")

		saynn("Only when her orgasm finally subsides, you slip your digits out and let her slump against the window. She is completely spent, her body tingling with the strong afterglow.")

		saynn("You step back and admire your handiwork. Rahi's pussy still pulsates slightly and drips juices. It seems she loved every second of it.. she can't quite describe it anymore. After recovering for a bit, Rahi takes a step back and spreads her legs, showing off her glistening, dripping pussy to the inmates.")

		saynn("[say=rahi]Look at what {pc.he} did to her.. To her pussy..[/say]")

		saynn("After this, Rahi walks up to you and gives you a tight hug, purring loudly into your face.")

		saynn("[say=rahi]Thank you.. meow..[/say]")

		addButton("Continue", "That was nice", "endthescene")
	if(state == "parading_start"):
		aimCameraAndSetLocName("hall_mainentrance")
		saynn("You decide that the best way to reward Rahi is to parade her around the prison for a bit. You make sure to let her know that she is free to.. showcase.. herself any way she wants to and that you will be there for her if she needs protection. You grab a chain leash..")

		saynn("[say=rahi]She can't wait to try..[/say]")

		saynn("Rahi nods and raises her chin, giving you access to her collar. You leash your kitty and walk her out in the main hall.")

		saynn("Time to see what happens.")

		addButton("Continue", "See what happens next", "par_loop")
	if(state == "par_loop"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcBodyState={naked=isNaked}})
		if (isNaked):
			saynn("You are walking your kitty on a leash. She is so confident in herself that she is okay with not wearing any clothes, allowing any inmate or staff member to see all of her in great detail.")

			if (isNotShamed()):
				var randLine = RNG.pick(["Everyone is looking at her..", "You can't keep your eyes off her, can you?..", "Do you like what you see, {rahiMaster}?..", "She is.. getting so wet..", "Kitty wonders if any camera is seeing her..", "She can feel their eyes on her body..", "She could use to this..", "Do you like the way her breasts bounce when she walks?..", "She wonders what will happen if she rubs her clit right now.. Would you let me?", "She feels like such a slut.. being paraded around like this..", "She.. she loves being your little naked pet.. So naughty and exciting..", "Her pussy is so exposed and vulnerable right now.. ah..", "She wonders if any of the guards will be brave enough..", "Want her to walk in front so you can see her ass?.."])
				saynn("[say=rahi]"+str(randLine)+"[/say]")

			else:
				var randLine = RNG.pick(["They're all staring at her.. Kitty feels so exposed..", "What if someone remembers her..", "She starts to feel a bit chilly.. Maybe we should head back soon..", "Everyone is probably judging her..", "She feels like such a slut right now..", "This is a bit.. humiliating..", "She can cover herself with her paws.. But everyone is staring at her ass..", "A few more and we go back maybe?..", "She is such a whore.."])
				saynn("[say=rahi]"+str(randLine)+"[/say]")

		else:
			saynn("You are walking your kitty on a leash. She is still wearing her inmate shirt and shorts. She is not confident enough to strip completely.")

			if (isNotShamed()):
				var randLine = RNG.pick(["She is so excited..", "Should we give them something to look at?..", "Wanna see something of hers?..", "She is feeling a little bit naughty today..", "You think she will get a chance to strip completely?..", "The guards are watching..", "Someone is watching..", "She can't wait to see their faces..", "Will she gets in trouble if she.. flashes someone?..", "This uniform.. is so limiting..", "Wanna see her tits, {rahiMaster}?..", "Wanna see how wet she is?..", "Do you like showing her off, {rahiMaster}?..", "She could use to being paraded like this..", "She wants to do something naughty..", "They don't know how much of a dirty slut she is..", "The leash makes this so much more hot..", "Her heart is racing.."])
				saynn("[say=rahi]"+str(randLine)+"[/say]")

			else:
				var randLine = RNG.pick(["She didn't do that much.. But she already wants to stop..", "She is blushing like a shy bitch..", "It was fun.. But maybe we should head back soon..", "She is such a slut..", "Will anyone remember her?.. She hopes no..", "Thank you.. but.. meow.."])
				saynn("[say=rahi]"+str(randLine)+"[/say]")

		saynn("Rahi's confidence: "+str(Util.roundF(parConf*100.0, 1))+"%")

		saynn("Rahi's embarrassment: "+str(Util.roundF(parShame*100.0, 1))+"%")

		addButton("Continue!", "See what happens next", "parGenerateEncounter")
	if(state == "pbench1"):
		playAnimation(StageScene.Duo, "sit", {npc="rahi", npcAction="sit", npcBodyState={naked=isNaked}})
		aimCameraAndSetLocName(RNG.pick(["main_bench1", "main_bench2", "main_bench3", "main_bench4"]))
		if (!isNaked):
			saynn("You see one of the benches and decide to take a seat. Rahi sits nearby and tries to rest her back against the cold metal. Rahi takes a deep breath and stretches her arms.")

			saynn("As you chat about stuff, Rahi bites her lip subtly. She looks around and then gives you a sly grin.")

			saynn("Without stopping the conversation, she slips her paw into her shorts and begins to casually rub her clit. You raise a brow at that but don't bring it up. Rahi's smile only gets bigger the more she touches herself, a little moan slips past her lips during one of the answers.")

			saynn("You are pretty sure other inmates have taken notice of Rahi's paw being in her shorts. But Rahi doesn't let their gazes stop her, she is being bold, enjoying the sensation of her fingers on her pussy.")

			if (isNotShamed()):
				saynn("[say=rahi]Something's wrong~?[/say]")

				saynn("[say=pc]Oh? No.. all good..[/say]")

				saynn("As your little conversation comes to an end, Rahi brings her paw to her mouth and carefully licks her digits.")

			else:
				saynn("[say=rahi]Is this too much?..[/say]")

				saynn("[say=pc]Oh? No.. it's all good.[/say]")

				saynn("[say=rahi]She feels it might be too much..[/say]")

				saynn("As your little conversation comes to an end, Rahi pulls her paw out of her shorts and notices that it's wet. Her cheeks blush as she quickly dries it against her uniform.")

			saynn("Time to walk around some more.")

		else:
			saynn("You see one of the benches and decide to take a seat. Naked Rahi sits nearby and tries to rest her back against the cold metal.")

			saynn("As you chat about stuff, Rahi tilts her head slightly and looks at you with lusty eyes. Around you are some inmates, some of them stare at your kitty, some didn't even realize yet that she has no clothes on.")

			saynn("Without stopping the conversation, Rahi slides her paw down her curves and lands it on her crotch. A soft moan escaped her lips as she began to rub her clit. She seemingly doesn't care about who sees her. But when she notices you noticing her masturbating, a little cute smile appears on her face.")

			if (isNotShamed()):
				saynn("[say=rahi]What's up~?[/say]")

				saynn("[say=pc]Oh? No.. nothing..[/say]")

				saynn("You almost forget what you were talking about, your sneaky gaze keeps slipping down to spy on Rahi's paw as she casually plays with her sensitive bean, flicking it side to side.")

				saynn("Others around started to take notice but Rahi paid no attention. Instead, she spreads her legs, revealing her moist pussy lips and spreads them open before sliding a few digits inside.")

				saynn("[say=rahi]Yeah, she agrees. Sparklink engines are the best at traversing at super-quantum speeds.[/say]")

				saynn("What? You don't even remember how you got there. As your little conversation comes to an end, Rahi brings her paw to her mouth and carefully licks her digits.")

			else:
				saynn("[say=rahi]Is this too much?..[/say]")

				saynn("[say=pc]Oh? No.. it's all good.[/say]")

				saynn("[say=rahi]She feels it might be too much..[/say]")

				saynn("You almost forget what you were talking about, your sneaky gaze keeps slipping down to spy on Rahi's paw as she casually plays with her sensitive bean, flicking it side to side.")

				saynn("Rahi notices someone's drilling gaze on her and gets somewhat shy. She suddenly feels an urge to cover her naked breasts and close her legs up. Her other paw is still gently kneading the sensitive clit though..")

				saynn("As your little conversation comes to an end, Rahi pulls her paw away from her slit and notices that it's wet. Her cheeks blush as she quickly dries it against her fur.")

			saynn("Time to walk around some more.")

		addButton("Continue", "See what happens next", "par_good")
	if(state == "pflash1"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="stand", npcBodyState={naked=isNaked}})
		aimCameraAndSetLocName(getRandomLoc())
		saynn("As you parade Rahi through the prison grounds, she takes notice of one of the inmates who is staring at her.")

		if (isNotShamed()):
			saynn("Without hesitation, Rahi quickly lifts her shirt, revealing her perky breasts to the inmate. His eyes widened in surprise but at the same time he couldn't look away. Rahi smirks and jiggles her breasts for them before hiding them under the shirt again.")

		else:
			saynn("She is blushing from such a stare but decides to go through with her plan anyways. She quickly lifts her shirt, revealing her perky breasts to the inmate. His eyes widened in surprise but at the same time he couldn't look away. Rahi likes his attention but at some point it gets too much and she hides them under the shirt again.")

		addButton("Continue", "See what happens next", "par_good")
	if(state == "pflash2"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="stand", npcBodyState={naked=isNaked}})
		aimCameraAndSetLocName(getRandomLoc())
		saynn("As you lead Rahi through the prison on a leash, she spots a guard watching you intently.")

		saynn("Without a second thought, Rahi lifts up her shirt, revealing her perky breasts and hard nipples. The guard is incredibly surprised but can't take his eyes off of her, clearly getting turned on by the unexpected sight.")

		if (isNotShamed()):
			saynn("Rahi sticks her tongue out at him and quickly covers herself. Such a bold kitty.")

		else:
			saynn("Rahi can do it for only a few moments though, getting a little embarrassed of showing off her tits so casually. She quickly covers herself and avoids the guard's eyes.")

		addButton("Continue", "See what happens next", "par_good")
	if(state == "pflash3"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="stand", npcBodyState={naked=true}})
		aimCameraAndSetLocName(getRandomLoc())
		saynn("As you parade Rahi on a leash, Rahi notices a group of inmates and has a sudden urge to give them a show.")

		saynn("Without hesitation, she quickly pulls down her shorts, exposing her bare pussy to the group of strangers.")

		saynn("The inmates are stunned, their eyes widening and getting lusty at the sight of her intimate parts on display. Rahi bathes in their reactions, getting visibly aroused from their hungry gazes. She keeps her shorts at her knee-level and spreads her legs as wide as they allow, giving them an even better view.")

		saynn("The inmates are catcalling your kitty and explaining what lewd things they would do to her but luckily you are there to keep them from going too far. You enjoy the view too though, Rahi runs her fingers over her clit and begins to moan softly for the audience.")

		saynn("The inmates are openly staring at her, their hands moving towards their own crotches. Rahi rubs her pussy faster, knowing that they were enjoying the show.")

		saynn("Though, that was enough for her. She quickly pulls her shorts up and runs away with you before the inmates have completely surrounded you.")

		addButton("Continue", "See what happens next", "par_good")
	if(state == "pundressing"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="stand", npcBodyState={naked=true}})
		aimCameraAndSetLocName(getRandomLoc())
		saynn("As you continue to parade Rahi through the prison, she becomes more and more bold and daring in her exhibitionist acts.. Finally, she decides to take it to the next level.")

		saynn("Without much warning, Rahi quickly strips out of her inmate uniform and offers it to you. She stands completely naked, her body exposed to the eyes of anyone who might be watching.")

		saynn("[say=rahi]Much better..[/say]")

		saynn("As you continue walking, you can't help but to look at her beautiful breasts and little pussy that she so proudly displays. Rahi catches your gaze on her naked form and begins to sway her girly hips seductively, jiggling her perky tits and tight ass in front of you, all with a smirk on her face.")

		saynn("[say=rahi]Something's wrong, {rahiMaster}~?[/say]")

		saynn("You shake your head, your eyes still exploring her fur. Rahi giggles, pleased with the reaction.")

		addButton("Continue", "See what happens next", "continueafterundress")
	if(state == "pasktotouchtits"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="stand", npcBodyState={naked=isNaked}})
		aimCameraAndSetLocName(getRandomLoc())
		saynn("Rahi finds a somewhat secluded spot where there aren't that many eyes around. She turns out and walks up to you, pretty much pressing her body against yours, her eyes shine with excitement.")

		saynn("When you realize that some of the buttons on Rahi's shirt are undone, her paws suddenly open it to you, revealing the gentle curves of her breasts and stiff-looking nips.")

		saynn("She giggles, seeing the hunger in your eyes. She steps even closer, concealing herself from other eyes, focusing only on you.")

		saynn("[say=rahi]Like them?..[/say]")

		saynn("You can either just enjoy the view or be bold yourself, testing your kitty.")

		addButton("Touch", "Touch your kitty's boobs", "pasktotouchtits_touch")
		addButton("Just watch", "You'd rather not spook your kitty", "pasktotouchtits_watch")
	if(state == "pasktotouchtits_touch"):
		saynn("Suddenly, you reach your hands out and cup Rahi's breasts, gently teasing her stiff nipples.")

		saynn("[say=pc]Yeah, I do.[/say]")

		if (success):
			saynn("Rahi handles it like a pro, biting her lip and smiling at you, letting you grope her round breasts and even pinch her hard nips.")

			saynn("As one of the guards walks past, Rahi just presses her tits into you and covers all the action with her shirt, still allowing you to enjoy her warm fluffy body.")

			saynn("[say=rahi]Nya..[/say]")

			saynn("After he walks away, Rahi giggles and buttons up her shirt.")

			addButton("Continue", "See what happens next", "par_good")
		else:
			saynn("Rahi bites her lip and gets all blushy when you do that, a little moan escapes from her as you grope her round breasts and softly pinch her hard nips.")

			saynn("A guard appears behind you, probably because he heard something strange happening. As he makes a sound, Rahi jumps back into him before turning around, her shirt still open, her tits on full display. The guard sees that, his eyes widening slightly.")

			saynn("Rahi offers him a guilty smile. The guard readies his stun baton.. Rahi takes a step back and looks at you with big eyes.")

			saynn("[say=rahi]Run![/say]")

			saynn("You two dash away from the meanie as fast as you can, Rahi struggling with the buttons on her shirt as she runs.")

			saynn("Luckily, you got away. But your kitty is still looking quite embarrassed, she didn't expect to be caught..")

			addButton("Continue", "See what happens next", "par_bad")
	if(state == "parading_end"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="stand", npcBodyState={naked=false}})
		aimCameraAndSetLocName("cellblock_orange_nearcell")
		saynn("After pushing herself out of her comfort zone for so long, Rahi is finally starting to feel self-conscious. As you pass a relatively secluded area, your kitty pokes you.")

		saynn("[say=rahi]Can.. we maybe.. stop for today..[/say]")

		if (isNaked):
			saynn("Kitty lowers her eyes, her paws are covering her privates. It seems she doesn't want to be naked in public anymore.")

			saynn("[say=rahi]She is feeling a bit embarrassed..[/say]")

			saynn("You smile and pat your kitty before returning her the uniform. She is clearly doing her best.")

			saynn("[say=pc]Of course, kitty. Let's give you some rest.[/say]")

		else:
			saynn("Kitty lowers her eyes, her paws make sure her uniform is all buttoned up.")

			saynn("[say=rahi]She is feeling a bit embarrassed..[/say]")

			saynn("You smile and pat your kitty, she is clearly doing her best.")

			saynn("[say=pc]Of course, kitty. Let's give you some rest.[/say]")

		saynn("You unclip the leash from Rahi's collar and just make your way back to the cell with her. Rahi lets out a sigh of relief and plops down on her bed. You sit nearby and place a hand on her shoulder.")

		saynn("[say=pc]You're a very brave kitty.[/say]")

		saynn("Rahi purrs while you scritch her behind the ears, slowly returning to her normal safe, the red blush goes away from her cheeks.")

		addButton("Continue", "See what happens next", "endthescene")
func isNotShamed():
	if(parShame < 0.8):
		return true
	return false

func isShamed():
	return !isNotShamed()

func getRandomLoc():
	return RNG.pick(["main_hallroom1", "main_hallroom2", "main_hallroom3", "main_hallroom4", "main_hallroom5", "main_hallroom6", "main_hallroom7", "main_hallroom8", "main_hallroom9", "main_hallroom10", "main_hallroom11", "hall_mainentrance", "main_bench1", "main_bench2", "main_bench3", "main_bench4", "main_hall_west", "hall_ne_corner"])


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "stripping1"):
		processTime(25*60)
		getModule("RahiModule").advanceSkill("rahiSkillExhibit")

	if(_action == "stripping2"):
		processTime(25*60)
		getModule("RahiModule").advanceSkill("rahiSkillExhibit")

	if(_action == "stripping3"):
		processTime(25*60)
		getModule("RahiModule").advanceSkill("rahiSkillExhibit")

	if(_action == "stripping"):
		processTime(25*60)
		getModule("RahiModule").advanceSkill("rahiSkillExhibit")

	if(_action == "parading_start"):
		processTime(3*60)
		getModule("RahiModule").advanceSkill("rahiSkillExhibit")

	if(_action == "stripping_masturbate"):
		processTime(10*60)
		GM.pc.addLust(20)

	if(_action == "stripping_rail"):
		getModule("RahiModule").advanceSkill("rahiSkillSex")
		processTime(5*60)

	if(_action == "stripping_fingering"):
		getModule("RahiModule").advanceSkill("rahiSkillSex")
		processTime(5*60)

	if(_action == "stripping_rail_cuminside"):
		processTime(3*60)
		getCharacter("rahi").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("rahi")

	if(_action == "parGenerateEncounter"):
		processTime(1*60)
		var possible = []
		
		if(parShame >= 1.0):
			setState("parading_end")
			return
		
		if(parConf >= 0.5 && !isNaked):
			isNaked = true
			setState("pundressing")
			return
		
		if(!isNaked):
			possible.append("pbench1")
			possible.append_array(["pflash1", "pflash2", "pflash3"])
			possible.append("pasktotouchtits")
		else:
			possible.append("pbench1")
		
		possible.erase(parLastEvent)
		
		var selEvent = RNG.pick(possible)
		
		
		setState(selEvent)
		parLastEvent = selEvent
		return

	if(_action == "par_good"):
		parConf = parConf + 0.1
		parShame = parShame + RNG.randf_range(0.01, 0.2)
		setState("par_loop")
		return

	if(_action == "continueafterundress"):
		parConf = 0.5#parConf + 0.1
		#parShame = parShame + RNG.randf_range(0.01, 0.2)
		setState("par_loop")
		return

	if(_action == "pasktotouchtits_touch"):
		if(RNG.chance(50)):
			success = true
		else:
			success = false

	if(_action == "par_bad"):
		parConf = parConf + 0.05
		parShame = parShame + RNG.randf_range(0.1, 0.2)
		setState("par_loop")
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["deserved"] = deserved
	data["parConf"] = parConf
	data["parShame"] = parShame
	data["isNaked"] = isNaked
	data["parLastEvent"] = parLastEvent
	data["success"] = success

	return data

func loadData(data):
	.loadData(data)

	deserved = SAVE.loadVar(data, "deserved", true)
	parConf = SAVE.loadVar(data, "parConf", 0.0)
	parShame = SAVE.loadVar(data, "parShame", 0.0)
	isNaked = SAVE.loadVar(data, "isNaked", false)
	parLastEvent = SAVE.loadVar(data, "parLastEvent", "")
	success = SAVE.loadVar(data, "success", false)
