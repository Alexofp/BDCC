extends VBoxContainer

onready var locationLabel 		= $LocationLabel
onready var timeLabel 			= $Time/timeLabel
onready var dayLabel			= $Time/dayLabel
onready var sceneCreatorLabel 	= $sceneCreatorLabel

func setLocationName(newname: String):
	locationLabel.text = newname

func onTimePassed(_secondsPassed):
	var timeday 	= GM.main.getVisibleTime()
	timeLabel.text 	= timeday[0]
	dayLabel.text 	= "Day: " + timeday[1]

func getLocationName():
	return locationLabel.text

func setSceneCreator(newcreator):
	if(newcreator == null || newcreator == "" || !OPTIONS.shouldShowSceneCreator()):
		sceneCreatorLabel.visible = false
		return
	sceneCreatorLabel.visible = true
	sceneCreatorLabel.text = "Scene by "+str(newcreator)
