extends SceneBase

func _init():
	sceneID = "DrugDenKidlat4Scene"

func _run():
	if(state == ""):
		addCharacter("kidlat", ["naked"])
		playAnimation(StageScene.Duo, "stand", {npc="kidlat", further=true, kidlatBox=true, npcAction="struggle", npcBodyState={naked=true}})
		saynn("The dim, flickering light of the tunnels reveals a familiar silhouette before you. It's Kidlat, the friendly shopkeeper kitty. But this time, she seems to be caught in a precarious position..")

		saynn("She is naked again.. but that's not the worst part.. you actually notice her uniform neatly laid out in her cardboard box.")

		saynn("Her wrists strain against the cuffs behind her back, accentuating the curve of her chest as she writhes against the restraints. Her black and cyan fur gleams, giving off a soft sheen that catches the low light glow.")

		saynn("You take a step back.. making her ears perk instantly.")

		saynn("[say=kidlat]Oh, cheers.. Whoever it is.. welcome to Kidlat's humble little shop of shady wonders. Meow. I have a slight problem here, don't worry..[/say]")

		saynn("A tight blindfold is covering her eyes, making her unable to see you.. or anything really. Despite that, she seems to be still trying to run her shop. Interesting.")

		saynn("She sways her girly hips restlessly, trying to somehow wiggle her way out of the ankle cuffs as well, the little chain is holding her legs closed.. but you can still notice the slight wetness between them.")

		saynn("[say=kidlat]I don't have much to offer.. for obvious reasons.. but I trust that you will pay a fair price if you're gonna take something.[/say]")

		saynn("You watch as she tugs at the cuffs again. The motion makes her chest bounce slightly, breasts jiggling, nipples hard against the cool air of the tunnels. She probably realizes by now that the struggle is pointless.. but she still tries, her cheeks blushing with cyan.")

		saynn("You stay quiet for now, not sure how to react yet.")

		saynn("[say=kidlat]Sorry if it was your stash that I raided.. I mean.. meow.. I'm just a dumb blue cat-thing, don't mind me. I totally didn't trigger any traps that you laid out.. haha..[/say]")

		saynn("Her inner thighs rub against each other as she wiggles her body. She is probably still trying to break free.. but the damp fur near her crotch tells you a different story. Her breath quickens, the eerie ambience of the tunnels is now broken by her panting.. and the sounds of little drops of wetness hitting the floor.")

		saynn("[say=kidlat]I don't suppose you've got a key by any chance?.. I'd appreciate it.. well, who cares about appreciation.. but I'd find a way to pay back, yeah?..[/say]")

		saynn("You can help her if you have a restraint key.. But at the same time.. her bound form is extremely exposed and vulnerable.. You can just take what she is selling.. or take something else instead..")

		addButton("Continue", "See what happens next", "start_browsing_shop")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "start_browsing_shop"):
		getModule("DrugDenModule").regenerateKidlatItems()
		runScene("DrugDenKidlatShopScene")
		endScene()

	setState(_action)
