extends VBoxContainer

onready var locationLabel = $LocationLabel
onready var timeLabel = $timeLabel

func setLocationName(newname: String):
	locationLabel.text = newname

func onTimePassed(_secondsPassed):
	timeLabel.text = GM.main.getVisibleTime()

func getLocationName():
	return locationLabel.text
