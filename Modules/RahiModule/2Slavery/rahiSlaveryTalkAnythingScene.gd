extends SceneBase

func _init():
	sceneID = "rahiSlaveryTalkAnythingScene"

func _reactInit():
	addCharacter("rahi")
	var talkedTopics = getFlag("RahiModule.rahiTalkedTopics", {})
	var possibleTopics = []
	var allTopics = []
	
	var slaveryStage = getModule("RahiModule").getSlaveryStage()
	
	if(slaveryStage >= 0):
		allTopics.append_array(["0_wonder", "0_alcohol", "0_steal", "0_doctor"])
	if(slaveryStage >= 1):
		allTopics.append_array(["1_nothappy", "1_kind", "1_mother", "1_sorry"])
	if(slaveryStage >= 1):
		allTopics.append("pic1")
	if(slaveryStage >= 2 && talkedTopics.has("pic1")):
		allTopics.append("pic2")
	if(slaveryStage >= 2):
		allTopics.append_array(["2_sorry", "2_engineer", "2_like"])
	if(slaveryStage >= 3):
		allTopics.append_array(["3_normal", "3_shy", "3_like"])
	if(slaveryStage >= 3 && talkedTopics.has("pic2")):
		allTopics.append("pic3")
		allTopics.append("pic4")
	if(slaveryStage >= 4):
		allTopics.append_array(["4_gun", "4_think", "4_stealing"])
	if(slaveryStage >= 5):
		allTopics.append_array(["5_sorry", "5_father", "5_meow"])
	if(slaveryStage >= 5 && talkedTopics.has("pic4")):
		allTopics.append("pic5")
	if(slaveryStage >= 6):
		allTopics.append_array(["6_fresh", "6_talk", "6_quinn"])
	if(slaveryStage >= 7):
		allTopics.append_array(["7_happy"])
	if(slaveryStage >= 8):
		allTopics.append_array(["8_thankyou"])
	
	for topic in allTopics:
		if(talkedTopics.has(topic)):
			continue
		possibleTopics.append(topic)
	
	
	if(possibleTopics.size() > 0):
		var randomTopic = possibleTopics[0]#RNG.pick(possibleTopics)
		talkedTopics[randomTopic] = true
		setFlag("RahiModule.rahiTalkedTopics", talkedTopics)
		setState(randomTopic)

