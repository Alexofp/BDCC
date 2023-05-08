extends SceneBase

var deserved = true

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

	setState(_action)

func saveData():
	var data = .saveData()

	data["deserved"] = deserved

	return data

func loadData(data):
	.loadData(data)

	deserved = SAVE.loadVar(data, "deserved", true)
