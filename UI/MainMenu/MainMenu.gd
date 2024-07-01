extends Control

onready var versionLabel = $HBoxContainer/MainVBox/ScrollContainer/VBoxContainer/VersionLabel
onready var MainVBox = $HBoxContainer/MainVBox
onready var LoadGameTab = $HBoxContainer/LoadGameScreen
onready var optionsGameTab = $HBoxContainer/OptionsScreen
onready var creditsGameTab = $HBoxContainer/CreditsScreen
onready var resumeButton = $HBoxContainer/MainVBox/GridContainer/ResumeButton
onready var http_request = $HTTPRequest
onready var gutHubReleaseLabel = $HBoxContainer/Panel/MarginContainer/VBoxContainer/GithubReleaseLabel
onready var gitHubReleaseButton = $HBoxContainer/Panel/MarginContainer/VBoxContainer/GithubReleasesButton
onready var devToolsScreen = $HBoxContainer/DevToolsScreen
onready var devSubScreen = $HBoxContainer/DevToolsScreen/DevScreen
onready var loadedModsLabel = $HBoxContainer/Panel/MarginContainer/VBoxContainer/ScrollContainer/LoadedModsLabel
onready var modsMenu = $HBoxContainer/ModsMenu
onready var autoTranslatorMenu = $HBoxContainer/AutoTranslatorMenu

export(Resource) var GlobalTheme

# Called when the node enters the scene tree for the first time.
func _ready():
	versionLabel.text = "Version: "+GlobalRegistry.getGameVersionString()

	$HBoxContainer/Panel2/MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer3/DonationsLabel.bbcode_text = GlobalRegistry.getDonationDataString()
	var _ok = GlobalRegistry.connect("donationDataUpdated", self, "updateDonationData")

	checkCanResume()
	if(OPTIONS.shouldFetchGithubRelease()):
		getNewRelease()
	else:
		gutHubReleaseLabel.text = "Latest github release: DISABLED"
		gutHubReleaseLabel.visible = false
		gitHubReleaseButton.visible = false
		
	var loadedMods = GlobalRegistry.getLoadedMods()
	if(loadedMods.size() > 0):
		var text = "Loaded mods:"
		for mod in loadedMods:
			text += "\n"+str(mod)
		loadedModsLabel.bbcode_text = text
	
	if(OS.get_name() == "HTML5"):
		$HBoxContainer/MainVBox/GridContainer/AutoTranslatorButton.disabled = true

func updateDonationData():
	$HBoxContainer/Panel2/MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer3/DonationsLabel.bbcode_text = GlobalRegistry.getDonationDataString()

func _on_NewGameButton_pressed():
	var _ok = get_tree().change_scene("res://Game/MainScene.tscn")

func hideAllMenus():
	GlobalTooltip.resetTooltips()
	MainVBox.visible = false
	LoadGameTab.visible = false
	optionsGameTab.visible = false
	creditsGameTab.visible = false
	devToolsScreen.visible = false
	modsMenu.visible = false
	$HBoxContainer/Panel2.visible = true
	$HBoxContainer/Panel.visible = true
	autoTranslatorMenu.visible = false

func switchToMainMenu():
	hideAllMenus()
	MainVBox.visible = true
	
	checkCanResume()

func _on_LoadGameButton_pressed():
	hideAllMenus()
	LoadGameTab.visible = true
	

func checkCanResume():
	if(SAVE.canResumeGame()):
		resumeButton.disabled = false
	else:
		resumeButton.disabled = true

func _on_ResumeButton_pressed():
	SAVE.switchToGameAndResumeLatestSave()


func _on_OptionsButton_pressed():
	hideAllMenus()
	optionsGameTab.visible = true


func _on_CreditsButton_pressed():
	hideAllMenus()
	creditsGameTab.visible = true


func _on_GithubButton_pressed():
	var _ok = OS.shell_open("https://github.com/Alexofp/BDCC")

func getNewRelease():
	var error = http_request.request("https://api.github.com/repos/Alexofp/BDCC/releases")
	if error != OK:
		Log.printerr("[MainMenu] An error occurred in the HTTP request.")
		gutHubReleaseLabel.text = "Latest github release: Error"

