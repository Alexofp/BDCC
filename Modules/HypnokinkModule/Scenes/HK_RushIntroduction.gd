extends SceneBase

func _init():
	sceneID = "RushIntroduction"

func _run():
	addCharacter("rush")
	playAnimation(StageScene.Duo, "stand", {npc="rush"})
	if(state == ""):
		saynn("After a few minutes of searching, taking care not to let your gaze linger on anyone lest they take it as a personal slight worth stabbing over, you spot a tall stallion matching Vion's description. It would seem he's currently... using a solid wall as a boxing bag? You approach him, mustering up confidence as you go. Noticing your approach, he stops to take a breather.")

		saynn("[say=rush]Name's Rush. Can I help ya', pipsqueak?[/say]")

		saynn("Wow, he is big.")

		saynn("[say=pc]Yeah, uh-[/say]")

		saynn("Your eyes wander downward.")

		saynn("Wow, he [b]is[/b] big.")

		saynn("[say=rush]Spit it out, I don' have all day. Whaddya want?[/say]")
		
		addButton("Mention Vion", "", "no_bully")
	if(state == "no_bully"):
		saynn("[say=rush]Oh, four-eyes sent ya, eh? Tha's cute.[/say]")

		saynn("He leaps up, grabbing onto a support beam holding up the ceiling and starts doing pull-ups.")

		saynn("[say=rush]Now why- would I- do tha'?- Pushin' him- about 's- hilarious,-[/say]")

		saynn("He lets go with one hand, switching to one-armed pull-ups.")

		saynn("[say=rush]he's tryin'- to be all- [i]dignified[/i]- but I can- tell tha' he's- itchin' for it-[/say]")

		saynn("He swaps hands and even picks up the pace.")

		saynn("[say=rush]and I want- that ass- an' besides- if he won't- put out it's- easy credits-[/say]")

		saynn("He lets go with most of his hand, only maintaining a grip with his index and middle finger. Somehow he seems to still be barely breaking a sweat.")

		saynn("[say=rush]for me! So yeah- pipsqueak- wha's- in it- for me?[/say]")

		saynn("He lets go and drops with a clang, leaving hoofprints in the metal floor. He rises to full height, once again towering over you.")
		
		addButton("Gulp", "", "endthescene")


func _react(_action: String, _args):
		
	if(_action == "endthescene"):
		endScene()
		runScene("RushRepeatConversation")
		return

	setState(_action)
