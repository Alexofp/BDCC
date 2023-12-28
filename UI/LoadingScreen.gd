extends Control

func _ready():
	if(GlobalRegistry.isInitialized):
		var _ok = get_tree().change_scene("res://UI/MainMenu/MainMenu.tscn")
		return
	var _ok = GlobalRegistry.connect("loadingUpdate", self, "onGlobalRegistryUpdate")
	var _ok2 = GlobalRegistry.connect("loadingFinished", self, "onGlobalRegistryFinishedUpdate")
	GlobalRegistry.registerEverything()

func onGlobalRegistryUpdate(percent, whatnext):
	$ProgressBar.value = percent * 100.0
	$ProgressBar/Label.text = str(whatnext) #str(Util.roundF(percent*100.0, 1))+"% " + 

func onGlobalRegistryFinishedUpdate():
	var _ok = get_tree().change_scene("res://UI/MainMenu/MainMenu.tscn")