func _on_HTTPRequest_request_completed(result, _response_code, _headers, body):
	if result != HTTPRequest.RESULT_SUCCESS:
		Log.printerr("[MainMenu] Couldn't get the latest release from github")
		gutHubReleaseLabel.text = "Latest github release: Error"
		return
	
	var jsonResult = JSON.parse(body.get_string_from_utf8())
	if(jsonResult.error != OK):
		Log.printerr("[MainMenu] Couldn't parse json data from github.")
		gutHubReleaseLabel.text = "Latest github release: Error"
		return
	
	var releasesData = jsonResult.result

	if(!(releasesData is Array)):
		Log.printerr("[MainMenu] Bad data from github")
		gutHubReleaseLabel.text = "Latest github release: Error"
		return
		
	for release in releasesData:
		var requiredFields = ["published_at", "name", "tag_name"]
		for req in requiredFields:
			if(!release.has(req)):
				continue
		
		var time = Util.ISO8601DateToDatetime(release["published_at"])
		
		gutHubReleaseLabel.text = "Latest github release: "+release["tag_name"]
		if(time != null):
			gutHubReleaseLabel.text += "\n" + Util.datetimeToRFC113(time)
		
		gutHubReleaseLabel.text += "\n\nYour current version: "+GlobalRegistry.getGameVersionString()
		return
	gutHubReleaseLabel.text = "Latest github release: Nothing found"

func _on_GithubReleasesButton_pressed():
	var _ok = OS.shell_open("https://github.com/Alexofp/BDCC/releases")


func _on_DevClose_pressed():
	hideAllMenus()
	MainVBox.visible = true


func _on_DevToolsButton_pressed():
	hideAllMenus()
	devToolsScreen.visible = true
	$HBoxContainer/Panel2.visible = false
	$HBoxContainer/Panel.visible = false


func _on_DevSceneConverter_pressed():
	Util.delete_children(devSubScreen)
	
	var scene = load("res://Util/SceneConverter.tscn")
	devSubScreen.add_child(scene.instance())


func _on_DevLikesGenerator_pressed():
	Util.delete_children(devSubScreen)
	
	var scene = load("res://UI/LikesGenerator/NpcLikesGenerator.tscn")
	devSubScreen.add_child(scene.instance())


func _on_DiscordButton_pressed():
	var _ok = OS.shell_open("https://discord.gg/7UGYBvQrc3")
	
func _on_ChangelogButton_pressed():
	var _ok = OS.shell_open("https://github.com/Alexofp/BDCC/blob/main/CHANGELOG.md")


func _on_DonationsLabel_meta_clicked(meta):
	var _ok = OS.shell_open(meta)


func _on_DevCharCreator_pressed():
	Util.delete_children(devSubScreen)
	
	var scene = load("res://UI/QuickCharacterCreator/QuickCharacterCreator.tscn")
	devSubScreen.add_child(scene.instance())


func _on_ModsButton_pressed():
	hideAllMenus()
	var _ok = OS.request_permissions()
	modsMenu.visible = true


func _on_DevModCreator_pressed():
	Util.delete_children(devSubScreen)
	
	var scene = load("res://UI/ModMaker/ModMaker.tscn")
	devSubScreen.add_child(scene.instance())


func _on_DevSceneConverter2_pressed():
	Util.delete_children(devSubScreen)
	
	var scene = load("res://Util/SceneConverter2.tscn")
	devSubScreen.add_child(scene.instance())


func _on_AutoTranslatorMenu_onClosePressed():
	hideAllMenus()
	MainVBox.visible = true


func _on_AutoTranslatorButton_pressed():
	hideAllMenus()
	autoTranslatorMenu.visible = true


func _on_SexActivityCreator_pressed():
	Util.delete_children(devSubScreen)
	
	var scene = load("res://Util/SexActivityCreator/SexActivityCreator.tscn")
	devSubScreen.add_child(scene.instance())

var datapackMenu
func _on_DatapackButton_pressed():
	#hideAllMenus()
	$HBoxContainer.visible = false
	datapackMenu = load("res://Game/Datapacks/UI/DatapackMenu.tscn").instance()
	datapackMenu.connect("onClosePressed", self, "onDatapackMenuClosedPressed")
	add_child(datapackMenu)

func onDatapackMenuClosedPressed():
	if(datapackMenu != null):
		datapackMenu.queue_free()
		datapackMenu = true
		$HBoxContainer.visible = true
