extends SceneBase

func _init():
	sceneID = "MainMenu"
	
func _run():
	if (state == ""):
		GM.ui.returnToTitle()
		
		if SAVE.canResumeGame():
			addButton("Resume", "Load last save and continue suffering...", 				"", ["loadlastsave"])
		else:
			addDisabledButton("Resume", "No pain to load...")
		
		addButton("New Game",		"Let's start new live in prison!", 						"newgame", [])
		addButton("Load Game",		"Choose from which time you start loving suffer...", 	"toLoadscreen", [])
		addButton("Options",		"Which option in your BDSM spcesuit you like more?)..", "toOptions", [])
		addButton("Credits",		"Some big and small thanks to almost all...", 			"toCredits", [])
		addButton("Join Discord",	"Say 'Hi!' to developer!)", 							"", ["sendtodiscord"])
		addButton("GitHub",			"Go and explore source code of this game universe!", 	"", ["sendtogihub"])
		addButton("DevTools",		"GIVE. ME. FULL. POWEEEEEEEER!!!",						"goDev",[])
		addButton("Chagelog", 		"Wow, it's HUGE!",										"", ["showChangelog"])
		addButton("Mods",			"Insall and adjust your BDSM upgrades!",				"toMods",[])
		
	if (state == "toLoadscreen"):
		GM.ui.showLoadGameScreen()
		addButton("Close", "On second thoght...", "")
		
		addButtonAt(3, "Import Save", "Yes... YES!... Share your pain!", "toLoadscreen", ["importsave"])
		
		if !(OS.get_name() == "Android" || OS.get_name() == "HTML5"):
			addButtonAt(4, "Save Folder", "Pain lies here...", "toLoadscreen", ["showfolder"])
			
		addButtonAt(14, "Delete Save", "Please, just forget about it...", "toLoadscreen", ["delsave"])
	
	if (state == "toOptions"):
		GM.ui.showOptionsScreen()
		addButton("Save and Close", "Enough ajusting pain-fun-meter...", "", ["saveopt"])
		addButtonAt(2, "Reset to Defalut", "ARGH! Wrong! God, just revert it!", "toOptions", ["resetAll"])
		addButtonAt(4, "Reset Render Settings", "I CAN'T SEE, I CAN'T SEE!!!", "toOptions", ["resetRender"])
		
	if (state == "toCredits"):
		GM.ui.showCreditsScreen()
		addButton("Close", "...And thanks to YOU, player!", "", [])
		addButton("Support Rahi", "Support BDCC development!", "toCredits", ["support"])
		
	if (state == "goDev"):
		addButton("Close", "Enogh modding your game pain...", "", [])
		addButton("Scene Converter", "Make events for your mod!", "goDev", [0])
		addButton("NPC Likes Generator", "Make NPC like your fetishes...", "goDev", [1])
		addButton("Character Generator", "Make yourself and NPC as you like!", "goDev", [2])
		addButton("Mod Maker", "Extract files for edit or share.", "goDev", [3])
		
	if (state == "toMods"):
		addButton("Close", "I'm satisfied.", "", [])
		
		if (OS.get_name() in ["Android", "iOS", "HTML5"]):
			if (OS.get_name() != "Android"):
				addButton("Delete ALL", "Mmmmm... Vanilla better!", "toMods", ["delliteall"])
		else:
			addButton("Open Mods Folder", "Show me where your expanded staff lies...", "toMods", ["openfolder"])
			
		addButton("Import Mod", "I need to... Load some things.", "toMods", ["importmod"])
			
		addButton("Mod Wiki", "Untouched instructions here!", "toMods", ["towiki"])

func _react(_action: String, _args : Array):
	match _action:
		"":
			if "loadlastsave" in _args:
				endScene()
				SAVE.switchToGameAndResumeLatestSave()
			elif "saveopt" in _args:
				GM.ui.callSaveOptions()
			elif "sendtodicord" in _args:
				var _ok = OS.shell_open("https://discord.gg/7UGYBvQrc3")
			elif "sendtogithub" in _args:
				var _ok = OS.shell_open("https://github.com/Alexofp/BDCC/releases")
			elif "showChangelog" in _args:
				var _ok = OS.shell_open("https://github.com/Alexofp/BDCC/blob/main/CHANGELOG.md")
				
		"newgame":
			GM.ui.prepareToGame()
			runScene("IntroScene")
			endScene()
		
		"toLoadscreen":
			if "showfolder" in _args:
				GM.ui.showSaveFolderLoc()
			elif "importsave" in _args:
				GM.ui.callImportSave()
			elif "delsave" in _args:
				GM.ui.callDelSaveMode()
								
		"toCredits":
			if "support" in _args:
				var _ok = OS.shell_open("https://subscribestar.adult/rahi")
						
		"toOptions":
			if "resetAll" in _args:
				GM.ui.callResetOptions()
			elif "resetRender" in _args:
				GM.ui.callResetRenderOptions()
		
		"goDev":
			if _args.size() > 0:
				GM.ui.showDevToolsScreen(_args[0])
			else:
				GM.ui.showDevToolsScreen()
				
		"toMods":
			GM.ui.showModsMenuScreen()
			if "openfolder" in _args:
				var _ok = OS.shell_open(ProjectSettings.globalize_path("user://mods"))
			elif "importmod" in _args:
				GM.ui.showImportModsPopup()
			elif "delliteall" in _args:
				GM.ui.showDeliteAllModsPopup()
			elif "towiki" in _args:
				var _ok = OS.shell_open("https://github.com/Alexofp/BDCC/wiki")
		
	setState(_action)
