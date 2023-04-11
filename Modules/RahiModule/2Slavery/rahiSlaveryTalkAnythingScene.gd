extends SceneBase

func _init():
	sceneID = "rahiSlaveryTalkAnythingScene"

func _reactInit():
	addCharacter("rahi")
	var talkedTopics = getFlag("RahiModule.rahiTalkedTopics", {})
	var possibleTopics = []
	var allTopics = []
	
	var slaveryStage = getModule("RahiModule").getSlaveryStage()
	
	if(true):
		allTopics.append_array(["meow_topic"])
	if(slaveryStage >= 1):
		allTopics.append("pic1")
	if(slaveryStage >= 2 && talkedTopics.has("pic1")):
		allTopics.append("pic2")
	if(slaveryStage >= 3 && talkedTopics.has("pic2")):
		allTopics.append("pic3")
		allTopics.append("pic4")
	if(slaveryStage >= 5 && talkedTopics.has("pic4")):
		allTopics.append("pic5")
	
	
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
	if(state == "meow_topic"):
		saynn("[say=rahi]She likes to meow.. Maybe because she is a cat..[/say]")

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

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
