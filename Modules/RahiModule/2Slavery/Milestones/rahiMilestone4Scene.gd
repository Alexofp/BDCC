extends SceneBase

var wasKind = false

func _init():
	sceneID = "rahiMilestone4Scene"

func _reactInit():
	if(getFlag("RahiModule.rahiMile2Embraced", false)):
		wasKind = true

func _run():
	if(state == ""):
		addCharacter("rahi")
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="sit"})
		saynn("As you enter Rahi's cell, you notice her sitting on her bed, staring at the featureless walls like there is something there.")

		saynn("[say=pc]Hey, kitty. Something is troubling you?[/say]")

		saynn("She offers you a soft smile.")

		saynn("[say=rahi]Na-ah.. well.. She was thinking a lot lately.[/say]")

		saynn("Interesting. You sit near her and put your hand around her shoulders.")

		saynn("[say=pc]About?..[/say]")

		saynn("She nods and leans into you.")

		saynn("[say=rahi]She wants to tell you what happened.. Why she is like this..[/say]")

		saynn("You raise a brow.")

		saynn("[say=pc]What made you want to do that, kitty. Something changed?[/say]")

		if (wasKind):
			saynn("[say=rahi]You've been.. kind to her. She kinda wants to.. repay you?[/say]")

			saynn("[say=pc]Kitty, don't feel pressured into doing it. I'm here because I like you, just like I said.[/say]")

		else:
			saynn("[say=rahi]You were curious and she kinda felt like she needed to tell you.. She doesn't want to ever say no to you, {rahiMaster}..[/say]")

			saynn("[say=pc]Kitty, don't feel pressured into doing it. I might be rough with you sometimes but that's because I want you to be a better kitty. My kitty.[/say]")

		saynn("You smooch your kitty on the cheek. She meows at you.")

		saynn("[say=rahi]It's her decision. She wants to.. really..[/say]")

		saynn("Fair enough. You decide to listen to her. Maybe that will help you help her.")

		addButton("Continue", "See what happens next", "rahi_prepares")
	if(state == "rahi_prepares"):
		playAnimation(StageScene.Duo, "sit", {npc="rahi", npcAction="sit"})
		saynn("Rahi inhales deeply, trying to gather all her thoughts before starting.")

		saynn("[say=rahi]A few years ago.. How much exactly?.. She lost track of time a long time ago..[/say]")

		saynn("You can't help but to get immersed in Rahi's story.")

		addButton("Rahi's mind..", "See the story with your own eyes", "start_backstory")
	if(state == "start_backstory"):
		removeCharacter("rahi")
		playAnimation(StageScene.Solo, "stand")
		aimCameraAndSetLocName("rahi_mineshaft")
		saynn("Clang! Clang! Clang!")

		saynn("One of the dry rocks finally cracks.")

		saynn("Rahi raises her pickaxe and hits it again, putting her full strength into it.")

		saynn("Clang! Crack, thud.")

		saynn("The rock splits in half, some chips and sizable fragments break off and fall onto the cold ground with a thud that echoes throughout the whole mineshaft. The dust that was sent into the air in the process makes Rahi cough even though she is seemingly wearing a gas mask. Kitty is.. sweating..")

		saynn("Rahi takes her time, resting against the uneven hand-made wall. She pulls the mask away from her face temporarily and keeps trying to clear her throat by coughing.")

		saynn("[say=pc]Khm, k-khm.. Fuck, when is it gonna be over already.[/say]")

		saynn("There are other faceless felines around you hitting rocks with their pickaxes. Old school way, yes. But at least the tools are made out of light and sturdy materials, its weight comes mostly from its head.")

		saynn("Rahi grabs her pickaxe and continues to work, slowly chipping away at the walls. Her brown fur on her paws looks black and dirty. The feline tries to push through even though each impact spawns more of that dust that she tries to avoid breathing in so hard.")

		addButton("Continue", "See what happens next", "shift_stops")
	if(state == "shift_stops"):
		aimCameraAndSetLocName("rahi_mineshaftexit")
		saynn("After some time, Rahi finally hears a loud ring coming from outside the mineshaft.")

		saynn("[say=pc]Finally, it only took forever.[/say]")

		saynn("Panting kitty stops working and puts the pickaxe on her shoulder before proceeding to step out of the artificially-created cave, following the rails. Near the exit there are some racks to leave your equipment in and little buildings that are more like metal boxes.")

		saynn("Rahi enters one of such buildings, revealing a dressing room and a doorway that leads to some showers.")

		saynn("People around Rahi are talking about something but she is too tired to listen.")

		addButton("Shower", "Take a quick shower", "rahi_takes_shower")
	if(state == "rahi_takes_shower"):
		saynn("Rahi takes a quick shower and then puts on her normal clothes, just a shirt and some black pants. Then she wears an old slightly-oversized leather jacket on top.")

		saynn("She steps out of the little box and looks around. It's almost night, the dark sky is only illuminated by two moons and many little shiny dots. Rahi's blue eyes shine brightly in the dark.")

		saynn("Today is Rahi's payday so she goes straight for the administration building with a sign that proudly displays \"AlphaCorp's Ahdomai Exploration and Mining Division\". Rahi climbs the outside stairs to the second floor and opens a wooden door.")

		addButton("Step inside", "Go collect your paycheck", "paycheck_fail")
	if(state == "paycheck_fail"):
		aimCameraAndSetLocName("rahi_shaftpay")
		addCharacter("rahiMineOwner")
		playAnimation(StageScene.Duo, "stand", {npc="rahiMineOwner", npcAction="sit"})
		saynn("Rahi steps into a small cozy room. Wooden floors, painted walls, a little tv in the corner that seems to be spewing random news. In the middle of the room there is a wooden desk. A desk that clearly belongs to a busy person. A few telephones, a bin for papers, a cup holder for pens and pencils, a lamp.")

		saynn("Behind that desk is sitting quite a big person. A human that is of such an age when your hair usually just starts to become gray. He is wearing a dusty black suit with old shoes and a tie. He seems to be busy reading a newspaper, not even noticing when Rahi coughs to get some attention.")

		saynn("[say=pc]I want to be paid.[/say]")

		saynn("He slowly lowers the newspaper and directs his sleazy eyes at the feline. Then he puts it away and grabs a chip with credits from one of the drawers before handing it to the girl, his other hand quickly leaving a mark on one of the papers.")

		saynn("[say=rahiMineOwner]Rahi.. Haj'jar.. There you go, enjoy.[/say]")

		saynn("Rahi grabs the chip and looks at it. Something is wrong about it. Yeah. Something is definitely wrong.")

		saynn("[say=pc]Why are there only ten credits on it? I worked every shift for an entire month, there should be twenty at least.[/say]")

		saynn("She furrows her brows, Rahi starts to get really annoyed after a hard day of work. The guy sighs as he has to lower his newspaper again and look at the girl.")

		saynn("[say=rahiMineOwner]Well if you actually worked instead of fucking around all day, maybe you would have received more. Work harder next month.[/say]")

		saynn("Wow. Rahi raises her brows and tilts her head slightly. Her tail.. making jerky motions in the air.. sometimes hitting the floor with a low thud.")

		saynn("[say=pc]The fuck do you mean? Give me my credits, I earned them.[/say]")

		saynn("A single cough escapes Rahi's lungs.")

		saynn("[say=rahiMineOwner]Like I said, I can only pay you for half of your hours since most of the time you've been doing nothing productive. Seems fair?[/say]")

		saynn("Rahi shakes head and approaches the desk before slamming her fist against it.")

		saynn("[say=pc]Bullshit. I worked my ass off and you know it. If somebody was actually replacing filters in the masks I wouldn't be dying from this fucking cough.[/say]")

		saynn("The guy only shrugs at Rahi's words. That really gets her going, she is slowly boiling inside until she grabs the guy by his fancy tie and pulls him closer, her other paw showing off its claws.")

		saynn("[say=pc]You're not doing this to me. I have to buy meds to treat this shit. I have to live on something. Now is not a time to be an asshole, really.[/say]")

		saynn("He only leans closer to your ear before whispering into it.")

		saynn("[say=rahiMineOwner]Sounds like a you problem. And if you don't wanna have problems with AlphaCorp.. you better take your ten credits and work harder next time.[/say]")

		saynn("Rahi is growling and showing off her fangs now too. It would be so easy to scratch his face into a bloody mess right now. To bite into his throat and tear off a chunk. But instead, Rahi lets go of the tie and just stores the chip. The guy nods and sits on his wooden chair again.")

		saynn("Rahi tries to calm down.")

		saynn("[say=rahiMineOwner]Others are working just fine, no one is coughing like you do.[/say]")

		saynn("She rolls her eyes and steps towards the exit. Rahi was about to grab onto the handle.")

		saynn("[say=rahiMineOwner]Not even your father.[/say]")

		saynn("Rahi stops and turns towards the guy again.")

		saynn("[say=rahiMineOwner]Wasn't his name.. Samir. Yeah, Samir Haj'jar. I remember him.[/say]")

		saynn("Rahi furrows her brows.")

		saynn("[say=rahiMineOwner]The guy worked hard, day and night. Like a man should. He wasn't slaking away from hard tasks like most of you freeloaders.[/say]")

		saynn("[say=pc]Don't talk about my father.[/say]")

		saynn("He chuckles.")

		saynn("[say=rahiMineOwner]You know, he always talked about his family. His children. How he wanted them to become.. engineers I think? On a space station, no less. The guy had a great dream. I almost want to respect him. But. If only he knew.[/say]")

		saynn("Rahi slowly steps closer to the guy's desk again, her paws clenched into fists.")

		saynn("[say=rahiMineOwner]If only he knew what a bunch of spoiled lazy brats he had raised.[/say]")

		saynn("This is it, Rahi lashes out at the fucker and sinks her claws into his cheek, leaving some nasty but shallow bleeding marks.")

		saynn("[say=pc]Fuck. You.[/say]")

		saynn("The guy grunts and covers his cheek.")

		saynn("[say=rahiMineOwner]You stupid bitch, get the fuck out of here, now. Before I throw you out.[/say]")

		saynn("Rahi growls but then just kicks the door open and steps out before proceeding to step down the loud metal ladder.")

		saynn("[say=rahiMineOwner]The truth always hurts, doesn't it, Rahi?[/say]")

		saynn("[say=pc]Just fuck off.[/say]")

		addButton("Continue", "See what happens next", "rahi_thinks_on_stairs")
	if(state == "rahi_thinks_on_stairs"):
		aimCameraAndSetLocName("rahi_shaftstairs")
		removeCharacter("rahiMineOwner")
		playAnimation(StageScene.Solo, "stand")
		saynn("Rahi stands at the bottom of the stairs, a little dirt leads towards the town streets.")

		saynn("Kitty is still furious but the cold air helps to cool down. And realize everything that just happened. That's when she becomes sad, her eyes almost desperate.")

		saynn("[say=pc]There goes the only job in this fucking town.[/say]")

		saynn("Rahi turns around and looks at the sign, contemplating.")

		saynn("[say=pc]I don't wanna..[/say]")

		saynn("The more Rahi thinks about it, the more that she realizes that she will have to. She will have to return here..")

		saynn("But. Not today. Fuck today. Since it's friday, might as well go pay the bar a visit instead.")

		addButton("Continue", "See what happens next", "rahi_coughs_badly")
	if(state == "rahi_coughs_badly"):
		aimCameraAndSetLocName("rahi_cough")
		playAnimation(StageScene.Solo, "walk")
		saynn("Rahi walks down the streets of her town. It's hard to tell if something is changing because all the buildings seem the same. And even if they aren't, they still.. feel.. the same.. Rectangular boxes made out of the same gray panels with a perfect grid of windows on each side. Efficient, cheap and easily fabricated on mass, perfect for quickly growing planets that have just joined the galaxy exploration race. They're souless and ugly but at least they're better than the.. primitive tents.")

		saynn("The snow gives each one a white hat which makes them look prettier. It feels weird when it's not snowing here.")

		saynn("Rahi just follows the sidewalks while lonely cars are passing by. Old boring cars that have wheels and doors and run on gas. It's like this planet is stuck in the past century when it in fact is stuck in the future and can't get past it. Like something is holding it. On a tight leash.")

		saynn("Rahi's eyes can almost see the bright neon sign of a bar past all the fog and snow. A beacon of hope. Rahi would stop to admire the view but the damn cough returns and forces her to stop.")

		saynn("Rahi holds onto the nearest electric pole and starts coughing.. a lot. Her coughing fit is so strong that she almost collapses, dropping to her knees. After about half a minute of suffering the cough finally calms down, Rahi pulls her paw away from her mouth and notices.. blood. That's.. not good. But Rahi seems to be unphased by the sight, she leaves a bloody imprint on the pole and continues on her way.")

		saynn("She goes through her pockets, searching for something. Aha, there is the pill bottle. Rahi opens it and finds.. that it's empty. Seems like fate really wants Rahi to change her course in life. Luckily there seems to be a drugstore just around the corner, might as well give it a visit. The inescapable AlphaCorp logo is proudly displayed on the glass window.")

		addButton("Drug store", "Buy some meds", "rahi_enters_drugstore")
	if(state == "rahi_enters_drugstore"):
		aimCameraAndSetLocName("rahi_store")
		addCharacter("rahiPharmGirl")
		playAnimation(StageScene.Duo, "stand", {npc="rahiPharmGirl"})
		saynn("The little bell rings when Rahi opens the door and steps inside. Oh, great, more sterile gray walls. At least the floors are made out of polished wood, it's very nice to step on with your bare legs. Kitty walks up to the counter. Behind it is a cat, clearly a female, but she has a lighter fur tone compared to Rahi's.")

		saynn("[say=rahiPharmGirl]Hey. What do you need?[/say]")

		saynn("[say=pc]Something against a cough.[/say]")

		saynn("[say=rahiPharmGirl]Pneumonia? CWP? PMF?[/say]")

		saynn("All of those sound scary. Rahi scratches the back of her head, trying to decide if she should be completely honest or just honest enough.")

		saynn("[say=pc]Just.. cough? Been scratching my lungs these last days.[/say]")

		saynn("Mhm. The girl raises a brow at Rahi's words but then reaches under the counter and presents a few pill bottles.")

		saynn("[say=rahiPharmGirl]This one is ten, this one is fifteen and the last one is the best but also costs the most. Thirty for that one.[/say]")

		saynn("Wow. All Rahi has in her pockets is the ten credits chip that the asshole gave her.")

		saynn("[say=pc]Uh. Did they raise the prices or something?[/say]")

		saynn("[say=rahiPharmGirl]It's a mining town, the demand is high for these.[/say]")

		saynn("Something doesn't add up here. But whatever, the more Rahi thinks about it all, the more she realizes that the bar deserves her credits more. Still, it's worth asking.")

		saynn("[say=pc]What changed though? It's always been a mining town.[/say]")

		saynn("She shrugs and gives Rahi an annoyed look.")

		saynn("[say=rahiPharmGirl]You're buying anything or not?[/say]")

		saynn("Guess not. Rahi turns around and just steps out of the shop.")

		addButton("Continue", "See what happens next", "rahi_runs_into_rabi")
	if(state == "rahi_runs_into_rabi"):
		aimCameraAndSetLocName("rahi_nearstore")
		playAnimation(StageScene.Duo, "stand", {npc="rahiRabi"})
		addCharacter("rahiRabi")
		removeCharacter("rahiPharmGirl")
		saynn("[say=rahiRabi]Hey there, sis.[/say]")

		saynn("Rahi's ears perk towards the very familiar voice, she turns around and sees a brown male cat waving at her. Putting them near makes it obvious who they are to each other.")

		saynn("[say=pc]Hey yourself.[/say]")

		saynn("[say=rahiRabi]Meow? Something's up?[/say]")

		saynn("[say=pc]Can't buy the meds that I need, shit costs too much.[/say]")

		saynn("The male cat peeks past the glass door of the drugstore.")

		saynn("[say=rahiRabi]Oh yeah, she is upselling you.[/say]")

		saynn("[say=pc]Huh?[/say]")

		saynn("[say=rahiRabi]And then she puts the difference in her pocket. Girl wants credits. Like you. Like everyone.[/say]")

		saynn("Rahi tilts her head down, her paws clenching into fists again. The cat taps on Rahi's shoulder.")

		saynn("[say=rahiRabi]My job offer still stands, you know. You would be earning way more without all these health problems. What do you say?[/say]")

		saynn("[say=pc]I know what your job is, Rabi. It's illegal. But Also.. That's not what father would want.[/say]")

		saynn("Rabi chuckles softly and puts both his paws on Rahi's shoulder.")

		saynn("[say=rahiRabi]I only know one thing, sis. Father wanted us to be happy. I hate seeing you fade just like he did. It's not worth it.[/say]")

		saynn("He offers kitty a smile and then rubs her shoulders.")

		saynn("[say=pc]I'm done stealing and I don't wanna have anything to do with drugs, you know that..[/say]")

		saynn("Rabi shrugs.")

		saynn("[say=rahiRabi]See you around then, I gotta go make a transaction.[/say]")

		saynn("Rahi nods and watches Rabi enter the drugstore. Huh.")

		addButton("Continue", "See what happens next", "rahi_thinks_about_stealing")
	if(state == "rahi_thinks_about_stealing"):
		removeCharacter("rahiRabi")
		playAnimation(StageScene.Solo, "stand")
		saynn("The bar is attracting Rahi harder than her home planet attracts the two moons. But. The force of curiosity is stronger. Kitty takes a few steps back and sneakily peeks through the glass window.")

		saynn("Rabi and the pharmacist girl are talking about something before exchanging things and credits. Then the girl steps away from the counter and goes to look for something in the back.")

		saynn("Hm. The meds. They are probably still just under the counter. And Rahi knows that Rabi wouldn't rat on her. Now would be the perfect time to..")

		saynn("No, that's so wrong.. But.. The girl that is selling them basically stole them too. And Rahi clearly needs them more.. The guilt is already eating Rahi from the inside. But.. No.. She is not gonna make the mistake that her father did. Yes..")

		addButton("Sneak inside", "Try to steal the pills that Rahi needs", "rahi_sneaks_inside")
	if(state == "rahi_sneaks_inside"):
		aimCameraAndSetLocName("rahi_store")
		addCharacter("rahiRabi")
		addCharacter("rahiPharmGirl")
		playAnimation(StageScene.Duo, "kneel", {npc="rahiRabi"})
		saynn("Rahi slowly and carefully opens the door just enough to slip inside without triggering the bell. Rabi's ears instantly spot her though. The girl is still out in the back, searching for something.")

		saynn("But as Rahi begins to creep towards the counters, the girl suddenly returns. Gotta do something! Rahi leaps forward and hits the floor as silently as she can, hiding near Rabi's feet. He sneakily looks down at her sister and smiles.")

		saynn("[say=rahiPharmGirl]This stuff?[/say]")

		saynn("Rabi gets handed a small box of some kind.. material...")

		saynn("[say=rahiRabi]Yeah, that would do nicely. I need more though.[/say]")

		saynn("[say=rahiPharmGirl]Geez, really? You could have said that before I had to dig through the stash.[/say]")

		saynn("[say=rahiRabi]The cameras are still broken, right?[/say]")

		saynn("[say=rahiPharmGirl]Yeah. And I intend for them to stay that way. I guess I will go get more, wait here.[/say]")

		saynn("The girl leaves her spot and goes searching for something again. Rabi winks at Rahi before she silently leaps over the counters and begins looking for the right pills. A voice comes from the back room.")

		saynn("[say=rahiPharmGirl]Saw your sister I think. Didn't even realize it wasn't you at first.[/say]")

		saynn("[say=rahiRabi]Oh yeah? What do you think about her?[/say]")

		saynn("Shit. The pills that Rahi needs seem to be in a locked box. And she probably doesn't have much time left.")

		saynn("[say=rahiPharmGirl]No offense but why is she such a bitch? Demanding stuff, asking stupid questions. Did she find her clothes in a garbage dumpster?[/say]")

		saynn("That does it. Rahi pulls out a metal hairpin that was holding her ponytail together before bending it into a lockpick and sliding past the keyhole.")

		saynn("[say=rahiRabi]She had a rough day, don't go so hard on her. She is also trying to stay away from this whole thing.[/say]")

		saynn("[say=rahiPharmGirl]Is she mining coal all day instead? PFf-f-f. Good luck to her.[/say]")

		saynn("Rahi's ears pick up on the girl's footsteps. And they are getting closer and closer. Rahi quickly shakes her paw with the lockpick until she hears something clicking inside the box. She quickly opens the box, grabs the first pill bottle that she sees and then hops over the counter again, hairpin in her paw. Then she hears a thud as the pharmacist girl places something.")

		saynn("[say=rahiPharmGirl]Here, happy now?![/say]")

		saynn("Phew. She didn't see Rahi. But she still needs to slip out somehow.")

		saynn("[say=rahiRabi]You know what, I changed my mind, what I have will be enough.[/say]")

		saynn("Rahi can almost hear the other girl's eyes rolling.")

		saynn("[say=rahiPharmGirl]Fucking really?! You.. You!.. ARghh-h-! Fuck you![/say]")

		saynn("Rabi chuckles softly while the girl grabs the box of stuff and goes away again.")

		saynn("[say=rahiRabi]We will get to that~.[/say]")

		saynn("Rabi then nods towards Rahi. Rahi nods back.")

		addButton("Slip out", "Time to go", "rahi_slips_out_of_drugstore")
	if(state == "rahi_slips_out_of_drugstore"):
		removeCharacter("rahiPharmGirl")
		removeCharacter("rahiRabi")
		aimCameraAndSetLocName("rahi_nearstore")
		playAnimation(StageScene.Solo, "stand")
		saynn("Rahi slips out of the drugstore the same way she entered it and starts walking towards the bar again. She quickly fixes her ponytail back with the hairpin.")

		saynn("Her paw brings the stolen pill bottle to her face. Seems like she stole the best ones.")

		saynn("[say=pc]Maybe life isn't so unfair.[/say]")

		saynn("The instructions warn not to mix them with alcohol but who cares about what instructions say. She pops one into her mouth and swallows it. No apparent effects but hopefully they will help against the cough in the long run.")

		addButton("Continue", "See what happens next", "rahi_near_bar")
	if(state == "rahi_near_bar"):
		aimCameraAndSetLocName("rahi_outsidebar")
		playAnimation(StageScene.Solo, "walk")
		saynn("As Rahi approaches the bar, she spots more and more.. girls.. and guys too.. wearing skimpy and sexy clothes. Night-butterflies. Earning credits the only way they know how. Or maybe they like it? Who knows. Rahi hopes she will never reach such a low level. But then she realizes that stealing is probably lower than selling your body on the global scales. From now on she prefers not to think about it.")

		saynn("Here it is. The bar. It's maybe the only place in the entire town that wasn't tainted by the greedy hands of AlphaCorp. Not yet at least. The wooden walls and floors, the bright neon sign, the promise of a good time, it's very inviting.")

		addButton("Bar", "Enter it", "rahi_enters_bar")
	if(state == "rahi_enters_bar"):
		aimCameraAndSetLocName("rahi_bar")
		playAnimation(StageScene.Solo, "sit")
		saynn("The cold light from the moons is replaced by a warm one from all the lamps. It's cozy here. Which means the place is also quite busy. Every single cat in the town comes here to have a nice chat, drink some cheap alcohol and then smash heads until they forget what year it is.")

		saynn("Rahi steps further and flops her butt on one of the round stools near the barmen. Her paw places the ten credits chip on the counter.")

		saynn("[say=pc]The usual.[/say]")

		saynn("The guy behind the wooden bar counter nods. Ten credits means ten shots of whiskey. Barely enough to fix anything. But fixing everything would require a barrel.")

		saynn("Time passes and nothing changes. Kitty is sitting alone, sipping the lifejuice. It's cute to see her try to occasionally shove her muzzle into the glass and lap the remains of whiskey up. All the while others around her are busy living their lives. It's almost like the bar is the only place where people are truly alive. It doesn't do it for Rahi anymore though.")

		saynn("[say=pc]Repeat.[/say]")

		saynn("The kind barman shakes his head. Damn. Already? The night has only just started and Rahi is already out of credits.")

		saynn("Kitty decides to look around. Sneakily. Huh. She quickly spots a group of drunk felines with one of them clearly being the main guy. It seems he is buying today, swaying around and waving his giant glass of beer around. Which means he has credits to spare.")

		saynn("Rahi looks at the barmen.")

		saynn("[say=pc]Be right back.[/say]")

		saynn("The guy nods, his eyes see Rahi getting up and seemingly heading for the restrooms. But then she alters her course by losing her balance. No matter how agile you are, the brain poison that is the alcohol will do that to you.")

		addButton("Continue", "See what happens next", "rahi_flops_on_guy")
	if(state == "rahi_flops_on_guy"):
		addCharacter("rahiBarGuy")
		playAnimation(StageScene.SexStart, "start", {pc="rahiBarGuy", npc="pc"})
		saynn("Rahi sways to the side until she runs herself into the loud group, her paws instinctively grabbing onto the cat's jacket.")

		saynn("[say=pc]Eep![/say]")

		saynn("He catches the drunk Rahi and saves her from collapsing completely.")

		saynn("[say=rahiBarGuy]Oh hey. Are you hurt, kitty cat?[/say]")

		saynn("[say=pc]Sorry, had one too many glasses of whiskey today.[/say]")

		saynn("He helps Rahi get up before tapping on her shoulders.")

		saynn("[say=rahiBarGuy]Well, if you still have room in ya, we can share. I'm buying rounds. It's not whiskey. But you know.[/say]")

		saynn("Rahi is clearly not interested.")

		saynn("[say=pc]I'm good, thank you. Sorry again.[/say]")

		addButton("Continue", "See what happens next", "rahi_after_stealing_credits")
	if(state == "rahi_after_stealing_credits"):
		playAnimation(StageScene.Solo, "sit")
		saynn("Rahi returns back to the barmen and places a thirty credit chip on the counter. He raises his brow but accepts it.")

		saynn("[say=pc]Limit me to.. Ah, screw it, no limit. Just repeat until I say stop or lose consciousness..[/say]")

		saynn("And so the fun times continue. Rahi slowly sips more and more whiskey, clouding her mind. Accepting reality is way harder when looking through an empty glass. At least she is making progress.")

		saynn("More time passes. Some people leave, some have just walked in. The group that Rahi has disturbed has decided to move on with their lives. When suddenly.")

		saynn("[say=rahiBarGuy]Uh. I can't find the creds, guys. Where did I put them..[/say]")

		saynn("Oops. Rahi looks away and pretends she is a prop.")

		saynn("[say=rahiBarGuy]I swear, they were right here, in this pocket. You all saw it, right?[/say]")

		saynn("Now would be a good time to go breathe some fresh air, it's good for your health. And Rahi decides to do just that. Too bad the alcohol is actually affecting her motions, making them more gracious and flowing. And slow.")

		saynn("[say=rahiBarGuy]Wait. I think I know where the creds are. Where is that whiskey cat?![/say]")

		saynn("Just keep walking, just keep walking..")

		addButton("Continue", "See what happens", "rahi_gets_grabbed_by_barguy")
	if(state == "rahi_gets_grabbed_by_barguy"):
		playAnimation(StageScene.Duo, "hurt", {npc="rahiBarGuy", npcAction="shove"})
		saynn("A dirty paw reaches for Rahi's shoulder and pulls on it, rotating the cat one eighty and leaving a print on the leather. Kitty is swaying a lot.")

		saynn("[say=rahiBarGuy]Leaving already? I don't think so.[/say]")

		saynn("He is certainly not happy, his other paw clenched. Rahi has to raise her chin to look at his face.")

		saynn("[say=pc]I'm go-oing home. And you ca-an't stop me..[/say]")

		saynn("He certainly can. The guy furrows his brows and bares his fangs.")

		saynn("[say=rahiBarGuy]Give back the credits that you stole, you little junkie.[/say]")

		saynn("Rahi shakes her head, putting extra sway into her neck motions.")

		saynn("[say=pc]I don't have you-ur credits. So-o-o.. fuck off? Please?[/say]")

		saynn("Suddenly the guy grabs Rahi's throat and makes her stand on her toes. A very refreshing experience, kitty can suddenly feel the clouds going away. And she is not a fan.")

		saynn("[say=rahiBarGuy]Already wasted it all? You don't get it. I Am getting my credits back no matter what. I don't care how. I will pass your slutty ass around until you earn enough if I have to.[/say]")

		saynn("That's not a nice thing to say. As the guy reaches for Rahi's clothes, she growls and sinks her claws into his paws, making him yelp and increase the pressure on her throat, choking her out.")

		saynn("[say=pc]L-let g-go..[/say]")

		saynn("People around don't seem to care much, even the bartender guy just focuses on cleaning his glasses and pouring drinks. This conversation just gets lost in the overall noise.")

		saynn("[say=rahiBarGuy]You little bitch. Prepare to get whored out.[/say]")

		saynn("Suddenly a voice from behind him. A very familiar one.")

		saynn("[say=rahiRabi]I'd let her go if I were you.[/say]")

		addButton("Continue", "See what happens next", "rahi_gets_saved_by_rabi")
	if(state == "rahi_gets_saved_by_rabi"):
		addCharacter("rahiRabi")
		playAnimation(StageScene.Duo, "stand", {pc="rahiBarGuy", npc="rahiRabi"})
		saynn("The guy lets go of Rahi's neck and turns towards the bold voice. Kitty is coughing and gasping for air.")

		saynn("[say=rahiBarGuy]And who the fuck are you?[/say]")

		saynn("He then looks at both Rahi and Rabi.")

		saynn("[say=rahiBarGuy]You two are clearly working together. You're her pimp, aren't you?[/say]")

		saynn("Rabi shakes his head and crosses his arms. The angry cat steps towards him.")

		saynn("[say=rahiRabi]You're gonna say sorry to the kitty that you hurt. Then you just gonna relax and enjoy the rest of your night.[/say]")

		saynn("That made the other guy furious, he grabs Rabi by the clothing. The conflict is.. quite heated. But Rahi's brother seems to stay calm.")

		saynn("[say=rahiBarGuy]Oh yeah? How about I smash your head, take all your creds and then fuck your stupid slut?[/say]")

		saynn("Rabi reaches for something. The other guy was about to punch him when they both suddenly hear a noise of a gun cocking up. Rabi smiles.")

		saynn("[say=rahiRabi]I said. You will say sorry to the kitty and relax.[/say]")

		saynn("The dude is furious. But only on the inside. Outside, he doesn't look so brave anymore. He grits his teeth and then lets go of Rabi's clothing.")

		saynn("[say=rahiBarGuy]Oh, go fuck yourself then, both of you. This is not worth it.[/say]")

		saynn("The guy joins his group again and plops his butt onto the chair.")

		saynn("All the while Rabi helps Rahi get up and sit on the stool before taking a seat himself.")

		addButton("Continue", "See what happens next", "rabi_talks_with_rahi")
	if(state == "rabi_talks_with_rahi"):
		removeCharacter("rahiBarGuy")
		playAnimation(StageScene.Duo, "sit", {npc="rahiRabi", npcAction="sit"})
		saynn("Rahi rubs her bruised neck.")

		saynn("[say=pc]How long have you been here?[/say]")

		saynn("[say=rahiRabi]A few hours, wanted to make sure you're alright. Saw what you did with that guy. Great technique. You have some great skills, sis.[/say]")

		saynn("Rahi tries to order another whiskey shot but Rabi stops her and orders two himself.")

		saynn("[say=pc]Oh yeah? He almost began teaching me other types of skills.. Thanks.. by the way..[/say]")

		saynn("Rabi chuckles and sips some whiskey, the same way that Rahi does, by lapping the contents up with his tongue.")

		saynn("[say=rahiRabi]Don't mention it. The girl at the drugstore has no idea so far, great work there too.[/say]")

		saynn("Rahi empties her glass and sighs. She looks at Rabi.")

		saynn("[say=pc]I have a strange feeling that you wanna offer me something.[/say]")

		saynn("[say=rahiRabi]Yeah, I wanna..[/say]")

		saynn("Rahi cuts him off.")

		saynn("[say=pc]But I already said that I wanna have nothing to do with your.. business.. whatever it is.[/say]")

		saynn("Rabi leans closer to his sister.")

		saynn("[say=rahiRabi]I'm not talking about my business here. I wanna offer you a.. solution. A solution to all your problems.[/say]")

		saynn("Rahi tilts her head. But she can't deny that she.. might be slightly intrigued.")

		addButton("Continue", "See what happens next", "rabi_shows_alphacorp_lady")
	if(state == "rabi_shows_alphacorp_lady"):
		addCharacter("rahiAlphaCorpLady")
		playAnimation(StageScene.Solo, "sit", {pc="rahiAlphaCorpLady"})
		saynn("Rabi sneakily points at a certain lady. A lady that is wearing some fancy suit. She is drinking something, alone in her little corner.")

		saynn("[say=rahiRabi]See her? The one with the white hair. She comes here every day, orders the most expensive drink that they got, idles for about an hour or so and then leaves.[/say]")

		saynn("Rahi tries to figure out if she ever saw her before but no. All the alcohol made remembering faces hard for her.")

		saynn("[say=pc]What about her?[/say]")

		saynn("Rabi leans in even closer, almost whispering.")

		saynn("[say=rahiRabi]I saw what she had in her wallet. Sis, it's at least ten thousand credits.[/say]")

		saynn("Rahi raises a brow.")

		saynn("[say=pc]And you want me to pickpocket her?[/say]")

		saynn("Rahi's brother shakes his head.")

		saynn("[say=rahiRabi]Nah, she is smart. Keeps the wallet in her inner pocket. Even your kitty paws won't reach there. But. When she leaves, she always cuts through some dark alleyways.[/say]")

		saynn("[say=pc]You.. asking me to rob her? You're okay with your head? Need a doctor?[/say]")

		saynn("Rabi sighs and puts his paw on Rahi's back, caressing.")

		saynn("[say=rahiRabi]I'm asking you to help me. Sis, think about it. Ten. Thousand. Credits. That's your education sitting right there. Or a better house. Clothes. You won't have to work ever again. You will be able to drink whiskey as much as you want.[/say]")

		saynn("Rahi is.. quiet. She is deliberating in her head. Her eyes.. focused on that wallet in the lady's pocket.")

		saynn("[say=pc]I.. I can't.. That's too.. dangerous.. And.. That's too much.. I don't wanna ruin her life..[/say]")

		saynn("Rabi almost rubs cheeks with his sister, his paw kneading her back.")

		saynn("[say=rahiRabi]Sis, really? Look at her. She is from AlphaCorp. You remember AlphaCorp, right? It's logo on your abysmal paychecks? Or meds that you need to fix your ruined health and that you can't afford? That's the sole reason for everything bad that happened to us. She is the reason father has passed..[/say]")

		addButton("Continue", "See what happens next", "alphacorplady_leaves")
	if(state == "alphacorplady_leaves"):
		playAnimation(StageScene.Solo, "walk", {pc="rahiAlphaCorpLady"})
		saynn("The AlphaCorp lady has finally finished her drink and prepares to leave. She heads towards a different exit that everyone enters through.")

		saynn("All the while Rahi is sitting there.. almost spaced out. Her eyes.. watery. Her paws.. clenching into fists..")

		saynn("[say=rahiRabi]She is leaving. This is our chance, sis. Please.[/say]")

		saynn("[say=pc]Yeah.. okay.. Okay. Let's do this. I'm with you.[/say]")

		saynn("Rabi smiles and grabs his sister's paw before following the AlphaCorp lady.")

		addButton("Continue", "See what happens next", "rabi_rahi_discuss_robberry")
	if(state == "rabi_rahi_discuss_robberry"):
		aimCameraAndSetLocName("rahi_alleystart")
		playAnimation(StageScene.Duo, ["holdpistol", "res://Inventory/UnriggedModels/Pistol/Pistol.tscn"], {npc="rahiRabi"})
		saynn("The feline twins exit the bar through its back exit and begin sneakily following the rich girl. Cold air fills Rahi's lungs yet again.")

		saynn("It's.. dark. Much darker than before Rahi entered the bar. And the lack of any light sources in these alleyways doesn't help. Well, it does. It helps Rahi and Rabi since their eyes can adjust even to a dim light from the two moons. Their blue eyes shine.")

		saynn("Rabi whispers.")

		saynn("[say=rahiRabi]See that corner? Perfect spot for it. Here, you're gonna hold this while I frisk her.[/say]")

		saynn("He suddenly pulls out a gun that he was holding under his jacket. A high-caliber pistol. Works great even against armored targets. Rahi gasps seeing it.")

		saynn("[say=pc]You.. you want me to hold her at gunpoint?! I've never shot a gun in my life. And I don't plan on doing that now.[/say]")

		saynn("Rabi pats Rahi's back again.")

		saynn("[say=rahiRabi]Kitty.. You won't have to shoot anyone. It will be quick, you will see. Just aim it at her and I will do everything else. If she tries to escape.. Whatever, you don't have to do anything.[/say]")

		saynn("Rahi is deliberating yet again. But then she sees her future just walking away from her through a dark alleyway. It would only be fair..")

		saynn("[say=pc]Okay.. I will do it.[/say]")

		saynn("Rabi produces two pieces of dark cloth and offers one to Rahi before tying one around his maw. Rahi does the same.")

		saynn("[say=rahiRabi]Let's go.[/say]")

		addButton("Continue", "See what happens next", "rabi_rahi_rob_girl")
	if(state == "rabi_rahi_rob_girl"):
		aimCameraAndSetLocName("rahi_darkalley")
		playAnimation(StageScene.Duo, ["holdpistol", "res://Inventory/UnriggedModels/Pistol/Pistol.tscn"], {npc="rahiAlphaCorpLady"})
		saynn("Rahi catches up with the rich lady right when she reaches the corner. Rabi follows behind. Time for Rahi to say something..")

		saynn("[say=pc]Hey, you. Not a single step more.[/say]")

		saynn("The AlphaCorp lady gasps and tries to turn around. That's when Rahi finds the hammer on her gun and cocks it with an audible click.")

		saynn("[say=pc]Don't. Turn. Around. Bitch. Hands where I can see them.[/say]")

		saynn("The lady sighs but stops and slightly raises her hands.")

		saynn("[say=rahiAlphaCorpLady]I can smell a cat from a mile away. What are you gonna do? Rob me? Good luck.[/say]")

		saynn("The twins slowly approach the lady. Rahi puts a gun right up against her skull, letting her feel the metal.")

		saynn("[say=rahiAlphaCorpLady]Do you even know who I am? You can still stop and save yourself from the worst prison in the whole galaxy.[/say]")

		saynn("[say=pc]Shut up, AlphaCorp whore. I know exactly who I'm robbing.[/say]")

		saynn("Rabi reaches his paws into the lady's uniform and starts searching for the wallet. Lady sighs more while her breasts are being groped in the process.")

		saynn("Suddenly.. The urge.. To cough.. Rahi fights it.. as best as she can. But it's so strong.. Little coughs begin escaping from her.")

		saynn("[say=pc]F-Fuck.. Not now..[/say]")

		saynn("Rabi successfully fetches the wallet and steps away from the pair. He taps-taps twice on Rahi's shoulder and prepares to make his escape. But she is busy fighting her cough that only gets worse.")

		saynn("[say=rahiAlphaCorpLady]Hm.. You're a shaft miner, aren't you?[/say]")

		saynn("[say=pc]Shut up! Fuck..[/say]")

		saynn("Rahi uses her free paw to try and find the pill bottle. It's somewhere in her jacket.. There it is.. She tries to open it. Fuck, the coughing fit makes Rahi drop it, pills go everywhere. And the cough only gets worse.")

		saynn("Rabi stands behind Rahi, really concerned. But quiet. He looks at the wallet in his paws.. And starts to slowly step away..")

		saynn("[say=rahiAlphaCorpLady]So unfortunate. I almost feel bad for you.[/say]")

		saynn("Are those.. sirens?.. Already?.. The lady must have pressed something. Rabi shakes his head and quickly makes his escape, abandoning his sister.")

		addButton("Pills", "Rahi gotta grab one and swallow it!", "rahi_fucks_up")
	if(state == "rahi_fucks_up"):
		removeCharacter("rahiRabi")
		playAnimation(StageScene.Duo, "defeat", {npc="rahiAlphaCorpLady", npcAction=["holdpistol", "res://Inventory/UnriggedModels/Pistol/Pistol.tscn"]})
		saynn("The cough won't stop. Rahi decides to slowly crouch and try to pick one of the pills off the ground. But as soon as she takes her eyes off the lady, she suddenly turns around and disarms Rahi before aiming the gun at her, all in less than a second.")

		saynn("[say=pc]Agh!..[/say]")

		saynn("Kitty yelps, her hand got twisted uncomfortably during all that. She collapses onto the snow and keeps suffering from the coughing fit, the cold air only makes it worse. Lady rips the cloth off of Rahi's maw.")

		saynn("[say=rahiAlphaCorpLady]Well-well-well. Seems like your.. boyfriend?.. has decided to betray you. Doesn't matter, we will find him. If not.. you will just have to suffer alone.[/say]")

		saynn("Rahi finally grabs one of the pills but the lady kicks it out of her paws. Poor kitty keeps coughing her lungs out.")

		saynn("[say=rahiAlphaCorpLady]You made a huge mistake, pussy cat.. You ruined your life.. congrats.. I guess.[/say]")

		saynn("[say=pc]Gh-h.. kh-h.. My life is already ruined. Because of you. All of you.. Kh..[/say]")

		saynn("The lady laughs, almost hysterically. All the while the sirens get extremely close. The cops must be here.")

		saynn("[say=rahiAlphaCorpLady]Haha-Ha.. You can't even imagine how much worse your life is soon gonna become. You're gonna wish you could have continued to hit the rocks with your pickaxe all day.[/say]")

		saynn("Rahi looks up at the girl.")

		saynn("[say=pc]Fuck. You.[/say]")

		saynn("Just to get knocked out a second later by the handle of her own gun.")

		saynn("Darkness follows soon.")

		addButton("Darkness..", "See what happens next", "rahi_visits_police_station")
	if(state == "rahi_visits_police_station"):
		removeCharacter("rahiAlphaCorpLady")
		addCharacter("intro_detective")
		playAnimation(StageScene.Solo, "sit")
		aimCameraAndSetLocName("rahi_policestation")
		saynn("Time passes, Rahi begins to slowly come back to her senses. She opens her eyes and sees a small windowless room. A table. Two chairs. A locked door. Ow, her bruised forehead still makes her dizzy. Rahi tries to get up but her paws are chained to the chair with some cuffs. So thoughtful.")

		saynn("Oh, there is something else. A security camera seems to acknowledge Rahi's state. Can't be long now.")

		saynn("And indeed, very soon the door opens and a wolf guy steps in. He is wearing your normal office clothes but he also has an empty weapon holster under his armpit.")

		saynn("He closes the door behind him and locks it before taking a seat between Rahi and the only exit. He is holding a folder with some papers.")

		saynn("[say=intro_detective]Hello, Miss.. give me a sec.. Miss Haj'jar? Right. My name is Jake, I'm a detective. Or, more specifically, I'm from a threat assessment division. Let me know if you need something. Are you thirsty, miss?[/say]")

		saynn("The guy seems kind. But Rahi is clearly not buying it.")

		saynn("[say=pc]I doubt you're gonna spoon feed me.. Jake the detective.. Just say what you wanna say.[/say]")

		saynn("Jake puts the folder on the table and relaxes in his chair.")

		saynn("[say=intro_detective]Alright. Let's start from the beginning. Miss Haj'jar, can you tell me how your day started?[/say]")

		saynn("[say=pc]It started shitty. And only got progressively worse. You know what I did. And you probably don't care why I did it. So why am I still here and not in a cell?[/say]")

		saynn("Jake scritches his chin while Rahi tilts her head and puts on her mean eyes.")

		saynn("[say=intro_detective]I do care, miss. Yes, I know the what. But I'm trying to figure out the why. I wanna hear your story. With the most details possible.[/say]")

		saynn("Rahi tries to reach her ponytail but her paws being cuffed makes it very awkward. Damn.")

		saynn("[say=pc]I'm not telling you shit.[/say]")

		saynn("Jake sighs and leans towards the feline. Rahi recoils back, now rubbing the back of her head against the wall behind her. The metal pin holding her ponytail.. it seems to shift slightly while she does that.")

		saynn("[say=intro_detective]If you help me figure this thing out, I will try to help you too, as much as I can.[/say]")

		saynn("[say=pc]You're on AlphaCorp's payroll, aren't you?[/say]")

		saynn("Jake quickly flips through some of the folder's pages.")

		saynn("[say=intro_detective]So you're saying that your.. deeds.. both of them.. had a political reasoning?[/say]")

		saynn("Rahi looks confused.")

		saynn("[say=pc]What do you mean both?[/say]")

		saynn("Jake holds a paper.")

		saynn("[say=intro_detective]Here is a statement from your employer. It says that you have attacked him. There is a picture included. Looks like claw marks.[/say]")

		saynn("[say=pc]Oh fuck off, the guy scammed me for my credits.[/say]")

		saynn("Jake nods and stays silent for a few seconds after Rahi finishes her sentence until she starts to feel uncomfortable.")

		saynn("[say=pc]What? He underpaid me. I did the hours and he cut half of them. The fucker had it coming.[/say]")

		saynn("[say=intro_detective]Alright. Well, he is still an AlphaCorp representative. You're saying that this had nothing to do with that?[/say]")

		saynn("[say=pc]I don't care who he is, okay? I said enough. Bring me to my cell and get it over with.[/say]")

		saynn("Jake nods, he sees that Rahi doesn't want to cooperate.")

		saynn("[say=intro_detective]I'm afraid that's impossible, miss Haj'jar. When any AlphaCorp representatives are involved, such cases must go through the intergalactic trial first.[/say]")

		saynn("[say=pc]The what?[/say]")

		saynn("[say=intro_detective]And since you've got two charges plus stacked against you.. I'm gonna be honest. I doubt you will ever see the light of day ever again. I doubt that you will see your home planet honestly.[/say]")

		saynn("That sounds.. intimidating.. to say the least. Rahi looks around the small room, rubbing her ponytail against the wall more.")

		addButton("Continue", "See what happens next", "detective_gets_angry")
	if(state == "detective_gets_angry"):
		saynn("[say=intro_detective]But. I'm ready to close my eyes on your first charge. As long as you cooperate with me, just a bit. And by cooperating I mean just answering a few of my questions. If you do that.. who knows, maybe we can scale this case down to a local one.[/say]")

		saynn("Rahi blinks a lot. Her ears droop, her tail wrapping around the leg of the chair.")

		saynn("[say=pc]Well.. shoot..[/say]")

		saynn("Jake moves his chair closer to Rahi.")

		saynn("[say=intro_detective]The woman you stole the credits from said that there were two robbers. And that the credits are with the second one. Who are they?[/say]")

		saynn("Oh-h. That's.. asking for too much.")

		saynn("[say=pc]I'm not gonna tell you that..[/say]")

		saynn("Jake stares Rahi into the eyes.")

		saynn("[say=intro_detective]It was your brother, wasn't it? It was Rabi Haj'jar? C'mon, you can tell me.[/say]")

		saynn("As Jake tries to place his wolf palm on Rahi's leg, she shakes it off.")

		saynn("[say=pc]It wasn't him. I'm not gonna tell you who it was, okay?![/say]")

		saynn("[say=intro_detective]Why are you protecting him? The guy has betrayed you.[/say]")

		saynn("[say=pc]Fuck you, it wasn't him![/say]")

		saynn("Jake growls and grabs Rahi by the chin, forcing her to look him into the eyes.")

		saynn("[say=intro_detective]You don't understand. If we find the credits, you both might just get away from this with nothing but a slap on the wrist. But if you don't wanna admit it.. you're gonna suffer for both.[/say]")

		saynn("Rahi bares her fangs and tries to shake Jake's hand off.")

		saynn("[say=intro_detective]Attempted armed robbery.. Violence against an AlphaCorp representative.. Carry of an unregistered firearm.. Theft of medical drugs, pickpocketing.. All of these are gonna stick, Rahi.[/say]")

		saynn("What? How did he.. Rahi looks more confused than ever.")

		saynn("[say=intro_detective]We followed your trail, Rahi. You had a hell of an evening, didn't you? And since you decided not to cooperate.. I see no other choice.. But to make an example out of you.[/say]")

		saynn("Jake gets up and heads for the exit door.")

		saynn("[say=intro_detective]I will return in a bit.[/say]")

		saynn("He leaves, leaving Rahi to panic.")

		addButton("Cuffs!", "Try to get them off", "rahi_tries_to_escape")
	if(state == "rahi_tries_to_escape"):
		removeCharacter("intro_detective")
		saynn("Rahi didn't like any of that. She must escape now while she still can. She starts actively rubbing her head against the wall behind her. It might seem useless but somehow she manages to make the metal pin shift in her ponytail. The only thing that she can do while her paws are cuffed to the chair.")

		saynn("[say=pc]Fuck fuck fuck..[/say]")

		saynn("Rahi is desperate, she eagerly squirms, trying to get the pin out of her hair any way possible.. until it finally happens.")

		saynn("The metal pin starts falling, almost in slow motion.. Rahi opens her paws and tries to catch it.. but fails.. the pin bounces off her cuffs and starts falling further. The panic is real, there is no way Rahi can pick it up if it reaches the floor..")

		saynn("Rahi's tail! There is only one chance to do this. Rahi blindly flicks her tail up.. and manages to bat it back into her paws! There can't be much time left, Rahi bends the pin into a lockpick before blindly finding the keyhole and trying to unlock them.")

		saynn("Her ears already pick up on the footsteps getting closer. Her paws keep shaking the lockpick around.. until there is a satisfying click.")

		saynn("Jake opens the door again.. now is the time to slip past him.. who cares what happens after..")

		addButton("Slip past", "Try to slip past Jake", "try_to_slip_past_jake")
	if(state == "try_to_slip_past_jake"):
		addCharacter("intro_detective")
		playAnimation(StageScene.Solo, "defeat")
		saynn("[say=intro_detective]Alright, the trial has..[/say]")

		saynn("Who cares about his words.. As soon as Jake enters the room, Rahi jumps off her chair before leaping onto the table and jumping off it in one elegant motion, aiming to fit between Jake's head and the doorway.")

		saynn("But, sadly, his reaction was perfect. Jake catches the kitty before she can jump over him and throws her back onto the table, breaking it in half. Ow. Kitty's back didn't like that. She tries to recover but Jake pins her to the broken wooden fragments and growls into her face.")

		saynn("[say=intro_detective]I'm so sick of your bullshit.[/say]")

		saynn("He tries to cuff Rahi's paws again but she keeps fighting back, leaving countless scratch marks on his hands.")

		saynn("[say=pc]Let me go! I'm not going away for life![/say]")

		saynn("[say=intro_detective]Gr-r.. Hah. You're not going.. you're flying away on a rocket, Rahi. To a space prison that no one even knows about.[/say]")

		saynn("Rahi's eyes go wide.")

		saynn("[say=intro_detective]A prison made specifically for scum like you. But first, I'm gonna fix your behavior.[/say]")

		saynn("Suddenly Jake frees one of his hands and pulls out an.. injector.. of sorts.. Inside it, some kind of.. red.. glowing.. drug. Rahi sees it and resists harder, trying to kick the guy off. But he uses his weight to crush kitty's resistance before forcibly stabbing her neck with the thing.")

		saynn("[say=pc]Fuck!..[/say]")

		saynn("[say=intro_detective]Have fun.[/say]")

		saynn("Rahi gets weaker and weaker.. She gets cuffed to the chair again.. This time nothing can save her.")

		saynn("Suddenly, darkness. Second time this day.")

		addButton("Darkness", "Embrace it", "rahi_goes_to_heaven")
	if(state == "rahi_goes_to_heaven"):
		removeCharacter("intro_detective")
		addCharacter("rahiFather")
		playAnimation(StageScene.Duo, "stand", {npc="rahiFather"})
		saynn("After who knows how long, Rahi wakes up.. As she opens her eyes, the darkness gets replaced by.. a blinding light.. a whole room that's full of it.")

		saynn("Rahi gets up and looks around. The bright white room has no beginning and no end. There is nothing here.. expect.. another figure.")

		saynn("[say=pc]Am I.. dead? Is this what heaven looks like..[/say]")

		saynn("Rahi starts to approach the figure that is facing away from her. Wait.. that tail.. that.. posture.. old clothes.. brown fur..")

		saynn("[say=pc]F-f.. f-father?.. Is that you?[/say]")

		saynn("There is no way that's him, that's impossible.. But Rahi so wants to believe.. She starts sprinting towards the figure. He turns around. Yes, there is no denying it, that's.. Rahi's father.")

		saynn("Rahi tackle-hugs her father and starts nuzzling his cheek, still not believing that this is really happening.")

		saynn("[say=pc]You can't imagine how much I missed you, dad.. After you passed my life just wasn't the same anymore.. Where are we.. How are you alive.. I don't care.. Please let this moment last a little longer, please..[/say]")

		saynn("Rahi hugs her father as tight as she can, lonely tears begin streaming down her cheeks. All the while the old cat raises his paws and puts them on Rahi's shoulders..")

		addButton("Continue", "See what happens next", "samir_breaks_rahi")
	if(state == "samir_breaks_rahi"):
		playAnimation(StageScene.Duo, "defeat", {npc="rahiFather", npcAction="shove"})
		saynn("Suddenly Rahi's father shoves her away, making her collapse, leaving kitty more confused than anything.")

		saynn("[say=pc]Ow.. Why, d-dad?.. Say something, dad..[/say]")

		saynn("[say=rahiFather]My girl.. How.. how could you..[/say]")

		saynn("He furrows his brows while Rahi is desperate to hug him again. But the guy seems.. quite angry..")

		saynn("[say=rahiFather]How could you do that to me?[/say]")

		saynn("[say=pc]Do.. what?.. Dad..[/say]")

		saynn("[say=rahiFather]I worked so hard to give you all a future and this is how you act after I'm gone? Injuring, stealing, breaking, robbing. Why would you taint the legacy of the Haj'jar clan like that? Why?![/say]")

		saynn("Rahi suddenly breaks down in tears. All the while her dad only gets more annoyed hearing her sobbing.")

		saynn("[say=pc]I'm sorry!.. I had no choice.. I tried, believe me, dad, I tried.. But..[/say]")

		saynn("He huffs and suddenly slaps Rahi's cheek.")

		saynn("[say=rahiFather]Listen to yourself. Nothing but pathetic excuses. Only hard work gets you somewhere. What you did.. that's inexcusable. Awful. I'm starting to think.. that you're not my daughter.[/say]")

		saynn("Rahi rubs her red cheek and can't stop crying. The last words.. shatter something inside her.. inside you..")

		saynn("[say=pc]Wha.. What do you mean.. father.. dad.. please.. d-don't say that..[/say]")

		saynn("Samir crosses his arms, his eyes.. show hatred.")

		saynn("[say=rahiFather]You heard me. You don't deserve the name Haj'jar. I don't want to have such a daughter. You're not the Rahi that I knew and loved. You're.. someone else.. Someone I don't want to know.[/say]")

		saynn("[say=pc]D-d.. a.. fathe.. wh.. n-n.. n-no.. ple-..[/say]")

		saynn("Your father's words.. they echo around your mind.. corrupting your every thought..")

		saynn("[say=rahiFather]What? What do you have to say now? If it's more of your pathetic excuses then just keep them to yourself, couldn't care less anymore. You're not my daughter.[/say]")

		saynn("Samir turns around and starts walking away from you. No! You must stop him! You dash forward and grab onto his leg, begging.")

		saynn("[say=pc]P-please!.. I-I'm sorry!.. F-forgive me.. ..your R-Rahi is so sorry..[/say]")

		saynn("Samir just pushes you away. His voice.. couldn't be more strict.. and direct.")

		saynn("[say=rahiFather]I gave the name Rahi to my daughter, not you. You're not Rahi.[/say]")

		saynn("He just keeps walking away while you are breaking down further.. The bright white room suddenly begins to.. get darker and darker.. the further your dad gets from you.")

		saynn("[say=pc]I.. I'm sorry..[/say]")

		saynn("You stay on your knees.. just watching your dad walking away.. But is he even your dad anymore.. You're not sure.. Deep inside you understand now.. There are no more tears to shed.. Your face.. loses any emotion..")

		saynn("[say=pc]I'm not Rahi.. I'm not.. I don't deserve.. I'm not.. me.. t-there is no me.. T-There is o-only..[/say]")

		saynn("The room is about to become pitch-dark. You only manage to add..")

		saynn("[say=pc]She..[/say]")

		saynn("Before losing your consciousness and hitting the floor.")

		saynn("Thud.")

		addButton("Continue", "Rough stuff..", "story_ends")
	if(state == "story_ends"):
		aimCameraAndSetLocName("cellblock_orange_nearcell")
		removeCharacter("rahiFather")
		addCharacter("rahi")
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="sit"})
		saynn("That's where Rahi.. kitty.. stops telling you, the real you, her story.")

		saynn("[say=rahi]Then they just sent her here..[/say]")

		saynn("Your kitty sheds a tear.. but then quickly swipes it away and looks at you.")

		saynn("[say=rahi]What do you think, {rahiMaster}?..[/say]")

		saynn("You can.. try to be kind and explain that it's all because of the drug.. Or you can tell her that none of it matters because you're gonna give the kitty a new purpose in life.")

		addButton("Be kind", "Try to explain that it was the drug who made Rahi the way she is", "say_be_kind")
		addButton("Doesn't matter", "Whatever happened in the past doesn't matter anymore", "say_doesnt_matter")
	if(state == "say_be_kind"):
		setFlag("RahiModule.rahiMile4WasKind", true)
		
		saynn("You smooch your kitty on the cheek.")

		saynn("[say=pc]Kitty.. Whatever that drug was, it's at fault. It made you hallucinate your father into existence. It wasn't actually him..[/say]")

		saynn("Rahi lowers her chin.")

		saynn("[say=rahi]But.. it was her father.. That's exactly what her father would say.. If he would be alive..[/say]")

		saynn("You hug your kitty tightly.")

		saynn("[say=pc]No. If he was alive, he wouldn't say that. Trust me. This drug.. whatever it was.. it spawned a bad version of him.. in your mind. Do you understand that? Please, kitty.[/say]")

		saynn("She looks you in the eyes. More tears begin streaming down her cheeks.. many more. Then she looks away and tilts her head again.")

		saynn("[say=rahi]Maybe you're right.. maybe not..[/say]")

		saynn("Rahi sighs.")

		saynn("[say=rahi]She needs to think about it.. Thank you.. For listening..[/say]")

		saynn("[say=pc]You're very welcome, my kitty.[/say]")

		saynn("You grab your kitty and lie in bed together with her, just cuddling for some time.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "say_doesnt_matter"):
		setFlag("RahiModule.rahiMile4WasKind", false)
		
		saynn("You scritch your kitty behind the ears.")

		saynn("[say=pc]That drug.. whatever it is.. made you like this, kitty. But that doesn't matter. Look at me.[/say]")

		saynn("Kitty tilts her head down.. before turning towards you.")

		saynn("[say=pc]That's past. It's not worth crying over the choices you made. Because you would have made them anyway.[/say]")

		saynn("[say=rahi]But.. still..[/say]")

		saynn("You hug your kitty tighter.")

		saynn("[say=pc]I know, it's hard to just forget the past. You tried many times. But instead of trying to fix it, you should look into the future. You like being my kitty, don't you?[/say]")

		saynn("She nods subtly. You scritch her behind the ears more until she starts to purr.")

		saynn("[say=pc]One day you will wake up. You will go about your day as normal, doing a task from me before getting rewarded or punished. Then you will idle some more and go prepare for your sleep. And before closing your eyes, you will suddenly realize. You didn't think about it once. You will realize that you can.. in fact.. forget.[/say]")

		saynn("Kitty looks at you and.. smiles..")

		saynn("[say=rahi]Thank you.. for everything..[/say]")

		saynn("[say=pc]You're very welcome, my kitty.[/say]")

		saynn("You grab your kitty and lie in bed together with her, just cuddling for some time.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "start_backstory"):
		GM.main.overridePC()
		GM.pc.setName("Rahi")
		GM.pc.setGender(Gender.Female)
		GM.pc.setSpecies([Species.Feline])
		GM.pc.resetBodypartsToDefault()
		GM.pc.giveBodypart(GlobalRegistry.createBodypart("ponytailhair"))
		var breasts = GlobalRegistry.createBodypart("humanbreasts")
		breasts.size = 3
		GM.pc.giveBodypart(breasts)
		GM.pc.pickedThickness = 50
		GM.pc.pickedFemininity = 100
		GM.pc.getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("EngineerClothes"))
		GM.pc.getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("GasMask"))
		GM.pc.updateNonBattleEffects()
		getCharacter("rahi").copySkinTo(GM.pc)

	if(_action == "rahi_takes_shower"):
		GM.pc.getInventory().clear()
		GM.pc.getInventory().forceEquipRemoveOther(GlobalRegistry.createItem("LeatherJacket"))

	if(_action == "rahi_visits_police_station"):
		GM.pc.getInventory().equipItem(GlobalRegistry.createItem("inmatewristcuffs"))

	if(_action == "try_to_slip_past_jake"):
		GM.pc.removeAllRestraints()

	if(_action == "story_ends"):
		GM.main.clearOverridePC()
		processTime(60*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["wasKind"] = wasKind

	return data

func loadData(data):
	.loadData(data)

	wasKind = SAVE.loadVar(data, "wasKind", false)

func getDevCommentary():
	return "Yeahhhhh.. Rahi's backstory scene.. I had an idea for this scene for a looooong time. And I'm so glad I managed to write it. I was sick through the last half of it, which is funny considering what happens in it.. Just kinda ironic that I also had a bad cough while writing it\n\nBackstory scenes are.. supposed to be pretty self-contained. They all are about telling you a little story. Yes, it's connected to your story. But it's mostly about how these characters ended up where they are. There is always some kind of climax in these backstory scenes.. makes it more interesting\n\nIf you look at the structure its basically just Rahi getting rekt by everything x3. And then she gets some rest but her own actions push her further and further into this.. dark place. It's basically a scene about Rahi getting corrupted by the world that she is in. Her father is the only bright memory.. and even that is.. I dunno if I should spoil the ending x3\n\nI did cry while writing some parts. Which usually means there are a lot of emotions packed into the words. I don't expect you to cry x3. I'm just an emotional wreck I guess. But it helps me see if the scene is good. Good writing will make you feel something."

func hasDevCommentary():
	return true
