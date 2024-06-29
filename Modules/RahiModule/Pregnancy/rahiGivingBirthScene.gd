extends SceneBase

var howManyBirths = 0
var bornString = ""
var bornChildAmount = 0

func _init():
	sceneID = "rahiGivingBirthScene"

func _run():
	if(state == ""):
		addCharacter("rahi")
		playAnimation(StageScene.Duo, "stand", {npc="rahi"})
		#var isSlavery = getModule("RahiModule").isInSlavery()
		howManyBirths = getFlag("RahiModule.Rahi_GaveBirthsNearPC", 0)
		if (howManyBirths <= 1):
			saynn("Rahi holds her shaky paws on her big pregnant belly, her breathing deep. You can already tell what's happening..")

			saynn("[say=rahi]It's h-happening.. Just like last time.. She doesn't know if she can handle it..[/say]")

			saynn("That's the second time you catch her in this state. Her eyes show that she is extremely nervous.. but you also pick up on something else.. you're not quite sure. At least this is not her first time being pregnant.")

			saynn("[say=pc]Oh. We gotta get to the medical wing. Let me help you.[/say]")

			saynn("You offer a reassuring touch, your hands supporting her as you make your way through the familiar corridors of the prison. You walk beside her, a reminder that she doesn't have to go through this tough moment alone.")

		elif (howManyBirths <= 2):
			saynn("Rahi sees you and offers you a nervous smile, her paws resting under her pregnant belly. She slowly walks up to you, a mix of nervousness and.. excitement.. evident in her eyes.")

			saynn("[say=rahi]It's time.. she is gonna be a mother.. yet again.. Can you help her?..[/say]")

			saynn("This is the third time she asked you for this. But how can you say no to such a cute nervous kitty?")

			saynn("You begin to carefully support your kitty as you make your way towards the medical wing. Rahi has to hold onto the walls sometimes.. but at least she isn't stressing about it unlike her first time.")

		elif (howManyBirths <= 4):
			saynn("Rahi stands tall, her gaze filled with a bit of nervousness.. but mostly anticipation.")

			saynn("[say=rahi]The contractions.. She can feel them.. She is so.. excited.. nya..[/say]")

			saynn("It seems she is ready to give birth yet again.")

			saynn("[say=pc]Me too. You're such a good mommy, let's go make your belly flat again.[/say]")

			saynn("You can hear subtle purring coming from her as you help her walk through the prison's corridors towards the medical wing.")

		elif (howManyBirths <= 5):
			saynn("Rahi breathes heavily. She is leaning against something while throwing her head back and letting out a little moan. Her paws are holding onto her pregnant belly..")

			saynn("[say=rahi]It feels so.. ah.. She is gonna be a mommy soon..[/say]")

			saynn("You begin to lose track of how many times Rahi gave birth already. But if she is so eager to get bred.. why deny her the pleasure of being a good mommy?")

			saynn("[say=pc]You are already one, kitty.. Let's go welcome new life into this world.[/say]")

			saynn("[say=rahi]Yes.. please..[/say]")

			saynn("You carefully support her and help her navigate around the prison. It seems Rahi has gotten really good at conquering her.. fear.. at least the fear of giving birth.")

		else:
			saynn("Rahi slowly walks up to you, proudly displaying her big pregnant belly to you.")

			saynn("[say=rahi]She is.. ready..[/say]")

			saynn("Her mommy eyes shine brightly, she is smiling. You grab her paw and proceed to slowly walk her towards the medical wing. Rahi probably knows this path like the back of her tail already..")

			saynn("[say=rahi]You being around always gives her so much strength..[/say]")

			saynn("She nuzzles your cheek while you make your way to the nursery.")

		addButton("Continue", "See what happens next", "near_nurse")
	if(state == "near_nurse"):
		aimCameraAndSetLocName("medical_nursery")
		GM.pc.setLocation("medical_nursery")
		addCharacter("nurse")
		playAnimation(StageScene.Duo, "sit", {pc = "nurse", npc="rahi", npcAction="stand"})
		saynn("As you step into the lobby, the nurse sees Rahi's big belly and gets up, already knowing what's up.")

		var randomNurseLine = RNG.pick(["Welcome back", "Back so soon?", "Someone is gonna be a mother again, huh.", "Ready to give birth? You know the drill. Follow me.", "I will go prepare everything.", "Such a fertile cat, huh.", "You like being pregnant, huh?", "You're visiting us quite often lately. Keep them coming.", "Should I start keeping a tally..", "Look who's back.."])
		saynn("[say=nurse]"+str(randomNurseLine)+"[/say]")

		saynn("She leads you both through some short corridors into a special room..")

		addButton("Continue", "See what happens next", "before_birth")
	if(state == "before_birth"):
		playAnimation(StageScene.GivingBirth, "birth", {pc="rahi", bodyState={naked=true}})
		addCharacter("rahi", ["naked"])
		saynn("You and Rahi are led into a private room with a soft and warm environment that already seems to be prepared for her labor. The nurse quickly undresses Rahi and positions her on a special hospital bed.")

		saynn("You stand by her side and hold her paw while more doctors and nurses walk in.")

		if (howManyBirths <= 1):
			saynn("[say=rahi]She is so nervous..[/say]")

			saynn("[say=pc]It's okay, kitty, I'm here.[/say]")

		elif (howManyBirths <= 2):
			saynn("[say=rahi]It's her third time here with you..[/say]")

			saynn("[say=pc]Yeah, you're such a good mommy, kitty.[/say]")

		elif (howManyBirths <= 4):
			saynn("[say=rahi]Thank you for being here..[/say]")

			saynn("[say=pc]Of course, kitty.[/say]")

		elif (howManyBirths <= 5):
			saynn("[say=rahi]She can't wait to give birth.. Will you make her pregnant again?..[/say]")

			saynn("[say=pc]Sure. But you should focus on this, kitty.[/say]")

		else:
			if (RNG.change(50)):
				saynn("[say=rahi]She is so glad you're here.. Even after all the times she gave birth already..[/say]")

			else:
				saynn("[say=rahi]She is so glad you're here..[/say]")

			saynn("[say=pc]How can I not be here..[/say]")

		saynn("With each contraction, Rahi breathes deeply, her prior experiences are helping her during this. But still, life decided not to make this process easy. The kitty starts producing painful cries when the intensity of her labor intensifies. That's why you keep whispering her words of support and encouragement.")

		saynn("With one big push, the room is filled with the sweet sound of crying..")

		addButton("Continue", "See what happens next", "rahi_gives_birth")
	if(state == "rahi_gives_birth"):
		playAnimation(StageScene.GivingBirth, "idle", {pc="rahi", bodyState={naked=true}})
		
		if (bornChildAmount == 1):
			saynn("Rahi gave birth to "+str(bornChildAmount)+" kid!")

		else:
			saynn("Rahi gave birth to "+str(bornChildAmount)+" kids!")

		saynn(""+str(bornString)+"")

		addButton("Continue", "See what happens next", "after_birth")
	if(state == "after_birth"):
		playAnimation(StageScene.SexStart, "start", {pc = "pc", npc="rahi", npcBodyState={naked=true}})
		var randomRahiLine = RNG.pick(["Look.. so beautiful..", "She became a mommy, yet again..", "So cute..", "She did it.. she can't believe it.."])
		if (bornChildAmount  <= 1):
			saynn("Your eyes widen with awe as you catch your first glimpse of Rahi's child, your heart overflowing with love. Rahi is incredibly exhausted though, just smiling as she cradles her newborn in her paws.")

			saynn("[say=rahi]"+str(randomRahiLine)+"[/say]")

		else:
			saynn("Your eyes widen with awe as you catch your first glimpse of Rahi's kids, your heart overflowing with love. Rahi is incredibly exhausted though, just smiling as she cradles her newborns in her paws, all "+str(bornChildAmount)+" of them.")

			saynn("[say=rahi]"+str(randomRahiLine)+"[/say]")

		saynn("You decide to give Rahi some time to rest and leave her for now.. You know it well enough that they're not just gonna let you or Rahi keep any kids..")

		addButton("Continue", "See what happens next", "near_kindergarden")
	if(state == "near_kindergarden"):
		addCharacter("rahi")
		playAnimation(StageScene.Duo, "sit", {npc="rahi", npcAction="kneel"})
		saynn("A few hours pass.")

		saynn("You sit in the lobby on one of the benches and watch one of the rooms of the prison's kindergarten through the reinforced window.")

		if (bornChildAmount == 1):
			saynn("After some time, an exhausted Rahi walks into that room and sits on the carpet, her paws carefully cradling her child.")

		else:
			saynn("After some time, an exhausted Rahi walks into that room and sits on the carpet, her paws carefully cradling one of her children.")

		addButton("Join", "See if you can join Rahi", "check_join")
		addButton("Leave", "Let Rahi enjoy the moment alone", "just_leave")
	if(state == "just_leave"):
		saynn("You stare at Rahi through the window for a little longer, the sight makes you feel.. happy.")

		saynn("Time to go..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "check_join"):
		playAnimation(StageScene.Duo, "sit", {pc="nurse", npc="pc", npcAction="stand"})
		saynn("You approach the nurse that sits behind the counter. She seems to be quite bored, just staring at her computer screen while supporting her head with her arm.")

		saynn("[say=nurse]Need something, inmate?[/say]")

		saynn("[say=pc]Yeah, I wanna join the feline behind the window.[/say]")

		if (!GM.pc.isTooLewd()):
			saynn("The nurse lazily turns her head, looking at Rahi. Then she looks back at you and quickly scans you with her eyes, probably looking for anything.. inappropriate.")

			saynn("[say=nurse]Sure.[/say]")

			saynn("That was easy. She presses a button on her computer that opens one of the locked doors.")

			addButton("Continue", "Join Rahi", "join_rahi_wholesome")
		else:
			saynn("The nurse lazily turns her head, looking at Rahi. Then she looks back at you.")

			saynn("[say=nurse]You wanna walk in there looking like that? Nope.[/say]")

			saynn("Aw, she has a point.")

			addButton("Leave", "Let Rahi enjoy the moment alone", "just_leave")
			addButton("Inventory", "Look at your inventory", "open_inv")
	if(state == "open_inv"):
		saynn("[say=pc]What about now?[/say]")

		saynn("The nurse lazily scans you with her eyes again.")

		if (!GM.pc.isTooLewd()):
			saynn("[say=nurse]Sure, that's better. You have ten minutes.[/say]")

			saynn("She presses a button on her computer that opens one of the locked doors.")

			addButton("Continue", "Join Rahi", "join_rahi_wholesome")
		else:
			saynn("[say=nurse]Nope.[/say]")

			saynn("It seems you can't visit her there today.. Maybe some other time when Rahi is gonna give another birth..")

			addButton("Leave", "Let Rahi enjoy the moment alone", "just_leave")
			addButton("Inventory", "Look at your inventory", "open_inv")
	if(state == "join_rahi_wholesome"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="kneel"})
		removeCharacter("nurse")
		saynn("You enter the big white room and see Rahi sitting cross-legged on a soft carpet, her gentle hum filling the air. Cradled in her arms is her precious newborn, nestled snugly against her chest.")

		saynn("What do you wanna do?")

		addButton("Praise", "Tell Rahi how good of a mommy she is", "praise_rahi")
		addButton("Cuddle", "Offer your kitty some warm cuddles", "cuddle_rahi")
		addButton("Story time", "Ask Rahi to tell her kid a bedtime story", "story_time")
		if (GM.pc.canBeMilked()):
			addButton("Breastfeed", "Breastfeed the child yourself", "breastfeed_yourself")
		else:
			addDisabledButton("Breastfeed", "You're not lactating to be able to breastfeed")
	if(state == "praise_rahi"):
		playAnimation(StageScene.Duo, "kneel", {npc="rahi", npcAction="kneel"})
		saynn("You just sit nearby and watch Rahi and her newborn. She offers you a little smile but then directs her full attention to her child.")

		saynn("[say=rahi]Precious.. You're probably hungry..[/say]")

		saynn("Seeing Rahi carefully open her shirt up and exposing her breasts makes you hungry too but the child is obviously more important. The kitty carefully brings her child to her heavy breasts and proceeds to breastfeed..")

		saynn("[say=pc]You're such an incredible mother, kitty.[/say]")

		var birthDialogue = getFlag("RahiModule.Rahi_BirthDialogue", 0)
		if (birthDialogue <= 1):
			saynn("[say=rahi]You think so?.. She doesn’t really have much experience..[/say]")

			saynn("[say=pc]Yeah but your love and devotion are evident in every little thing you do for your child.[/say]")

			saynn("Rahi blushes and carefully supports the head of her child.")

			saynn("[say=pc]You're so nurturing, so gentle. It's as if you were made for this role.[/say]")

			saynn("[say=rahi]T-Thank you.. She never really saw herself ever becoming a mother..[/say]")

			saynn("You reach your hand out and scritch your kitty behind the ear.")

			saynn("[say=pc]You make me immensely proud. Seeing you like this.. it fills me with an overwhelming desire to have more children with you.[/say]")

			saynn("Kitty lowers her gaze.")

			saynn("[say=rahi]Meow..[/say]")

		elif (birthDialogue <= 2):
			saynn("[say=rahi]She thinks she is beginning to.. get used to this..[/say]")

			saynn("[say=pc]I'm glad you do, kitty. Breeding you brings me immense pleasure.[/say]")

			saynn("Rahi blushes and lowers her chin, her ears droop. You lean forward and offer her a little kiss.")

			saynn("[say=pc]Your willingness to fulfill my desires, willingness to create life together.. It excites me deeply. You're such a good girl, kitty.[/say]")

			saynn("You hear loud purring coming directly from Rahi's throat.")

			saynn("[say=rahi]Thank you.. meow..[/say]")

		elif (birthDialogue <= 3):
			saynn("[say=rahi]Thank you.. She.. she just wants to give her kids everything they need.. She wants to be the best mother she can be.. Even if she is stuck here..[/say]")

			saynn("Rahi lowers her head and looks at her child. You lean in closer and begin whispering into her ear.")

			saynn("[say=pc]You're doing more than that, kitty.. You're nurturing your child with such tenderness, such love. I love seeing it. I wanna see it more..[/say]")

			saynn("Your words send shivers down her spine.")

			saynn("[say=rahi]You make her feel so.. cherished.. She wouldn't mind her belly being swollen again.. She wants to have all your children..[/say]")

			saynn("As you nibble lightly on Rahi's ear, little noises of pleasure escape from her.")

			saynn("[say=pc]Such a good girl..[/say]")

		elif (birthDialogue <= 4 || (birthDialogue != 5 && RNG.chance(50))):
			saynn("[say=rahi]Thank you.. She was hesitant before.. But now.. there is nothing more that she wants..[/say]")

			saynn("Kitty blushes, unable to continue the sentence out loud. You shift closer and lean closer to her lips.")

			saynn("[say=rahi]..please.. love.. impregnate her again.. Make her your breeding pet.. your devoted mother of your children..[/say]")

			saynn("You raise a brow but kitty just keeps going..")

			saynn("[say=rahi]She wants to feel your seed flooding her womb.. to bear witness the miracle of our love in the form of more precious children..[/say]")

			saynn("She sounds so.. submissive.. so.. needy.. barely holding herself back. You whisper back.")

			saynn("[say=pc]Together we will create a family filled with love and passion, a true legacy..[/say]")

			saynn("Kitty smiles and kisses you on the lips.")

			saynn("[say=rahi]Meow!..[/say]")

		else:
			saynn("[say=rahi]Thank you.. Being able to bring new life into this world.. even if she can't really raise them.. it still fills her with joy.. and purpose..[/say]")

			saynn("You look around the big empty room and then get closer to Rahi.")

			saynn("[say=pc]Who knows, kitty. Maybe you will get to raise them yourself..[/say]")

			saynn("[say=rahi]That would be.. great.. But for now she can only dream of that.. and be your breeding toy..[/say]")

			saynn("You chuckle and brush your hand over her cheek.")

			saynn("[say=pc]Your devotion, your care and your obedience are the qualities I cherish and admire in you.[/say]")

			saynn("[say=rahi]She will continue to give herself to you and our children.. Serving you is where she finds true happiness.. meow..[/say]")

		saynn("You continue that little cute small talk while the kid feeds on her mother's breast, savoring the taste.")

		addButton("Continue", "See what happens next", "rahi_last_words")
	if(state == "rahi_last_words"):
		playAnimation(StageScene.Duo, "kneel", {npc="rahi", npcAction="stand"})
		saynn("After some time the doctors come in and see you two. Rahi sighs and looks at her child before whispering something, her voice filled with love..")

		var randomLastWord = RNG.pick(["She might not always be by your side.. but know that you are loved beyond measure..", "Be brave, her little one.. Grow up strong and kind..", "Remember that you carry her love with you always.. Let it guide you on your journey..", "Treasure every moment, her.. my.. precious child.. Embrace the world, learn and grow.. Know that she will always be watching over you, my child..", "Though she can't be near you.. know that she will always hold you in her heart.. Embrace the opportunities that come your way and make her proud..", "Don't let the bars that surround her define who you are.. Reach for the stars.. let nothing hold you back..", "Hold onto your dreams, my little one.. Let them ignite the fire without you.. Pursue them with unwavering determination..", "Know that she loves you more than words can express.. May your path be blessed, and may you find happiness in every step you take.."])
		saynn("[say=rahi]"+str(randomLastWord)+"[/say]")

		saynn("After that, she stands up and reluctantly hands her child to one of the nurses.")

		saynn("Time to go..")

		addButton("Continue", "See what happens next", "lewd_check")
	if(state == "leaving"):
		removeCharacter("nurse")
		playAnimation(StageScene.Hug, "hug", {npc="rahi", npcAction="stand"})
		saynn("You get up too and follow Rahi back to the lobby. She turns around and gives you a tight hug.")

		saynn("[say=rahi]She needs some.. rest..[/say]")

		saynn("[say=pc]Of course, kitty.[/say]")

		saynn("Rahi lowers her head and heads back to her spot.")

		addButton("Continue", "That was something", "endthescene")
	if(state == "rahi_wants_lewd"):
		removeCharacter("nurse")
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="stand"})
		aimCameraAndSetLocName("med_lobby_start")
		GM.pc.setLocation("med_lobby_start")
		saynn("You get up too and follow Rahi back to the lobby. You can't help but notice that kitty is swaying her girly hips more than usual..")

		saynn("You join her near the elevator doors and begin waiting for it to reach your floor, the thing is big and slow..")

		saynn("Rahi looks around.. Many nurses around. Then she looks at you and.. bites her lip.")

		saynn("[say=rahi]Hey..[/say]")

		saynn("As you turn your head towards her and notice how lusty her eyes are. Kitty leans in closer and whispers into your ear so only you can hear it.")

		saynn("[say=rahi]She needs you to breed her.. right now.. She wants to be a mother.. again and again..[/say]")

		saynn("Oh wow, the kitty is still in her mommy mindset.")

		saynn("[say=rahi]She needs you to fill her womb with your potent seed.. Hear that?..[/say]")

		addButton("Nod", "Breed the kitty in the elevator", "breed_kitty")
		addButton("Shake head", "Maybe some other time", "no_breed")
	if(state == "no_breed"):
		saynn("As much as.. alluring.. she might sound.. you decide that now is not the time.")

		saynn("[say=pc]Sorry, kitty. Maybe some other time.[/say]")

		saynn("You land your palm on her empty belly.")

		saynn("[say=pc]I can always turn you into my kitten oven, don't worry.[/say]")

		saynn("Rahi fails to hide her disappointment. Her ears droop.")

		saynn("[say=rahi]That's.. that's okay.. yeah..[/say]")

		saynn("As the elevator doors open, Rahi just walks inside and travels to the other floor, leaving you to think about it all.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "breed_kitty"):
		playAnimation(StageScene.SexStanding, "fast", {npc="rahi", pc="pc", bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true}})
		saynn("You nod subtly just as the elevator doors open, revealing.. no one.. perfect.")

		saynn("You two walk inside and pick the furthest floor that you have access to..")

		saynn("Your heart is pounding. As soon as the doors close.. the timer is on.. With a sudden surge of confidence, you press her small frame against the wall of the elevator, the unique environment adds an extra thrill to your encounter, intensifying your desire..")

		saynn("The shorts fly off almost instantly. Her claws gently glaze your skin while you explore her body with your hands. As you press your exposed {pc.penis} against her folds, you can already feel the.. heat.. radiating from her needy pussy hole.")

		saynn("[say=rahi]Wait..[/say]")

		saynn("Rahi's desire hits its peak, she quickly turns around and presents herself to you by bending forward, her paws gripping the walls for support. She spreads her legs more and arches her back, pushing her round fluffy ass enticingly towards you, her pussy is visibly dripping.")

		saynn("[say=rahi]Now.. Breed her.. rough..[/say]")

		saynn("You don't need much more than that. One of your hands yanks on her ponytail, making Rahi hiss from the pain and throw her head back, while your second hand quickly guides your cock towards her slit. With a swift and powerful thrust, you enter her, your throbbing length stretching her folds wide and filling her needy depths.")

		saynn("[say=rahi]Ah~..[/say]")

		saynn("Rahi gasps, her body tightens around you, inner walls squeezing and welcoming your dick. The hissing quickly gets replaced with moans as you begin to thrust deep, roughly fucking your kitty while holding her pinned against the metal wall.")

		saynn("The time is slowly running out, the elevator is gonna arrive soon.. So you increase the grip on her ponytail and smack her girly ass for good measure, causing the feline to clench harder. More passionate moans escape from her until she suddenly cums on you, her body shivering, her legs shaking. No time to stop, you keep pounding her slutty pussy through her orgasm, overstimulating her to the point of squirting, her inner walls pulse and contract, kneading your shaft, bringing your own orgasm closer..")

		saynn("[say=rahi]Nya.. ah-h-..[/say]")

		saynn("The elevator has almost arrived..")

		addButton("Breed", "Cum inside the kitty", "breed_cuminside")
	if(state == "breed_cuminside"):
		playAnimation(StageScene.SexStanding, "inside", {npc="rahi", pc="pc", pcCum=true, npcCum=true, bodyState={exposedCrotch=true,hard=true}, npcBodyState={naked=true}})
		saynn("A groan escapes from you as Rahi's tight pussy pushes you over the edge. You ram your {pc.penis} as far as her cute slit allows before her cervix gets smashed. As the orgasmic waves begin washing over you, your throbbing length starts flooding her inviting womb with your seed, claiming it as your own.")

		saynn("[say=rahi]Y-yes-s.. good..[/say]")

		saynn("She savors the moment.. the feeling of being fucked, bred and filled..")

		saynn("As the elevator slows to a halt, Rahi remains bent over, your member still twitching inside her used sex. The afterglow is so good..")

		saynn("The elevator doors open..")

		addButton("Continue", "See what happens next", "breed_quicklycover")
	if(state == "breed_quicklycover"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="stand"})
		aimCameraAndSetLocName("hall_mainentrance")
		GM.pc.setLocation("hall_mainentrance")
		saynn("..revealing you two to the world. Two guards stare at you.")

		saynn("You just stand still. Awkward.. but.. they don't notice anything out of the ordinary. You two managed to put the clothes back on fast enough and take your spots in the middle of the elevator, avoiding real embarrassment.")

		saynn("Although, one of the guards pays a little more attention to Rahi, noticing her red cheeks and slight panting. But he doesn't get to ask any questions because you quickly grab Rahi's paw and bring her out of the elevator.")

		saynn("[say=rahi]That was close..[/say]")

		saynn("[say=pc]And fun.[/say]")

		saynn("Rahi smiles, her free paw is on her crotch, hiding the wet spot on her shorts.")

		saynn("[say=rahi]Nya.. Thank you.. Now she needs some rest..[/say]")

		saynn("[say=pc]Of course. Take care.[/say]")

		saynn("And just like that, Rahi steps towards her spot, leaving a little trail of lewd fluids behind her. Cute.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "cuddle_rahi"):
		playAnimation(StageScene.Cuddling, "idle", {npc="rahi"})
		saynn("The room is filled with a quiet ambience.. you notice colorful drawings on the white walls that you haven't seen before.. plush toys scattered across the floor.. all of it creates.. a nice atmosphere.")

		saynn("Rahi looks lovingly at her baby with a smile of pure adoration. With quiet steps, you approach closer and lower yourself onto the carpet behind the kitty. Your spread legs allow her to lean back into you, her paws are still cradling her child while your hands wrap around hers, forming a.. protective embrace.")

		saynn("[say=pc]Tired?[/say]")

		saynn("[say=rahi]A little.. but look..[/say]")

		saynn("You marvel at the tiny features of Rahi's child, her fingers lightly tracing delicate contours. The baby looks quite drowsy from being softly cradled by the kitty.")

		saynn("[say=pc]Yes..[/say]")

		saynn("Not many words can express what your hearts are feeling. But then again, why break the harmony. Much better to just.. enjoy the joys of parenthood while you still can, ten minutes at a time.. This soft carpet creates a sanctuary for you three.. free of any sins and wrongdoings.")

		saynn("As the new newborn slumbers peacefully in Rahi's arms, you hug her tightly and nuzzle her cheek. Together, you bask in the quiet joy.. Sometimes it's good to appreciate the small moments too..")

		saynn("Unfortunately, the good times can't last forever..")

		addButton("Continue", "See what happens next", "rahi_last_words")
	if(state == "breastfeed_yourself"):
		playAnimation(StageScene.Cuddling, "idle", {pc="rahi", npc="pc", npcBodyState={naked=true}})
		saynn("You approach Rahi with a warm smile and sit nearby.")

		saynn("[say=rahi]Hey there..[/say]")

		saynn("[say=pc]How are we doing, kitty?[/say]")

		saynn("The feline's gaze is fixed upon her newborn in her arms that seems to be reaching towards something. Or at least trying to.")

		saynn("[say=rahi]Tired.. She thinks her child is hungry..[/say]")

		saynn("Rahi begins to undo the top buttons of her shirt and carefully opens it up.")

		saynn("[say=pc]Can.. Can I try?[/say]")

		saynn("As you expose your breasts, it becomes quite obvious that you are, in fact, lactating too..")

		saynn("[say=rahi]Oh.. sure..[/say]")

		saynn("She gently passes the newborn to your waiting arms, trust and affection shimmering in her gaze.")

		saynn("You settle into a comfortable position and begin cradling the child against your chest. Rahi sits behind you, her chin resting on your shoulder. With gentle guidance, you encourage the baby to latch onto your nipple, providing your {pc.milk} and comfort..")

		saynn("As the newborn instinctively begins to suckle, some good feelings wash over you. You can't help but to smile seeing the baby feeding on your {pc.milk}. Rahi, sitting behind you, watches the act with a mix of adoration and gratitude on her face as you nourish her child. And, for a split moment, both you and her completely forgot where you are.. Just savoring the joys of parenthood for as long as you can..")

		saynn("Unfortunately, the good times can't last forever..")

		addButton("Continue", "See what happens next", "rahi_last_words")
	if(state == "story_time"):
		playAnimation(StageScene.Duo, "kneel", {npc="rahi", npcAction="kneel"})
		saynn("The room is filled with quiet pleasant hum coming from Rahi. She is still sitting on a soft carpet with her newborn nestled in her paws. You, drawn by the peaceful sight, approach the feline and take a seat beside her.")

		saynn("Rahi's humming gives you an idea. WIth a gentle smile, you lean in and whisper into her ear.")

		saynn("[say=pc]Why don't you tell your little one a story, kitty?[/say]")

		saynn("The kitty tilts her head slightly, her eyes light up but her ears droop slightly.")

		saynn("[say=rahi]She doesn't really know any..[/say]")

		saynn("[say=pc]Come up with one. You can't go wrong, kitty.[/say]")

		saynn("Rahi nods, you can see the flicker of creativity sparking within her. She adjusts her hold on the baby, making sure they are comfortable and looking at her, before beginning her tale..")

		saynn("[say=rahi]Once upon a time..[/say]")

		saynn("Her voice is gentle and soft.")

		saynn("[say=rahi]There once was a princess named Ra.. Rary.. One day she found herself trapped in a big castle..[/say]")

		saynn("Her gaze directed towards the newborn who seems to be fascinated even if they don't quite understand anything.")

		saynn("[say=rahi]Magnificent fortress.. but devoid of life.. and so Rary hoped for freedom.. She hoped for a hero to come and rescue her.. someone brave and kind..[/say]")

		saynn("She catches your curious gaze and gets all blushy but still continues the tale.")

		saynn("[say=rahi]And one day, as if by fate.. that hero appeared at the castle's gates! They were determined to free Rary from her isolation.[/say]")

		saynn("Rahi's eyes sparkle, she sees her child smiling and smiles too, eager to continue.")

		saynn("[say=rahi]But you see, little one, something bad happened.. The hero, too, found themselves.. trapped within the castle's walls.. It seemed the castle held secrets and mysteries beyond what met the eye..[/say]")

		saynn("Rahi sighs. You shift closer to her and put your hand on her shoulder, gently kneading.")

		saynn("[say=rahi]Together, the princess and the hero embarked on a journey of exploration.. They were searching for hidden corridors, discovering many forgotten empty rooms and slowly unlocking the castle's secrets.. But alas.. No luck in getting out.. Although.. the more they were doing it.. the more something.. magical.. began happening..[/say]")

		saynn("Rahi's voice becomes even softer, filled with warmth and affection. That makes the child drowsy. The cute yawn makes you two chuckles.")

		saynn("[say=rahi]As they explored the depths of the castle, they shared stories, laughter, sadness and.. dreams.. The emptiness of the castle was gradually filled.. with the light of their connection, transforming it into.. their home.[/say]")

		saynn("Rahi gazes lovingly at the tiny bundle of love in her arms. Her child is pretty much sleeping at this point..")

		saynn("[say=rahi]And so.. Rary learned.. She doesn't need any treasures.. Wait.. Did she mention that she wanted to find a treasure?.. Doesn't matter.. The hero taught her that the real treasure in life is what we share with the ones who we love..[/say]")

		saynn("The room becomes quiet.. The newborn rests peacefully in Rahi's arms. Your hand finds its way to Rahi's free paw, your fingers intertwining. Kitty looks at you, still blushing but not pulling her gaze away.")

		saynn("[say=pc]Great story, kitty.[/say]")

		saynn("[say=rahi]Thanks..[/say]")

		saynn("You keep holding hands with her but, unfortunately, the good times can't last forever..")

		addButton("Continue", "See what happens next", "rahi_last_words")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "near_nurse"):
		processTime(10*60)

	if(_action == "before_birth"):
		processTime(5*60)

	if(_action == "rahi_gives_birth"):
		processTime(5*60)
		var bornChilds = getCharacter("rahi").giveBirth()
		bornChildAmount = bornChilds.size()
		bornString = GM.CS.getChildBirthInfoString(bornChilds)
		increaseFlag("RahiModule.Rahi_GaveBirthsNearPC")
		howManyBirths = getFlag("RahiModule.Rahi_GaveBirthsNearPC", 0)

	if(_action == "near_kindergarden"):
		processTime(3*60*60)

	if(_action == "open_inv"):
		runScene("InventoryScene")

	if(_action == "praise_rahi"):
		processTime(5*60)
		increaseFlag("RahiModule.Rahi_BirthDialogue")
		getCharacter("rahi").milk(0.5)

	if(_action == "cuddle_rahi"):
		processTime(5*60)
		GM.pc.addStamina(50)

	if(_action == "story_time"):
		processTime(5*60)

	if(_action == "breastfeed_yourself"):
		processTime(5*60)
		GM.pc.addSkillExperience(Skill.Milking, 30)
		GM.pc.milk(0.5)

	if(_action == "rahi_last_words"):
		processTime(3*60)

	if(_action == "lewd_check"):
		if(GM.pc.hasReachablePenis()):
			if((howManyBirths > 2 && RNG.chance(20)) || howManyBirths == 5):
				setState("rahi_wants_lewd")
				return
		setState("leaving")
		return

	if(_action == "breed_kitty"):
		processTime(5*60)

	if(_action == "breed_cuminside"):
		processTime(2*60)
		getCharacter("rahi").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("rahi")
		GM.pc.addSkillExperience(Skill.SexSlave, 50, "rahi_breed")

	setState(_action)

func saveData():
	var data = .saveData()

	data["howManyBirths"] = howManyBirths
	data["bornString"] = bornString
	data["bornChildAmount"] = bornChildAmount

	return data

func loadData(data):
	.loadData(data)

	howManyBirths = SAVE.loadVar(data, "howManyBirths", 0)
	bornString = SAVE.loadVar(data, "bornString", "")
	bornChildAmount = SAVE.loadVar(data, "bornChildAmount", 0)

func getDevCommentary():
	return "I'm more of a 'pls breed - no preg' kind of person x3. For some reason the nature has decided that giving birth for us humans needed to be super painful. But oh well, what can you do. That's why I yada-yada most of this stuff. But some people are really into it so might as well keep some fun parts like cradling your kids..\n\nThe bedtime story is obviously referencing Rahi and you being stuck in the prison x3. I tried to put a little spin on it."

func hasDevCommentary():
	return true
