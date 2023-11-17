extends HK_SessionInductionBase

func _init():
	sceneID = HK_Sessions.InductionFirstTime
	
func _initScene(_args = []):
	onInduction(_args)

func _run():
	if(state == ""):
		addCharacter("HK_Vion")
		playAnimation(StageScene.Duo, "sit", {npc="HK_Vion", npcAction="sit"})
		
		saynn("[say=HK_Vion]Take a seat, please.[/say]")
		
		saynn("You make yourself comfortable on the sofa.")
		
		saynn("[say=HK_Vion]Since you're new at this, we'll start with establishing a basic foundation. Try your best to not get distracted and maintain eye contact with me. That's why I've put the couch up against [i]that[/i] wall.[/say]")

		saynn("He gestures to the window to your side. It's true, from this angle you can't even see outside the cell.")

		saynn("[say=HK_Vion]It puts all the distractions behind you, quite literally. Focus back on me, please.[/say]")

		saynn("Your attention wandered off during the explanation. You snap your eyes back to Vion's.")

		saynn("[say=HK_Vion]Better. Understand, at its core hypnosis, or trance, or flow, whatever you want to call it, is simply a heightened state of focus. Ever caught yourself staring out a window for ten minutes straight, just watching the wind blow? It's the same principle.[/say]")

		saynn("{HK_Vion.name} crosses his fingers below his chin and leans a bit closer.")

		saynn("[say=HK_Vion]What we're going to be doing today is building an association between a word and a specific mental state. Like any skill, being a good hypnosis subject takes practice and time. Through repetition, this association will become stronger and stronger over time.[/say]")

		saynn("[say=HK_Vion]So let us get started. I want you to consciously try to relax. People often struggle with intentionally remaining still, and I don't expect you to be perfect at it right away. It's okay if you fidget, or need to stretch occasionally.[/say]")

		saynn("His voice gets softer.")

		saynn("[say=HK_Vion]The word we will focus on is: sleep. You might have heard of \"trigger words\" before, but I assure you that your brain is perfectly capable of recognizing which contexts are appropriate and desirable. The word will not affect you unless you want it to affect you.[/say]")

		saynn("[say=HK_Vion]Now... Do your best to calm your mind. Let your thoughts quiet down. Any distracting, insistent thoughts you will simply acknowledge and move on from. As if you were on the edge of sleep.[/say]")

		saynn("Your body grows heavy. Your limbs feel pleasantly numb.")
		
		saynn("[say=HK_Vion]You might notice a sense of vertigo. Some subject experience a feeling akin to static in their extremities. Or maybe you are just feeling tired. Either way its perfectly normal. Just sink down. Fall deeper. Even deeper now. Fall into sleep, allowing only the subconcious part of you to remain fully awake.[/say]")

		saynn("You do feel so tired, and your eyelids are getting so heavy...")

		saynn("[say=HK_Vion]Let your eyes close. I'm going to count you down now. As I do, imagine you're walking down a staircase. Each number, a step.[/say]")

		saynn("[say=HK_Vion]Five. Descending down.[/say]")
		sayn("[say=HK_Vion]Four. Mind quiet. Safe and fuzzy.[/say]")
		sayn("[say=HK_Vion]Three. Deeper and deeper.[/say]")
		sayn("[say=HK_Vion]Two. Closer and closer.[/say]")
		sayn("[say=HK_Vion]One. Almost there. And as you reach the final step...[/say]")
		saynn("[say=HK_Vion]Zero. Sleep.[/say]")
		
		saynn("Sleep...")

		saynn("[say=HK_Vion]Just sleep.[/say]")

		saynn("[say=HK_Vion]There we go.[/say]")

		saynn("[say=HK_Vion][b]Sleep[/b].[/say]")
		
		addButton("Sleep", "", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		afterInduction()
		return

	setState(_action)
