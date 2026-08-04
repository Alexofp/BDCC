extends HBoxContainer

var fetish : FetishBase
var currentValue : float

var displayOverrides : Dictionary = {
	FetishInterest.SlightlyLikes: "+",
	FetishInterest.Likes: "++",
	FetishInterest.ReallyLikes: "+++",
	FetishInterest.Neutral: "0",
	FetishInterest.SlightlyDislikes: "-",
	FetishInterest.Dislikes: "--",
	FetishInterest.ReallyDislikes: "---",
}

onready var buttonsc : Container = $buttonshb

signal valueChanged

func setFetish(new:FetishBase, nval:float=FetishInterest.Likes) -> void:
	fetish = new
	$name.text = new.getVisibleName()
	redisplay(nval)
	
	onButtonPressed(nval)

func redisplay(nval:float) -> void:
	currentValue = nval
	
	var vals : Array = FetishInterest.getAll()
	var texts : Array = FetishInterest.getAllText()
	
	Util.delete_children(buttonsc)
	
	for i in vals.size():
		var b : Button = addInterestButton(vals[i])
		b.text = displayOverrides.get(vals[i], texts[i])
		b.hint_tooltip = texts[i]
	

func addInterestButton(value:float) -> Button:
	var nb := Button.new()
	
	nb.set_meta("value", value)
	nb.connect("pressed", self, "onButtonPressed", [value])
	
	buttonsc.add_child(nb)
	
	return nb

func onButtonPressed(newValue:float) -> void:
	for button in buttonsc.get_children():
		button.disabled = button.get_meta("value")==newValue
	
	currentValue = newValue
	$name.hint_tooltip = "NPC %s %s" % [ FetishInterest.getVisibleName(currentValue), fetish.getVisibleName() ]
	$name.add_color_override("font_color", FetishInterest.getColorString(currentValue))
	emit_signal("valueChanged")

func getValue() -> float:
	return currentValue
