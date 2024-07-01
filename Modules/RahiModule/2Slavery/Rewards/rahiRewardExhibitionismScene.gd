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
		playAnimation(StageScene.Hug, "hug", {npc="rahi", npcBodyState={naked=true}})
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
		playAnimation(StageScene.SexStanding, "inside", {npc="rahi", pc="pc", pcCum=true, npcCum=true, bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true}})
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
		addCharacter("rahi", ["naked"])
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

		saynn("Success chance: "+str(getSuccChance(5, 15, 20, 90))+"%")

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

			addButton("Continue", "See what happens next", "par_very_good")
		else:
			saynn("Rahi bites her lip and gets all blushy when you do that, a little moan escapes from her as you grope her round breasts and softly pinch her hard nips.")

			saynn("A guard appears behind you, probably because he heard something strange happening. As he makes a sound, Rahi jumps back into him before turning around, her shirt still open, her tits on full display. The guard sees that, his eyes widening slightly.")

			saynn("Rahi offers him a guilty smile. The guard readies his stun baton.. Rahi takes a step back and looks at you with big eyes.")

			saynn("[say=rahi]Run![/say]")

			saynn("You two dash away from the meanie as fast as you can, Rahi struggling with the buttons on her shirt as she runs.")

			saynn("Luckily, you got away. But your kitty is still looking quite embarrassed, she didn't expect to be caught..")

			addButton("Continue", "See what happens next", "par_bad")
	if(state == "pasktotouchtits_watch"):
		saynn("You decide to control yourself a little bit and just stare at Rahi's beautiful chest. Suddenly reaching out for it would be against the spirit of exhibitionism..")

		saynn("The longer you admire her nips, the stiffer they become. Your kitty smiles widely, seeing your reaction and how tempted you are.")

		addButton("Continue", "See what happens next", "par_good")
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
	if(state == "pcanteen"):
		playAnimation(StageScene.Duo, "sit", {npc="rahi", npcAction="sit", npcBodyState={naked=false}})
		aimCameraAndSetLocName("hall_canteen")
		saynn("You decide to enter the prison's busy canteen, taking seats on one of the benches near the corner.")

		saynn("Rahi looks around, curious if anyone is watching her. After ensuring that most inmates are busy eating or standing in a queue, she slyly pulls down her shorts, just enough to reveal her aroused sex. It was a.. fascinating sight for sure, Rahi is smiling while proudly displaying her pussy lips that are quite moist and inviting.")

		saynn("[say=rahi]Look at it.. and keep looking..[/say]")

		saynn("Her heart is probably racing with excitement, she glances around discreetly. With a sly smile, she lends over to you, whispering.")

		saynn("[say=rahi]She is so naughty, isn't she?..[/say]")

		saynn("You are wondering if you could.. test your kitty a little bit.")

		saynn("Success chance: "+str(getSuccChance(5, 15, 5, 90))+"%")

		addButton("Touch", "Rub your kitty's pussy", "pcanteen_touch")
		addButton("Just watch", "You'd rather not embarrass your kitty", "pcanteen_watch")
	if(state == "pcanteen_touch"):
		saynn("Rahi is so naughty that you just couldn't resist the temptation. Your hand slowly moves across the table before jumping onto Rahi's inner thigh and caressing it. Kitty raises a brow while you feel the.. warmth.. radiating from her exposed slit. Now it's your time to smile.")

		saynn("[say=pc]Something is bugging you, kitty?[/say]")

		if (success):
			saynn("Rahi shakes her head and keeps eye contact with you even when you begin to trace the contours of her wet inviting folds with gentle strokes.")

			saynn("[say=rahi]It's.. completely fine, {rahiMaster}..[/say]")

			saynn("Rahi bites her lip to suppress a moan, her excitement growing by the second. All the while one of your digits is teasingly rubbing her sensitive clit. The risk of almost being caught is so..")

			saynn("Suddenly, a few inmates walk up to your little secluded spot and sit on the opposite bench from yours. They drop their food plates onto the table and begin eating their tasteless paste, occasionally shooting you unaware gazes.")

			saynn("You wonder if you should remove the hand now.. Rahi's smile is still wide.. so you continue. Your digits resume their teasing, dancing sensually and exploring the depth of Rahi's slick folds. The canteen noise does mask some of the soft moans that escape from Rahi's lips.. But the people on the other side are probably already wondering why you two are just sitting there with no food.. and why do Rahi's eyes look so lusty.")

			saynn("But, luckily, they just finish their food and leave you two alone.")

			saynn("[say=rahi]Close call.. She can feel the adrenaline.. Nya-a..[/say]")

			saynn("As you pull your hand away from her crotch.. you realize that your fingers are coated in Rahi's juices. Your kitty sees that and pounces on them almost instantly, sliding your digits past her fangs where she can suck them dry.")

			saynn("Time to go..")

			addButton("Continue", "See what happens next", "par_very_good")
		else:
			saynn("Rahi shakes her head.. but looks quite nervous while you begin to trace the contours of her wet inviting folds with gentle strokes.")

			saynn("[say=rahi]It's.. no..[/say]")

			saynn("Rahi cheeks blush red as she fails to suppress a moan, her excitement growing by the second.. just like her fear. All the while one of your digits is teasingly rubbing her sensitive clit. The risk of almost being caught is so..")

			saynn("Suddenly, a few inmates walk up to your little secluded spot and sit on the opposite bench from yours. They drop their food plates onto the table and begin eating their tasteless paste, occasionally shooting you unaware gazes.")

			saynn("As soon as they come into view, Rahi shuts her legs.. hard.. trapping your hand between her girly thighs, desperate not to get caught. She tries to maintain a composed face expression.. even while feeling you wiggling your digits beneath the table.")

			saynn("The canteen noise does mask some of the soft moans that escape from Rahi's lips.. But the people on the other side are probably already wondering why you two are just sitting there with no food.. and why do Rahi's cheeks are red and her eyes are so jumpy. Your hand begins to feel numb.. Each passing second feels like an eternity as she waits for the inmates to finish their meals and move on.")

			saynn("Finally, as the inmates rise from their seats, Rahi finally releases your hand.. allowing the blood to flow through it again.")

			saynn("[say=rahi]S-sorry.. Her heart is beating so fast..[/say]")

			saynn("As you pull your hand away from her crotch.. you realize that your fingers are coated in Rahi's juices. Your kitty sees that and pounces on them almost instantly, sliding your digits past her fangs where she can suck them dry.")

			saynn("Time to go..")

			addButton("Continue", "See what happens next", "par_bad")
	if(state == "pcanteen_watch"):
		saynn("You couldn't help but to keep staring at that forbidden sight, Rahi's pink, glistening pussy is so tempting.. But you decide against doing more, allowing Rahi to stay confident.")

		saynn("Other inmates begin to fill the canteen, taking seats, including on the opposite bench.. but Rahi remains unashamed.. still displaying herself for you, bathing in the attention that her private bits catch. And the risk of being caught only makes her excitement grow with every second.")

		saynn("The inmates at the opposite are probably questioning themselves about why are you two sitting there without food.. and why your gaze is guided where it is. They whisper amongst themselves.. but you just can't stop looking at your slick pink contours..")

		saynn("Finally, after the inmates finish their meal and leave, Rahi pulls her shorts back up.")

		saynn("[say=rahi]They probably saw.. Her heart is beating so fast..[/say]")

		saynn("Time to go..")

		addButton("Continue", "See what happens next", "par_good")
	if(state == "pflash4"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="stand", npcBodyState={naked=false}})
		aimCameraAndSetLocName(getRandomLoc())
		saynn("One of the guards seems to be staring at you two a little too much.. Rahi has a playful smirk on her face, you can tell that she has a plan.")

		saynn("Your kitty waits until he gets distracted with some inmate before positioning herself behind him and quickly unbuttoning her inmate shirt, putting her round perky tits on full display. Kinky.")

		saynn("The guard is completely unaware that Rahi is boldly flashing her tits behind him.. but the inmate that got stopped sees that in great detail, his eyes widened as he switches his attention completely.")

		if (isNotShamed()):
			saynn("Finally, the guard begins to realize that something is wrong and begins to turn. Time seems to slow down.. while Rahi just.. stands still, with her tits out, probably curious about what will happen next if she just lets it happen.")

			saynn("The guard finally turns around, his gaze locking onto Rahi's exposed breasts. A quick flash of surprise flashes across his face. Rahi couldn't help but revel in the power she had over others in that moment.")

			saynn("But when that flash passes, the guard's expression switches to an annoyed one. Time to make your escape! Giggling mischievously, Rahi quickly closes her shirt and grabs your hand before dashing away.")

		else:
			saynn("Finally, the guard begins to realize that something is wrong and begins to turn. Time seems to slow down.. while Rahi.. begins to have doubts about it. She is still holding her tits out.. but the shame eventually takes over..")

			saynn("The guard finally turns around, his gaze locking onto Rahi. Her cheeks blush for no reason, she manages to close her shirt just in time.. but is still embarrassed about it.")

			saynn("The guard tilts his head and then just shoos you away.")

		addButton("Continue", "See what happens next", "par_good")
	if(state == "pgymnaked"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="stand", npcBodyState={naked=true}})
		aimCameraAndSetLocName("gym_yoga")
		saynn("You let Rahi lead you in any direction that she wants. And so she does, bringing you into the area with lots of greenery. Rahi decides to take a leisurely stroll through the yard, letting her exposed breasts bounce freely. You were quick to follow. It seems your kitty had a certain place in mind.")

		saynn("The gym.. Your naked kitty enters it and boldly presents herself and her fluffy body, probably already feeling a sense of excitement coursing through her. The gym was busy as always, lots of inmates doing weights or stretches.. but the moment Rahi walked in, most of the gazes were directed towards her.")

		saynn("You take a spot slightly out of the way, looking after Rahi but letting her have fun. You see her swaying her hips seductively as she steps forward, following the inner edge of the area. Her flawless curves were on full display, enticing gazes from all directions.")

		saynn("With a playful smile, Rahi runs her paws over her fur, caressing her {rahi.breasts} and trailing down over her hips. The desire in the onlookers' eyes fuels her fire, making her eager to push boundaries.. You can tell how aroused this little act makes her.")

		saynn("As she walks by weightlifting stations, Rahi can't resist giving a show to the inmates who were mid-lift. She approaches them and turns around before boldly bending forward, ensuring they catch glimpses of her wet dripping pussy and the inviting tight asshole.")

		saynn("And just like, after getting everyone horny, Rahi quickly makes her escape before someone could catch her.")

		addButton("Continue", "See what happens next", "par_good")
	if(state == "ppee"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="stand", npcBodyState={naked=true}})
		aimCameraAndSetLocName("yard_northCorridor")
		saynn("As you parade your kitty on a leash through the prison's green yard, a mischievous thought enters Rahi's mind. She stops and tugs on the leash, inviting you to look at her.")

		saynn("Your naked feline looks around and then bites her lip, her eyes spark.")

		saynn("[say=rahi]She needs to pee. Right here. Right now.[/say]")

		addButton("No", "You can't allow your kitty to pee in public", "ppee_no")
		addButton("Sure", "(Watersports) Let Rahi pee here", "ppee_yes")
		if (getModule("RahiModule").getSkillScore("rahiSkillDominance") > 5):
			addButton("Offer mouth", "(Dominance+Watersports) Allow Rahi to pee into your mouth", "ppee_offermouth")
	if(state == "ppee_no"):
		aimCameraAndSetLocName("main_bathroom2")
		saynn("You shake your head.")

		saynn("[say=pc]No, kitty. The bathroom is not that far, we're going there.[/say]")

		saynn("Your kitty rolls her eyes and sighs. As confident as she might be, you still have her leash, meaning you have the last word.")

		saynn("[say=rahi]Fiiine.[/say]")

		saynn("Rahi follows you through the gym area and towards the big bathroom room, the urge makes her do the pee dance already which gets a few chuckles out of people around.")

		saynn("[say=rahi]Can she at least do it in the sink?..[/say]")

		saynn("You shake your head and push Rahi into one of the cubicles with a toilet in it before closing the door, not wishing to see her do it.")

		saynn("After some time, Rahi comes out of it, no longer walking funny.")

		saynn("[say=rahi]Meow.. It would have been so hot if you allowed her, {rahiMaster}..[/say]")

		addButton("Continue", "See what happens next", "par_bad")
	if(state == "ppee_yes"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="kneel", npcBodyState={naked=true}})
		saynn("Well.. maybe it would be a good test of her exhibitionistic tendencies. The longer you think about it, the more Rahi starts to do the pee shuffle, clearly about to wet herself.")

		saynn("[say=pc]Go ahead, just not on the path.[/say]")

		saynn("Your kitty nods and literally does one step away from it before slowly squatting down and spreading her legs wide, showcasing her cute tight pussy to you and anyone who would dare to walk past.")

		saynn("Rahi bites her lip again and closes her eyes, her body shivering ever so slightly. Her pussy tenses up, and, after a few moments, Rahi starts peeing.")

		saynn("As the golden stream pours from her pee hole, Rahi's body quivers with pleasure, she opens her eyes and looks into yours, a sensual moan escaping her lips while she relishes the sensation of warm piss cascading down from her eager pussy slit.")

		if (isShamed()):
			saynn("It's only when some random inmate walks past you, Rahi suddenly releases how vulnerable her position is and closes her legs, peeing under herself now. Her cheeks blush a little red.")

		else:
			saynn("Even when some random inmate walks past you, Rahi continues to proudly relieve herself, unashamed by anything.")

		if (getModule("RahiModule").getSkillScore("rahiSkillWatersports") > 9):
			saynn("Your kitty is so into this that she uses her paw to catch some of the golden fluid and then brings it to her maw, using her tongue to lick it all off, tasting her gross pee and loving it.")

		saynn("Finally, when the last drops trickle from Rahi's slit, she gracefully rises and gets back on the path.")

		saynn("[say=rahi]Much better..[/say]")

		addButton("Continue", "See what happens next", "par_good")
	if(state == "ppee_offermouth"):
		playAnimation(StageScene.SexOral, "lick", {pc="rahi", npc="pc", bodyState={naked=true}})
		saynn("The more you think about it.. maybe you could let Rahi.. Hmm..")

		saynn("Your kitty notices your strange gaze. A gaze of a.. submissive person.")

		saynn("[say=rahi]Ohh. Is someone.. feeling like a subby bitch?[/say]")

		saynn("Her voice switches from soft and excited to dark and.. even more excited. You lower your head slightly. Rahi pulls you closer to her using the leash and then grabs your chin.")

		saynn("[say=rahi]Because right now she could use one. So? Mm?[/say]")

		saynn("[say=pc]Miss Rahi..[/say]")

		saynn("Rahi's urge is getting stronger. So hearing those words was enough for her to grab you and pull you down to your knees before showing her crotch into your face, her needy pussy blocking your air.")

		saynn("[say=rahi]Open. Your. Mouth.[/say]")

		saynn("You shift a little, taking a deep breath, inhaling Rahi's horny scent before obeying, parting your lips and sitting still, awaiting your fate. Very soon your kitty finally unleashes a warm stream of urine directly into your mouth, a mix of surprise and arousal courses through your veins as you are forced to keep up, swallowing the gross yellow fluid without thinking about it too much.")

		saynn("While using you as a piss toilet, Rahi smiles and looks down at you, little soft moans escape from her as she slowly empties her full bladder. At some points it becomes too much and you start gagging on her piss. But Rahi just slaps your cheek and presses her slit against your lips harder.")

		saynn("[say=rahi]Drink it, don't make her force you to lick the ground.[/say]")

		saynn("So humiliating.. And yet, it's hard to imagine yourself being even more aroused. Eventually, Rahi's stream begins to subside, allowing you to catch up and swallow the rest.. The aftertaste.. is probably even grosser than the taste itself.. But seeing Rahi's satisfied expression.. makes you realize that you're not doing it for the taste.. You clean Rahi's folds with your tongue to make sure there is no pee there anymore.")

		saynn("[say=rahi]Good pet.[/say]")

		saynn("After that, she offers you a paw and helps you stand up.. before giving you the other end of her leash.")

		saynn("[say=rahi]Let's go, {rahiMaster}..[/say]")

		addButton("Continue", "See what happens next", "par_good")
	if(state == "finish_pick"):
		saynn("After teasing so many people with her body, Rahi got incredibly confident and now asks to go somewhere for her last big act.")

		saynn("Where do you want to go?")

		addButton("Laundry", "Go check out those big washing machines", "finish_laundry")
		addButton("Stocks", "Go hang around the punishment area", "finish_stocks")
	if(state == "finish_laundry"):
		playAnimation(StageScene.SexAllFours, "tease", {npc="rahi", npcBodyState={naked=true}})
		aimCameraAndSetLocName("main_laundry")
		saynn("You decide that giving Rahi's uniform a wash is a good idea and head to the laundry room, bringing your kitty too of course. The hum of machines and the scent of detergent filled the air. Your naked Rahi got a few glances from the inmates here but most of them are busy. And Rahi wants more, you can see the mischief shine in her eyes.")

		saynn("You approach one of the empty washing machines, all of them extremely huge and bulky. Rahi fetches her uniform off of you and begins to climb into the open drum for reasons that are unknown to you at first.. but they become obvious very soon.")

		saynn("[say=rahi]Oh no.. She thinks she is stuck.. Can you help her, please?[/say]")

		saynn("Her voice is filled with mock distress. Rahi wiggles her body, purposely feigning frustration as if she was truly stuck. Her cute, pink pussy was on full display, just aching for attention.")

		saynn("Huh. You realize that there are some good opportunities here. And the kitty is clearly asking. Or you can leave her needy.")

		addButton("Free Rahi", "She is asking for help after all", "flaundry_free")
		addButton("\"Free Rahi\"", "Grope your kitty", "flaundry_grope")
	if(state == "flaundry_free"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="kneel", npcBodyState={naked=true}})
		saynn("It seems that Rahi has gotten stuck pretty well because you meet quite a lot of resistance while trying to help her. But eventually you pull her out and see her disappointed eyes.")

		saynn("[say=rahi]Huff..[/say]")

		saynn("[say=pc]Something is wrong, kitty~?[/say]")

		saynn("She crosses her arms and pouts while you ready the washing machine and let it work on Rahi's uniform. The inmates that are walking past you keep sneakily eyeing your kitty's private bits but that just doesn't do it for her anymore.")

		saynn("[say=rahi]Nothing..[/say]")

		saynn("You grab her chin and make her look at you.")

		saynn("[say=pc]Are you lying to me, kitty?[/say]")

		saynn("[say=rahi]No..[/say]")

		saynn("The audacity of that cat..")

		addButton("Spank her", "Publicly punish your kitty", "flaundry_free_spank")
	if(state == "flaundry_free_spank"):
		playAnimation(StageScene.Spanking, "fast", {npc="rahi", npcBodyState={naked=true}})
		saynn("Without a word, you firmly grab Rahi's wrist before guiding her to bend forward and make her get on all fours, her round buttocks exposed and vulnerable. Rahi's breath hitched in excitement as you positioned yourself behind her, already raising your hand.")

		saynn("With a swift motion, your hand comes down on Rahi's upturned rear, delivering a firm smack on her ass, the sound echoing through the whole laundry room and gathering the attention of inmates.")

		saynn("[say=rahi]AH!..[/say]")

		saynn("Even when a little crowd begins to gather around, you continue to spank Rahi's butt, alternating between harder and softer strikes, between her left and right buttcheek, sometimes switching to rubbing her curvy ass.. but only to prepare her for another firm smack.")

		saynn("Each impact sends waves of sharp sensations through her body. You are trying to make it painful but your kitty, feeling so many hungry eyes on her, suddenly starts to moan instead, her pussy dripping juices onto the tiled floor.")

		saynn("Rahi's disobedience fades into a distant memory as the punishment consumes her, her buttcheeks slowly becoming red and warm to the touch. The combination of pain and weird kind of exhibitionist pleasure surges through her, igniting her senses.. and making her into a subby mess.")

		saynn("With a final, well-placed strike, rahi's body starts convulsing with pleasure. She lets out a loud slutty moan, the warm fuzzy waves make her body convulse and shiver.")

		saynn("[say=pc]Never lie to me, kitty.[/say]")

		saynn("Rahi rests on the cold floor while the inmates cheer, seeing a puddle of Rahi's pussy juices under her.")

		saynn("[say=rahi]S-sorry.. T-thank you for disciplining her.. ah..[/say]")

		saynn("When the punishment is over, the crowd begins to disperse, returning to their spots. Oh, the washing beeps, showing that it has finished washing Rahi's uniform. Just in time.")

		saynn("Your kitty whines softly while you try to pull shorts onto her red butt.")

		saynn("[say=rahi]Worth it..[/say]")

		saynn("After that, you just return to Rahi's cell, still keeping her on a leash so she wouldn't run away and start flashing people again.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "flaundry_grope"):
		saynn("You approach the stuck Rahi and crouch behind her, kitty's wiggling butt is up against your face.")

		saynn("[say=pc]Let me see..[/say]")

		saynn("You pretend to assess the situation, secretly enjoying the view. Rahi can't help but to feel a thrill rush through her, knowing that others can potentially catch a glimpse of her intimate bits.")

		saynn("You reach your hands out to \"free\" Rahi, your fingers brush against her fluffy butt before sliding down along her inner thighs, causing shivers of excitement to go through her body. Rahi lets out a soft gasp, you can clearly see her arousal building with each touch.")

		saynn("[say=rahi]She is still stuck..[/say]")

		saynn("[say=pc]Oh yeah? Let me try a little harder.[/say]")

		saynn("Your hand moves closer and closer to her exposed pussy, fingers lightly sliding over her sensitive areas. Rahi can't hold back any longer and parts her legs wider, giving more access to her dripping sex and uncovering her beautiful tailhole by moving the tail away. She is practically begging for you to explore her even further. You can hear a little soft moan as your digits glide over her wet folds, teasingly.")

		saynn("You hold one of your hands on Rahi's fluffy butt, squeezing and keeping her in place but she still tries to grind her slit against her fingers, seeking more pleasure. The laundry room was bustling with activity, but Rahi was lost in the moment, her lust fueled further by the risk of getting caught.")

		addButton("Rescue her", "That was enough lewds", "flaundry_grope_resque")
		addButton("Eat her out", "That pussy looks awfully tasty", "flaundry_grope_lick")
		if (getModule("RahiModule").isSkillLearned("rahiSkillSex")):
			addButtonWithChecks("Breed her", "(Sex) Rahi is stuck in a perfect position for this", "flaundry_grope_breed", [], [ButtonChecks.HasReachablePenis])
	if(state == "flaundry_grope_resque"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="stand", npcBodyState={naked=true}})
		saynn("Finally, you decide that your kitty has had enough teasing and so you \"rescue\" her from the washing machine, freeing her from the supposed entrapment by just carefully tugging on her butt.")

		saynn("Rahi gets up and turns around before leaning against the machine behind her. You can easily see how heated she still is, her chest is going up and down as she breathes deeply.")

		saynn("[say=rahi]Meow.. Thank you, savior.[/say]")

		saynn("You grab Rahi's inmate clothes and put them into the washing machine.. might as well get them washed.")

		saynn("[say=pc]You're very welcome, kitty.[/say]")

		saynn("She leans in such a way that her lower part of the body is pushed out forward. She is emphasizing her {rahi.breasts} with one arm while the other hand slowly slides down to her crotch and begins to casually rub her clit. Many random onlookers probably already spotted her but she doesn't mind, she is safe as long as you're around.")

		saynn("[say=rahi]Someone could have taken advantage of such..[/say]")

		saynn("Kitty spreads her legs a little and then gently grabs her pussy folds before spreading them too, showcasing the little strings of juices hanging between them.")

		saynn("[say=rahi]..a slutty kitty..[/say]")

		saynn("Rahi catches some of them and then licks her digits before moving them back to her sex and boldly plunging two inside and proceeding to casually finger herself in front of you. It seems she is gonna get her climax one way or another today.")

		saynn("[say=rahi]..by fucking her raw..[/say]")

		saynn("Her free paw is squeezing her tits firmly while the second one keeps sliding the two digits in and out of her wet needy slit, bringing the orgasm closer and closer. Many passionate moans escape from her, causing a lot more eyes to look her way rather than just you.")

		if (getModule("RahiModule").getSkillScore("rahiSkillMasochist") > 5):
			saynn("[say=rahi]..and leaving her used and abused..[/say]")

		else:
			saynn("[say=rahi]..and leaving her used..[/say]")

		saynn("Rahi's panting gets faster and faster, she keeps pumping her digits inside her slit until the orgasm takes over her body, causing her to throw her head back and moan while her legs legs. Kitty's pussy walls are spasming around her girlcum-coated fingers, her eyes roll up while she produces more noises of love directed towards the ceiling.")

		saynn("After this long moment of pure bliss, your kitty finally comes down from it and brings her gaze down, seeing so many inmates staring at her. And some are more than just staring..")

		saynn("[say=rahi]H-hah.. Should we go now?..[/say]")

		saynn("Seems like a good idea. You grab Rahi's clean uniform and lead her out of the room while you still can, leaving the inmate inside horny.")

		saynn("[say=rahi]That was fun, wasn't it..[/say]")

		saynn("[say=pc]Sure, kitty.[/say]")

		saynn("You bring her back into her cell and watch her finally put on her uniform.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "flaundry_grope_lick"):
		saynn("Unable to resist Rahi's tempting display, you lean in closer. Groping that ass feels nice.. but actually flicking your tongue against her cute little clit feels even better. You wrap your lips around it and gently suck while teasing the sensitive mound further, forcing a gasp of pleasure to come somewhere inside the washing machine. You continue to explore her with your mouth, your tongue doing gentle licks along the folds before focusing on the clit a little more and doing swirling motions around it.")

		saynn("[say=rahi]Ah..[/say]")

		saynn("With each stroke of your tongue, Rahi's arousal reaches new heights. She grips the round drum of that machine harder while you start prodding at the entrance, easily slipping inside her. So warm.. her pussy walls gently knead your tongue while you begin lapping away at them, catching all the juices and occasionally pulling away to swallow.")

		saynn("[say=rahi]Everyone can see.. you doing this..[/say]")

		saynn("As Rahi's pleasure intensifies, her body begins to tremble, legs shiver, her hips rocking against your mouth in an eager rhythm.")

		saynn("[say=rahi]..to your slutty pet.. ah..[/say]")

		saynn("Finally, unable to contain herself any longer, Rahi's orgasm washes over her. She arches her back and lets out a cry of ecstasy as she releases her sweet nectar onto your tongue. Her body convulsing from the intense sensations, this much stimulation causes her to squirt again and again, coating your mouth with her love juices.")

		saynn("Exhausted and satisfied, Rahi slumps against the washing machine, her legs still trembling. You pull away from her pussy and lick your lips. Oh wow, everyone is staring at you two. Probably because the whole laundry room smells of sex now..")

		saynn("You actually help Rahi to get out of her precarious position and land a little kiss on her lips.")

		saynn("[say=rahi]Nya.. oh.. so many eyes..[/say]")

		saynn("You hand her back her uniform and lead her back to the cell while you still can.")

		saynn("[say=rahi]That was fun, wasn't it..[/say]")

		saynn("[say=pc]Sure, kitty.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "flaundry_grope_breed"):
		playAnimation(StageScene.SexAllFours, "sex", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("It's a perfect setup, your kitty is in the prime position for breeding. You decide not to waste time and expose your {pc.penis} that got quite hard already just from you inhaling Rahi's scent for so long.")

		saynn("As you press it against her needy entrance and spread her slick folds, Rahi lets out a surprised meow and willingly spreads her legs wider.")

		saynn("[say=rahi]Are you gonna..[/say]")

		saynn("With a slow but deliberate motion, you push your hips forward, allowing your member to easily stretch open Rahi's pussy slit and slide inside. A soft moan escapes her mouth while her inner walls are clenching around you, her body instinctively accepting you, craving you like she is in heat.."+str(" Because she is, in fact, in heat.." if getCharacter("rahi").isInHeat() else "")+"")

		saynn("[say=rahi]Ah.. yes, you are..[/say]")

		saynn("With a firm grip on Rahi's grip, you plunge your cock deep into her wetness, fucking her raw. The kitty moans, her body arching as she takes your shaft in until the tip hits her tight womb entrance.")

		saynn("[say=rahi]You are fucking your slutty kitty..[/say]")

		saynn("Your bodies move back and forth with Rahi's slightly lagging behind, only synchronizing when you thrust inside, your motions slowly becoming more intense and primal. Both your and her desires seem to be growing fast, consuming your every thought.")

		saynn("[say=rahi]Ah.. In front of everyone.. You gonna..[/say]")

		addButton("Cum inside", "Breed your kitty", "flaundry_grope_breed_inside")
	if(state == "flaundry_grope_breed_inside"):
		playAnimation(StageScene.SexAllFours, "inside", {npc="rahi", npcBodyState={naked=true}, bodyState={exposedCrotch=true, hard=true}})
		saynn("Rahi's pussy is so good that you can't help but to succumb to your primal urges. You pull on her tail while ramming your {pc.penis} as deep as she can take it, making her body squirm uncontrollably under so much pressure.")

		saynn("[say=rahi]C-cum inside..[/say]")

		saynn("Indeed, with a loud growl, you proceed to release your load deep into Rahi's slick depths, claiming her as your own. Slutty moans escape from her lips, her body shivering as she feels your seed flooding her womb, marking you as her mate. Her pussy walls clench around your shaft, draining your balls.")

		saynn("[say=rahi]Ye-es-s..[/say]")

		saynn("You remain in this intimate position.. with Rahi's top part of the body still stuck inside the washing machine. While enjoying the afterglow, you suddenly notice that everyone is staring at you and your moaning kitty. At least you gave them a good show.")

		saynn("As you catch your breath, you finally pull out, leaving your kitty to leak {pc.cum}. You help her get out of her predicament and hand her the uniform.")

		saynn("[say=rahi]Thank you.. oh.. hello everyone..[/say]")

		saynn("[say=pc]Better for us to go.[/say]")

		saynn("You grab Rahi's leash and lead her out and towards her cell.")

		saynn("[say=rahi]That was fun, wasn't it..[/say]")

		saynn("[say=pc]Sure, kitty.[/say]")

		saynn("You bring her back into her cell and watch her finally put on her uniform.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "finish_stocks"):
		playAnimation(StageScene.Stocks, "idle", {pc="rahi", bodyState={naked=true}})
		aimCameraAndSetLocName("main_punishment_spot")
		saynn("During your adventures, you stumble upon the big platform where most public punishments take place, a place where inmates are disciplined.. or just used and humiliated.")

		saynn("There are a few types of.. contraptions here, most of which are designed to bind you into some compromised position or bring you pain. But Rahi's eyes get glued to one of the unlocked stocks.")

		saynn("[say=rahi]Look, they keep the inmate on display in these..[/say]")

		saynn("Stocks are nothing but a few metal parts with holes for some unlucky person's wrists and neck. But Rahi seems very curious anyways, admiring the construction and running her digits along the cold, unforgiving material.")

		saynn("Feeling playful, Rahi positions herself within the stocks, placing her wrists and neck into the openings. The top part is still unlocked and opened.. but as Rahi pretends to struggle, wiggling her ass eagerly, the stocks suddenly shut around her and get locked with a satisfying click. Your kitty tries to free her paws.. but realizes that she can't, the bulky contraption doesn't budge at all.")

		saynn("[say=rahi]Ohh.. oops..[/say]")

		saynn("It seems your kitty \"accidentally\" got stuck. She is still naked while now also forced to bend forward, meaning her pink pussy is on full display, just like her tight asshole. She pretends to struggle more, her butt swaying is enticing and provocative.")

		saynn("[say=rahi]Kitty is so clumsy, meow.. And now everyone can see her private parts in great detail.. nya-ah..[/say]")

		saynn("Indeed, her ass now has your full attention.")

		addButton("Unlock her", "Be a good person and help kitty", "pstocks_unlock")
		addButton("Tease her", "It's like she is begging for it", "pstocks_tease")
	if(state == "pstocks_unlock"):
		saynn("You decide that this is too dangerous, trying the stocks is fine but staying in them might attract some unwanted attention. So you approach the stocks and begin trying to unlock them. They have some weird mechanism inside so it takes some time. But as you do that, Rahi suddenly baps you with her tail.")

		saynn("[say=rahi]H-hey..[/say]")

		saynn("[say=pc]What, kitty? I'm trying to help you.[/say]")

		saynn("Your kitty pouts at you.")

		saynn("[say=rahi]But.. why..[/say]")

		saynn("[say=pc]So nobody gets advantage of your state.[/say]")

		saynn("Kitty pouts harder, her eyes drilling you and the tail gets into your face many times, bonking you until you decide to tug on it, causing Rahi to whine.")

		saynn("[say=rahi]At least.. at least draw something on her?..[/say]")

		saynn("Rahi's tail points at a handy black marker that is connected on a little chain to the stocks.")

		saynn("[say=rahi]Pretty please?.. Anything you want..[/say]")

		saynn("Well.. your kitty has such a cute begging voice that you just can't say no, you grab the marker and begin writing various words on her short fur. While you do that, your kitty's breathing gets deeper, her body reacts to that marker's tip by tingling ever so slightly.")

		saynn("[say=rahi]Is it something slutty?.. She can't really see..[/say]")

		saynn("[say=pc]Probably.[/say]")

		saynn("Rahi smiles and looks all content and happy. You proceed to tinker with the stocks until something clicks in them again and they get unlocked.")

		saynn("Your kitty slowly straightens her posture and looks at her fur.")

		saynn("[say=rahi]Yay.. Thank you, {rahiMaster}, you're the best.[/say]")

		saynn("After that you just return back to Rahi's cell where she finally puts her uniform on.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "pstocks_tease"):
		playAnimation(StageScene.StocksSex, "tease", {pc="rahi", npc="pc", bodyState={naked=true}})
		saynn("Your gaze is locked onto Rahi's enticing display, your desire rising swiftly as she arches her back, accentuating the curves of her spine and putting her fluffy round ass on full display. Now it's your time to tease..")

		saynn("[say=pc]Yeah, it would be a shame..[/say]")

		saynn("Your hands jump on her back and let the fingers trace lights along the feminine curves down to her waist. As you brush your digits around the base of her tail, Rahi's breath quickens, her fur reacts by standing on ends.")

		saynn("[say=pc]If someone would use this opportunity..[/say]")

		saynn("[say=rahi]..meow..[/say]")

		saynn("While Rahi is forced to stay in this compromising position, your hands slide over her ass before squeezing it tightly and forcing a moan out of your kitty. You skip the private bits for now and instead trace your digits along the fluffy curves of her inner thighs, teasingly inching closer to her wet, inviting pussy.")

		saynn("[say=pc]To use you..[/say]")

		saynn("[say=rahi]..yes..[/say]")

		saynn("But instead of going straight for her moist folds, you put your hands on her buttcheeks again and spread them wide, making all her holes look stretched and exposed, juices dripping from her sex onto the floor. Wow, doing this reveals the view of the glistening pink depths hidden within.")

		saynn("[say=pc]Like a slut that you are.[/say]")

		saynn("[say=rahi]Y-yes!..[/say]")

		saynn("Rahi is practically shaking from excitement, her whole body begging you to go further.. to test her.. to use her.")

		addButton("Finger her", "Use nothing but your digits to pleasure Rahi", "pstocks_fingering")
		if (getModule("RahiModule").isSkillLearned("rahiSkillSex")):
			addButtonWithChecks("Breed her", "(Sex) Your kitty is positioned perfectly for this!", "pstocks_breed", [], [ButtonChecks.HasReachablePenis])
			addButtonWithChecks("Strapon her", "(Sex) Your kitty is positioned perfectly for this!", "pstocks_pickstrapon", [], [ButtonChecks.HasStraponAndCanWear])
	if(state == "pstocks_fingering"):
		saynn("As you bring your hand closer to her folds, you begin to feel.. heat.. radiating from them. With gentle precision, you begin tracing little circles along the sensitive petals of her pulsating pussy. Her body responds immediately, her hips instinctively rocking against your hand, seeking.. more..")

		saynn("[say=pc]Look at you, like a bitch in heat.[/say]")

		saynn("The dirty talk only seems to make your kitty more wet. A little crowd already begins to gather around you two, enjoying the public show. You focus your attention on her little clit, sending jolts of pleasure through her as you rub it. The poor kitty is forced to endure your digits whenever she wants it or not.. but her moans make it obvious..")

		saynn("[say=pc]Yeah.. getting off just from my fingers. So easy to handle.[/say]")

		saynn("Your digits slowly slide over to her pussy entrance.. and prod it a few times.. easily slipping inside due to sheer amount of wetness. Your other hand lands on Rahi's ass and gentle gropes it while you proceed to fuck her slit with just two of your digits, curling them ever so much to add extra stimulation.")

		saynn("[say=rahi]Ah-h!.. H-h.. W-wai..[/say]")

		saynn("Not that long after you start finger-fucking her with your digits, Rahi's inner walls tighten around them. Pleasurable sensations quickly spread through her like wildfire, your rhythm quickly pushing her closer to the edge.. and then over it..")

		saynn("[say=rahi]She is.. c-c..[/say]")

		saynn("[say=pc]Do it, slut.[/say]")

		saynn("Rahi's mind is getting cloudy as ecstatic waves of her orgasm begin washing over her, making her body shudder and thrash against the sturdy metal frame. But even then, you continue shoving your digits deeper inside her pulsating slit, pushing Rahi into her state of bliss so much that she squirts all over your hands.")

		saynn("[say=rahi]NYAa-a-ah..[/say]")

		saynn("[say=pc]That's it?[/say]")

		saynn("You curl your digits in such a way that your fingertips begin hammering away at Rahi's g-spot. This was enough to prolong her pleasure until another climax ripples through her with an even stronger intensity.. causing her slit to gush out juices yet again. Your kitty's pussy is pulsating and clenching around your fingers as you push her over the edge again.. and again.. and again..")

		saynn("The inmates cheer seeing Rahi losing herself in this sea of overstimulation, at some points her moans get replaced with desperate gasps, her pussy dripping the last drops of nectar rather than shooting it out.")

		saynn("[say=pc]Good little slut.[/say]")

		saynn("Only when the flesh of Rahi's inner walls begins to look reddish, you pull your hand away and walk up to her face. Kitty's eyes.. unfocussed.. lost.. slutty..")

		saynn("[say=rahi]Nya-a-a..[/say]")

		saynn("Her tongue rolls out as she says that, allowing you to just shove your wet digits past her fangs. Rahi feels something in her mouth and begins sucking on it instinctively. Cumming so much in a public place has brought her true euphoria it seems.")

		saynn("After she gets some time to recover, you unlock the stocks and pull her out of them. Rahi's legs shake slightly as she tries to walk, her tail doing most of the heavy lifting, trying to balance the poor feline's body.")

		saynn("After you bring her back into her cell, Rahi slowly begins to come to her senses.")

		saynn("[say=rahi]That was.. fun..[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "pstocks_breed"):
		playAnimation(StageScene.StocksSex, "fast", {pc="rahi", npc="pc", bodyState={naked=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("Rahi's helplessness.. makes you quite eager to do something bold. With a little smile on your face, you position yourself behind your kitty and expose your {pc.penis} before pressing it against her dripping pussy entrance, not yet penetrating it.")

		saynn("[say=rahi]Oh..[/say]")

		saynn("Rahi's body is quivering with anticipation, her pussy twitching slightly in response to you putting your hands on her fluffy butt and squeezing it. She is at your mercy.. unable to move.. completely at your whim.")

		saynn("[say=pc]You're mine, kitty. I'm gonna fill you up with every inch of me. Everyone is gonna see that.[/say]")

		saynn("The desire in your voice fuels Rahi's, she is getting shivers of pleasure coursing through her.")

		saynn("With one rough motion, you part her folds and ram your cock deep inside, making kitty stagger slightly and lean into the stocks. A cute moan escapes her lips, her pussy clenching around your length as you pull back just to thrust deep inside again, your cock leaking precum into that warm slick love tunnel.")

		saynn("[say=rahi]So rough.. Ah..[/say]")

		saynn("With each powerful thrust, Rahi's pleasure rises. Due to all the teasing, she can only endure a few seconds of your onslaught before her pussy starts tightening around your shaft. A powerful climax washes over her, causing her body to convulse as she cries out in ecstasy.")

		saynn("[say=rahi]F-fu-uck!..[/say]")

		saynn("But you weren't even close so the powerful thrusting continues, relentless and unforgiving. You push past the resistance of her inner walls and keep pounding her needy slit, driving your kitty to new heights. Very soon the second climax crashes over her, this time it was powerful enough to make kitty squirt, her pussy trying to milk your cock but instead just bringing you closer to your own orgasm..")

		saynn("[say=rahi]Mya-ah.. Use your slut!.. Stuff her pussy full!.. Please!..[/say]")

		saynn("Well, if she is asking..")

		addButton("Cum inside", "Breed the kitty", "pstocks_breed_cuminside")
	if(state == "pstocks_breed_cuminside"):
		playAnimation(StageScene.StocksSex, "inside", {pc="rahi", npc="pc", pcCum=true, npcCum=true, bodyState={naked=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("As you thrust deep into Rahi's soft slick depths, your shaft starts to pulsate with an insatiable need. Rahi's pussy clenches tightly around it, her inner walls eager to receive the impending load..")

		saynn("At some point it becomes too much, another Rahi's orgasm causes her slutty holes to get tighter, causing you to go over the edge too..")

		saynn("[say=pc]Ngh-h.[/say]")

		saynn("With an animal roar, your explosive release starts flooding Rahi's depths with liquid desire. Multiple hot, thick streams of your seed, one after another, surges from the tip of your pulsating member, causing Rahi's belly to receive a little bump.")

		saynn("[say=rahi]Ye-e-ess..[/say]")

		saynn("Her pussy, pushed to its limits, quivers in response. The soft walls of her tight vaginal channel kneading your shaft with a hunger for more. There is barely any room left inside her so some of your seed, mixed together with Rahi's slick juices, begin leaking out, creating such a messy cocktail on the fur of her thighs.")

		saynn("It's only when your cock strops throbbing inside her, you slowly withdraw from Rahi's shivering body, leaving her feeling both empty and full. Your {pc.cum}, thick and shiny, drips from her well-used pussy, something that anyone around can see and admire.")

		saynn("Rahi is still stuck in the stocks, her body exhausted, her eyes have a spark of submissiveness in them. You decide to give her a little rest.. but why waste that time, she has a perfectly fine mouth and tongue that weren't used yet.")

		addButton("Continue", "See what happens next", "pstocks_breed_cleancum")
	if(state == "pstocks_breed_cleancum"):
		playAnimation(StageScene.StocksSexOral, "sex", {pc="rahi", npc="pc", bodyState={naked=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("[say=pc]Good little breeding stock. I need you to clean this for me.[/say]")

		saynn("Saying that, you approach your kitty from the other side and offer your messy cock to her, the shaft is coated in all sorts of lewd fluids. Rahi sees it and blushes, still panting from the breeding she received.")

		saynn("[say=rahi]Oh..[/say]")

		saynn("She doesn't really have much of a choice anyways, her head is stuck between two metal bars, allowing you to easily position yourself in front of her face and wait, giving her a chance to do this willingly before you force her.")

		saynn("But Rahi seems eager to please, she lets her feline tongue out, showing that it is definitely longer than an average human one before tracing a path around your messy shaft, guiding it towards her waiting mouth.")

		saynn("Her tongue, warm and sand-papery, wraps around your member and begins to gently massage it, sliding back and forth along it, slowly gathering all the seed and her juices onto it, while her lips close around the head and begin sucking on the tip.")

		saynn("After catching enough lewd fluids from the veiny surface onto her tongue, Rahi retracts it into her mouth and obediently swallows everything. She then parts her lips, inviting your dick.")

		saynn("You step closer, gradually pushing your {pc.penis} down that kitty's mouth, past her fangs, until you reach the back of her throat. That's when she begins to actually clean it, her lips caressing your sensitive flesh while her tongue is swirling and dancing around it with skilled precision.")

		saynn("Her mouth feels so.. heavenly.. You're hard again and can't help but to start moving your hips slightly, letting your shaft go slightly deeper into her throat each time, creating a small bump on her neck. That causes your kitty to start choking a little, her paws clenching into fists and her eyes closing as she is trying to focus..")

		saynn("With each flick of her tongue and gentle suck, Rahi demonstrates her obedience to you, her desire to please.. even if there are lots of people around watching her. You allow yourself to surrender to the great sensations and move your hips faster, not even realizing that you're fucking her face now..")

		saynn("Somewhat quickly, you reach another peak of your pleasure.. A powerful groan escapes from you as hot spurts of your seed begin flowing over her eager tongue and down her throat.")

		saynn("[say=pc]Oh fuck..[/say]")

		saynn("You ram your cock as deep as her throat allows and let the tight walls clench around your shaft, making more pleasurable noises while the kitty under you is choking and gagging, her eyes rolling up.. such a guilty pleasure.. but it's still pleasure..")

		saynn("As the moment of pure bliss ends.. you pull out.. your member looks coated in her saliva.. but clean otherwise. Rahi is coughing and gasping for air, her eyes slowly focus on the dick in front of her again. She presents you her mouth full of your jizz before closing it and swallowing everything yet again.")

		saynn("[say=pc]Good girl.[/say]")

		saynn("Now it's you who feels quite exhausted.. You begin to slowly free your kitty, supporting and helping her to stand.")

		saynn("[say=rahi]Nya-a-a..[/say]")

		saynn("You find an opening in the crowd of inmates that has surrounded you and bring Rahi back to her cell. Slowly, she begins to recover, putting her paws onto her head.")

		saynn("[say=rahi]She went a little bit too far, didn't she?.. Although it was.. fun..[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "pstocks_pickstrapon"):
		saynn("Pick what strapon you wanna use.")

		addStraponButtons()
		if (false):
			addButton("Nope", "You shouldn't see this", "pstocks_straponwith")
	if(state == "pstocks_straponwith"):
		playAnimation(StageScene.StocksSex, "fast", {pc="rahi", npc="pc", bodyState={naked=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("With Rahi firmly secured in the stocks, you decide to give her pussy the treatment that it deserves. You quickly secure one of the strapons around your waist and stroke it a few times like it's a real cock. Sadly you don't feel much.. but Rahi will..")

		saynn("As you press your rubber cock against Rahi's wet entrance, a few shivers run through her body, her tail bonking your leg.")

		saynn("[say=rahi]Oh?.. Is that still you, {rahiMaster}.. She can't really look back..[/say]")

		saynn("You drag your palm over that fluffy butt before squeezing it tightly.")

		saynn("[say=pc]Yeah, it's me. Just with an extra.. tool.[/say]")

		saynn("Your second hand grabs the tip of your strapon and forcibly buries it into Rahi's inviting sex before you throw your {pc.masc} hips forward and thrust inside, easily shoving inside the rest of the shaft, thanks to her slick juices.")

		saynn("[say=rahi]AH!..[/say]")

		saynn("Moans begin to attract more inmates. It's hard to tell but you're pretty sure you're reaching Rahi's natural barricade as you thrust inside, causing a little bump to sometimes appear on her belly. It doesn't take long for the first orgasm to suddenly crash over her, making her body convulse and her inner walls drip your strapon tightly.")

		saynn("[say=pc]Already? That was too quick for you, slut.[/say]")

		saynn("Even though Rahi's pussy is making it difficult, you keep pushing through, roughly shoving the rubber toy in and out while the poor kitty is riding her waves of ecstasy.")

		saynn("[say=rahi]Nya-a..[/say]")

		saynn("It seems the increased friction led to more stimulation, not even that long after the first orgasm ended, another one began, a much intense one. Rahi's inner walls keep spasming around the firm length of the strapon while her pussy itself sends out a rush of fluids, making the fur on her thighs wet.")

		saynn("[say=pc]Yeah, keep cumming while everyone watches.[/say]")

		saynn("Having so many eyes surely affects Rahi's sensations, her mind gets clouded up with sheer pleasure. You don't even know when the third climax began, Rahi's body thrashes against the firm restraints almost non-stop, her pussy squirting out her female juices until there is nothing left.")

		saynn("[say=rahi]Ye-e-es-s..[/say]")

		saynn("You find yourself panting heavily after pushing your kitty over the edge so many times, you yourself feel quite horny too by now.. As Rahi's last orgasm subsides, you pull the rubber toy out, leaving her pussy looking gaping and empty, the weak clenching only causes her to drip the last drops of her girlcum.")

		saynn("You smack Rahi's ass, forcing a quiet moan out of her.")

		saynn("[say=pc]Cute.[/say]")

		addButton("Continue", "See what happens next", "pstocks_strapon_clean")
	if(state == "pstocks_strapon_clean"):
		playAnimation(StageScene.StocksSexOral, "tease", {pc="rahi", npc="pc", bodyState={naked=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("You walk around the stocks and see Rahi's spaced out eyes and open mouth. She notices your figure and purrs softly.")

		saynn("[say=rahi]T-thank y-..[/say]")

		saynn("You push the strapon into her face, it looks incredibly shiny because of all the pussy juices that are on it.")

		saynn("[say=pc]Taste yourself, kitty.[/say]")

		saynn("As you bring it closer to her mouth, Rahi lets her feline tongue roll out and wrap around the rubber shaft. She starts sliding it along the wet surface while her lips close around the tip and suck on it. Rahi's purring becomes louder, what a slut..")

		saynn("[say=pc]It'd be so easy to fuck your throat right now..[/say]")

		saynn("But it seems Rahi can barely stay conscious, shoving a big rubber dildo up her throat won't help with that. So you just let her obedient tongue and lips do all the work, gathering some of Rahi's fluids before you watch her swallow them.")

		saynn("[say=pc]Good girl.[/say]")

		saynn("Now it's you who feels quite exhausted.. You begin to slowly free your kitty, supporting and helping her to stand.")

		saynn("[say=rahi]Nya-a-a..[/say]")

		saynn("You find an opening in the crowd of inmates that has surrounded you and bring Rahi back to her cell. Slowly, she begins to recover, putting her paws onto her head.")

		saynn("[say=rahi]She went a little bit too far, didn't she?.. Although it was.. fun..[/say]")

		addButton("Continue", "See what happens next", "removestraponandend")
	if(state == "pdirtytalk"):
		aimCameraAndSetLocName(getRandomLoc())
		saynn("As you parade Rahi around the prison from one spot to another, her naked body on display for all to see, she couldn't help but to get horny from all the attention. While walking alongside you, she leans in close, her voice soft and needy.")

		var randomLine = RNG.pick(["Look at her.. all exposed and vulnerable.. paraded like she is a slave.. And you're holding the leash..", "Every step she takes.. She can feel their hungry eyes on her.. But your eyes are the best..", "Being led on a leash like a submissive pet.. It awakens her inner slut.. She crave to be used..", "Her pussy is dripping wet with anticipation of what you will do to her..", "Having her pussy and tits exposed like this.. makes her feel alive.. Everyone can look.. but nobody can touch.. thanks to you..", "She can hear them whispering.. She can see their eyes on her body..", "Each time she feels the leash tugging at her collar.. It sends shivers down her spine.."])
		saynn("[say=rahi]"+str(randomLine)+"[/say]")

		if (isShamed()):
			saynn("She is blushing red after being so bold with you, her self-consciousness slowly taking over.")

			saynn("[say=rahi]She can't stop being slutty..[/say]")

		else:
			saynn("Rahi teasingly brushes her body against yours, sensual purring can be heard after her confession.")

			saynn("[say=rahi]The thought of their eyes on her body only excites her more, knowing that she belongs to you, and you alone, {rahiMaster}..[/say]")

		addButton("Ask to pose", "Ask Rahi to pose for you", "pdirtytalk_askpose")
		addButton("Whisper back", "Say some dirty things to Rahi", "pdirtytalk_whisperback")
	if(state == "pdirtytalk_askpose"):
		saynn("Being curious, you couldn't resist the urge to push Rahi's skills under a little test.")

		saynn("[say=pc]I wonder if you could.. strike a pose for me.[/say]")

		if (isShamed()):
			saynn("Rahi seems to be determined to push her boundaries today no matter what, her initial confidence is shining through as she leans against some wall and slowly spreads her legs for you, revealing the moist folds of her sex.")

			saynn("However, halfway through, a sudden rush of embarrassment washes over her, causing her to hesitate. As she realizes how vulnerable she looks, her cheeks flush with a mixture of shyness and arousal. Rahi quickly pulls her legs back together.")

			saynn("[say=rahi]S-sorry..[/say]")

			saynn("[say=pc]It's alright, kitty. No pressure.[/say]")

			addButton("Continue", "See what happens next", "par_bad")
		else:
			var randomPose = RNG.pick(["1", "2", "3"])
			if (randomPose == "1"):
				saynn("Rahi, always eager to please, feels a surge of excitement rush through her. With a little mischievous smile, she turns around and obediently bends over, presenting herself to you in the most provocative way possible. Her paw reaches down between her legs and spreads the wet folds of her needy pussy, as if inviting you.")

			elif (randomPose == "2"):
				saynn("Rahi, always eager to please, feels a surge of excitement rush through her. With a little mischievous smile, she leans against one of the walls and then lifts one of her legs up before placing her foot on a ledge, exposing the moist entrance of her pussy and her tight anus. Her paw lands on her ass and pulls on her buttcheek slightly, making both of her holes look spread open for you.")

			elif (randomPose == "3"):
				saynn("Rahi, always eager to please, feels a surge of excitement rush through her. Standing against a wall, Rahi brings her arms above her head while arching her back and thrusting her chest forward, presenting her firm breasts and stiff nipples. She then spreads her legs wide apart, also showcasing her dripping pussy and her cute clenched anus.")

			saynn("After doing that, her gaze meets yours, Rahi's voice is almost purring.")

			saynn("[say=rahi]Like what you see?..[/say]")

			saynn("Your kitty really has no shame..")

			addButton("Continue", "See what happens next", "par_very_good")
	if(state == "pdirtytalk_whisperback"):
		saynn("Now it's your turn to lean in closer until your lips are brushing against Rahi's ear. You switch your tone to sensual whispering.")

		var randLine = RNG.pick(["Such a naughty little feline.. You love showing off, don't you? Flaunting that dripping pussy and that tight little asshole for me to see.", "You're such a naughty exhibitionist, kitty. The way you bravely display your naked body, showing off every inch to my hungry gaze.. drives me wild.", "You enjoy being on display, don't you, kitty? Knowing that I hold the leash that guides your desires..", "Seeing you show off like this, it's like a drug to me, kitty. I'm addicted to the sight of your body, the way you tease and entice with every move.", "You're such a brave exhibitionist, kitty. Letting everyone see just how much of a dirty little slut you are, how you revel in their lustful gazes.. such a turn-on."])
		saynn("[say=pc]"+str(randLine)+"[/say]")

		saynn("Your digits lightly trace the curves of her body, teasingly brushing over her fur and sensitive parts. Rahi's breath hitches, your words fueling her desire.")

		saynn("And just when she thinks you will go further.. instead you pull away and keep her needy for later.")

		addButton("Continue", "See what happens next", "par_good")
	if(state == "pguardnaked"):
		aimCameraAndSetLocName(getRandomLoc())
		saynn("As you parade your Rahi through the prison, a sharp voice stops you.")

		saynn("[say=maleguard_canine]Why is this inmate naked?[/say]")

		saynn("A guard stands before you, his gaze fixed on Rahi's exposed form, his eyebrows raised in suspicion.")

		saynn("You can try to let Rahi handle this, it would be a good test of her skills.")

		saynn("Success chance: "+str(getSuccChance(8, 15, 5, 90))+"%")

		addButton("Let Rahi try", "Let Rahi try to sweet-talk the guard", "pguardnaked_rahi")
		addButton("Protect Rahi", "Rahi won't get a chance to tease the guard", "pguardnaked_protect")
	if(state == "pguardnaked_rahi"):
		saynn("You poke Rahi and let her try to handle this. Worst case, you will just both be put into stocks probably..")

		if (success):
			saynn("Rahi understands your sign and puts on a coy smile before stepping forward, proudly displaying naked self while her eyes are locked with the guard's.")

			saynn("[say=rahi]Oh, you won't believe it.. She had an unfortunate accident in the laundry room. Her uniform got chewed up and stolen by the washing machine.. She had no choice but to leave naked..[/say]")

			saynn("She purrs, her voice dripping with innocence.")

			saynn("The guard's stern expression softens ever so slightly as Rahi expertly plays her role. She moves closer to him, her body barely brushing against his armor, her paws gently brushing his arm.")

			saynn("[say=rahi]If you want, you can try to help her get her uniform back from that washing machine.. Or you can just watch her do it, that's fine too.. But last time she got stuck in the drum..[/say]")

			saynn("The guard hesitates, his eyes scanning her exposed form, torn between suspicion and desire. Rahi seizes the opportunity and breathes warmly into the guard's ear, her voice dropping to a seductive whisper.")

			saynn("[say=rahi]You can't believe how.. vulnerable and.. exposed.. she was.. Her pussy and ass were completely out on display.. She would be so-so grateful if you could help her.. officer..[/say]")

			saynn("The guard's resolve wavered, his professionalism crumbling under Rahi's persuasive allure.")

			saynn("[say=maleguard_canine]Um.. It's.. it's okay. I will let the engineers know, they will recover your uniform, miss.[/say]")

			saynn("And just like that, he quickly leaves you two alone, heading in the rough direction of one of the bathrooms.")

			saynn("You pet Rahi, making her purr.")

			saynn("[say=pc]What would you do if he actually agreed?[/say]")

			saynn("Rahi shrugs and offers you a cheeky smile.")

			addButton("Continue", "See what happens next", "par_very_good")
		else:
			saynn("Rahi understands your sign and steps forward, trying to proudly display naked self while her eyes are locked with the guard's. But the more she does it, the more flushed her cheeks become..")

			saynn("[say=rahi]She.. She had an.. It was just.. um.. an experiment?.. Of self-expression..[/say]")

			saynn("The guard's expression only hardened.")

			saynn("[say=maleguard_canine]Self-expression? You're in a prison, inmate, not on a nudist resort. You know the rules.[/say]")

			saynn("Rahi's attempts to sway the guard with her playful flirtations failed, she bites her lip, not knowing if she should run or not.")

			saynn("With a swift motion, the guard grabs Rahi's arm and suddenly gives her a few firm smacks on her ass, sending it to bounce.")

			if (getModule("RahiModule").getSkillScore("rahiSkillMasochist") > 5):
				saynn("[say=rahi]Ow!.. Harder!.. No, ignore that..[/say]")

				saynn("Rahi's masochism slips through, making her look even more embarrassed..")

			else:
				saynn("[say=rahi]Ow!..[/say]")

			saynn("After the brief punishment, the guard releases your kitty.")

			saynn("[say=maleguard_canine]Now go get dressed properly.[/say]")

			saynn("With her cheeks still flushed, Rahi noses meekly, her submissive side emerging in response to the guard's dominance.")

			saynn("As you two walk away, Rahi looks at you.")

			saynn("[say=rahi]Sorry..[/say]")

			saynn("[say=pc]It's okay, kitty, you tried.[/say]")

			addButton("Continue", "See what happens next", "par_bad")
	if(state == "pguardnaked_protect"):
		saynn("As the guard interrogates Rahi about her nudity, a protective instinct takes over you. Without hesitation, you step forward, positioning yourself between Rahi and the guard.")

		saynn("[say=pc]I take full responsibility for my pet's current state. It was my idea to have her in this state of undress. I apologize for any inconvenience caused.[/say]")

		saynn("The guard's stern gaze shifts from Rahi to you, he crosses his arms.")

		saynn("[say=maleguard_canine]Why would you encourage an inmate to be naked?[/say]")

		saynn("His tone just radiates authority. But you meet his gaze with determination.")

		saynn("[say=pc]I understand the concern. But it was a consensual arrangement between my pet and me. My kitty likes showing off her naked body to everyone, including you. She is probably wet as fuck just from your gaze.[/say]")

		saynn("The guard's expression softens slightly, his suspicion slowly getting replaced with arousement. As he eyes Rahi, she offers him an innocent smile while casually groping her perky tits.")

		saynn("[say=pc]We understand the boundaries and consequences of our actions.[/say]")

		saynn("[say=maleguard_canine]Sure.. Just don't complain when someone decides to do more than just watch.[/say]")

		saynn("Both you and Rahi nod. The guard retreats, allowing you to continue parading her through the prison.")

		saynn("[say=rahi]Thank you, {rahiMaster}..[/say]")

		addButton("Continue", "See what happens next", "par_good")
func isNotShamed():
	if(parShame < 0.75):
		return true
	return false

func isShamed():
	return !isNotShamed()

func getRandomLoc():
	return RNG.pick(["main_hallroom1", "main_hallroom2", "main_hallroom3", "main_hallroom4", "main_hallroom5", "main_hallroom6", "main_hallroom7", "main_hallroom8", "main_hallroom9", "main_hallroom10", "main_hallroom11", "hall_mainentrance", "main_bench1", "main_bench2", "main_bench3", "main_bench4", "main_hall_west", "hall_ne_corner"])

func getSuccChance(minlevel, maxlevel, minchance, maxchance):
	return Util.roundF(getModule("RahiModule").getSkillSuccessChanceAdv("rahiSkillExhibit", minlevel, maxlevel, minchance, maxchance), 1)

func addStraponButtons():
	var strapons = GM.pc.getStrapons()
	for strapon in strapons:
		addButton(strapon.getVisibleName(), strapon.getVisibleDescription(), "pstocks_straponwith", [strapon])


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
		
		if(parConf >= 0.99 && isNaked):
			setState("finish_pick")
			return
		
		if(parShame >= 1.0):
			setState("parading_end")
			return
		
		if(parConf >= 0.5 && !isNaked):
			isNaked = true
			setState("pundressing")
			return
		
		if(!isNaked):
			possible.append("pbench1")
			possible.append_array(["pflash1", "pflash2", "pflash3", "pflash4"])
			possible.append("pasktotouchtits")
			possible.append("pcanteen")
		else:
			possible.append("pbench1")
			possible.append("pgymnaked")
			possible.append("pdirtytalk")
			possible.append("pguardnaked")
			if(RNG.chance(20) && getModule("RahiModule").isSkillLearned("rahiSkillWatersports")):
				possible.append("ppee")
		
		possible.erase(parLastEvent)
		
		var selEvent = RNG.pick(possible)
		
		
		setState(selEvent)
		parLastEvent = selEvent
		return

	if(_action == "par_good"):
		var someValue = 1.0 - getSuccChance(5, 15, 0.0, 0.6)
		parConf = parConf + RNG.randf_range(0.1, 0.2)
		parShame = parShame + RNG.randf_range(someValue/5.0, someValue/3.0)
		setState("par_loop")
		return

	if(_action == "continueafterundress"):
		parConf = 0.5#parConf + 0.1
		#parShame = parShame + RNG.randf_range(0.01, 0.2)
		setState("par_loop")
		return

	if(_action == "pasktotouchtits_touch"):
		if(RNG.chance(getSuccChance(5, 15, 20, 90))):
			success = true
		else:
			success = false

	if(_action == "par_very_good"):
		parConf = parConf + 0.3
		parShame = max(0.0, parShame - RNG.randf_range(0.01, 0.05))
		setState("par_loop")
		return

	if(_action == "par_bad"):
		var someValue = 1.0 - getSuccChance(5, 15, 0.0, 0.6)
		parConf = parConf + 0.05
		var newShame = parShame + RNG.randf_range(someValue/3.0, someValue/2.0)
		if(parShame < 0.9 && newShame >= 0.9):
			parShame = 0.9 + RNG.randf_range(0.01, 0.05)
		else:
			parShame = newShame
		setState("par_loop")
		return

	if(_action == "pcanteen_touch"):
		if(RNG.chance(getSuccChance(5, 15, 5, 90))):
			success = true
		else:
			success = false

	if(_action == "ppee_no"):
		processTime(3*60)

	if(_action == "ppee_yes"):
		getModule("RahiModule").advanceSkill("rahiSkillWatersports")
		processTime(3*60)

	if(_action == "ppee_offermouth"):
		processTime(3*60)
		GM.pc.cummedInMouthBy("rahi", FluidSource.Pissing)
		getModule("RahiModule").advanceSkill("rahiSkillWatersports")
		getModule("RahiModule").advanceSkill("rahiSkillDominance")

	if(_action == "finish_laundry"):
		processTime(5*60)

	if(_action == "finish_stocks"):
		processTime(5*60)

	if(_action == "flaundry_free_spank"):
		processTime(5*60)

	if(_action == "flaundry_grope_lick"):
		processTime(6*60)
		GM.pc.cummedInMouthBy("rahi", FluidSource.Vagina)

	if(_action == "flaundry_grope_breed"):
		processTime(5*60)
		getModule("RahiModule").advanceSkill("rahiSkillSex")

	if(_action == "flaundry_grope_breed_inside"):
		processTime(3*60)
		getCharacter("rahi").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("rahi")
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "rahi_breed")

	if(_action == "pstocks_unlock"):
		processTime(3*60)
		getCharacter("rahi").addBodywritingRandom()
		getCharacter("rahi").addBodywritingRandom()
		getCharacter("rahi").addBodywritingRandom()

	if(_action == "pstocks_tease"):
		processTime(3*60)

	if(_action == "pstocks_fingering"):
		processTime(20*60)

	if(_action == "pstocks_breed"):
		processTime(5*60)
		getModule("RahiModule").advanceSkill("rahiSkillSex")

	if(_action == "pstocks_pickstrapon"):
		getModule("RahiModule").advanceSkill("rahiSkillSex")

	if(_action == "pstocks_breed_cuminside"):
		processTime(3*60)
		getCharacter("rahi").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("rahi")
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "rahi_breed")

	if(_action == "pstocks_breed_cleancum"):
		processTime(5*60)
		getCharacter("rahi").cummedInMouthBy("pc")

	if(_action == "pstocks_straponwith"):
		processTime(10*60)
		var strapon = _args[0]
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(strapon)
		getCharacter("rahi").cummedInVaginaBy("pc", FluidSource.Strapon)

	if(_action == "pstocks_strapon_clean"):
		processTime(5*60)

	if(_action == "removestraponandend"):
		GM.pc.unequipStrapon()
		endScene()
		return

	if(_action == "pguardnaked_rahi"):
		if(RNG.chance(getSuccChance(8, 15, 5, 90))):
			success = true
		else:
			success = false

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

func getDevCommentary():
	return "The only reason this is a reward and not an activity is because I needed more rewards and this seemed good enough x3.\n\nThe parading stuff took sooo much time, I'm not even sure if it was worth it, there isn't even that much to do. Maybe just having a few fully scripted scenes would be better but who knows x3. But I kinda like that you have a little progression with it. The higher Rahi's skill is, the further you will get."

func hasDevCommentary():
	return true
