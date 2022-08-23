extends VBoxContainer

onready var locationLabel = $LocationLabel
onready var timeLabel = $timeLabel
onready var sceneCreatorLabel = $sceneCreatorLabel

func setLocationName(newname: String):
	locationLabel.text = newname

func onTimePassed(_secondsPassed):
	timeLabel.text = GM.main.getVisibleTime()

func getLocationName():
	return locationLabel.text

func setSceneCreator(newcreator):
	if(newcreator == null || newcreator == "" || !OPTIONS.shouldShowSceneCreator()):
		sceneCreatorLabel.visible = false
		return
	sceneCreatorLabel.visible = true
	sceneCreatorLabel.text = "Scene by "+str(newcreator)
