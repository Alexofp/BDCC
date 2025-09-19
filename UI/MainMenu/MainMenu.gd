extends Control

onready var versionLabel = $"%VersionLabel"
onready var MainVBox = $"%MainVBox"
onready var LoadGameTab = $"%LoadGameScreen"
onready var optionsGameTab = $"%OptionsScreen"
onready var creditsGameTab = $"%CreditsScreen"
onready var resumeButton = $"%ResumeButton"
onready var http_request = $"%HTTPRequest"
onready var gutHubReleaseLabel = $"%GithubReleaseLabel"
onready var gitHubReleaseButton = $"%GithubReleasesButton"
onready var devToolsScreen = $"%DevToolsScreen"
onready var devSubScreen = $"%DevScreen"
onready var loadedModsLabel = $"%LoadedModsLabel"
onready var modsMenu = $"%ModsMenu"
onready var autoTranslatorMenu = $"%AutoTranslatorMenu"
onready var donations_label = $"%DonationsLabel"
onready var auto_translator_button = $"%AutoTranslatorButton"

onready var center_area_v_box = $"%CenterAreaVBox"
onready var vertical_bottom_spacer = $"%VerticalBottomSpacer"

onready var troubleshooting_screen = $"%TroubleshootingScreen"

onready var vertical_github_release_box = $"%VerticalGithubReleaseBox"
onready var vertical_github_release_label = $"%VerticalGithubReleaseLabel"
var verticalModsStr:String = ""

export(Resource) var GlobalTheme

func updateVerticalGithubReleaseVisibility():
	if(OPTIONS.shouldFetchGithubRelease() && OPTIONS.isVerticalOrientation()):
		vertical_github_release_box.visible = true
	else:
		vertical_github_release_box.visible = false

func setGithubLabelStr(_simpleText:String, _extraText:String):
	gutHubReleaseLabel.text = _simpleText + (_extraText if !_extraText.empty() else "")
	vertical_github_release_label.text = _simpleText + ("\n"+verticalModsStr if !verticalModsStr.empty() else "")

# Called when the node enters the scene tree for the first time.
func _ready():
	OPTIONS.setSupportsVertical(true)
	updateSidePanelsVisibility()
	versionLabel.text = "Version: "+GlobalRegistry.getGameVersionString()

	donations_label.bbcode_text = GlobalRegistry.getDonationDataString()
	var _ok = GlobalRegistry.connect("donationDataUpdated", self, "updateDonationData")

	checkCanResume()
	if(OPTIONS.shouldFetchGithubRelease()):
		getNewRelease()
	else:
		setGithubLabelStr("Latest github release: DISABLED", "")
		gutHubReleaseLabel.visible = false
		gitHubReleaseButton.visible = false
	updateVerticalGithubReleaseVisibility()
	
	var loadedMods = GlobalRegistry.getLoadedMods()
	if(loadedMods.size() > 0):
		var text = "Loaded mods:"
		for mod in loadedMods:
			text += "\n"+str(mod)
		loadedModsLabel.bbcode_text = text
		verticalModsStr = str(loadedMods.size())+" mod"+("s" if loadedMods.size() != 1 else "")
	
	if(OS.get_name() == "HTML5"):
		auto_translator_button.disabled = true
	
	OPTIONS.connect("onScreenOrientationChange", self, "updateSidePanelsVisibility")
	
func updateDonationData():
	donations_label.bbcode_text = GlobalRegistry.getDonationDataString()

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
	autoTranslatorMenu.visible = false
	troubleshooting_screen.visible = false
	
	updateSidePanelsVisibility()

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
		setGithubLabelStr("Latest github release: Error", "")