func _run():
	if(state == ""):
		saynn("You ask if Rahi has anything to talk about.")

		saynn("[say=rahi]Sorry, {rahiMaster}. She has run out of things to talk about..[/say]")

		saynn("Fair enough. Maybe you can ask her again when your relationship advances.")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "pic1"):
		saynn("[say=rahi]Hey, {rahiMaster}.. She found a black marker and some paper.. Wanna see what she drew?[/say]")

		saynn("You don't see why not. Nervous Rahi shows you the picture.")

		saynn("[img=500]res://Modules/RahiModule/RahiPics/rahi1.png[/img]")

		saynn("[say=rahi]It's a.. self-portrait?[/say]")

		addButton("Cute", "Tell her that the picture is cute", "pic1_cute")
		addButton("Meh", "Tell her that she has lots to learn to still", "pic1_meh")
	if(state == "pic1_cute"):
		saynn("[say=pc]It's a cute one. Good job, kitty.[/say]")

		saynn("Rahi purrs.")

		saynn("[say=rahi]Maybe she will draw more then..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "pic1_meh"):
		saynn("[say=pc]You have a lot to learn, kitty.[/say]")

		saynn("Rahi lowers her head.")

		saynn("[say=rahi]You're right.. She will try harder next time..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "pic2"):
		saynn("[say=rahi]She drew another picture today.. wanna see it?[/say]")

		saynn("[say=pc]Sure, kitty.[/say]")

		saynn("Rahi shows you her second drawing.")

		saynn("[img=500]res://Modules/RahiModule/RahiPics/rahi2.png[/img]")

		saynn("[say=pc]Why are you so sad, kitty?[/say]")

		saynn("[say=rahi]Because.. She has no apples?.. But then you gave her one! Thank you, {rahiMaster}![/say]")

		addButton("Good job", "Tell Rahi that she did a good job", "pic2_goodjob")
		addButton("Too sad", "Tell Rahi that the picture is too sad", "pic2_toosad")
	if(state == "pic2_goodjob"):
		saynn("[say=pc]Good job, kitty. Didn't know you liked apples so much.[/say]")

		saynn("Rahi purrs and bounces happily.")

		saynn("[say=rahi]Meow-meow.[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "pic2_toosad"):
		saynn("[say=pc]It's.. too sad, kitty. Why would you draw yourself sad? Why not the opposite.[/say]")

		saynn("Rahi lowers her head. Then she suddenly tears the picture in half.")

		saynn("[say=rahi]You're right.. She will draw something better..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "pic3"):
		saynn("[say=rahi]She drew another picture today.. It's a bit.. Wanna see?[/say]")

		saynn("You nod. Rahi slowly turns the drawing that she holds so you can see it.")

		saynn("[img=500]res://Modules/RahiModule/RahiPics/rahi3.png[/img]")

		saynn("[say=pc]What made you draw that, kitty?[/say]")

		saynn("Rahi blushes.")

		saynn("[say=rahi]Nothing in particular?..[/say]")

		saynn("[say=pc]These cuffs don't look like they can hold you.[/say]")

		saynn("Rahi meows and rubs her feline nose.")

		addButton("Kinky", "Tell Rahi that its a kinky one", "pic3_kinky")
		addButton("Very silly", "Tell Rahi that she drew a silly picture", "pic3_silly")
	if(state == "pic3_kinky"):
		saynn("[say=pc]It's quite kinky. You even found the red marker for it.[/say]")

		saynn("Rahi nods-nods and purrs.")

		saynn("[say=pc]Maybe we will do that to you.[/say]")

		saynn("Your words make her blush again.")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "pic3_silly"):
		saynn("[say=pc]It's more silly than sexy, kitty. Don't know if that was the idea.[/say]")

		saynn("Rahi blinks many times.")

		saynn("[say=rahi]Yeah.. silly fun..[/say]")

		saynn("[say=pc]Ever saw how professional artists draw? It takes years.[/say]")

		saynn("[say=rahi]You're right..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "pic4"):
		saynn("[say=rahi]Wanna see another drawing from her?..[/say]")

		saynn("[say=pc]Sure, kitty.[/say]")

		saynn("Rahi shows you the picture.")

		saynn("[img=500]res://Modules/RahiModule/RahiPics/rahi4.png[/img]")

		saynn("[say=pc]Why didn't you take the apple?[/say]")

		saynn("Kitty's ears droop.")

		saynn("[say=pc]Almost like that other cat is trying to seduce you.[/say]")

		saynn("Rahi shakes her head.")

		saynn("[say=pc]Good job, keep practicing.[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "pic5"):
		saynn("[say=rahi]Hey.. Wanna see what she drew just now?..[/say]")

		saynn("[say=pc]I always do, kitty.[/say]")

		saynn("Rahi shows you her drawing.")

		saynn("[img=500]res://Modules/RahiModule/RahiPics/rahi5.png[/img]")

		saynn("[say=pc]Oh wow, that's a comic.[/say]")

		saynn("[say=rahi]Yeah.. it's about how headpats make her happy..[/say]")

		saynn("[say=pc]But then you get sad again?[/say]")

		saynn("[say=rahi]Pats are a finite resource..[/say]")

		addButton("Pat Rahi", "Give that kitty some good headpats", "pic5_pat")
		addButton("Nod", "That makes sense", "endthescene")
	if(state == "pic5_pat"):
		saynn("You pull your kitty closer to you and begin patting her many times. So much that her ears get flat with her head.")

		saynn("Rahi can't stop purring and rubbing her cheek against you.")

		saynn("Very cute.")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "0_wonder"):
		saynn("[say=rahi]She wonders if you.. training her.. is gonna help.. That task was pretty hard..[/say]")

		addButton("It takes time", "Tell Rahi this", "0_wonder_time")
		addButton("Do as I say", "Tell Rahi this", "0_wonder_do")
	if(state == "0_wonder_time"):
		saynn("[say=pc]It will take time, kitty. A lot of time.[/say]")

		saynn("Rahi nods.")

		saynn("[say=rahi]Of course..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "0_wonder_do"):
		saynn("[say=pc]Just do as I say, kitty. Leave all the thinking to me.[/say]")

		saynn("Rahi lowers her head.")

		saynn("[say=rahi]You're probably right..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "0_alcohol"):
		saynn("[say=rahi]Alcohol was a good escape for her.. For a while.. Whiskey numbs her tongue.. and mind..[/say]")

		addButton("Health problems", "Tell Rahi that it's not healthy", "0_alcohol_health")
		addButton("Not anymore", "Tell Rahi that that lifestyle is over", "0_alcohol_notanymore")
	if(state == "0_alcohol_health"):
		saynn("[say=pc]It's a huge health risk, kitty. The sooner you get rid of that addiction, the better.[/say]")

		saynn("Her ears droop.")

		saynn("[say=rahi]But.. What's the alternative..[/say]")

		saynn("[say=pc]You will figure it out.[/say]")

		saynn("Rahi nods softly.")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "0_alcohol_notanymore"):
		saynn("[say=pc]Not anymore it's not. That lifestyle is over, kitty.[/say]")

		saynn("Rahi pouts.")

		saynn("[say=rahi]Why..[/say]")

		saynn("[say=pc]Because I said so.[/say]")

		saynn("[say=rahi]Fair enough..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "0_steal"):
		saynn("[say=rahi]She used to steal things.. Others usually don't suspect a little brown kitty.. Her dad was so angry when he found out..[/say]")

		addButton("You had to", "Tell Rahi this", "0_steal_hadto")
		addButton("Screw dad", "Tell Rahi this", "0_steal_screw")
	if(state == "0_steal_hadto"):
		saynn("[say=pc]You had to do it, kitty. I'm sure.[/say]")

		saynn("Rahi smiles.")

		saynn("[say=rahi]Alternatives weren't the best, yes..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "0_steal_screw"):
		saynn("[say=pc]Screw your dad, he doesn't understand anything.[/say]")

		saynn("Rahi lowers her head.")

		saynn("[say=rahi]He was very kind.. Was..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "0_doctor"):
		saynn("[say=rahi]That doctor is such a.. meanie.. Do you agree?[/say]")

		addButton("Yes", "Say this", "0_doctor_yes")
		addButton("Has reasons", "Say this", "0_doctor_hasreasons")
	if(state == "0_doctor_yes"):
		saynn("[say=pc]I agree, kitty. I'm glad I saved you from her.[/say]")

		saynn("Rahi purrs.")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "0_doctor_hasreasons"):
		saynn("[say=pc]She probably has her reasons. Maybe she just likes you.[/say]")

		saynn("Rahi shakes her head.")

		saynn("[say=rahi]If she liked her, she would leave her alone..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "1_nothappy"):
		saynn("[say=rahi]If you're not happy with her.. We can stop..[/say]")

		addButton("Happy", "Tell Rahi that you're happy with her", "1_nothappy_happy")
		addButton("Shush", "Shush Rahi", "1_nothappy_shush")
	if(state == "1_nothappy_happy"):
		saynn("[say=pc]Why would I not be? That last heist was very fun. You saved us.[/say]")

		saynn("Rahi purrs.")

		saynn("[say=rahi]And now we have lots of toys..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "1_nothappy_shush"):
		saynn("You shush Rahi.")

		saynn("[say=pc]Don't ever say that. Anything that I don't like about you I will change.[/say]")

		saynn("Rahi nods and lowers her head.")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "1_kind"):
		saynn("[say=rahi]You were so kind with the kitty when we first met.. You are probably the only person who understands her..[/say]")

		addButton("I'm glad", "Tell Rahi this", "1_kind_glad")
		addButton("Not true", "Tell Rahi this", "1_kind_nottrue")
	if(state == "1_kind_glad"):
		saynn("[say=pc]I'm glad you think this way about me, kitty.[/say]")

		saynn("Rahi smiles.")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "1_kind_nottrue"):
		saynn("[say=pc]That's just not true, kitty. I'm sure there are many others who can also empathize with you. What about your family?[/say]")

		saynn("Rahi shrugs.")

		saynn("[say=rahi]Her father is kind.. But she argued a lot with him.. Her brother.. is the reason why she is here..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "1_mother"):
		saynn("[say=rahi]Her mother died when she was little.. All she had were her dad and brother.. Probably why Rahi ended up the way she is..[/say]")

		addButton("Rahi?", "Why did she use her name", "1_mother_rahi")
		addButton("How little", "Ask how little Rahi was when her mother died", "1_mother_howlittle")
	if(state == "1_mother_rahi"):
		saynn("[say=pc]Rahi?[/say]")

		saynn("Rahi nods.")

		saynn("[say=rahi]Rahi was way more.. assertive..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "1_mother_howlittle"):
		saynn("[say=pc]How little were you when mom passed away?[/say]")

		saynn("Rahi lowers her head.")

		saynn("[say=rahi]Her mother died during birth..[/say]")

		saynn("Ouch.")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "1_sorry"):
		saynn("[say=rahi]She wants to say.. that she is sorry.. that she tried to end her life.. That won't happen ever again..[/say]")

		addButton("Hug Rahi", "Hug this precious kitty", "1_sorry_hug")
		addButton("It better not", "Tell Rahi this", "1_sorry_betternot")
	if(state == "1_sorry_hug"):
		playAnimation(StageScene.Hug, "hug", {npc="rahi"})
		saynn("Instead of saying anything you just walk up to Rahi and give her a tight hug. The feline mewls surprised and then proceeds to purr in your hands.")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "1_sorry_betternot"):
		saynn("[say=pc]It better not, kitty. Another trick like that and I will have to keep you leashed at all times.[/say]")

		saynn("Rahi is.. thinking about your proposal.. You give her a smack on the rear to speed that process up.")

		saynn("[say=rahi]Yeah, she won't..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "2_sorry"):
		saynn("[say=rahi]Sorry for lying to you, {rahiMaster}..[/say]")

		addButton("It's okay", "Tell Rahi this", "2_sorry_itsokay")
		addButton("Bad kitty", "Tell Rahi this", "2_sorry_badkitty")
	if(state == "2_sorry_itsokay"):
		saynn("[say=pc]It's okay, kitty. You got a good lesson out of it.[/say]")

		saynn("She nods.")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "2_sorry_badkitty"):
		saynn("[say=pc]You broke the rules, kitty. That makes you a very bad kitty.[/say]")

		saynn("[say=rahi]You don't have to be kind with..[/say]")

		saynn("You cut Rahi off.")

		saynn("[say=pc]A very bad whore of a slave.[/say]")

		saynn("That had a bigger effect. Rahi nods and assumes a submissive pose, lowering her chin and holding her paws by her sides.")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "2_engineer"):
		saynn("[say=rahi]She always wanted to become an engineer.. Make things, repair things, break things to make and repair other things.. That kind of stuff..[/say]")

		addButton("What stopped?", "Ask Rahi about why she didn't end up being an engineer", "2_engineer_whatstopped")
		addButton("Kitty is better", "Tell Rahi that her being your kitty is better", "2_engineer_kittyisbetter")
	if(state == "2_engineer_whatstopped"):
		saynn("[say=pc]What stopped you, kitty?[/say]")

		saynn("Rahi sighs.")

		saynn("[say=rahi]Any kind of education was very expensive.. Father did his best for her and her brother..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "2_engineer_kittyisbetter"):
		saynn("[say=pc]But then you wouldn't be my kitty. And being a kitty that belongs to someone is much better, isn't it?[/say]")

		saynn("Rahi offers you a small smile.")

		saynn("[say=rahi]You're right, {rahiMaster}.. She wouldn't be here then.. with you.[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "2_like"):
		saynn("[say=rahi]She.. never asked before.. Do you even like how kitty looks?..[/say]")

		addButton("I do", "Tell Rahi this", "2_like_do")
		addButton("Doesn't matter", "Tell Rahi this", "2_like_matter")
	if(state == "2_like_do"):
		saynn("[say=pc]You are one pretty kitty.[/say]")

		saynn("[say=rahi]But.. she is so.. simple.. Just a brown kitty..[/say]")

		saynn("You shrug.")

		saynn("[say=pc]Sometimes simplicity is good.[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "2_like_matter"):
		saynn("[say=pc]It really doesn't matter, kitty. All the bondage gear is what makes you look like a beautiful slave.[/say]")

		saynn("Rahi blushes and covers her eyes for a second.")

		saynn("[say=rahi]Huff..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "3_normal"):
		saynn("[say=rahi]Do you think that this.. What we're doing.. is normal?..[/say]")

		addButton("It's fun", "Tell Rahi this", "3_normal_fun")
		addButton("It's not", "Tell Rahi this", "3_normal_not")
	if(state == "3_normal_fun"):
		saynn("[say=pc]It's fun and that's all that matters, kitty. If you have any concerns - tell me.[/say]")

		saynn("Rahi nods.")

		saynn("[say=rahi]She has no concerns, {rahiMaster}..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "3_normal_not"):
		saynn("[say=pc]Me making you my kitty? Others will say that it's not normal. But who cares about them? You need more discipline in your life. And I'm here to provide.[/say]")

		saynn("Rahi smiles warmly.")

		saynn("[say=rahi]Thank you for that, {rahiMaster}..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "3_shy"):
		saynn("[say=rahi]Is it bad that she is so shy and quiet?..[/say]")

		addButton("No", "Tell Rahi this", "3_shy_no")
		addButton("Yes", "Tell Rahi this", "3_shy_yes")
	if(state == "3_shy_no"):
		saynn("[say=pc]It's not. If being quiet makes you comfortable - be quiet, kitty. You have me to protect you.[/say]")

		saynn("Rahi smiles.")

		saynn("[say=rahi]That's good to know..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "3_shy_yes"):
		saynn("[say=pc]In this prison.. yeah, it's a bad trait. You gotta be loud if you don't wanna be bullied. But right now you have my protection, kitty.[/say]")

		saynn("Rahi smiles.")

		saynn("[say=rahi]That's good to know..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "3_like"):
		saynn("[say=rahi]She really liked.. what we did.. out there near the waterfall..[/say]")

		addButton("Me too", "Tell Rahi this", "3_like_metoo")
		addButton("Great pussy", "Tell Rahi this", "3_like_greatfuck")
	if(state == "3_like_metoo"):
		saynn("[say=pc]Me too, kitty. We should do it more.[/say]")

		saynn("[say=rahi]Nya..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "3_like_greatfuck"):
		saynn("[say=pc]Yeah, your pussy is great, kitty.[/say]")

		saynn("Rahi blushes and blinks many times.")

		saynn("[say=rahi]Oh.. It's not just about her pussy though, right?..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "4_gun"):
		saynn("[say=rahi]She still can't believe that she agreed to rob that person.. with a gun..[/say]")

		addButton("Got tricked", "Tell Rahi this", "4_gun_hadto")
		addButton("Good plan", "Tell Rahi that it was a good plan that didn't worked out", "4_gun_goodplan")
	if(state == "4_gun_hadto"):
		saynn("[say=pc]You got tricked into doing it, kitty. You practically had no choice.[/say]")

		saynn("Rahi puts on her sad eyes and thinks about it.")

		saynn("[say=rahi]She made many choices.. She tricked herself in the end..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "4_gun_goodplan"):
		saynn("[say=pc]It was a good plan, those AlphaCorp pigs need a good shaking once in a while. Sucks that your cough betrayed you.[/say]")

		saynn("Rahi sighs.")

		saynn("[say=rahi]Maybe..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "4_think"):
		saynn("[say=rahi]Is there something particular that you like about her, {rahiMaster}?..[/say]")

		addButton("Face", "Tell Rahi this", "4_think_face")
		addButton("Voice", "Tell Rahi this", "4_think_voice")
		addButton("Fur", "Tell Rahi this", "4_think_fur")
		addButton("Pussy", "Tell Rahi this", "4_think_pussy")
		addButton("Ass", "Tell Rahi this", "4_think_ass")
		addButton("Everything", "Tell Rahi this", "4_think_everything")
	if(state == "4_think_face"):
		saynn("[say=pc]You have a pretty cute face, kitty.[/say]")

		saynn("Rahi gets all shy and blushy when you look at her.")

		saynn("[say=rahi]You too!..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "4_think_voice"):
		saynn("[say=pc]You have a very calming voice, kitty.[/say]")

		saynn("Rahi can't hide her purring.")

		saynn("[say=rahi]It's just a feline voice, me-eow..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "4_think_fur"):
		saynn("[say=pc]Your fur feels nice and soft.[/say]")

		saynn("Your hand on Rahi's exposed parts and strokes her fur, making the kitty wiggle slightly.")

		saynn("[say=rahi]A kitty without any fur would be weird..[/say]")

		saynn("[say=pc]But yours is extra soft.[/say]")

		saynn("She blushes.")

		saynn("[say=rahi]Maybe it's because she often licks.. nevermind..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "4_think_pussy"):
		saynn("[say=pc]Your pussy feels great to fuck, kitty. Couldn't ask for a better one.[/say]")

		saynn("Rahi blushes and pouts while you stare at her crotch.")

		saynn("[say=rahi]She has other parts..[/say]")

		saynn("[say=pc]Yeah, your tits are great too.[/say]")

		saynn("Now you got her all flustered too.")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "4_think_ass"):
		saynn("[say=pc]You have a very gropable ass. Would caress it all day if I could.[/say]")

		saynn("Rahi blushes and pouts while you squeeze her rear, forcing a squeak out of her.")

		saynn("[say=rahi]Just ass?..[/say]")

		saynn("[say=pc]Your tits are great too.[/say]")

		saynn("Now you got her all flustered too.")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "4_think_everything"):
		saynn("[say=pc]Your face.. beautiful.. a careful ponytail, kitty ears, big blue eyes, a pointy black nose, sharp fangs.. little lips. The voice that they produce.. is music to my ears.. your every word makes me want to grab and hold you forever while my hands..[/say]")

		saynn("Kitty blushes already. And you're done yet.")

		saynn("[say=pc]While my hands brush over your soft brown fur, caressing all your curves and other areas such as your beautiful flower or all around your tail.[/say]")

		saynn("The feline covers her embarrassed eyes until you're done.")

		saynn("[say=rahi]Huff.. You will spoil her like that..[/say]")

		saynn("[say=pc]Sounds good.[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "4_stealing"):
		saynn("[say=rahi]Do you think stealing those meds was the right call?..[/say]")

		addButton("Yeah", "Tell Rahi this", "4_stealing_yeah")
		addButton("Other way", "Tell Rahi that there might have been some other solution", "4_stealing_other")
	if(state == "4_stealing_yeah"):
		saynn("[say=pc]Yeah, it was. You were dying, kitty. Screw that shopkeeper.[/say]")

		saynn("Rahi tilts her head from side to side, deliberating.")

		saynn("[say=rahi]The meds didn't help her in the end anyways..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "4_stealing_other"):
		saynn("[say=pc]Maybe there could have been some other way. Maybe the whole thing could have been avoided.. if you'd pick some other job?[/say]")

		saynn("Rahi shrugs slowly and looks all sad.")

		saynn("[say=rahi]Maybe.. There wasn't much available for the uneducated people.. It was that.. or being a prostitute..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "5_sorry"):
		saynn("[say=rahi]Sorry for lying.. again.. And stealing from you.. She was kinda desperate.. It tasted so good.. But that's not a good enough reason to do that.. She can't betray you like this.. Not after everything you did..[/say]")

		addButton("It's okay", "Tell Rahi this", "5_sorry_itsokay")
		addButton("Got punishment", "Tell Rahi that she received a punishment for it", "5_sorry_gotpunished")
	if(state == "5_sorry_itsokay"):
		playAnimation(StageScene.Hug, "hug", {npc="rahi"})
		
		saynn("[say=pc]It's okay, kitty. You did trick me which wasn't ideal. But in the end, you did the right thing. All by yourself. Makes me think that this wasn't all for nothing.[/say]")

		saynn("Rahi's eyes look watery, her lips twitch a little. You give her a short hug.")

		saynn("[say=rahi]M-meow..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "5_sorry_gotpunished"):
		saynn("[say=pc]You got punished for what you did, kitty. No need to say sorry anymore. What you did didn't break my trust in you. But if you decide to do something like that again..[/say]")

		saynn("[say=rahi]You're gonna make her regret..[/say]")

		saynn("You offer your kitty a pat on her head.")

		saynn("[say=pc]Good kitty.[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "5_father"):
		saynn("[say=rahi]She tries not to think about what her father said.. You being around helps her..[/say]")

		addButton("Not father", "Tell Rahi again that the vision she had wasn't her father", "5_father_notfather")
		addButton("Don't think", "Tell Rahi that she doesn't have to think about anything", "5_father_dontthink")
	if(state == "5_father_notfather"):
		saynn("[say=pc]It was just a vision, kitty. A hallucination that the drug has caused. Some drugs do cause anxiety.[/say]")

		saynn("Rahi nods subtly.")

		saynn("[say=rahi]Yeah.. you're right, {rahiMaster}..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "5_father_dontthink"):
		saynn("[say=pc]While you're with me, you don't have to think at all, kitty. Just do as I tell you, obey my words, and soon enough, you will forget it.[/say]")

		saynn("Rahi tries to offer you a smile.")

		saynn("[say=rahi]Yeah.. you're right, {rahiMaster}.. Sorry for that..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "5_meow"):
		saynn("[say=rahi]She likes to meow a lot.. She hopes that's okay..[/say]")

		addButton("Meow", "Meow-meow!", "5_meow_meow")
		addButton("It's cute", "Tell Rahi this", "5_meow_cute")
	if(state == "5_meow_meow"):
		saynn("[say=pc]Meow-meow![/say]")

		saynn("Rahi tilts her head.")

		saynn("[say=pc]Meow mew meow?[/say]")

		saynn("Rahi recoils back a few steps.")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "5_meow_cute"):
		saynn("[say=pc]It's cute, kitty. Is that common between felines?[/say]")

		saynn("Rahi shrugs.")

		saynn("[say=rahi]Her planet is not the only one that is inhabited by felines.. Probably.. Some find it embarrassing.. Meow..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "6_fresh"):
		saynn("[say=rahi]She feels so.. fresh.. Makes her regret not doing this earlier..[/say]")

		saynn("[say=pc]You were afraid of water, kitty.[/say]")

		saynn("Kitty blinks many times.")

		saynn("[say=rahi]She still is.. Felines should be afraid of water.. probably..[/say]")

		saynn("[say=pc]Sounds silly.[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "6_talk"):
		saynn("[say=rahi]What were you talking about while she was in the cryo?..[/say]")

		addButton("About you", "Tell Rahi this", "6_talk_aboutyou")
		addButton("Secret", "Tell Rahi this", "6_talk_secret")
	if(state == "6_talk_aboutyou"):
		saynn("[say=pc]About you. We were talking about you, kitty.[/say]")

		saynn("Rahi raises a brow.")

		saynn("[say=rahi]What did the doctor say about her?[/say]")

		saynn("[say=pc]That's you're a good kitty.[/say]")

		saynn("Rahi blinks a few times and just meows.")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "6_talk_secret"):
		saynn("[say=pc]It's a secret, kitty. Something that you're not supposed to know yet.[/say]")

		saynn("Rahi's ears perk up, her tail wagging behind her.")

		saynn("[say=rahi]Why not? Now you made kitty even more curious.. huff..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "6_quinn"):
		saynn("[say=rahi]Doctor Quinn isn't such a meanie like she thought before.. She can be kinda nice..[/say]")

		saynn("[say=pc]She was the one who noticed that you weren't doing too well. Others probably didn't care enough.[/say]")

		saynn("Rahi nods.")

		saynn("[say=rahi]No one cares about some inmate kitty..[/say]")

		saynn("A few seconds of silence.")

		saynn("[say=rahi]Except you..[/say]")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "7_happy"):
		playAnimation(StageScene.Hug, "hug", {npc="rahi"})
		saynn("[say=rahi]She doesn't have much to say. But I do. I'm such a happy kitty.[/say]")

		saynn("Rahi purrs and reaches out to hug you. Aw.")

		addButton("Continue", "Enough talking", "endthescene")
	if(state == "8_thankyou"):
		playAnimation(StageScene.Hug, "hug", {npc="rahi"})
		
		saynn("[say=rahi]I owe you everything, {rahiMaster}.. You made the life of this kitty so much better.. my life. I probably won't ever be the Rahi that I was before this prison.. But that's okay. I was unhappy. I was mean and grumpy at everything and everyone. Now I don't have to be. Unless you tell me to, meow.[/say]")

		saynn("Rahi looks around.")

		saynn("[say=rahi]I'm still stuck here, in this giant black box drifting through space. But my story doesn't end. As long as I'm alive. And as long as you're around. A kitty can dream, huh?[/say]")

		saynn("Rahi looks at her paws.")

		saynn("[say=rahi]I regret some things that I did. I'm not perfect. My father didn't like that I was stealing. He was furious when I tried to give him the stolen medicine. But he never disowned me no matter what. He never gave up. He understood how tough life can be. And now so do I. My name is Rahi. Rahi Haj'jar.[/say]")

		saynn("Rahi looks at you.")

		saynn("[say=rahi]And I'm proud to be your kitty.[/say]")

		saynn("After that she fills her lungs full of air and exhales audibly.")

		saynn("You can't help but to hug your kitty tightly, making her purr into your ear.")

		addButton("Continue", "Enough talking", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
