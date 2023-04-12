extends SceneBase

func _init():
	sceneID = "rahiSlaveryTalkAnythingScene"

func _reactInit():
	addCharacter("rahi")
	var talkedTopics = getFlag("RahiModule.rahiTalkedTopics", {})
	var possibleTopics = []
	var allTopics = []
	
	var slaveryStage = getModule("RahiModule").getSlaveryStage()
	
	if(slaveryStage >= 1):
		allTopics.append("pic1")
	if(slaveryStage >= 2 && talkedTopics.has("pic1")):
		allTopics.append("pic2")
	if(slaveryStage >= 3 && talkedTopics.has("pic2")):
		allTopics.append("pic3")
		allTopics.append("pic4")
	if(slaveryStage >= 5 && talkedTopics.has("pic4")):
		allTopics.append("pic5")
	
	if(slaveryStage >= 0):
		allTopics.append_array(["0_wonder", "0_alcohol", "0_steal", "0_doctor"])
	if(slaveryStage >= 1):
		allTopics.append_array(["1_nothappy", "1_kind"])#, "1_mother", "1_sorry"])
#	if(slaveryStage >= 2):
#		allTopics.append_array(["2_sorry", "2_engineer", "2_like"])
#	if(slaveryStage >= 3):
#		allTopics.append_array(["3_normal", "3_shy", "3_like"])
#	if(slaveryStage >= 4):
#		allTopics.append_array(["4_gun", "4_think", "4_stealing"])
#	if(slaveryStage >= 5):
#		allTopics.append_array(["5_sorry", "5_father", "5_meow"])
#	if(slaveryStage >= 6):
#		allTopics.append_array(["6_fresh", "6_talk", "6_quinn"])
#	if(slaveryStage >= 7):
#		allTopics.append_array(["7_happy"])
#	if(slaveryStage >= 8):
#		allTopics.append_array(["8_thankyou"])
	
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

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