func _on_HTTPRequest_request_completed(result, _response_code, _headers, body):
	if result != HTTPRequest.RESULT_SUCCESS:
		Log.printerr("[MainMenu] Couldn't get the latest release from github")
		setGithubLabelStr("Latest github release: Error", "")
		return
	
	var jsonResult = JSON.parse(body.get_string_from_utf8())
	if(jsonResult.error != OK):
		Log.printerr("[MainMenu] Couldn't parse json data from github.")
		setGithubLabelStr("Latest github release: Error", "")
		return
	
	var releasesData = jsonResult.result

	if(!(releasesData is Array)):
		Log.printerr("[MainMenu] Bad data from github")
		setGithubLabelStr("Latest github release: Error", "")
		return
		
	for release in releasesData:
		var requiredFields = ["published_at", "name", "tag_name"]
		for req in requiredFields:
			if(!release.has(req)):
				continue
		
		var publishedAtISOString:String = release["published_at"]
		var publishedAtUnix:int = Time.get_unix_time_from_datetime_string(publishedAtISOString)
		var timezone_info:Dictionary = Time.get_time_zone_from_system()
		var offset_minutes:int = timezone_info["bias"]
		var publishedAtLocal:int = publishedAtUnix + offset_minutes*60
		
		#var time = Time.get_datetime_string_from_unix_time(publishedAtLocal, true)#Util.ISO8601DateToDatetime(release["published_at"])
		#print(release["published_at"])
		
		var theSimpleText:String = ""
		var theAdvancedText:String = ""
		theSimpleText = "Latest github release: "+str(release["tag_name"])
		#if(time != null):
		theAdvancedText += "\n" + Time.get_datetime_string_from_unix_time(publishedAtLocal, true)
		
		theAdvancedText += "\n\nYour current version: "+GlobalRegistry.getGameVersionString()
		setGithubLabelStr(theSimpleText, theAdvancedText)
		return
	setGithubLabelStr("Latest github release: Nothing found", "")

func _on_GithubReleasesButton_pressed():
	var _ok = OS.shell_open("https://github.com/Alexofp/BDCC/releases")


func _on_DevClose_pressed():
	hideAllMenus()
	MainVBox.visible = true


func _on_DevToolsButton_pressed():
	hideAllMenus()
	devToolsScreen.visible = true
	updateSidePanelsVisibility()

onready var panel_2 = $"%Panel2"
onready var panel = $"%Panel"

func updateSidePanelsVisibility():
	var isVert:bool = OPTIONS.isVerticalOrientation()
	
	var shouldBeVis:bool = true
	if(devToolsScreen.visible || troubleshooting_screen.visible):
		shouldBeVis = false
	if(OPTIONS.isVerticalOrientation()):
		shouldBeVis = false
	
	panel_2.visible = shouldBeVis
	panel.visible = shouldBeVis
	vertical_bottom_spacer.visible = isVert
	updateVerticalGithubReleaseVisibility()

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

onready var main_h_box = $"%MainHBox"

var datapackMenu
func _on_DatapackButton_pressed():
	#hideAllMenus()
	main_h_box.visible = false
	datapackMenu = load("res://Game/Datapacks/UI/DatapackMenu.tscn").instance()
	datapackMenu.connect("onClosePressed", self, "onDatapackMenuClosedPressed")
	add_child(datapackMenu)

func onDatapackMenuClosedPressed():
	if(datapackMenu != null):
		datapackMenu.queue_free()
		datapackMenu = null
		main_h_box.visible = true


func _on_InteractionCreator_pressed():
	main_h_box.visible = false
	datapackMenu = load("res://Util/InteractionCreator/InteractionCreator.tscn").instance()
	datapackMenu.connect("onClosePressed", self, "onDatapackMenuClosedPressed")
	add_child(datapackMenu)

func _on_QuitButton_pressed():
	get_tree().quit()

func _on_TroubleshootingButton_pressedActually():
	hideAllMenus()
	troubleshooting_screen.visible = true
	updateSidePanelsVisibility()

func _on_TroubleshootingScreen_onClose():
	hideAllMenus()
	MainVBox.visible = true
