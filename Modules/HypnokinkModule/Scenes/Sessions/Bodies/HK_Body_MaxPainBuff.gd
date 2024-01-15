extends "res://Modules/HypnokinkModule/Scenes/Sessions/HK_SessionBodyBase.gd"

func _init():
	sceneID = HK_Sessions.BodyMaxPainBuff
	
func _initScene(_args = []):
	onBody()

func _run():
	if(state == ""):
		addCharacter("vion")
		playAnimation(StageScene.Duo, "sit", {npc="vion", npcAction="sit"})
		
		saynn("[say=vion]Now, onto the subject of this session. Pain.[/say]")

		saynn("[say=vion]Pain can serve us well. It teaches us to avoid harmful situations. It motivates us to avoid danger. It can be a useful companion... but also an unrelenting, demanding one.[/say]")
		
		saynn("[say=vion]You've likely had the displeasure of experiencing the collar around your neck. Let us use that memory as an example. When you hear a click, you'll feel an echo of that pain.[/say]")

		saynn("You tense up and try to burrow deeper into the cushions.")

		saynn("[say=vion]Relax. First we need to get you in the right frame of mind. Imagine a slowly flowing river. A calm mind is like a steady stream. But pain can be a raging torrent, threatening to overflow and flood your thoughts.[/say]")

		saynn("[say=vion]Blocking out the pain is daming the river. For a while that works, but eventually that dam will burst and the accumulated pain hits all at once.[/say]")

		saynn("[say=vion]Instead, when the torrent of pain pours in, simply endure it. Acknowledge it, and allow it to flow past unimpeded.[/say]")

		saynn("Click!")

		saynn("You shudder as ghostly electricity races down your back.")
		
		saynn("[say=pc]Nngh![/say]")

		saynn("[say=vion]Take deep breaths. In and out.[/say]")

		saynn("Click!")

		saynn("You force yourself to not clench your teeth and focus on your breathing.")

		saynn("[say=vion]Acknowledge it. Master it. It is simply information your body gives you. It can't dictate your reaction.[/say]")

		saynn("Click!")

		saynn("You breathe slowly. Imaginary pain stabs at your neck, but its gone as soon as it comes.")

		saynn("[say=vion]Good {pc.boy}... You're doing well.[/say]")

		saynn("Click!")

		saynn("[say=pc]Mmh...[/say]")
		
		addButton("Continue", "", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		afterBody()
		GM.pc.addTimedBuffs([buff(Buff.MaxPainBuff, [15 if betterBuffs() else 10])], 60 * 60 * 4 * buffDurationMultiplier())
		return

	setState(_action)

