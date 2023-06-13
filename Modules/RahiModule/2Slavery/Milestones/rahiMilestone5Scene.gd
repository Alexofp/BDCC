extends SceneBase

var wasKind = false
var orderedOrUndressed = false
var whippedOrGroped = false
var bodywritingsOrWax = false
var lickedOrSlapped = false
var vibroOrClamps = false
var humiliatedOrPraised = false
var dildoesOrElectroshock = false

func _init():
	sceneID = "rahiMilestone5Scene"

func _reactInit():
	if(getFlag("RahiModule.rahiMile4WasKind", false)):
		wasKind = true

func _run():
	if(state == ""):
		addCharacter("rahi")
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="sit"})
		saynn("You step into Rahi's cell. She is just sitting on her bed, thinking about something. Her ears perk towards the noises of your footsteps but her mind seems to be wandering.")

		saynn("You approach her and put your hands on her cheeks, caressing.")

		saynn("[say=pc]Something is troubling you, kitty?[/say]")

		saynn("Rahi offers you a short smile.")

		saynn("[say=rahi]Hi, {rahiMaster}. Actually no, for once.. She is just realizing something..[/say]")

		saynn("Your hands scritch your kitty under the chin and behind the ears. You hear purring coming from her.")

		saynn("[say=pc]I'm very curious.[/say]")

		saynn("[say=rahi]Going through her past with you.. You are right about the drug.. But she made a lot of decisions before that.. And after too.. And most of the time the alcohol has swayed her into the wrong direction.. Rather than helping..[/say]")

		saynn("Interesting. It's good to see your kitty understand that. You can't help but to wonder if she actually believes that though.")

		saynn("[say=pc]Yeah, it pushes your problems away while creating different ones. But it tastes good, doesn't it?[/say]")

		saynn("Kitty sighs and buries her face into your palms for a bit.")

		saynn("[say=rahi]Does that really matter?..[/say]")

		saynn("Rahi seems sincere but she also doesn't have the best track record when it comes to not lying.")

		addButton("Test kitty", "Test if Rahi's addiction is actually cured", "test_kitty")
	if(state == "test_kitty"):
		playAnimation(StageScene.Hug, "hug", {npc="rahi"})
		saynn("You pull out the bottle of whiskey that you have taken away from Rahi at some point. It's still half-full. As you present it to your kitty, her eyes.. brighten up.")

		saynn("[say=pc]So you're saying you have overcome your addiction?[/say]")

		saynn("Kitty stares at the bottle.. at the orange liquid sloshing inside.")

		saynn("[say=rahi]Yeah..[/say]")

		saynn("You open it and let Rahi sniff the contents. Her ears droop.")

		if (wasKind):
			saynn("[say=pc]I'm gonna give you a choice. You can either finish this bottle with no repercussions or I dispose of it but after that we have the best sex.[/say]")

		else:
			saynn("[say=pc]I'm gonna give you a choice. You can either finish this bottle with no repercussions or I dispose of it but after that we have the best BDSM session you ever experienced.[/say]")

		saynn("Your kitty keeps staring at the bottle, you can hear her audibly swallowing saliva. This prolonged silence is kinda suspicious. Finally she breaks it.")

		saynn("[say=rahi]The second option..[/say]")

		saynn("That's a huge relief. You put the bottle away for now and give your kitty a few pats on the head.")

		saynn("[say=rahi]Can she go pee real quick, your kitty kinda wants to..[/say]")

		saynn("[say=pc]I mean.. sure.[/say]")

		saynn("Rahi gets up from her bed and gives you a long tight hug, her cheek rubbing against yours. Your hands wrap around her girly chest and gently rub her back.")

		if (wasKind):
			saynn("[say=rahi]She really appreciates what you're doing with her..[/say]")

		else:
			saynn("[say=rahi]She really appreciates how you're treating her..[/say]")

		saynn("After that cute gesture, she quickly steps out of her cell and seemingly heads to the bathrooms.")

		addButton("Continue", "See what happens next", "pc_realizes")
	if(state == "pc_realizes"):
		playAnimation(StageScene.Solo, "stand")
		removeCharacter("rahi")
		saynn("Some time passes. The more you think about it, the more you realize that something is wrong here.. Kitty never had such requests..")

		saynn("[say=pc]Wait.[/say]")

		saynn("You check your things.. And the whiskey bottle.. it's not here.. It's just not.")

		saynn("Hard to describe how you feel. Sad? Betrayed? Angered?")

		saynn("Time to find that kitty, maybe she hasn't made too many mistakes yet.")

		addButton("Bathrooms", "Check the bathrooms", "check_bathrooms")
		addButton("Waterfall", "Check the waterfall area", "check_waterfall")
	if(state == "check_bathrooms"):
		aimCameraAndSetLocName("main_bathroom1")
		saynn("You rush into the bathrooms. You check every toilet stall.")

		saynn("No signs of kitty anywhere. She lied even about that.")

		addButton("Waterfall", "Check the waterfall area", "check_waterfall")
	if(state == "check_waterfall"):
		addCharacter("rahi")
		playAnimation(StageScene.Solo, "stand", {pc="rahi"})
		aimCameraAndSetLocName("yard_waterfall")
		saynn("You get a strange deja vu feeling when rushing towards the spot where you and Rahi are hanging out so much. You really hope she won't repeat the same mistakes.")

		saynn("You dash through the green yard area and stop when you notice Rahi, standing near the waterfall. Her back is turned towards you. For some reason you feel like she might..")

		saynn("Kitty is holding the bottle of whiskey. She opened it. Her eyes stare at the liquid inside while her paw jiggles the bottle.")

		saynn("She still didn't spot you. Do you trust her enough?..")

		addButton("Intervene", "Stop that kitty from doing what's she is doing", "intervene")
		addButton("Just watch", "See what kitty will do next without you intervening", "just_watch")
	if(state == "intervene"):
		setFlag("RahiModule.rahiMile5Intervened", true)
		playAnimation(StageScene.Duo, "stand", {npc="rahi"})
		saynn("[say=pc]Kitty![/say]")

		saynn("Rahi turns only her head, her ears perk towards your voice. But otherwise, there is no reaction. You begin closing the distance with her.")

		saynn("As the kitty begins to raise the paw with the bottle, seemingly getting it closer to her mouth, your walk fastens.")

		saynn("[say=pc]Don't![/say]")

		saynn("You catch with your kitty and get a grasp on her. One of your hands catches her wrist, stopping it, while another is wrapped around her belly, holding her still.")

		saynn("But then suddenly Rahi starts tilting the bottle to the side, more and more, until the whiskey.. starts spilling out of it.. and into the water pond.. Rahi keeps doing that until the bottle is completely empty.")

		saynn("[say=rahi]She made one gulp.. It tasted.. just like she remembers it..[/say]")

		saynn("You keep embracing her.")

		saynn("[say=pc]So.. why didn't you drink more?[/say]")

		saynn("[say=rahi]Because.. because~[/say]")

		saynn("She turns around, still hugged by you. Rahi has a cute smile on her face. She hands you the empty bottle.")

		saynn("[say=pc]You know that I will have to punish you, right? For lying to me.[/say]")

		saynn("Her smile only gets more cheeky.")

		saynn("[say=rahi]Do your worst, {rahiMaster}~.[/say]")

		saynn("Punishments aren't supposed to be fun so you get a grasp on her ponytail and yank slightly on it, making your kitty raise your chin while you attach a leash to her collar.")

		saynn("[say=rahi]Ah..[/say]")

		saynn("[say=pc]I will.[/say]")

		saynn("You take a few steps back and yank on the leash. Kitty obeys and follows you.")

		saynn("Better to get back to her cell where all the fun tools are at.")

		addButton("Rahi's cell", "Return to Rahi's cell", "go_back_to_cell")
	if(state == "just_watch"):
		setFlag("RahiModule.rahiMile5Intervened", false)
		playAnimation(StageScene.Duo, "stand", {npc="rahi"})
		saynn("You decide to just stand still and watch Rahi. If she wants to keep making the same mistakes.. You probably should just let her..")

		saynn("Rahi sighs, her paw starts raising the bottle closer to her mouth seemingly. But then.. she stops. And instead, her paw starts tilting the whiskey bottle to the side.. until the liquid starts pouring out of it.. and into the water pond. Phew.")

		saynn("Rahi empties the bottle completely. And then just stares at the wavy water.")

		saynn("As you start to slowly approach you, she turns around and notices you.")

		saynn("[say=rahi]Oh..[/say]")

		saynn("[say=pc]Kitty..[/say]")

		saynn("She lowers her head.")

		saynn("[say=rahi]She made one gulp.. It tasted.. just like she remembers it..[/say]")

		saynn("Rahi hands you the empty bottle so you can dispose of it.")

		saynn("[say=pc]Why didn't you drink more?[/say]")

		saynn("[say=rahi]Because.. because~[/say]")

		saynn("Rahi has a cute smile on her face.")

		saynn("[say=pc]You know that I will have to punish you, right? For lying to me.[/say]")

		saynn("Her smile only gets more cheeky.")

		saynn("[say=rahi]Do your worst, {rahiMaster}~.[/say]")

		saynn("Punishments aren't supposed to be fun so you get a grasp on her ponytail and yank slightly on it, making your kitty raise your chin while you attach a leash to her collar.")

		saynn("[say=rahi]Ah..[/say]")

		saynn("[say=pc]I will.[/say]")

		saynn("You take a few steps back and yank on the leash. Kitty obeys and follows you.")

		saynn("Better to get back to her cell where all the fun tools are at.")

		addButton("Rahi's cell", "Return to Rahi's cell", "go_back_to_cell")
	if(state == "go_back_to_cell"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi"})
		aimCameraAndSetLocName("cellblock_orange_nearcell")
		saynn("You bring your kitty back to her cell. You position her in the middle of it and unclip the leash.")

		saynn("Rahi's ears are slightly lowered. But she also sneakily bites her lip. Huh.")

		saynn("[say=rahi]She is sorry for lying to you, {rahiMaster}..[/say]")

		saynn("[say=pc]A simple sorry is not enough, kitty, you know that.[/say]")

		saynn("Rahi nods and eagerly awaits her fate.")

		addButton("Order to undress", "Tell Kitty to undress herself", "orderUndress")
		addButton("Undress Rahi", "Undress your Kitty yourself", "undressRahi")
	if(state == "orderUndress"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="stand", npcBodyState={naked=true}})
		addCharacter("rahi", ["naked"])
		saynn("First things first, you stand in front of your kitty and cross your arms.")

		saynn("[say=pc]Uniform, take it off.[/say]")

		var exhibitLevel = getModule("RahiModule").getSkillScore("rahiSkillExhibit")
		if (exhibitLevel > 5):
			saynn("A blush appears on Rahi's cheeks but her paws begin unbuttoning her shirt almost instantly, no questions asked. Then she opens it, presenting her cute round boobs"+str(" that seem to be full of milk" if getCharacter("rahi").canBeMilked() else "")+", before letting her shirt slide down off her shoulders. The scar on her belly is still there..")

			saynn("Then, just as quick, she pulls down her shorts slightly before wiggling her fluffy butt out of them and tossing them away with her foot. It seems you trained your kitty enough for her to not feel any shame, her paws don't cover her private bits at all. Quite the opposite, Rahi is eyeing you out while casually teasing her nips and clit.")

		else:
			saynn("A blush appears on Rahi's cheeks, her paws land on her shirt but then they just tug on the top-most button.")

			saynn("[say=rahi]And what if she won't.. Will you force her?[/say]")

			saynn("It's almost like your kitty wants that.")

			saynn("[say=pc]If you won't obey, we will just stop for today, kitty.[/say]")

			saynn("Rahi pouts, her paws begin to unbutton her shirt, one button at a time. Then she slowly opens it, presenting her cute round boobs"+str(" that seem to be full of milk" if getCharacter("rahi").canBeMilked() else "")+", before letting her shirt slide down off her shoulders. The scar on her belly is still there..")

			saynn("Rahi covers her chest with one arm while the second one pulls down her shorts slightly before she wiggles her fluffy butt out of them and tosses them away with her foot. It seems your kitty is not trained enough to not feel shame when naked, her paws try to cover her private bits. So you break your stance to grab her paws before forcibly placing them by her sides, causing kitty to blush harder.")

			saynn("[say=rahi]Me-eow..[/say]")

		saynn("Gagging or blindfolding her would make the sensations feel sharper for her. But at the same time, you want her to see what is gonna happen and be able to moan. Cuffs though.. Cuffs are a must. You go ahead and grab some.")

		saynn("[say=pc]Paws behind your back, now.[/say]")

		saynn("[say=rahi]Yes, {rahiMaster}..[/say]")

		saynn("Rahi obeys and does as told, bringing her hands behind her back. You go behind her and put some tight metal cuffs on her wrists. Then you crouch and cuff her ankles together too, severely limiting your kitty's possible motions.")

		saynn("How should you start..")

		addButton("Whip Rahi", "Give her ass and breasts some whipping", "whip_rahi")
		addButton("Grope Rahi", "Get a good feel for Rahi's body", "grope_rahi")
	if(state == "undressRahi"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="stand", npcBodyState={naked=true}})
		addCharacter("rahi", ["naked"])
		var exhibitLevel = getModule("RahiModule").getSkillScore("rahiSkillExhibit")
		saynn("You give Rahi a strict gaze.")

		saynn("[say=pc]Don't even try to resist.[/say]")

		saynn("Your hands reach out to her shirt and begin to unbutton it. Your kitty stands still and lets you do it but she also tracks your digits undoing each button one by one. Her cheeks blush as more of her fur gets revealed. Then you pull Rahi's inmate shirt off her shoulders until it finally slips off, revealing her cute round boobs"+str(" that seem to be full of milk" if getCharacter("rahi").canBeMilked() else "")+". The scar on her belly is still there..")

		if (exhibitLevel > 5):
			saynn("Your kitty proudly presents you her chest, she seems to like your attention a lot. Your training has helped her be more open about her body.")

		else:
			saynn("Your kitty blushes hard and begins to try to cover her tits after some time. You staring at her so much clearly makes her feel uncomfortable about her body. She probably just needs more training.")

			saynn("[say=pc]Paws off, kitty.[/say]")

			saynn("She shakes her head so you forcibly pry her hands off her breasts and place them by her sides. Rahi pouts but does her best not to cover herself.")

		saynn("Now that the shirt is taken off, your hands move down to her shorts, gently tugging them down, revealing Rahi's fluffy butt and her crotch that houses a cute little slit hidden between her legs.")

		if (exhibitLevel > 5):
			saynn("Your kitty seems eager to present her pussy to you as well. She bites her lips while seeing you inspecting her.")

		else:
			saynn("Her paws really want to cover her private bits but she actively fights that urge, instead just rubbing her thighs together.")

		saynn("Gagging or blindfolding her would make the sensations feel sharper for her. But at the same time, you want her to see what is gonna happen and be able to moan. Cuffs though.. Cuffs are a must. You go ahead and grab some.")

		saynn("[say=pc]Paws behind your back, now.[/say]")

		saynn("[say=rahi]Yes, {rahiMaster}..[/say]")

		saynn("Rahi obeys and does as told, bringing her hands behind her back. You go behind her and put some tight metal cuffs on her wrists. Then you crouch and cuff her ankles together too, severely limiting your kitty's possible motions.")

		saynn("How should you start..")

		addButton("Whip Rahi", "Give her ass and breasts some whipping", "whip_rahi")
		addButton("Grope Rahi", "Get a good feel for Rahi's body", "grope_rahi")
	if(state == "whip_rahi"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="kneel", npcBodyState={naked=true}})
		var masLevel = getModule("RahiModule").getSkillScore("rahiSkillMasochist")
		if (masLevel > 6):
			saynn("As you grab a short multi-tailed whip, your kitty starts to purr. She even offers you her bare butt by sticking it out and moving her feline tail away. So of course you don't waste much time and deliver the first impact, causing many knotted cords to sting her. Rahi produces a stifled noise and keeps sticking her butt out for you, even wiggling it.")

			saynn("You raise the whip and bring it down again, whipping her butt. This time Rahi recoils forward a bit so you grab her by the tail and pull her back before suddenly whipping her ass again, making your kitty throw her head back and produce a noise that kinda sounds like a moan.")

			saynn("[say=rahi]Is.. is that all you got?..[/say]")

			saynn("Wow. You're not sure if your kitty is a brat or a painslut. Either way, the solution is the same. You start whipping your kitty's butt many times, raising the whip before bringing it down with an almost sadistic level of strength, cords digging into her fur and leaving red lines under. But your kitty takes it like a champ, she keeps moaning and panting so you also decide to whip her somewhere else.")

			saynn("[say=rahi]Mya-ah..[/say]")

			saynn("You stand in front of Rahi. Wow, she got quite turned on by your whipping, her pussy is clearly wet and dripping. Let's see how she handles this. You raise the whip and suddenly strike her breasts instead, letting the few lucky tails leave an impact on her sensitive nips and areolas. That finally has some effect, Rahi jerks to the side and produces a cry of pain.")

			saynn("[say=rahi]Ow!..[/say]")

			saynn("She covers her breasts, leaving you no choice but to raise your tool and whip her crotch instead, letting the cords dig into her sensitive flesh. Kitty's eyes roll up, her body starts to shake and shiver in response, painful moans escape from her lips.")

			saynn("[say=rahi]T-too much.. meow..[/say]")

			saynn("[say=pc]Don't cover yourself.[/say]")

			saynn("Rahi pulls her paws away, presenting you all of her bits again. So you whip her tits for the second time, sending them to jiggle even. Kitty hisses quietly, the whip leaves visible red lines on her tits. Good. For some reason Rahi only got more wet after all that.")

		else:
			saynn("As you grab a short multi-tailed whip, your kitty starts to shiver slightly, already seeing where this is going. She moves her feline tail out of the way but she is not too eager to present you her butt. You take your time, just dragging the many knotted cords over her curves before suddenly whipping her. Rahi produces a loud painful noise and instantly covers her butt with her paws, rubbing it.")

			saynn("[say=rahi]H-huff!..[/say]")

			saynn("You gently tap them with your tool but she huffs more and shakes her head. So you strike her paws too with the whip, leaving many red lines on them and causing your kitty to yelp and recoil away.")

			saynn("[say=rahi]Ow-w!..[/say]")

			saynn("Her ass or her paws, kitty is quite puzzled, she can't escape the pain either way. In the end, she stops covering herself and lowers her head, patiently awaiting another strike. Your free hand grabs her tail and holds onto it, preventing Rahi from escaping your hits. You let the cords teasingly rest on her butt again for a while, caressing her fur, until you decide to raise the whip and strike her poor ass again, making Rahi huff and yelp.")

			saynn("She clearly wasn't trained enough to be able to extract pleasure out of pain. You deliver a few more strikes, making kitty's butt look striped. Each strike makes Rahi's sound more desperate.")

			saynn("[say=rahi]She is s-sorry-y!..[/say]")

			saynn("[say=pc]If you're sorry, take the punishment like a good girl.[/say]")

			saynn("Rahi pouts. You stand in front of her and start dragging the cords of your whip over her breasts. Her eyes open wide.")

			saynn("[say=rahi]No-o..[/say]")

			saynn("Kitty is terrified, shivering, but also standing as still as possible. You drag the cords for a little longer before raising the whip, about to strike. Rahi closes her eyes and pants heavily. Finally you bring the tool down, letting the many tails hit her breasts with some of them catching her sensitive nips, sending powerful painful impulses that make Rahi produce a cry. Her areolas receive a few cute red lines.")

			saynn("[say=rahi]AGh!..[/say]")

			saynn("She covers her tits and starts shaking her head. You switch the spot again and now tickle her crotch with the whip. Her pussy seems dry. But this is a punishment after all.")

			saynn("[say=rahi]Not there!.. please!.. A-Anywhere but there..[/say]")

			saynn("Sure. You tap at her paws that cover her breasts. Rahi huffs but eventually pulls them away, presenting her chest for another strike. And you deliver it, whipping her breasts so hard that they jiggle. Rahi throws her head back and wiggles her top part of the body, struggling to contain the painful sensations.")

			saynn("[say=rahi]Huf-f-f..[/say]")

		saynn("[say=pc]On your knees.[/say]")

		saynn("Rahi nods and attempts to execute your order. It's really tough when your ankles are connected with a chain, Rahi pretty much just falls forward and lands on her knees instead.")

		saynn("[say=rahi]Here..[/say]")

		addButton("Bodywritings", "Draw some humiliating things on Rahi", "draw_bodywritings")
		addButton("Hot wax", "Pour some hot wax on Rahi", "pour_hotwax")
	if(state == "grope_rahi"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="kneel", npcBodyState={naked=true}})
		saynn("Instead of delivering pain to your kitty, you'd rather prepare her for what's to come next. Your hand lands on her arm and then follows the shoulder line while you circle around her. Naked Rahi stays still and just watches your hand while she can.")

		saynn("After a circle and a half, you stop behind her, your hand starts sliding down her back, between the slightly visible shoulder blades. Rahi's short fur reacts to being caressed by standing on its ends.")

		saynn("Eventually you reach her waist level, both of your hands begin scritching around the area where Rahi's tail begins. That one really sparks a reaction, your kitty is arching her back and shivering even, her tail brushing against your legs and poking them with its tip.")

		saynn("[say=rahi]Tail is a sacred part of any feline.. Usually no one is allowed to touch hers..[/say]")

		saynn("[say=pc]Usually?[/say]")

		saynn("Your hand gently brushes over Rahi's tail. It didn't seem to mind your touch so you caress it more.")

		saynn("[say=rahi]Except for who she really trusts..[/say]")

		saynn("[say=pc]Do you trust me, kitty?[/say]")

		saynn("She doesn't respond. But seeing her tail curling around your hand that strokes it.. The answer is right there, in your palm. You use both hands to give that fluffy tail some attention that it deserves, making sure to not go against Rahi's fur.")

		saynn("After that you slide your hands lower to her butt and suddenly give her buttcheeks a good squeeze.")

		saynn("[say=rahi]Eek![/say]")

		saynn("So soft, you keep groping her behind, making kitty blush and rub her legs together. You follow her legs and start brushing her thighs, both inner and outer sides. Your hand teasingly reaches her crotch while it slides up and down, trapped between her legs. Your kitty is getting quite.. needy.. after your touches.")

		saynn("You walk around her again and this time your hands land under her cute perky breasts, giving them a good squeeze too."+str(" As you do it, a weak stream of her breastmilk begins flowing down your palms." if getCharacter("rahi").canBeMilked() else " No matter how much you grope your kitty's chest, she doesn't seem to be lactating. Which is completely fine.")+"")

		saynn("You skip the giant scar that is still there on her belly and carefully rub her sides instead, your hands following her curves until you reach her hips and pinch them slightly. Rahi looks so.. cute.")

		saynn("[say=rahi]Nya-a.. You can do more if you want, {rahiMaster}..[/say]")

		saynn("[say=pc]Not so fast, kitty. Get on your knees for me.[/say]")

		saynn("[say=rahi]Of course..[/say]")

		saynn("Rahi gets down on her knees for you. You go ahead and grab some cuffs before putting them on her ankles and wrists, making your needy kitty also helpless.")

		saynn("[say=rahi]Huff-f..[/say]")

		addButton("Bodywritings", "Draw some humiliating things on Rahi", "draw_bodywritings")
		addButton("Hot wax", "Pour some hot wax on Rahi", "pour_hotwax")
	if(state == "draw_bodywritings"):
		saynn("You go ahead and fetch a black sharpie. Then you crouch in front of your kitty and begin drawing on her fur.")

		saynn("[say=pc]Don't move or it will look bad.[/say]")

		saynn("Kitty sits still while you draw all sorts of humiliating words on her body. She reads one of them and meows softly.")

		saynn("[say=rahi]That's.. creative.. And embarrassing.. If anyone sees her like this..[/say]")

		saynn("[say=pc]You're gonna show them proudly. Like the slut that you are. Mhm?[/say]")

		saynn("You keep drawing more and more, covering your kitty's fur with these bodywritings. She tilts her head down.")

		saynn("[say=rahi]Of course, {rahiMaster}..[/say]")

		saynn("After you are done, Rahi looks quite slutty. Which is exactly what you wanted.")

		addButton("Finger Rahi", "Tease Rahi's pussy with your fingers", "finger_rahi")
		addButton("Slap pussy", "Slap Rahi's pussy with a riding crop", "slap_pussy")
	if(state == "pour_hotwax"):
		saynn("So much of Rahi is exposed, you get a pretty interesting idea. You find a few wax candles in the box and present them to your kitty. These are some special fat red ones. She gives you a concerned look.")

		saynn("[say=rahi]Are you sure, {rahiMaster}?..[/say]")

		saynn("Without answering her question, you light one of the candles and wait for the wax to start melting. As you bring it closer to your kitty, she starts shivering slightly, her body tensing up.")

		saynn("[say=rahi]This might not be.. ah-h!..[/say]")

		saynn("A singular drop of hot wax hits Rahi's thigh, causing her to wiggle. Soon another one lands near, leaving a red stinging spot.")

		saynn("[say=rahi]It's.. it's very warm.. Feels kinda nice..[/say]")

		saynn("Oh yeah? Since she likes it that much you decide to tilt the candle, causing many more drops of liquid wax to drip onto Rahi's thighs, making her squirm while her legs get covered with these cute red boiling dots.")

		saynn("[say=rahi]Nya-a-a..[/say]")

		saynn("Her toes curl up, she can't clean herself even if she wanted with her cuffed up paws. Rahi is forced to endure the liquid wax cooling down by heating her thighs. And you keep adding more and more of those red hot splotches all over her thighs, creating random shapes and lines.. Rahi is panting and squirming but you're not even close to being done.")

		saynn("[say=pc]Don't move.[/say]")

		saynn("You move the burning candle above her breasts. Rahi sees and huffs.")

		saynn("[say=rahi]W-wai.. Ah!..[/say]")

		saynn("Melted hot wax begins dripping onto her cute tits, forcing a moan out of your kitty. She is biting her lips and shakes her head out of desperation while more and more drops leave their trail on her fur. Oops, you accidentally poured some onto her nipple, making kitty arch her back and squirm harder.")

		saynn("[say=rahi]H-hu-uff.. myaa..[/say]")

		saynn("[say=pc]Want more?[/say]")

		saynn("She shakes her head. Huh, you wonder why. You take a step back and look at her. Rahi's thighs and breasts are covered in these red patterns made out of melted wax. Looks quite fitting for a misbehaved kitty.")

		saynn("And wow, she seems to be quite aroused by this point, rubbing her thighs together and watching you with her lusty eyes.")

		addButton("Finger Rahi", "Tease Rahi's pussy with your fingers", "finger_rahi")
		addButton("Slap pussy", "Slap Rahi's pussy with a riding crop", "slap_pussy")
	if(state == "finger_rahi"):
		playAnimation(StageScene.SexStart, "defeated", {npc="rahi", npcBodyState={naked=true}})
		saynn("Your hands gently push Rahi, making her lie on her back. She quickly realizes that she can't get up anymore.")

		saynn("[say=rahi]H-hey..[/say]")

		saynn("Her complaints quickly disappear when your hand lands on her crotch, your digits finding her sensitive clit and rubbing it. "+str("Even though you whipped her ass not that long ago, kitty quickly gets aroused from your touch." if whippedOrGroped else "She already was aroused after you fondled her butt and tits but now she only gets even more wet.")+"")

		saynn("Two of your digits spread her pussy lips, exposing.. quite a view. Rahi can't help but to blush while you stare inside her needy slit, strings of transparent juices hang between her petals.")

		saynn("You slide two of your digits inside and begin fucking your kitty with them. Rahi arches her back and moans eagerly, her body quivering around your hand. You try to keep her hot and bothered but also far away from her peak, just teasing.")

		saynn("[say=pc]You want something, kitty?[/say]")

		saynn("[say=rahi]Y-yes.. F-faster..[/say]")

		saynn("That would be way too easy. You chuckle and pull your digits away from her dripping pussy before bringing your wet hand close to her mouth.")

		saynn("[say=pc]Lick.[/say]")

		saynn("Without any extra convincing, Rahi starts to eagerly lick her own juices off your digits. Her rough tongue tickles your digits until they are clean.")

		saynn("[say=pc]Good girl.[/say]")

		saynn("She looks at you with big kitty eyes, expecting something.")

		addButton("Vibro toys", "Make Rahi cum using toys", "vibro_toys")
		addButton("Clamps+E-stim", "Make Rahi feel lots of pain", "estim")
	if(state == "slap_pussy"):
		playAnimation(StageScene.SexStart, "defeated", {npc="rahi", npcBodyState={naked=true}})
		saynn("Enough games, you find a riding crop and present it to Rahi. It's basically a long bendy stick that has a little flat part on its tip that you can use to slap someone. And slap someone you will.")

		saynn("You approach Rahi and carefully push her down to the floor. She mewls as she realizes that she can't get up without your help.")

		saynn("[say=rahi]Mee-eow.. What's that for..[/say]")

		saynn("Instead of explaining it, you begin guiding the crop along her curves, sometimes gently tapping on them. You reach her hips.. waist.. legs.. thighs.. The flat part slides between her legs and taps at Rahi's thighs, making her spread her legs as much as her cuffs allow.")

		saynn("After all that, the crop reaches the girl's pussy.. gently brushing over the sensitive parts. Rahi is shivering..")

		var masLevel = getModule("RahiModule").getSkillScore("rahiSkillMasochist")
		if (masLevel > 6):
			saynn("Suddenly you smack her pussy with the crop. A loud passionate noise escapes from Rahi.. a noise of.. pleasure? You tap her pussy slit with the crop again and see her squirming and moaning while her moist petals pulsate after the impact.")

			saynn("[say=pc]Such a painslut.[/say]")

			saynn("Rahi looks you in the eyes and nods subtly. She is just begging for more so why make her wait. Your hand raises the crop slightly before bringing it down, delivering a painful hit on Rahi's clit and lips. A stifled cry of pleasure escapes from Rahi, her needy pussy already looks slightly red.")

			saynn("You keep smacking your slut's cunt more and more, sending sharp stinging sensations that she can't get enough of. She is both hissing and moaning. Is she.. about to cum?.. Nah, if she is gonna cum from pain, that pain is gonna be much stronger.")

		else:
			saynn("Suddenly you smack her pussy with the crop. A loud painful cry escapes from Rahi. She is huffing and puffing at you. You tap her pussy slit again a few times, causing her to squirm and try to avoid your hits, her dry petals pulsate after the impacts.")

			saynn("[say=rahi]It hu-urts.. sorry-y-y..[/say]")

			saynn("[say=pc]Stay still and take it. Don't act like a bad girl.[/say]")

			saynn("She huffs again but stops resisting, giving you access to her pussy again. You slide the crop between her legs and gently smack her pussy again until it turns slightly red. Rahi keeps producing stifled painful noises after each hit.")

			saynn("These sharp stinging sensations won't make her cum but at least they seem to teach her a good lesson. You wonder if you should switch to the carrot or follow the painful route to the end.")

		addButton("Vibro toys", "Make Rahi cum using toys", "vibro_toys")
		addButton("Clamps+E-stim", "Make Rahi feel lots of pain", "estim")
	if(state == "vibro_toys"):
		saynn("Rahi is panting after you "+str("whipped" if whippedOrGroped else "groped")+", "+str("wrote some humiliating things" if bodywritingsOrWax else "poured some hot melted wax")+" and "+str("fingered her pussy" if lickedOrSlapped else "slapped her pussy")+". But now is the time to make her cum.. hard.")

		saynn("You grab a few little pink bullet vibrators and begin tapping them all around Rahi. Two get taped to her nipples, third one gets taped to her clit and the last one gets gently shoved up her slit. Rahi is still completely helpless because of the cuffs.")

		saynn("[say=rahi]This might be too much..[/say]")

		saynn("[say=pc]Should I remove them?[/say]")

		saynn("Your kitty shakes her head and huffs. Your hands find all the remotes and switch the toys on, making them buzz against Rahi's sensitive spots. It doesn't take long for her to begin squirming in front of you, her eyes show lust"+str(" even after you whipped her pussy with the crop" if !lickedOrSlapped else "")+".")

		saynn("[say=rahi]Nya-a..[/say]")

		saynn("Kitty's moans become louder and more passionate, little shivers happening in random parts of her body, her eager wet pussy dripping arousal while so many vibrating toys bring her pleasure.")

		saynn("[say=rahi]She.. she is g-gonna..[/say]")

		saynn("Saying no now would be pretty cruel. So you don't say anything and just increase the toy's strength. Rahi squirms hard, thrashing against her cuffs.")

		saynn("[say=rahi]Myaa!.. {rahiMaster}!.. Please!..[/say]")

		saynn("Orgasm takes over Rahi's body, causing random muscles in her body to tense and relax uncontrollably, draining the kitty. Even after the ecstatic waves had begun washing over her, the toy kept buzzing inside her, making her pussy twitch actively until finally spraying the floor with her girlcum.")

		saynn("[say=pc]Did you ask for permission, kitty?[/say]")

		saynn("Rahi's lusty eyes suddenly fill with fear. It's way too late for her to ask for it and she knows it. But her mind is too busy dealing with the absurd amount of pleasure going her way. One of the toys slips off her stiff nipples.")

		saynn("[say=rahi]S-she.. d-d.. n-not..[/say]")

		saynn("[say=pc]Relax kitty, you weren't required to.[/say]")

		saynn("Kitty lets out a nervous giggle while riding the last of her orgasmic waves. Her moans get replaced with noises of discomfort as the toys continue overstimulating her sensitive spots. She looks at you with pleading eyes.")

		saynn("[say=rahi]E-enough.. m-maybe?..[/say]")

		saynn("She was quick enough to add that maybe at the end to make herself not sound so demanding.")

		saynn("[say=pc]Are you sorry for what you did?[/say]")

		saynn("Rahi nods-nods many times while her body still squirms a lot.")

		saynn("[say=pc]Say it.[/say]")

		saynn("[say=rahi]She is sorry!.. Very-very sorry, couldn't be more sorry, won't happen again..[/say]")

		saynn("Hm. Almost sounds like kitty just says what you want to hear. So you torture her more, letting the toys stimulate her sensitive bits further until her pussy looks slightly redder.")

		saynn("[say=pc]Sorry for what?[/say]")

		saynn("[say=rahi]Nyaa..ah-h.. For lying to you, {rahiMaster}!..[/say]")

		saynn("You chuckle while Rahi is being desperate, her moans are a mix of pleasure, annoyance and pain.")

		saynn("[say=pc]Now say it fully.[/say]")

		saynn("[say=rahi]HUFF![/say]")

		saynn("You raise the toy's power to the maximum, making them vibrate inside and outside Rahi at a crazy speed while driving her insane. Poor kitty keeps moaning until she suddenly cums again, her body arching itself while her poor overstimulated slit squirts again.")

		saynn("[say=rahi]S-she is sorry for lying to you, {rahiMaster}! She is sorry for stealing the b-bottle too, won't happen again..[/say]")

		saynn("[say=pc]Much better.[/say]")

		saynn("Finally, you turn off the buzzing toys and begin to fetch them back. Rahi is left a panting wet mess on the floor.")

		saynn("[say=rahi]T-thank you.. myaa-a..[/say]")

		saynn("You let Rahi rest while you begin uncuffing her paws and ankles.")

		addButton("Continue", "See what happens next", "cuddle_rahi")
	if(state == "estim"):
		saynn("Rahi is panting after you "+str("whipped" if whippedOrGroped else "groped")+", "+str("wrote some humiliating things" if bodywritingsOrWax else "poured some hot melted wax")+" and "+str("fingered her pussy" if lickedOrSlapped else "slapped her pussy")+". But now is the time to show her the real pain.")

		saynn("You grab a pair of metal nipple clamps and attach them to Rahi's nipples, forcing a yelp out of her. The clamps are small but they pinch so well that Rahi can't stop squirming already. You stop her by pinning her before attaching another clamp but to her clit instead, pinching that sensitive area as well.")

		saynn("[say=rahi]She is sorry-y!..[/say]")

		var masLevel = getModule("RahiModule").getSkillScore("rahiSkillMasochist")
		if (masLevel > 6):
			saynn("Even though it's clearly painful for Rahi, you notice that her pussy is quite wet! Which makes you want to test how far you can push her.")

		else:
			saynn("It's clearly quite painful for her, meaning she is not even slightly wet. But that's good, which means she treats it as a real punishment.")

		saynn("[say=pc]Can't hear you kitty.[/say]")

		saynn("She keeps dragging her words but you're not even done yet. You find a cattle prod in your box of fun toys. It's basically a stick with a little fork at the end. And when you press a button on it, a little lightning appears inside that fork, while also making a crackling noise. Scary. Rahi's eyes open wide when she sees it.")

		if (masLevel > 6):
			saynn("[say=rahi]She likes pain but.. mya..[/say]")

		else:
			saynn("[say=rahi]Is that really necessary, {rahiMaster}..[/say]")

		saynn("[say=pc]You haven't tried it yet.[/say]")

		saynn("And she doesn't really have a choice. You begin dragging the prod over her fur, making circles around Rahi's breasts and belly. Kitty shivers and whines while you do that.")

		if (masLevel > 6):
			saynn("Suddenly you press the cattle prod against Rahi's hip and press a button that sends a little electrical shock through her. A loud moan escapes from her lips that she probably didn't even expect herself.")

			saynn("[say=rahi]Meow..[/say]")

			saynn("Huh. You decide to test Rahi by poking her other hip and pressing the button again. Rahi arches her back and lets out another noise of love. Her cute breasts bounce a lot while she wiggles.")

			saynn("The more you poke her in various spots, the lustier her eyes are.")

			saynn("[say=pc]Don't tell me..[/say]")

			saynn("You decide to be very mean and poke one of the metal clamps that are pinching Rahi's nips. The electrical shock that goes through it and the girl's breasts causes her to produce a long stifled noise."+str(" Some milk squirts out of her nips!" if getCharacter("rahi").canBeMilked() else "")+"")

			saynn("Your kitty is panting heavily, she is dripping juices so much that there is a little wet spot under her. Wasn't this supposed to be a punishment?")

			saynn("[say=rahi]S-she is very sorry for lying and stealing that bottle.. Please.. Do it more..[/say]")

			saynn("At least you heard what you wanted to hear. Might as well fulfill her wish now. Your hand brings the cattle prod down to her crotch and presses it against the clit that is still pinched by that metal clamp. As you press that button, a loud lust-filled noise escapes from Rahi, her pussy spasming from electricity so much that it suddenly starts squirting juices everywhere. All the while kitty is panting and squirming under you.")

			saynn("[say=rahi]Nya-a-a-a!..[/say]")

			saynn("What a slut.")

		else:
			saynn("Suddenly you press the cattle prod against Rahi's hip and press a button that sends a little electrical shock through her. She jerks away from the impulse and hisses from the painful sensations.")

			saynn("[say=rahi]Ow-ow.. She is sorry!..[/say]")

			saynn("You chuckle. Seems like pain really helps your kitty behave. You bring the tool to her her side and poke her again, sending another shock that causes kitty to jerk to the other side.")

			saynn("[say=rahi]Huf-ff..[/say]")

			saynn("[say=pc]What are you sorry for, kitty?[/say]")

			saynn("[say=rahi]For.. for lying.. And stealing too..[/say]")

			saynn("Suddenly you bring the cattle prod to Rahi's nipples and press it against one of her clamps before pressing the button again, sending such a powerful shock that Rahi is arching her back and whining loudly.")

			saynn("[say=rahi]Why-y-y.. She said everything!.. She won't do it again!..[/say]")

			saynn("[say=pc]Do what? Say the whole thing, kitty.[/say]")

			saynn("You bring the prod to her other nipple and threaten to press the button again.")

			saynn("[say=rahi]She!.. She is sorry.. sorry for lying to you, {rahiMaster}.. Sorry for stealing that bottle and not telling you.. It won't happen again!..[/say]")

			saynn("That sounded quite sincere. But you press the button anyways, causing your kitty to produce another noise of pain as more electricity goes through her sensitive nips, causing kitty to shiver.")

			saynn("You were about to put it away when suddenly..")

			saynn("[say=rahi]Huf-f-f.. Poke yourself with it instead..[/say]")

			saynn("Kitty's bratty side has decided to show herself. Rahi is already regretting saying it as you slide the cattle prod down her curves and move the tip to brush against her pinched clit.")

			saynn("[say=rahi]No!.. Sorry! Ple-ease!..[/say]")

			saynn("Your hand presses the cattle prod against the clamp there before sending another shock, this time going straight through her dry pussy! Rahi thrashes against her restraints while her pussy twitches and pulsates non-stop. A pain-filled scream escapes her lungs, so loud that she begins to sound raspy.")

			saynn("[say=pc]I'm glad that it won't happen again, kitty.[/say]")

			saynn("Rahi is left panting heavily on the floor.")

		addButton("Continue", "See what happens next", "cuddle_rahi")
	if(state == "cuddle_rahi"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcBodyState={naked=true}})
		saynn("Time for some rest, you unlock Rahi's cuffs and pull her onto the bed for some cuddles. She seems to just close her eyes and let you embrace her.")

		saynn("[say=pc]Did I go too far, kitty?[/say]")

		saynn("A few seconds of silence.")

		saynn("[say=rahi]Nu.. thank you, {rahiMaster}.. she.. needed that..[/say]")

		saynn("You rub your cheek against her and just continue cuddling her for a while.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "pc_realizes"):
		processTime(5*60)

	if(_action == "check_bathrooms"):
		processTime(3*60)

	if(_action == "check_waterfall"):
		processTime(5*60)

	if(_action == "go_back_to_cell"):
		processTime(6*60)

	if(_action == "orderUndress"):
		orderedOrUndressed = true
		getCharacter("rahi").getInventory().equipItem(GlobalRegistry.createItem("inmatewristcuffs"))
		getCharacter("rahi").getInventory().equipItem(GlobalRegistry.createItem("inmateanklecuffs"))

	if(_action == "undressRahi"):
		orderedOrUndressed = false
		getCharacter("rahi").getInventory().equipItem(GlobalRegistry.createItem("inmatewristcuffs"))
		getCharacter("rahi").getInventory().equipItem(GlobalRegistry.createItem("inmateanklecuffs"))

	if(_action == "whip_rahi"):
		processTime(2*60)
		whippedOrGroped = true

	if(_action == "grope_rahi"):
		processTime(2*60)
		whippedOrGroped = false

	if(_action == "draw_bodywritings"):
		bodywritingsOrWax = true
		var rahi = getCharacter("rahi")
		for _i in range(10):
			var zone = BodyWritingsZone.getRandomZone()
			rahi.addBodywriting(zone, BodyWritings.getRandomWritingIDForZone(zone))

	if(_action == "pour_hotwax"):
		bodywritingsOrWax = false
		getCharacter("rahi").coverBodyWithFluid("HotWax", 50)

	if(_action == "finger_rahi"):
		lickedOrSlapped = true

	if(_action == "slap_pussy"):
		lickedOrSlapped = false

	if(_action == "vibro_toys"):
		dildoesOrElectroshock = true

	if(_action == "estim"):
		dildoesOrElectroshock = false

	if(_action == "cuddle_rahi"):
		processTime(10*60)
		getCharacter("rahi").resetEquipment()

	setState(_action)

func saveData():
	var data = .saveData()

	data["wasKind"] = wasKind
	data["orderedOrUndressed"] = orderedOrUndressed
	data["whippedOrGroped"] = whippedOrGroped
	data["bodywritingsOrWax"] = bodywritingsOrWax
	data["lickedOrSlapped"] = lickedOrSlapped
	data["vibroOrClamps"] = vibroOrClamps
	data["humiliatedOrPraised"] = humiliatedOrPraised
	data["dildoesOrElectroshock"] = dildoesOrElectroshock

	return data

func loadData(data):
	.loadData(data)

	wasKind = SAVE.loadVar(data, "wasKind", false)
	orderedOrUndressed = SAVE.loadVar(data, "orderedOrUndressed", false)
	whippedOrGroped = SAVE.loadVar(data, "whippedOrGroped", false)
	bodywritingsOrWax = SAVE.loadVar(data, "bodywritingsOrWax", false)
	lickedOrSlapped = SAVE.loadVar(data, "lickedOrSlapped", false)
	vibroOrClamps = SAVE.loadVar(data, "vibroOrClamps", false)
	humiliatedOrPraised = SAVE.loadVar(data, "humiliatedOrPraised", false)
	dildoesOrElectroshock = SAVE.loadVar(data, "dildoesOrElectroshock", false)
