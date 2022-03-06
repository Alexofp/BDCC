extends PanelContainer

export(Gradient) var colorGradient
export var propertyName = "Property"
var currentValue = null
var currentBarValue = 0.0

func _ready():
	$ProgressBar.value = 0
	$MarginContainer/HBoxContainer/Label.text = propertyName

func setTextLeft(leftText):
	$MarginContainer/HBoxContainer/Label.text = leftText

func setText(rightText):
	$MarginContainer/HBoxContainer/Label2.text = rightText

func setProgressBarValue(value):
	if(currentValue == value):
		return
	
	currentValue = value
	$Tween.interpolate_method(self, "updateBarValue", currentBarValue, currentValue, 1.5, Tween.TRANS_CUBIC, Tween.EASE_OUT)
	$Tween.start()

func updateBarValue(value):
	$ProgressBar.value = value
	#$ProgressBar.get("custom_styles/fg").set_bg_color(colorEmpty.linear_interpolate(colorFull, value))
	$ProgressBar.get("custom_styles/fg").set_bg_color(colorGradient.interpolate(value))
	currentBarValue = value

func setProgressBarValueInt(value, maxvalue):
	var fvalue = float(value)
	var fmaxvalue = float(maxvalue)
	
	if(fmaxvalue == 0.0):
		return
	
	var ffvalue = fvalue/fmaxvalue
	setProgressBarValue(ffvalue)

func resetToZero():
	currentBarValue = 0.0
	$ProgressBar.value = 0.0
