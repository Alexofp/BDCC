extends Panel


var effectName
var effectDesc
var tooltipShouldBeWide = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func makeRed():
	self_modulate = Color(0.7, 0.1, 0.1)

func makeGreen():
	self_modulate = Color(0.1, 0.7, 0.1)

func makePurple():
	self_modulate = Color("#421C52")

func setColor(newcolor):
	self_modulate = newcolor

func setTexture(texture: String):
	$TextureRect.texture = load(texture)

func setNameAndDesc(newname: String, newdesc: String):
	effectName = newname
	effectDesc = newdesc
